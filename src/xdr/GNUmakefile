#   Copyright 1996 University Corporation for Atmospheric Research
#
#	OS/2 Makefile for eXternal Data Representation library routines
#		used by the netCDF.

include ../emx1.mak

XDRLIB 		= xdr.a
LIBOBJS		= xdr.o xdrarray.o xdrfloat.o xdrstdio.o byteordr.o
CC           = gcc
CFLAGS       = -O -c

INCLUDES	= -I.

# The socket library is for swapl().
LIBS		= $(LIBRARY) -lsocket

all:		$(XDRLIB)

xdr.a : $(LIBOBJS) 
	ar cvr xdr.a $?
	ar -s xdr.a

test:		xdrtest.exe FORCE
	xdrtest

clean::		FORCE
	delete test.xdr

xdrtest.exe:	$(XDRLIB)
	gcc xdrtest.c -DMSDOS -L. -lxdr

xdr.o:			xdr.c types.h xdr.h
xdrfloat.o:	xdrfloat.c types.h xdr.h
xdrarray.o:	xdrarray.c types.h xdr.h
xdrtest.o:	xdrtest.c types.h xdr.h
xdrstdio.o:	xdrstdio.c types.h xdr.h
byteordr.o:	byteordr.c