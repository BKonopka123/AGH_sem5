/* Processed by ecpg (16.1 (Debian 16.1-1.pgdg120+1)) */
/* These include files are added by the preprocessor */
#include <ecpglib.h>
#include <ecpgerrno.h>
#include <sqlca.h>
/* End of automatic include section */

#line 1 "test.sqc"
#include <stdio.h>
#include <stdlib.h>
#include "test.h"
 

#line 1 "/usr/include/postgresql/sqlca.h"
#ifndef POSTGRES_SQLCA_H
#define POSTGRES_SQLCA_H

#ifndef PGDLLIMPORT
#if  defined(WIN32) || defined(__CYGWIN__)
#define PGDLLIMPORT __declspec (dllimport)
#else
#define PGDLLIMPORT
#endif							/* __CYGWIN__ */
#endif							/* PGDLLIMPORT */

#define SQLERRMC_LEN	150

#ifdef __cplusplus
extern "C"
{
#endif

struct sqlca_t
{
	char		sqlcaid[8];
	long		sqlabc;
	long		sqlcode;
	struct
	{
		int			sqlerrml;
		char		sqlerrmc[SQLERRMC_LEN];
	}			sqlerrm;
	char		sqlerrp[8];
	long		sqlerrd[6];
	/* Element 0: empty						*/
	/* 1: OID of processed tuple if applicable			*/
	/* 2: number of rows processed				*/
	/* after an INSERT, UPDATE or				*/
	/* DELETE statement					*/
	/* 3: empty						*/
	/* 4: empty						*/
	/* 5: empty						*/
	char		sqlwarn[8];
	/* Element 0: set to 'W' if at least one other is 'W'	*/
	/* 1: if 'W' at least one character string		*/
	/* value was truncated when it was			*/
	/* stored into a host variable.             */

	/*
	 * 2: if 'W' a (hopefully) non-fatal notice occurred
	 */	/* 3: empty */
	/* 4: empty						*/
	/* 5: empty						*/
	/* 6: empty						*/
	/* 7: empty						*/

	char		sqlstate[5];
};

struct sqlca_t *ECPGget_sqlca(void);

#ifndef POSTGRES_ECPG_INTERNAL
#define sqlca (*ECPGget_sqlca())
#endif

#ifdef __cplusplus
}
#endif

#endif

#line 5 "test.sqc"

/* exec sql whenever sql_warning  sqlprint ; */
#line 6 "test.sqc"

/* exec sql whenever sqlerror  do Prnt ( ) ; */
#line 7 "test.sqc"

 
void Prnt()
{
   fprintf(stderr, "*******************************************\n");
   fprintf(stderr, "Fatal Error\n");
   sqlprint();
   fprintf(stderr, "*******************************************\n");
}
 
/* exec sql begin declare section */
     
     
     
     
     
     
     
     
     
     
     
     
     
     

#line 18 "test.sqc"
 char db [ 150 ] ;
 
#line 19 "test.sqc"
 char usr [ 15 ] ;
 
#line 20 "test.sqc"
 char pas [ 15 ] ;
 
#line 21 "test.sqc"
 char dbname [ 1024 ] ;
 
#line 22 "test.sqc"
 int czytelnik_id ;
 
#line 23 "test.sqc"
 int czytelnik_id_number ;
 
#line 24 "test.sqc"
 char nazwisko [ 20 ] ;
 
#line 25 "test.sqc"
 char imie [ 20 ] ;
 
#line 26 "test.sqc"
 char imiona [ 100 ] [ 100 ] [ 20 ] ;
 
#line 27 "test.sqc"
 char nazwiska [ 100 ] [ 100 ] [ 20 ] ;
 
#line 28 "test.sqc"
 char tytul [ 20 ] ;
 
#line 29 "test.sqc"
 char lista_ksiazek [ 100 ] [ 20 ] ;
 
#line 30 "test.sqc"
 int ilosc_wypozyczen [ 20 ] ;
 
#line 31 "test.sqc"
 int wypozyczenie_tmp ;
/* exec sql end declare section */
#line 32 "test.sqc"

 
int main(int argc, char* argv[])
{
    strncpy(db,dbase,150);
    strncpy(usr,user,15);
    strncpy(pas,pass,15);
    //ECPGdebug(1,stderr);
    { ECPGconnect(__LINE__, 0, db , usr , pas , "con1", 0); 
#line 40 "test.sqc"

if (sqlca.sqlwarn[0] == 'W') sqlprint();
#line 40 "test.sqc"

if (sqlca.sqlcode < 0) Prnt ( );}
#line 40 "test.sqc"

 
    { ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "select current_database ( )", ECPGt_EOIT, 
	ECPGt_char,(dbname),(long)1024,(long)1,(1024)*sizeof(char), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, ECPGt_EORT);
#line 42 "test.sqc"

if (sqlca.sqlwarn[0] == 'W') sqlprint();
#line 42 "test.sqc"

if (sqlca.sqlcode < 0) Prnt ( );}
#line 42 "test.sqc"

    //printf("current database=%s \n", dbname);

    czytelnik_id_number = atoi(argv[1]);

    /* declare c1 cursor for select distinct k . tytul from czytelnik c join wypozyczenie w using ( czytelnik_id ) join wc wc using ( wypozyczenie_id ) join ksiazki k using ( ksiazka_id ) where czytelnik_id = $1  */
