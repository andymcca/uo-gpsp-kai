# -x assembler-with-cpp
# gpSP makefile
# Gilead Kutnick - Exophase

# Global definitions

all: systembuttons_prx dvemgr homehookprx main

clean: systembuttons_prx_clean  dvemgr_clean homehookprx_clean main_clean

dvemgr:
	make -C ./prx/dvemgr

main:
	@awk '/^BUILD_COUNT=/ {gsub(/\r/,""); sub(/^BUILD_COUNT=[[:space:]]*/, ""); c=$$0+1} END{print "BUILD_COUNT= " c}' build_count.inc > build_count.inc.new && mv build_count.inc.new build_count.inc
	make -C ./gpsp

homehookprx:
	make -C ./prx/homehookprx

systembuttons_prx:
	make -C ./prx/systembuttons_prx

dvemgr_clean:
	make -C ./prx/dvemgr clean

main_clean:
	make -C ./gpsp clean

homehookprx_clean:
	make -C ./prx/homehookprx clean

systembuttons_prx_clean:
	make -C ./prx/systembuttons_prx clean
	