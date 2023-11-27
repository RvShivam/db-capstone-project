import mysql.connector as connector

dbconfig={'host': 'myhost', 'user':'myusername', 'password':'mypassword', 'database': 'littlelemondb'}

connection = connector.connect(**dbconfig)
cursor = connection.cursor()

show_tablesquery = """SHOW TABLES"""

results = cursor.execute(show_tablesquery)
tables = cursor.fetchall()
for table in tables:
    print(table[0])

