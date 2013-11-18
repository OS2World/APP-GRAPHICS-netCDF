# Microsoft Visual C++ Generated NMAKE File, Format Version 2.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

!IF "$(CFG)" == ""
CFG=Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Win32 Release" && "$(CFG)" != "Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "msoft32.mak" CFG="Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

################################################################################
# Begin Project
CPP=cl.exe

!IF  "$(CFG)" == "Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WinRel"
# PROP BASE Intermediate_Dir "WinRel"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRel"
# PROP Intermediate_Dir "WinRel"
OUTDIR=.\WinRel
INTDIR=.\WinRel

ALL : .\xdr.lib $(OUTDIR)/msoft32.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /ML /W3 /GX /YX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /c
# ADD CPP /nologo /ML /Za /W3 /GX /YX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOW" /D "MSDOS" /FR /c
CPP_PROJ=/nologo /ML /Za /W3 /GX /YX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOW" /D\
 "MSDOS" /FR$(INTDIR)/ /Fp$(OUTDIR)/"msoft32.pch" /Fo$(INTDIR)/ /c 
CPP_OBJS=.\WinRel/
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"msoft32.bsc" 
BSC32_SBRS= \
	$(INTDIR)/xdr.sbr \
	$(INTDIR)/xdrstdio.sbr \
	$(INTDIR)/xdrarray.sbr \
	$(INTDIR)/xdrfloat.sbr \
	$(INTDIR)/byteordr.sbr

$(OUTDIR)/msoft32.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=lib.exe
# ADD BASE LIB32 /NOLOGO
# ADD LIB32 /NOLOGO /OUT:"xdr.lib"
LIB32_FLAGS=/NOLOGO /OUT:"xdr.lib" 
DEF_FLAGS=
DEF_FILE=
LIB32_OBJS= \
	$(INTDIR)/xdr.obj \
	$(INTDIR)/xdrstdio.obj \
	$(INTDIR)/xdrarray.obj \
	$(INTDIR)/xdrfloat.obj \
	$(INTDIR)/byteordr.obj

.\xdr.lib : $(OUTDIR)  $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WinDebug"
# PROP BASE Intermediate_Dir "WinDebug"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebug"
# PROP Intermediate_Dir "WinDebug"
OUTDIR=.\WinDebug
INTDIR=.\WinDebug

ALL : .\xdr.lib $(OUTDIR)/msoft32.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /ML /W3 /GX /Z7 /YX /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /c
# ADD CPP /nologo /ML /Za /W3 /GX /Z7 /YX /Od /D "_DEBUG" /D "WIN32" /D "_WINDOW" /D "MSDOS" /FR /c
CPP_PROJ=/nologo /ML /Za /W3 /GX /Z7 /YX /Od /D "_DEBUG" /D "WIN32" /D\
 "_WINDOW" /D "MSDOS" /FR$(INTDIR)/ /Fp$(OUTDIR)/"msoft32.pch" /Fo$(INTDIR)/ /c 
CPP_OBJS=.\WinDebug/
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"msoft32.bsc" 
BSC32_SBRS= \
	$(INTDIR)/xdr.sbr \
	$(INTDIR)/xdrstdio.sbr \
	$(INTDIR)/xdrarray.sbr \
	$(INTDIR)/xdrfloat.sbr \
	$(INTDIR)/byteordr.sbr

$(OUTDIR)/msoft32.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=lib.exe
# ADD BASE LIB32 /NOLOGO
# ADD LIB32 /NOLOGO /OUT:"xdr.lib"
LIB32_FLAGS=/NOLOGO /OUT:"xdr.lib" 
DEF_FLAGS=
DEF_FILE=
LIB32_OBJS= \
	$(INTDIR)/xdr.obj \
	$(INTDIR)/xdrstdio.obj \
	$(INTDIR)/xdrarray.obj \
	$(INTDIR)/xdrfloat.obj \
	$(INTDIR)/byteordr.obj

.\xdr.lib : $(OUTDIR)  $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Group "Source Files"

################################################################################
# Begin Source File

SOURCE=.\xdr.c
DEP_XDR_C=\
	.\types.h\
	.\xdr.h\
	\MSVC20\INCLUDE\sys\types.h

$(INTDIR)/xdr.obj :  $(SOURCE)  $(DEP_XDR_C) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\xdrstdio.c
DEP_XDRST=\
	.\types.h\
	.\xdr.h\
	\MSVC20\INCLUDE\sys\types.h

$(INTDIR)/xdrstdio.obj :  $(SOURCE)  $(DEP_XDRST) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\xdrarray.c
DEP_XDRAR=\
	.\types.h\
	.\xdr.h\
	\MSVC20\INCLUDE\sys\types.h

$(INTDIR)/xdrarray.obj :  $(SOURCE)  $(DEP_XDRAR) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\xdrfloat.c
DEP_XDRFL=\
	.\types.h\
	.\xdr.h\
	\MSVC20\INCLUDE\sys\types.h

$(INTDIR)/xdrfloat.obj :  $(SOURCE)  $(DEP_XDRFL) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\byteordr.c

$(INTDIR)/byteordr.obj :  $(SOURCE)  $(INTDIR)

# End Source File
# End Group
# End Project
################################################################################