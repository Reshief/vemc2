#Makefile for vemc2 (c) by Simon Michalke
#this is the overall Makefile

all:
	make -C core
	make -C cons
	make -C graphic

libcore:
	make -C core

cons:
	make -C cons

graphic:
	make -C graphic

compile-all:
	mkdir -p core/temp
	mkdir -p cons/temp
	make -C core
	sudo make -C core install
	make -C cons

startall: compile-all
	bash -c "cd cons; bash portablestart.sh; cd .."

clean-all:
	make -C core clean
	make -C cons clean

init-all:
	make -C core preinst
	make -C core install

install-libs-local:
	make -C core install-local

install-libs:
	make -C core install

