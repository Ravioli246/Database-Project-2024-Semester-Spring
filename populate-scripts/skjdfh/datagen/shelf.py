import csv

archive_data, shelf_data = [], []
with open('./datagen/data/archives.csv', 'r') as archives_file:
    reader = csv.DictReader(archives_file)
    for row in reader:
        archive_data.append({
            "Archive_Number": int(row['Archive_Number']),
            "Capacity": int(row['Capacity'])
        })

shelf_data = []
for archive in archive_data:
    archive_number = archive["Archive_Number"]
    capacity = archive["Capacity"]
    num_shelves = capacity // 100

    current_shelf_number = 101
    for _ in range(num_shelves):
        shelf_data.append([archive_number, current_shelf_number])
        current_shelf_number += 1

with open('./datagen/data/shelves.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Archive_Number", "Shelf_Number"])
    writer.writerows(shelf_data)