#line 54 "test.sqc"

    
    { ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "declare c1 cursor for select distinct k . tytul from czytelnik c join wypozyczenie w using ( czytelnik_id ) join wc wc using ( wypozyczenie_id ) join ksiazki k using ( ksiazka_id ) where czytelnik_id = $1 ", 
	ECPGt_int,&(czytelnik_id_number),(long)1,(long)1,sizeof(int), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, ECPGt_EOIT, ECPGt_EORT);
#line 56 "test.sqc"

if (sqlca.sqlwarn[0] == 'W') sqlprint();
#line 56 "test.sqc"

if (sqlca.sqlcode < 0) Prnt ( );}
#line 56 "test.sqc"


    int i=0;
    while(sqlca.sqlcode == 0){
        { ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "fetch c1", ECPGt_EOIT, 
	ECPGt_char,(tytul),(long)20,(long)1,(20)*sizeof(char), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, ECPGt_EORT);
#line 60 "test.sqc"

if (sqlca.sqlwarn[0] == 'W') sqlprint();
#line 60 "test.sqc"

if (sqlca.sqlcode < 0) Prnt ( );}
#line 60 "test.sqc"

        if(SQLCODE == 0){ 
            strcpy(lista_ksiazek[i],tytul);
            i++;
        }
    }
    int ilosc_ksiazek = i;

    { ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "close c1", ECPGt_EOIT, ECPGt_EORT);
#line 68 "test.sqc"

if (sqlca.sqlwarn[0] == 'W') sqlprint();
#line 68 "test.sqc"

if (sqlca.sqlcode < 0) Prnt ( );}
#line 68 "test.sqc"


    for(int i=0; i<ilosc_ksiazek; i++){
        /* declare c2 cursor for select count ( distinct c . czytelnik_id ) as liczba_czytelnikow , c . imie , c . nazwisko from czytelnik c join wypozyczenie w using ( czytelnik_id ) join wc wc using ( wypozyczenie_id ) join ksiazki k using ( ksiazka_id ) where k . tytul = $1  group by c . czytelnik_id , c . imie , c . nazwisko */
#line 79 "test.sqc"

        
        ilosc_wypozyczen[i]=0;
        int j=0;
        { ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "declare c2 cursor for select count ( distinct c . czytelnik_id ) as liczba_czytelnikow , c . imie , c . nazwisko from czytelnik c join wypozyczenie w using ( czytelnik_id ) join wc wc using ( wypozyczenie_id ) join ksiazki k using ( ksiazka_id ) where k . tytul = $1  group by c . czytelnik_id , c . imie , c . nazwisko", 
	ECPGt_char,(lista_ksiazek[i]),(long)20,(long)1,(20)*sizeof(char), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, ECPGt_EOIT, ECPGt_EORT);
#line 83 "test.sqc"

if (sqlca.sqlwarn[0] == 'W') sqlprint();
#line 83 "test.sqc"

if (sqlca.sqlcode < 0) Prnt ( );}
#line 83 "test.sqc"

        while(sqlca.sqlcode == 0){
            wypozyczenie_tmp = 0;
            { ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "fetch c2", ECPGt_EOIT, 
	ECPGt_int,&(wypozyczenie_tmp),(long)1,(long)1,sizeof(int), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_char,(imie),(long)20,(long)1,(20)*sizeof(char), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_char,(nazwisko),(long)20,(long)1,(20)*sizeof(char), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, ECPGt_EORT);
#line 86 "test.sqc"

if (sqlca.sqlwarn[0] == 'W') sqlprint();
#line 86 "test.sqc"

if (sqlca.sqlcode < 0) Prnt ( );}
#line 86 "test.sqc"

            if(SQLCODE == 0){ 
                ilosc_wypozyczen[i]+=wypozyczenie_tmp;
                strcpy(imiona[i][j],imie);
                strcpy(nazwiska[i][j],nazwisko);
                j++;
            }
        }
        { ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "close c2", ECPGt_EOIT, ECPGt_EORT);
#line 94 "test.sqc"

if (sqlca.sqlwarn[0] == 'W') sqlprint();
#line 94 "test.sqc"

if (sqlca.sqlcode < 0) Prnt ( );}
#line 94 "test.sqc"

    }

    printf("[");
    for(int i=0; i<ilosc_ksiazek; i++){
        printf("{");
        printf("\"tytul\": \"%s\",\"ilosc_czytelnikow\": %d, \"czytelnicy\": ",lista_ksiazek[i], ilosc_wypozyczen[i]);
        for(int j=0; j<ilosc_wypozyczen[i]; j++){
            printf("{\"imie\": \"%s\", \"nazwisko\": \"%s\"}",imiona[i][j],nazwiska[i][j]);
            if(j != ilosc_wypozyczen[i]-1)
                printf(",");
        }
        if(i != ilosc_ksiazek-1)
            printf("},\n");
    }
    printf("]\n");
 
    { ECPGdisconnect(__LINE__, "ALL");
#line 111 "test.sqc"

if (sqlca.sqlwarn[0] == 'W') sqlprint();
#line 111 "test.sqc"

if (sqlca.sqlcode < 0) Prnt ( );}
#line 111 "test.sqc"

    return 0;
}