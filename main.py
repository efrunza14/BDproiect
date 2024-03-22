import os
os.environ["PATH"] = r"C:\Users\40770\Downloads\instantclient-basic-windows.x64-21.12.0.0.0dbru" + os.pathsep + os.environ["PATH"]

from flask import Flask, render_template, jsonify, request, redirect
import cx_Oracle
import math
import random
from datetime import datetime

app = Flask(__name__)
dsn = cx_Oracle.makedsn('bd-dc.cs.tuiasi.ro', '1539', 'orcl')
b = cx_Oracle.connect(user='bd105', password='bd105', dsn=dsn)

'''CLIENT'''


@app.route('/')
@app.route('/bd_CLIENT')
def Select_Client():
    bdCLIENT = []
    cur = b.cursor()
    cur.execute('select * from CLIENT')
    for result in cur:
        client = {'Nr_inregistrare': result[0], 'Nume_client': result[1], 'Prenume_client': result[2], 'CNP': result[3],
                   'Adresa': result[4], 'Email': result[5], 'Telefon': result[6], 'Puncte': result[7],
                   }
        bdCLIENT.append(client)
    cur.close()
    return render_template('index.html', bdclient=bdCLIENT)


@app.route('/add_CLIENT', methods=['POST'])
def add_client():
    error = None
    if request.method == 'POST':
        cur = b.cursor()
        values = ["'" + str(math.floor(random.random() * 10000)) + "'", "'" + request.form['Nume_client'] + "'",
                  "'" + request.form['Prenume_client'] + "'", "'" + request.form['CNP'] + "'",
                  "'" + request.form['Adresa'] + "'", "'" + request.form['Email'] + "'",
                  "'" + request.form['Telefon'] + "'", "'" + request.form['Puncte'] + "'"
                ]
        fields = ['Nr_inregistrare', 'Nume_client', 'Prenume_client', 'CNP', 'Adresa', 'Email', 'Telefon',
                  'Puncte']
        query = 'INSERT INTO %s (%s) VALUES (%s)' % (
            'CLIENT',
            ', '.join(fields),
            ', '.join(values)
        )
        cur.execute(query)
        cur.execute('commit')

    return redirect('/bd_CLIENT')


@app.route('/delete_CLIENT', methods=['POST'])
def del_c():
    c = "'" + request.form['Nr_inregistrare'] + "'"
    cur = b.cursor()
    cur.execute('delete from CLIENT where Nr_inregistrare=' + c)
    cur.execute('commit')
    return redirect('/bd_CLIENT')


'''PRODUS'''


@app.route('/bd_PRODUS')
def Select_Materie():
    bdPRODUS = []
    cur = b.cursor()
    cur.execute('select * from PRODUS')
    for result in cur:
        produs = {'ID_produs': result[0], 'Denumire_produs': result[1], 'An_produs': result[2],
                   'Puncte_produs': result[3], 'Brand_produs': result[4], 'Pret_produs': result[5]}
        bdPRODUS.append(produs)
    cur.close()
    return render_template('Produs.html', bdprodus=bdPRODUS)


@app.route('/add_PRODUS', methods=['POST'])
def Add_Produs():
    error = None
    if request.method == 'POST':
        cur = b.cursor()
        values = ["'" + str(math.floor(random.random() * 1000)) + "'", "'" + request.form['Denumire_produs'] + "'",
                  "'" + request.form['An_produs'] + "'", "'" + request.form['Puncte_produs'] + "'",
                  "'" + request.form['Brand_produs'] + "'", "'" + request.form['Pret_produs'] + "'"]
        fields = ['ID_produs','Denumire_produs', 'An_produs', 'Puncte_produs', 'Brand_produs', 'Pret_produs']
        query = 'INSERT INTO %s (%s) VALUES (%s)' % (
            'PRODUS',
            ', '.join(fields),
            ', '.join(values)
        )
        cur.execute(query)
        cur.execute('commit')

    return redirect('/bd_PRODUS')


