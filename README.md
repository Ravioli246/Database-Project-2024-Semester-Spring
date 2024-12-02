# Database-Project-2024-Semester-Spring

# Library Management System

## Overview

This system manages the operations of a library or archive, including book storage, book disposal, and book upkeep. The system consists of several modules that handle different aspects of the library's management:

1. **Book Management**: Creates and manages book records, including metadata like title, author, rarity, and genre.

2. **Employee Management**: Manages employee records, including their roles (Archivist, Restorationist, Disposal Worker).

3. **Archival Management**: Handles the storage and organization of books in archives and on shelves.

4. **Book Disposal**: Tracks the disposal of books, including the disposal method and the employee responsible.

5. **Book Upkeep**: Records the maintenance and restoration activities performed on books, including the tools used and the reason for the upkeep.

6. **Archival Assignment**: Manages the process of transferring books between different archives and shelves.

## Entity Relationship Diagram

The picture below is the ERD for our database.

![Entity Relationship Diagram 1](media/image1.png)

This picture is our DSD/ our relational schema
![Schema Diagram](media/image2.png)

### Key Entities

1. **Book**: Represents a book in the library, with metadata such as title, author, rarity, and genre.

2. **Employee**: Represents an employee of the library, with attributes like ID, name, age, salary, and role.

3. **Archive**: Represents a physical archive storage unit, with attributes like archive number, book type, and capacity.

4. **Shelf**: Represents a shelf within an archive, with a unique shelf number.

5. **Disposal**: Tracks the disposal of a book, including the disposal method, material of the book, and the employee responsible.

6. **Upkeep**: Tracks the maintenance and restoration activities performed on a book, including the tools used and the reason for the upkeep.

7. **Archival Assignment**: Manages the process of transferring books between different archives and shelves, including the old and new locations and the employee responsible.

## Thought Process: Disposal and Upkeep as Separate Entities

Initially, the disposal and upkeep processes were considered as separate "room" entities. However, we decided to make them their own "job" entities. This decision was made to better represent the distinct nature of these operations and to capture the relevant details for each process.

### Benefits of Separate Entities

1. **Maintain Detailed Records**: Storing disposal and upkeep information in dedicated entities allows for more comprehensive tracking of activities.

2. **Facilitate Reporting and Analysis**: Separation enables more granular reporting and independent process monitoring.

3. **Enhance Workflow Management**: Better management of workflows and responsibilities associated with disposal and upkeep tasks.

4. **Support Scalability**: Provides a flexible approach to managing library/archive functions as the organization grows.

## Data Generation Scripts

The system includes several Python scripts for generating sample data:

- `bookDG1.py`: Generates book data
- `employeeDG1.py`: Generates employee data
- `archiveDG1.py`: Generates archive data
- `assignmentDG1.py`: Generates archival assignment data
- `disposalDG1.py`: Generates book disposal data
- `upkeepDG1.py`: Generates book upkeep data
- `shelDG1.py`: Generates shelf data

These scripts can be used to populate the system with sample data for testing, demonstrations, and training purposes.

## Future Enhancements

Potential future improvements include:

1. **User Interface**: Develop a web-based or desktop application for system interaction.

2. **Reporting and Analytics**: Implement advanced data analysis capabilities.

3. **Integrated Barcode/RFID System**: Streamline book tracking and inventory management.

4. **Automated Workflows**: Implement automated processes to enhance efficiency.

5. **Backup and Disaster Recovery**: Ensure data safety and integrity.

6. **Scalability and Performance Optimization**: Optimize system architecture for large-scale operations.



