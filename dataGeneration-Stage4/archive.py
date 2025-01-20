import csv
import random
from faker import Faker
fake = Faker()

archive_numbers = list(range(1, 51))
book_types = ["Governmental", "Law", "Academic", "Historical Document", "Scroll", "General Purpose"]
capacity_values = [i * 1000 for i in range(10, 21)]

archive_data = []
for archive_number in archive_numbers:
    book_type = random.choice(book_types)
    capacity = random.choice(capacity_values)
    archive_data.append([archive_number, book_type, capacity])

with open('./datagen/data/archives.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Archive_Number", "Book_Type", "Capacity"])
    writer.writerows(archive_data)