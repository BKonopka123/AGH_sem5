#!/usr/bin/python3
import cgi
import os
import json

form = cgi.FieldStorage()
data = json.loads(form.getvalue('info', '{}'))

wiosna = data['wiosna']
lato = data['lato']
jesien = data['jesien']
zima = data['zima']

data_file = '../techniki_internetowe/lab7/data.txt'

with open(data_file, 'a') as file:
    file.write(f"{wiosna};{lato};{jesien};{zima}\n")

print("Content-type: appliaction/json")
print("")
print("""{"pory": {""")

if os.path.exists(data_file):
    wiosnaval=0
    latoval=0
    jesienval=0
    zimaval=0
    with open(data_file, 'r') as data:
        for line in data:
            if line.strip() == '':
                continue
            wiosna1, lato1, jesien1, zima1 = line.split(';')
            wiosnaval += int(wiosna1)
            latoval += int(lato1)
            jesienval += int(jesien1)
            zimaval += int(zima1)
        print(f""""wiosna": {wiosnaval}, "lato": {latoval}, "jesien": {jesienval}, "zima": {zimaval}""")
else:
    print("Brak informacji do wyswietlenia!")

print("} }")