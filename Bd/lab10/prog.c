#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <libpq-fe.h>

int main(){
    //program wczytuje maksymalnie 10 zapytan o dlugosci maksymalnej 700 znakow z pliku sql.txt
    char sqls_to_execute[10][700];
    int sqls_length[10];
    PGconn *conn;
    PGresult *result;
    const char *connection_str = "host=localhost port=5432 dbname=u1konopka user=u1konopka password=1konopka";
    conn = PQconnectdb(connection_str);
    if (PQstatus(conn) == CONNECTION_BAD){
        fprintf(stderr, "Connection to %s failed, %s",connection_str,PQerrorMessage(conn));
    } 
    else{
        FILE *f;
        char * line = NULL;
        size_t len = 0;
        ssize_t read;
        int i = 0;
        f = fopen("sql.txt", "r");
        if (f == NULL)
            exit(EXIT_FAILURE);
        while ((read = getline(&line, &len, f)) != -1) {
            sqls_length[i] = read;
            strcpy(sqls_to_execute[i],line);
            i++;
        }
        fclose(f);
        int sqls_number = i;

        for(int i=0; i<sqls_number; i++){
            result = PQexec(conn, sqls_to_execute[i]);
            if(PQresultStatus(result) != PGRES_TUPLES_OK){
                fprintf(stderr, "SELECT failed: %s", PQerrorMessage(conn));
                PQclear(result);
            }    
            else{
                int n = 0, r = 0;
                int nrows   = PQntuples(result);
                int nfields = PQnfields(result);
                printf("[");
                for(r = 0; r < nrows; r++){
                    printf("{");
                    for(n = 0; n < nfields; n++){
                        if(PQftype(result, n) == 20 || PQftype(result, n) == 21 || PQftype(result, n) == 23 || PQftype(result, n) == 700 || PQftype(result, n) == 701 || PQftype(result, n) == 1700)
                            printf("\"%s\":%s, ", PQfname(result, n),PQgetvalue(result,r,n));
                        else
                            printf("\"%s\":\"%s\", ", PQfname(result, n),PQgetvalue(result,r,n));
                        if(n == nfields-1)
                            printf("\b\b");
                    }
                    if(r == nrows-1)
                        printf("}]\n");
                    else    
                        printf("},\n");
                }
            }
            PQclear(result);
            printf("\n");
        }
    }
    PQfinish(conn);
    return EXIT_SUCCESS;
}