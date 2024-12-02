import csv
import random
from faker import Faker
fake = Faker()

books, restorationists = [], []
with open('./datagen/data/books.csv', 'r') as books_file:
    reader = csv.DictReader(books_file)
    for row in reader:
        books.append({'Book_ID': int(row['Book_ID']), 'Title': row['Title']})

with open('./datagen/data/employees.csv', 'r') as employees_file:
    reader = csv.DictReader(employees_file)
    for row in reader:
        if row['Role'] == 'Restorationist':
            restorationists.append(int(row['Employee_ID']))

tools = ["Glue", "Scissors", "Brush", "Tweezers", "Clamps", "Scalpel", "Binding Tape"]
reasons = ["Torn pages", "Loose binding", "Water damage", "Faded text", "Mold growth", "Dust accumulation",
           "Staining", "Cover damage","Insect damage", "Aging and brittleness"]

upkeep_ids = set()
while len(upkeep_ids) < 40000:
    upkeep_ids.add(random.randint(10000000, 99999999))

upkeep_data = []
used_books = set()
for upkeep_id in upkeep_ids:
    book = random.choice(books)
    while book['Book_ID'] in used_books:
        book = random.choice(books)
    used_books.add(book['Book_ID'])
    employee_id = random.choice(restorationists)
    tools_used = random.choice(tools)
    reason_for_upkeep = random.choice(reasons)
    upkeep_date = fake.date_between(start_date='-2y', end_date='today')

    upkeep_data.append([
        upkeep_id, book['Book_ID'], employee_id, tools_used, reason_for_upkeep, upkeep_date
    ])

with open('./datagen/data/upkeeps.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Upkeep_ID", "Book_ID", "Employee_ID", "Tools_Used", "Reason_for_Upkeep", "Date"])
    writer.writerows(upkeep_data)