import csv
from faker import Faker
import random
fake = Faker()

roles = ["Archivist", "Restorationist", "Disposal Worker"]

employee_data = []
for employee_id in range(1001, 1031):
    age = random.randint(18, 65)
    salary = random.randint(30000, 120000)
    role = random.choice(roles)
    name = fake.name()
    
    employee_data.append([employee_id, age, salary, role, name])

with open('./datagen/data/employees.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Employee_ID", "Age", "Salary", "Role", "Name"])
    writer.writerows(employee_data)