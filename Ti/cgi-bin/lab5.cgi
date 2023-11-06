#!/usr/bin/python3
import cgi
import os

form = cgi.FieldStorage()

name = form.getvalue('name')
author = form.getvalue('author')
ip = os.environ['REMOTE_ADDR']
timestamp = os.popen('date').read().strip()

data_file = '../techniki_internetowe/lab5/data.txt'

with open(data_file, 'a') as file:
    file.write(f"{name};{author};{timestamp};{ip}\n")


print("Content-type: text/html")
print("")
print("<html><head><title>Lab5 - CGI</title>")
print("""<link rel="stylesheet" type="text/css" href="../techniki_internetowe/lab5/data.css">""")
print("</head><body>")

if os.path.exists(data_file):
    print("""<h2><div class="header_two">REKORDY W BAZIE DANYCH:</h2></div>""")
    print("""<table><tr><td>Autor</td><td>Tytul</td><td>IP</td><td>date</td></tr>""")
    with open(data_file, 'r') as data:
        for line in data:
            if line.strip() == '':
                continue
            name, author, timestamp, ip = line.split(';')
            print(f"<tr><th>{name}</th><th>{author}</th><th>{ip}</th><th>{timestamp}</th></tr>")

print("</table></body></html>")