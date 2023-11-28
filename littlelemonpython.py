import mysql.connector as connector

dbconfig={'host': 'myhost', 'user':'myusername', 'password':'mypassword', 'database': 'littlelemondb'}

connection = connector.connect(**dbconfig)
cursor = connection.cursor()

show_tablesquery = """SHOW TABLES"""

results = cursor.execute(show_tablesquery)
tables = cursor.fetchall()
for table in tables:
    print(table[0])

customer_query = '''Select
Concat(cs.FirstName, ' ', cs.LastName) as CustomerName,
ct.Address,
ct.City,
ct.State,
ct.ZipCode,
ct.Country,
ct.PhoneNumber,
ct.Email,
Sum(od.TotalCost) as Cost
From customers cs
Join contact ct
  on ct.CustomerID = cs.CustomerID
Join orders od
  on od.CustomerID = cs.CustomerID
Where od.TotalCost > 60.00
Group By
cs.Firstname, 
cs.Lastname, 
ct.Address, 
ct.City, 
ct.State, 
ct.ZipCode, 
ct.Country, 
ct.PhoneNumber, 
ct.Email
'''

cursor.execute(customer_query)
customers = cursor.fetchall()

for customer in customers:
    print("CustomerName: ", customer[0])
    print("Address: ", customer[1])
    print("City: ", customer[2])
    print("State: ", customer[3])
    print("ZipCode: ", customer[4])
    print("Country: ", customer[5])
    print("PhoneNumber: ", customer[6])
    print("Email: ", customer[7])
    print("Cost: ", customer[8])
    print("\n")