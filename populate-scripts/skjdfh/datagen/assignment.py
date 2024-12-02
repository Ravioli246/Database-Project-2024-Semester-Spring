import csv
import random
from datetime import timedelta, date
from faker import Faker
fake = Faker()

def generate_limited_dates(start_date, num_dates, max_per_day):
    dates = []
    current_date = start_date
    assignments_today = 0

    for _ in range(num_dates):
        if assignments_today >= max_per_day:
            current_date += timedelta(days=1)
            assignments_today = 0
        dates.append(current_date)
        assignments_today += 1

    return dates

books, archives, archivists, shelves = [], [], [], []
with open('./datagen/data/books.csv', 'r') as books_file:
    reader = csv.DictReader(books_file)
    for row in reader:
        books.append(int(row['Book_ID']))
with open('./datagen/data/archives.csv', 'r') as archives_file:
    reader = csv.DictReader(archives_file)
    for row in reader:
        archives.append(int(row['Archive_Number']))
with open('./datagen/data/employees.csv', 'r') as employees_file:
    reader = csv.DictReader(employees_file)
    for row in reader:
        if row['Role'] == "Archivist":
            archivists.append(int(row['Employee_ID']))
with open('./datagen/data/shelves.csv', 'r') as shelves_file:
    reader = csv.DictReader(shelves_file)
    for row in reader:
        shelves.append(int(row['Shelf_Number']))

assignment_ids = set()
while len(assignment_ids) < 300000:
    assignment_ids.add(random.randint(10**14, 10**15 - 1))
start_date = date.today() - timedelta(days=5 * 365)
ordered_dates = generate_limited_dates(start_date, len(assignment_ids), max_per_day=1000)

book_assignments = {book_id: {"Old_Archive_Room": 0, "Old_Shelf": 0} for book_id in books}
archival_assignment_data = []
for assignment_id, assignment_date in zip(sorted(assignment_ids), ordered_dates):
    book_id = random.choice(books)
    old_archive_room = book_assignments[book_id]["Old_Archive_Room"]
    old_shelf = book_assignments[book_id]["Old_Shelf"]
    new_archive_room = random.choice(archives)
    new_shelf = random.choice(shelves)
    employee_id = random.choice(archivists)
    book_assignments[book_id]["Old_Archive_Room"] = new_archive_room
    book_assignments[book_id]["Old_Shelf"] = new_shelf

    archival_assignment_data.append([assignment_id, assignment_date, book_id,
                                      old_archive_room, old_shelf, new_archive_room,
                                      new_shelf, employee_id])

with open('./datagen/data/archival_assignments.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Assignment_ID", "Date", "Book_ID", "Old_Archive_Room",
                     "Old_Shelf", "New_Archive_Room", "New_Shelf", "Employee_ID"])
    writer.writerows(archival_assignment_data)