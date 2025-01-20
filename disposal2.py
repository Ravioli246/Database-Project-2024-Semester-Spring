import csv
import random
from faker import Faker
fake = Faker()

books, disposal_workers = [], []
with open('./datagen2/data/new/books2.csv', 'r') as books_file:
    reader = csv.DictReader(books_file)
    for row in reader:
        books.append({
            'Book_ID': int(row['Book_ID']),
            'Title': row['Title']
        })
with open('./datagen2/data/new/employees.csv', 'r') as employees_file:
    reader = csv.DictReader(employees_file)
    for row in reader:
        if row['Role'] == 'Disposal Worker':
            disposal_workers.append(int(row['Employee_ID']))

materials = ['Paper', 'Leather', 'Synthetic', 'Metal']
methods = [
    'Incineration', 'Recycling', 'Donation', 'Burial', 'Shredding', 'Repurposing'
]

disposal_ids = set()
while len(disposal_ids) < 20000:
    disposal_ids.add(random.randint(1000000, 9999999))

disposal_data = []
used_books = set()
for disposal_id in disposal_ids:
    book = random.choice(books)
    while book['Book_ID'] in used_books:
        book = random.choice(books)
    used_books.add(book['Book_ID'])
    employee_id = random.choice(disposal_workers)
    method = random.choice(methods)
    material = random.choice(materials)
    disposal_date = fake.date_between(start_date='-2y', end_date='today')

    disposal_data.append([
        disposal_id, book['Book_ID'], employee_id, method, material, disposal_date
    ])

with open('./datagen2/data/new/disposals2.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Disposal_ID", "Book_ID", "Employee_ID", "Disposal_Method", "Material_of_Book", "Date"])
    writer.writerows(disposal_data)