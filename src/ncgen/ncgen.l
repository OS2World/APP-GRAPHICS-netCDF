%{
/*********************************************************************
 *   Copyright 1993, UCAR/Unidata
 *   See netcdf/COPYRIGHT file for copying and redistribution conditions.
 *   $Id: ncgen.l,v 1.35 1996/02/27 23:16:46 steve Exp $
 *********************************************************************/

/* lex specification for tokens for ncgen */

/* Fill value used by ncdump from version 2.4 and later.  Should match
   definition of FILL_STRING in ../ncdump/vardata.h */
#define FILL_STRING "_"

char errstr[100];		/* for short error messages */
extern long strtol();
void expand_escapes();

#include <string.h>
#include <ctype.h>
#include <limits.h>
#include "ncgentab.h"
%}

%p 6000

escquote	\\\"
nonquotes	([^"]|{escquote})*
exp		([eE][+-]?[0-9]+)
%%
\/\/.*		/* comment */ ;

\"{nonquotes}\"		{
			 if(yyleng > MAXTRST) {
				yyerror("string too long, truncated\n");
			        yytext[MAXTRST-1] = '\0';
			 }
			 expand_escapes(termstring,yytext,yyleng);
		 	 return (TERMSTRING);
		        }

float|FLOAT|real|REAL	{return (FLOAT_K);}
char|CHAR		{return (CHAR_K);}
byte|BYTE		{return (BYTE_K);}
short|SHORT		{return (SHORT_K);}
long|LONG|int|INT|integer|INTEGER	{return (LONG_K);}
double|DOUBLE		{return (DOUBLE_K);}
unlimited|UNLIMITED	{long_val = -1;
			 return (NC_UNLIMITED_K);}

dimensions:|DIMENSIONS:	{return (DIMENSIONS);}
variables:|VARIABLES:	{return (VARIABLES);}
data:|DATA:		{return (DATA);}
(netcdf|NETCDF|netCDF)[ \t][^\{]+	{
		char *s = (char*)yytext+strlen("netcdf");
		char *t = (char*)yytext+yyleng-1;
		while (isspace(*s))
			s++;
		while (isspace(*t))
			t--;
		t++;
		netcdfname = (char *) emalloc(t-s+1);
		(void) strncpy(netcdfname, s, t-s);
		netcdfname[t-s] = '\0';
		return (NETCDF);
		}
DoubleInf|-?NaN	{    /* missing value (pre-2.4 backward compatibility) */
		double_val = FILL_DOUBLE;  /* IEEE double infinity */
		return (DOUBLE_CONST);
		}
FloatInf|Infinity|Inf	{ /* missing value (pre-2.4 backward compatibility) */
		float_val = FILL_FLOAT;  /* IEEE float infinity */
		return (FLOAT_CONST);
		}
[A-Za-z_][A-Za-z_0-9-]*	{
                if (STREQ((char *)yytext, FILL_STRING))
		        return (FILLVALUE);
		if ((yylval = lookup(yytext)) == NULL) {
			yylval = install(yytext);
			}
		return (IDENT);
		}

\n		{
		lineno++ ;
		}
[+-]?[0-9]*\.[0-9]*{exp}?[LlDd]?|[+-]?[0-9]*{exp}[LlDd]? {
		if (sscanf((char*)yytext, "%le", &double_val) != 1) {
		    sprintf(errstr,"bad long or double constant: %s",(char*)yytext);
		    yyerror(errstr);
		}
                return (DOUBLE_CONST);
                }
[+-]?[0-9]*\.[0-9]*{exp}?[Ff]|[+-]?[0-9]*{exp}[Ff] {
		if (sscanf((char*)yytext, "%e", &float_val) != 1) {
		    sprintf(errstr,"bad float constant: %s",(char*)yytext);
		    yyerror(errstr);
		}
                return (FLOAT_CONST);
                }
[+-]?[0-9]+[sS]|0[xX][0-9a-fA-F]+[sS] {
		if (sscanf((char*)yytext, "%hd", &short_val) != 1) {
		    sprintf(errstr,"bad short constant: %s",(char*)yytext);
		    yyerror(errstr);
		}
		return (SHORT_CONST);
	        }
[+-]?([1-9][0-9]*|0)[lL]? {
#ifdef cray	/* machines where longs have more precision than doubles. */
    		char *ptr;
		long_val = strtol((char*)yytext, &ptr, 0);
		if (ptr == (char*)yytext) {
		    sprintf(errstr,"bad long constant: %s",(char*)yytext);
		    yyerror(errstr);
		}
		return (LONG_CONST);
#else		/* machines where doubles have more precision than longs. */
		/*
		 * Because strtol and sscanf with "%ld" may silently give
		 * bad results from undetected overflow for strings like
		 * "30000000000", we scan as double first.
		 */
		double dd;
#ifdef VMS  /* work around bug in VMS strtol() */
		if (STREQ((char*)yytext, "-2147483648")) {
		    long_val = -2147483648;
		    return (LONG_CONST);
		}
#endif /* VMS */
		if (sscanf((char*)yytext, "%le", &dd) != 1) {
		    sprintf(errstr,"bad long constant: %s",(char*)yytext);
		    yyerror(errstr);
		}
		if (dd < LONG_MIN  ||  dd > LONG_MAX) {
		    double_val = dd;
		    return DOUBLE_CONST;
		} else {
		    long_val = dd;
		    return LONG_CONST;
		}
#endif /* cray */
	        }
0[xX]?[0-9a-fA-F]+[lL]? {
		long dd;
#ifdef VMS  /* work around bug in VMS strtol() */
		if (STREQ((char*)yytext, "-2147483648")) {
		    long_val = -2147483648;
		    return (LONG_CONST);
		}
#endif /* VMS */
		if (sscanf((char*)yytext, "%li", &dd) != 1) {
		    sprintf(errstr,"bad long constant: %s",(char*)yytext);
		    yyerror(errstr);
		}
		long_val = dd;
		return LONG_CONST;
	        }
\'[^\\]\'          {
	        (void) sscanf((char*)&yytext[1],"%c",&byte_val);
		return (BYTE_CONST);
                }
\'\\[0-7][0-7]?[0-7]?\'  {
		byte_val = strtol((char*)&yytext[2], (char **) 0, 8);
		return (BYTE_CONST);
                }
\'\\[xX][0-9a-fA-F][0-9a-fA-F]?\'  {
		byte_val = strtol((char*)&yytext[3], (char **) 0, 16);
		return (BYTE_CONST);
                }
\'\\.\'        {
	       switch ((char)yytext[2]) {
	          case 'a': byte_val = '\007'; break; /* not everyone under-
						       * stands '\a' yet */
     	          case 'b': byte_val = '\b'; break;
		  case 'f': byte_val = '\f'; break;
		  case 'n': byte_val = '\n'; break;
		  case 'r': byte_val = '\r'; break;
		  case 't': byte_val = '\t'; break;
		  case 'v': byte_val = '\v'; break;
		  case '\\': byte_val = '\\'; break;
		  case '?': byte_val = '\177'; break;
		  case '\'': byte_val = '\''; break;
		  default: byte_val = (char)yytext[2];
	           }
		return (BYTE_CONST);
                }

[ \t\f]+	{/* whitespace */ ;
		}
.		return (yytext[0]) ;
