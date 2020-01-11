release : wacom-5.3.7-6-macOS-patched.zip

all : drivers/PenTabletDriver-5.3.7-6.patched drivers/ConsumerTouchDriver-5.3.7-6.patched

wacom-5.3.7-6-macOS-patched.zip : all build/
	rm -f $@
	cp drivers/PenTabletDriver-5.3.7-6.patched build/PenTabletDriver
	cp drivers/ConsumerTouchDriver-5.3.7-6.patched build/ConsumerTouchDriver
	cp Readme.md build/
	cd build && zip ../$@ PenTabletDriver ConsumerTouchDriver Readme.md

build/ :
	mkdir build

%.patched : %.original %.patch
	cp $*.original $*.patched
	patch $*.patched < $*.patch

clean :
	rm -f wacom-5.3.7-6-macOS-patched.zip build/* drivers/*.patched