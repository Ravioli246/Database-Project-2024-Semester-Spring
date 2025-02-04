import csv
import random
from faker import Faker

fake = Faker()

rarity_levels = ['Common', 'Rare', 'Very Rare', 'Legendary']

genres = []
with open('./datagen2/data/restored/genre.csv', 'r') as genre_file:
    reader = csv.DictReader(genre_file)
    for row in reader:
        genres.append(row['name'])

books = []
with open('./datagen2/data/restored/book.csv', 'r') as book_file:
    reader = csv.DictReader(book_file)
    for row in reader:
        books.append(row)

authors = {}
with open('./datagen2/data/restored/author.csv', 'r') as author_file:
    reader = csv.DictReader(author_file)
    for row in reader:
        authors[row['author_id']] = f"{row['first_name']} {row['last_name']}"

book_authors = {}
with open('./datagen2/data/restored/written_by.csv', 'r') as written_by_file:
    reader = csv.DictReader(written_by_file)
    for row in reader:
        book_id = row['id']
        author_id = row['author_id']
        if book_id not in book_authors:
            book_authors[book_id] = []
        book_authors[book_id].append(author_id)

book_data = []
for book in books:
    book_id = book['id']
    title = book['title']
    release_date = book['release_date']
    page_count = book['page_count']
    book_format = book['format']
    description = book['description']
    isbn = book['isbn']

    author_ids = book_authors.get(book_id, [])
    authors_for_book = [authors[author_id] for author_id in author_ids if author_id in authors]
    author = ", ".join(authors_for_book) if authors_for_book else "Unknown Author"

    genre = random.choice(genres)
    rarity = random.choice(rarity_levels)
    
    book_data.append([book_id, title, release_date, page_count, book_format, description, isbn, author, rarity, genre])

with open('./datagen2/data/new/books2.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Book_ID", "Title", "Release_Date", "Page_Count", "Format", "Description", "ISBN", "Author", "Rarity", "Genre"])
    writer.writerows(book_data)
