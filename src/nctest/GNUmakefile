#  Copyright 1993, 1996 UCAR/Unidata
#
#  OS/2 makefile for exhaustive test of netCDF package.
#
CC = gcc
CFLAGS = -I/unix/netcdf/include
CPPFLAGS = 
PROGRAM		= nctest.exe
INCLUDES	= -I/unix/netcdf/include
OBJS		=  driver.o \
		   varget.o vargetg.o varput.o varputg.o vardef.o \
		   vartests.o vputget.o vputgetg.o cdftests.o \
		   dimtests.o rec.o atttests.o misctest.o add.o \
		   error.o emalloc.o val.o slabs.o
.SUFFIXES: .exe .o .i .c 

# Compile C source code:
.c.o:
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $<
# Preprocess C source code:
.c.i:
	$(CC) -E $(CPPFLAGS) $< >$@
# Compile C++ source code:
.cc.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) $<
# Link an object into an executable:
.o.exe:
	$(CC) -o $@ $(CFLAGS)  $< $(OBJS) $(LIBS)


all:		$(PROGRAM)
test:		all FORCE
	./nctest
install:
clean::
	rm -f *.cdf

$(PROGRAM):	$(OBJS) ../libsrc/netcdf.a ../xdr/xdr.a
	gcc $(OBJS) -o $(PROGRAM) -L/unix/netcdf/lib -lnetcdf -lxdr

add.o: add.c ../libsrc/netcdf.h testcdf.h add.h emalloc.h

atttests.o: atttests.c ../libsrc/netcdf.h testcdf.h add.h error.h emalloc.h tests.h val.h

bug.o: bug.c ../libsrc/netcdf.h

cdftests.o: cdftests.c ../libsrc/netcdf.h testcdf.h add.h error.h tests.h

dimtests.o: dimtests.c ../libsrc/netcdf.h testcdf.h add.h error.h tests.h

driver.o: driver.c ../libsrc/netcdf.h tests.h

emalloc.o: emalloc.c error.h emalloc.h

error.o: error.c ../libsrc/netcdf.h error.h

fixed1.o: fixed1.c ../libsrc/netcdf.h

fixed2.o: fixed2.c ../libsrc/netcdf.h

misctest.o: misctest.c ../libsrc/netcdf.h testcdf.h add.h error.h

nctime.o: nctime.c ../libsrc/netcdf.h

nctime0.o: nctime0.c ../libsrc/netcdf.h

rec.o: rec.c ../libsrc/netcdf.h testcdf.h val.h error.h tests.h

slabs.o: slabs.c ../libsrc/netcdf.h testcdf.h add.h error.h tests.h

val.o: val.c ../libsrc/netcdf.h testcdf.h val.h error.h

vardef.o: vardef.c ../libsrc/netcdf.h testcdf.h add.h error.h tests.h

varget.o: varget.c ../libsrc/netcdf.h testcdf.h error.h tests.h

vargetg.o: vargetg.c  ../libsrc/netcdf.h testcdf.h error.h tests.h

varput.o: varput.c ../libsrc/netcdf.h testcdf.h val.h error.h tests.h

varputg.o: varputg.c ../libsrc/netcdf.h testcdf.h val.h error.h tests.h

vartests.o: vartests.c ../libsrc/netcdf.h testcdf.h add.h error.h tests.h

vputget.o: vputget.c ../libsrc/netcdf.h testcdf.h val.h error.h tests.h add.h emalloc.h

vputgetg.o: vputgetg.c ../libsrc/netcdf.h testcdf.h val.h error.h tests.h add.h emalloc.h
