.PHONY: all clean install uninstall
all clean install uninstall:
	@ $(MAKE) -C src $@

all1:
	@ $(MAKE) -C src1 all
clean1:
	@ $(MAKE) -C src1 clean
install1:
	@ $(MAKE) -C src1 install
uninstall1:
	@ $(MAKE) -C src1 uninstall

rm-timing:
	@ rm src/*.timing && rm src1/*.timing

time:
	@ $(MAKE) all  TIMING=1 $@

time1:
	@ $(MAKE) -C src1 all TIMING=1 $@


time-all: time time1
	@ echo "Done"

clean-all:
	@ $(MAKE) clean clean1 rm-timing

compare:
	$(eval Y := $(subst src,src1,$X))
	$(eval Z := $(subst src,,$X))
	coqtimelog2html $X $X.timing $Y.timing > ./$Z.html