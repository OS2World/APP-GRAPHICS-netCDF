#   Copyright 1993,1996 University Corporation for Atmospheric Research
#
#  OS/2 Makefile for netCDF library
include ../emx1.mak
CP = copy
CC = gcc
CFLAGS = -O  $(INCLUDES)
CPPFLAGS	= -DOS2 -DNO_SYSTEM_XDR_INCLUDES $(DEFINES) $(INCLUDES)
HEADER		= netcdf.h
INCLUDES	= -I../xdr
DEFINES		= -DSWAP -DMSDOS
LIBRARY		= netcdf.a
LIBS		= $(LIBRARY) ../xdr/xdr.a -lsocket
LIBOBJS		= array.o attr.o cdf.o dim.o error.o file.o \
		  globdef.o iarray.o putget.o putgetg.o sharray.o \
		  string.o var.o xdrposix.o
HEADERS = local_nc.h netcdf.h alloc.h
all:		local_nc.h $(LIBRARY)

netcdf.a : $(LIBOBJS)
	ar cvr netcdf.a $?
	ar -s netcdf.a
test:		cdftest.exe FORCE
	./cdftest
install:	$(LIBDIR)/$(LIBRARY) $(INCDIR)/$(HEADER)
clean::
	del  test.cdf local_nc.h
cdftest.exe:	$(LIBRARY)
	gcc cdftest.c $(CPPFLAGS) $(CFLAGS) -L. -lnetcdf -l../xdr/xdr
local_nc.h:     local_nc.gen
	$(CP) $? $@
array.o: array.c $(HEADERS)
attr.o: attr.c  $(HEADERS)
cdf.o: cdf.c  $(HEADERS)
cdftest.o: cdftest.c netcdf.h
dim.o: dim.c $(HEADERS)
error.o: error.c  local_nc.h netcdf.h
file.o: file.c  $(HEADERS)
globdef.o: globdef.c netcdf.h
iarray.o: iarray.c $(HEADERS)
putget.o: putget.c $(HEADERS)
putgetg.o: putgetg.c local_nc.h netcdf.h
sharray.o: sharray.c $(HEADERS)
string.o: string.c $(HEADERS)
var.o: var.c $(HEADERS)
xdrposix.o: xdrposix.c $(HEADERS)