import csv
from faker import Faker
import random

fake = Faker()

rarity_levels = ['Common', 'Rare', 'Very Rare', 'Legendary']
genres = ['Fiction', 'Non-fiction', 'Biography', 'Mystery', 'Fantasy', 'Science Fiction', 'Romance', 'Horror']

def generate_book_title():
    options = [
        fake.sentence(nb_words=5).rstrip(".").title(),
        f"The {fake.word().title()} Of {fake.city()}",
        fake.catch_phrase().title(),
        " ".join(fake.words(nb=3)).title(),
        fake.job().title(),
        f"{fake.word().title()} And The {fake.word().title()}",
        fake.sentence(nb_words=3).rstrip(".").title(),
        f"The {fake.word().title()} Of {fake.city()}",
        fake.catch_phrase().title(),
        " ".join(fake.words(nb=2)).title(),
        fake.job().title(),
        f"{fake.word().title()} And The {fake.word().title()}",
    ]
    return random.choice(options)

book_ids = set()
while len(book_ids) < 200000:
    book_ids.add(str(random.randint(1000000000, 9999999999)))

book_data = []
for book_id in book_ids:
    title = fake.catch_phrase().title()
    author = fake.name()
    rarity = random.choice(rarity_levels)
    genre = random.choice(genres)
    
    book_data.append([book_id, title, author, rarity, genre])

with open('./datagen/data/books.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Book_ID", "Title", "Author", "Rarity", "Genre"])
    writer.writerows(book_data)