@app.route('/delete_PRODUS', methods=['POST'])
def delete_produs():
    c = "'" + request.form["Denumire_produs"] + "'"
    cur = b.cursor()
    cur.execute('delete from PRODUS where Denumire_produs=' + c)
    cur.execute('commit')
    return redirect('/bd_PRODUS')



'''RESTANTA'''


@app.route('/bd_RESTANTA')
def Select_Restanta():
    bdRESTANTA = []
    cur = b.cursor()
    cur.execute('select * from RESTANTA')
    for result in cur:
        restanta = {'Nr_inregistrare': result[0], 'ID_produs': result[1]}
        bdRESTANTA.append(restanta)
    cur.close()
    return render_template('Restanta.html', bdrestanta=bdRESTANTA)


@app.route('/add_RESTANTA', methods=['POST'])
def Add_RESTANTA():
    error = None
    if request.method == 'POST':
        cur = b.cursor()
        values = ["'" + request.form['Nr_inregistrare'] + "'", "'" + request.form['ID_produs']+"'"]
        fields = ['Nr_inregistrare', 'ID_produs']
        query = 'INSERT INTO %s (%s) VALUES (%s)' % (
            'RESTANTA',
            ', '.join(fields),
            ', '.join(values)
        )
        cur.execute(query)
        cur.execute('commit')

    return redirect('/bd_RESTANTA')

@app.route('/delete_RESTANTA', methods=['POST'])
def delete_restanta():
    d = "'" + request.form["ID_produs"] + "'"
    cur = b.cursor()
    cur.execute('delete from RESTANTA where ID_produs=' + d)
    cur.execute('commit')
    return redirect('/bd_RESTANTA')

'''PROMOTIE'''
@app.route('/bd_BPROMOTIE')
def Select_Promotie():
    bdPROMOTIE = []
    cur = b.cursor()
    cur.execute('select * from PROMOTIE order by Puncte desc')
    for result in cur:
        promotie = {'Nr_inregistrare': result[0], 'Puncte': result[1], 'Valoare_promotie': result[2]}
        bdPROMOTIE.append(promotie)
    cur.close()
    return render_template('promotie.html', bdpromotie=bdPROMOTIE)


@app.route('/add_PROMOTIE', methods=['POST'])
def Add_PROMOTIE():
    error = None
    if request.method == 'POST':
        cur = b.cursor()
        values = ["'" + request.form['Nr_inregistrare'] + "'", "'" + request.form['Puncte'] + "'", "'" + request.form['Valoare_promotie'] + "'"]
        fields = ['Nr_inregistrare', 'Puncte', 'Valoare_promotie']
        query = 'INSERT INTO %s (%s) VALUES (%s)' % (
            'PROMOTIE',
            ', '.join(fields),
            ', '.join(values)
        )
        cur.execute(query)
        cur.execute('commit')

    return redirect('/bd_PROMOTIE')

@app.route('/delete_PROMOTIE', methods=['POST'])
def delete_promotie():
    d = "'" + request.form["Nr_inregistrare"] + "'"
    cur = b.cursor()
    cur.execute('delete from PROMOTIE where Nr_inregistrare=' + d)
    cur.execute('commit')
    return redirect('/bd_PROMOTIE')


@app.route('/')
@app.route('/update_PROMOTIE',methods=['POST'])
def updatepromotie():
    error = None
    if request.method == 'POST':
        cur = b.cursor()
        values = ["'" + request.form['Nr_inregistrare'] + "'",
                  "'" + request.form['Valoare_promotie'] + "'"]
        query = f"UPDATE PROMOTIE SET Valoare_promotie = {(values[1])} where Nr_inregistrare = {values[0]}"
        cur.execute(query)
        cur.execute('commit')
        return redirect('/bd_PROMOTIE')


if __name__ == '__main__':
    app.run()
