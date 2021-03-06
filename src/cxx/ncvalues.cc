/*********************************************************************
 *   Copyright 1992, University Corporation for Atmospheric Research
 *   See netcdf/README file for copying and redistribution conditions.
 *
 *   Purpose:	implementation of classes of typed arrays for netCDF
 *
 *   $Header: /upc/share/CVS/netcdf/cxx/ncvalues.cc,v 1.20 1996/02/21 17:52:12 russ Exp $
 *********************************************************************/

#include <iostream.h>		// for debugging
#include "ncvalues.hh"

NcValues::NcValues( void ) : the_number(0), the_type(ncNoType)
{}

NcValues::NcValues(NcType type, long num)
	: the_number(num), the_type(type)
{}

NcValues::~NcValues( void )
{}

long NcValues::num( void )
{
    return the_number;
}    

ostream& operator<< (ostream& os, const NcValues& vals)
{
    return vals.print(os);
}

implement(NcValues,ncbyte)
implement(NcValues,char)
implement(NcValues,short)
implement(NcValues,nclong)
implement(NcValues,float)
implement(NcValues,double)

Ncbytes_for_one_implement(ncbyte)
Ncbytes_for_one_implement(char)
Ncbytes_for_one_implement(short)
Ncbytes_for_one_implement(nclong)
Ncbytes_for_one_implement(float)
Ncbytes_for_one_implement(double)

as_ncbyte_implement(short)
as_ncbyte_implement(nclong)
as_ncbyte_implement(float)
as_ncbyte_implement(double)

inline ncbyte NcValues_char::as_ncbyte( long n ) const
{
    return the_values[n];
}

inline ncbyte NcValues_ncbyte::as_ncbyte( long n ) const
{
    return the_values[n];
}

as_char_implement(short)
as_char_implement(nclong)
as_char_implement(float)
as_char_implement(double)

inline char NcValues_ncbyte::as_char( long n ) const
{
    return the_values[n] > CHAR_MAX ? ncBad_char : (char) the_values[n];
}

inline char NcValues_char::as_char( long n ) const
{
    return the_values[n];
}

as_short_implement(nclong)
as_short_implement(float)
as_short_implement(double)

inline short NcValues_ncbyte::as_short( long n ) const
{
    return the_values[n];
}

inline short NcValues_char::as_short( long n ) const
{
    return the_values[n];
}

inline short NcValues_short::as_short( long n ) const
{
    return the_values[n];
}

as_nclong_implement(float)
as_nclong_implement(double)

inline nclong NcValues_ncbyte::as_nclong( long n ) const
{
    return the_values[n];
}

inline nclong NcValues_char::as_nclong( long n ) const
{
    return the_values[n];
}

inline nclong NcValues_short::as_nclong( long n ) const
{
    return the_values[n];
}

inline nclong NcValues_nclong::as_nclong( long n ) const
{
    return the_values[n];
}

as_long_implement(float)
as_long_implement(double)

inline long NcValues_ncbyte::as_long( long n ) const
{
    return the_values[n];
}

inline long NcValues_char::as_long( long n ) const
{
    return the_values[n];
}

inline long NcValues_short::as_long( long n ) const
{
    return the_values[n];
}

inline long NcValues_nclong::as_long( long n ) const
{
    return the_values[n];
}

as_float_implement(ncbyte)
as_float_implement(char)
as_float_implement(short)
as_float_implement(nclong)
as_float_implement(float)
as_float_implement(double)

as_double_implement(ncbyte)
as_double_implement(char)
as_double_implement(short)
as_double_implement(nclong)
as_double_implement(float)
as_double_implement(double)

as_string_implement(short)
as_string_implement(nclong)
as_string_implement(float)
as_string_implement(double)

inline char* NcValues_ncbyte::as_string( long n ) const
{
    char *s = new char[the_number + 1];
    s[the_number] = '\0';
    strncpy(s, (const char *)the_values + n, (int)the_number);
    return s;
}

inline char* NcValues_char::as_string( long n ) const
{
    char *s = new char[the_number + 1];
    s[the_number] = '\0';
    strncpy(s, (const char *)the_values + n, (int)the_number);
    return s;
}

ostream& NcValues_short::print(ostream& os) const
{
    for(int i = 0; i < the_number - 1; i++)
      os << the_values[i] << ", ";
    if (the_number > 0)
      os << the_values[the_number-1] ;
    return os;
}

ostream& NcValues_nclong::print(ostream& os) const
{
    for(int i = 0; i < the_number - 1; i++)
      os << the_values[i] << ", ";
    if (the_number > 0)
      os << the_values[the_number-1] ;
    return os;
}

ostream& NcValues_ncbyte::print(ostream& os) const
{
    for(int i = 0; i < the_number - 1; i++)
      os << the_values[i] << ", ";
    if (the_number > 0)
      os << the_values[the_number-1] ;
    return os;
}

ostream& NcValues_char::print(ostream& os) const
{
    os << '"';
    long len = the_number;
    while (the_values[--len] == '\0') // don't output trailing null bytes
	;
    for(int i = 0; i <= len; i++)
	os << the_values[i] ;
    os << '"';
    
    return os;
}

ostream& NcValues_float::print(ostream& os) const
{
    long save=os.flags();
    os.precision(7);
    for(int i = 0; i < the_number - 1; i++)
      os << the_values[i] << ", ";
    if (the_number > 0)
      os << the_values[the_number-1] ;
    os.flags(save);
    return os;
}

ostream& NcValues_double::print(ostream& os) const
{
    long save=os.flags();
    os.precision(15);
    for(int i = 0; i < the_number - 1; i++)
      os << the_values[i] << ", ";
    if (the_number > 0)
      os << the_values[the_number-1];
    os.flags(save);
    return os;
}
