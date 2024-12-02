CREATE TABLE Employee
(
  Age INT NOT NULL,
  Employee_ID INT NOT NULL,
  Salary INT NOT NULL,
  Role VARCHAR(20) NOT NULL,
  Name VARCHAR(50) NOT NULL,
  PRIMARY KEY (Employee_ID)
);

CREATE TABLE Book
(
  Book_ID INT NOT NULL,
  Author VARCHAR(50) NOT NULL,
  Rarity VARCHAR(30) NOT NULL,
  Genre VARCHAR(40) NOT NULL,
  Title VARCHAR(100) NOT NULL,
  PRIMARY KEY (Book_ID)
);

CREATE TABLE Disposal
(
  Disposal_ID INT NOT NULL,
  Method VARCHAR(300) NOT NULL,
  Material_of_Book VARCHAR(50) NOT NULL,
  Date DATE NOT NULL,
  Book_ID INT NOT NULL,
  Employee_ID INT NOT NULL,
  PRIMARY KEY (Disposal_ID),
  FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Archive_
(
  Archive_Number INT NOT NULL,
  Book_Type INT NOT NULL,
  Capacity INT NOT NULL,
  Number_of_Shelves INT NOT NULL,
  PRIMARY KEY (Archive_Number)
);

CREATE TABLE Upkeep
(
  Upkeep_ID INT NOT NULL,
  Tools_used VARCHAR(300) NOT NULL,
  Reason_for_Upkeep VARCHAR(300) NOT NULL,
  Date DATE NOT NULL,
  Employee_ID INT NOT NULL,
  Book_ID INT NOT NULL,
  PRIMARY KEY (Upkeep_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
  FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

CREATE TABLE Archival_Assignment
(
  Old_shelf VARCHAR(100) NOT NULL,
  Assignment_ID INT NOT NULL,
  Date DATE NOT NULL,
  Old_Archive_Room INT NOT NULL,
  New_Shelf INT NOT NULL,
  Employee_ID INT NOT NULL,
  Book_ID INT NOT NULL,
  New_Archive_Room INT NOT NULL,
  PRIMARY KEY (Assignment_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
  FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
  FOREIGN KEY (New_Archive_Room) REFERENCES Archive_(Archive_Number)
);

CREATE TABLE Shelf
(
  Shel_Number INT NOT NULL,
  Archive_Number INT NOT NULL,
  PRIMARY KEY (Shel_Number),
  FOREIGN KEY (Archive_Number) REFERENCES Archive_(Archive_Number)
);
