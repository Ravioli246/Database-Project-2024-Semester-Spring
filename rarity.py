import csv
import random

rarity_names = ['Common', 'Rare', 'Very Rare', 'Legendary']

book_ids = []
with open('./datagen2/data/restored/book.csv', 'r') as book_file:
    reader = csv.DictReader(book_file)
    for row in reader:
        book_ids.append(row['id'])

rarity_data = []
for book_id in book_ids:
    rarity = random.choice(rarity_names)
    rarity_data.append([book_id, rarity])

with open('./datagen2/data/new/raritys.csv', 'w', newline='') as rarity_file:
    writer = csv.writer(rarity_file)
    writer.writerow(["Book_ID", "Rarity"])
    writer.writerows(rarity_data)