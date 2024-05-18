CREATE DATABASE Library;
USE Library;
CREATE TABLE Branch(
 Branch_No INT PRIMARY KEY,
 Manager_ID INT,
 Branch_Address VARCHAR(30),
 Contact_No INT
);
DESC Branch;
INSERT INTO Branch VALUES
(11201,1101,'Alabama',89565232),
(11202,1102,'Belfast',74542415),
(11203,1103,'Birmingham',78451202),
(11204,1104,'Cardiff',74545121),
(11205,1105,'Durham',88474122),
(11206,1106,'Exeter',85411212),
(11207,1107,'Edinburg',85623250),
(11208,1108,'Ely',78451212),
(11209,1109,'Gloucester',94475514),
(11210,1110,'Glasgow',87454556);
SELECT * FROM Branch;

CREATE TABLE Employee(
Emp_ID INT PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary INT,
Branch_No INT,
FOREIGN KEY(Branch_No) REFERENCES Branch(Branch_No) ON DELETE CASCADE
);
DESC Employee;

INSERT INTO Employee VALUES
(7801,'Albert','Clerk',40000,11204),
(7802,'Annie','Cashier',50000,11205),
(7803,'Archie','PRO',60000,11205),
(7804,'Bella','Librarian',90000,11205),
(7805,'Carlisle','Senior Librarian',100000,11206),
(7806,'colton','clerk',30000,11201),
(7807,'Dean','Network administration',50000,11205),
(7808,'Everette','Technician',40000,11202),
(7809,'Federick','Librarian',90000,11205),
(7810,'Grayson','Clerk',40000,11203),
(7811,'Hailee','PRO',60000,11204),
(7812,'Jenny','Assistant',30000,11206),
(7813,'Kinsley','Manager',70000,11207),
(7814,'Linda','Manager',70000,11208),
(7815,'Marie','Assistant',30000,11209),
(7816,'Norah','Cashier',50000,11210),
(7817,'Piper','PRO',60000,11205),
(7818,'Renesme','Senior Librarian',100000,11209),
(7819,'Sonny','Customer service',30000,11208),
(7820,'Willow','Network Administration',50000,11207);
SELECT * FROM Employee;

CREATE TABLE Customer(
Customer_ID INT PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_Address VARCHAR(30),
Reg_date DATE);
DESC Customer;

INSERT INTO Customer VALUES
(8901,'Anne','Manchester','2023-02-12'),
(8902,'Benyamin','Glasgow','2022-01-09'),
(8903,'Benny','Cardiff','2022-06-06'),
(8904,'Charles','Edinburg','2022-03-23'),
(8905,'Daniel','Ely','2022-04-21'),
(8906,'Emmi','Alabama','2023-06-05'),
(8907,'Everette','Durham','2021-08-16'),
(8908,'Hudson','Birmingham','2022-09-06'),
(8909,'Federick','Exeter','2023-11-29'),
(8910,'Zain','Gloucester','2022-12-23'),
(8911,'Dain','Scotland','2022-04-14'),
(8912,'Radcliff','Belfast','2021-02-02'),
(8913,'Harry','Ely','2022-03-17'),
(8914,'George','Oxford','2021-03-12'),
(8915,'Winston','Durham','2021-03-12'),
(8916,'Weily','Manchester','2022-04-21');
SELECT * FROM Customer;

CREATE TABLE Issue_status(
Issue_ID INT,
Issued_customer INT,
Issued_book_name VARCHAR(30),
Issue_date DATE,
ISBN_book VARCHAR(30),
FOREIGN KEY(Issued_customer) REFERENCES Customer(Customer_ID) ON DELETE CASCADE,
FOREIGN KEY(ISBN_book) REFERENCES Books(ISBN) ON DELETE CASCADE 
);
DESC Issue_status;
INSERT INTO Issue_status VALUES
(101,8915,'God of smallthings','2022-02-12','ISBN1'),
(102,8901,'Harry potter1','2023-06-03','ISBN2'),
(103,8902,'Twilight1','2024-02-25','ISBN11'),
(104,8904,'Gullivers travel','2024-01-02','ISBN15'),
(105,8905,'The great gatsby','2024-01-16','ISBN16'),
(106,8910,'The Divine Comedy','2023-06-28','ISBN17'),
(107,8916,'Pride and Prejudice','2024-01-09','ISBN18'),
(108,8911,'Secret of nagas','2024-03-24','ISBN19'),
(109,8910,'The Prince','2024-05-01','ISBN20'),
(110,8906,'Twilight4','2024-02-12','ISBN14');
SELECT * FROM Issue_status;

CREATE TABLE Return_status(
Return_ID INT PRIMARY KEY,
Return_cust INT ,
Return_book_name VARCHAR(100),
Return_date DATE,
ISBN_Book2 VARCHAR(30),
FOREIGN KEY(Return_cust) REFERENCES Customer(Customer_ID),
FOREIGN KEY(ISBN_Book2) REFERENCES Books(ISBN) ON DELETE CASCADE
);
DESC Return_status;

INSERT INTO Return_status VALUES
(501,8902,'Harry potter 2','2024-01-02','ISBN3'),
(502,8915,'God of small things','2023-06-01','ISBN1'),
(503,8909,'Twilight2','2024-05-01','ISBN12'),
(504,8916,'Twilight3','2024-01-12','ISBN13'),
(505,8901,'The prince','2023-06-12','ISBN20'),
(506,8914,'The diary of a young girl','2024-05-16','ISBN10'),
(507,8912,'Divine comedy','2024-03-15','ISBN17'),
(508,8913,'Twilight1','2024-01-15','ISBN11'),
(509,8904,'Gullivers Travel','2024-03-24','ISBN15'),
(510,8911,'Secret of nagas','2024-05-14','ISBN19');
SELECT * FROM Return_status;

CREATE TABLE Books(
ISBN VARCHAR(30) PRIMARY KEY,
Book_Title VARCHAR(100),
Category VARCHAR(100),
Rental_price INT,
STATUS ENUM('YES','NO'),
Author VARCHAR(100),
Publisher VARCHAR(100)
);
DESC Books;

INSERT INTO Books(ISBN,Book_Title,Category,Rental_price,STATUS,Author,Publisher) VALUES
('ISBN1','God of small things','Novel',20,'YES','Arundhathi Roy','HarperCollins'),
('ISBN2','Harry potter 1','Fiction',15,'YES','JK Rowling','Bloomsbury'),
('ISBN3','Harry potter 2','Fiction',15,'NO','JK Rowling','Bloomsbury'),
('ISBN4','Harry potter 3','Fiction',15,'YES','JK Rowling','Bloomsbury'),
('ISBN5','Harry potter 4','Fiction',15,'YES','JK Rowling','Bloomsbury'),
('ISBN6','Harry potter 5','Fiction',15,'NO','JK Rowling','Bloomsbury'),
('ISBN7','Harry potter 6','Fiction',15,'NO','JK Rowling','Bloomsbury'),
('ISBN8','Harry potter 7','Fiction',15,'YES','JK Rowling','Bloomsbury'),
('ISBN9','Harry potter 8','Fiction',15,'YES','JK Rowling','Bloomsbury'),
('ISBN10','The diary of a young girl','Autobiography',20,'YES','Anne Frank','Contact & Het Achterhuis'),
('ISBN11','Twilight1','Novel',25,'NO','Stephenie Meyer','Little Brown and Company'),  
('ISBN12','Twilight2','Novel',25,'YES','Stephenie Meyer','Little Brown and Company'),
('ISBN13','Twilight3','Novel',25,'NO','Stephenie Meyer','Little Brown and Company'),
('ISBN14','Twilight4','Novel',25,'NO','Stephenie Meyer','Little Brown and Company'),
('ISBN15','Gullivers travel','Fantasy',20,'YES','Jonathan Swift','UNKNOWN'),
('ISBN16','The great Gatsby','History',20,'No','F ScottFitzgerald','Simon & Schuster'),
('ISBN17','The Divine Comedy','Poetry',12,'Yes','Dante Alighieri','Simon & Schuster'),
('ISBN18','Pride and Prejudice','Drama',12,'No','Jane Austen','Simon & Schuster'),
('ISBN19','The secret of nagas','Fiction','20','YES','Amish tripathi','Westlandbooks'),
('ISBN20','The Prince','History',12,'NO','Niccolo Machiavelli','UNKNOWN');
SELECT * FROM Books;

# Questions
#1) Retrieve the book title, category, and rental price of all available books.
SELECT Book_Title,Category,Rental_price FROM Books WHERE STATUS = 'YES';

#2) List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name,Salary FROM Employee ORDER BY Salary DESC;

#3) Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Books.Book_Title,Customer.Customer_name FROM Issue_status 
JOIN Books ON Issue_status.ISBN_Book = Books.ISBN
JOIN Customer ON Issue_status.Issued_customer = Customer.Customer_ID;

#4) Display the total count of books in each category
SELECT Category, COUNT(*) FROM Books GROUP BY Category;

#5) Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name,Position,Salary FROM Employee WHERE Salary > 50000;

#6) List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name,Reg_date FROM Customer
LEFT JOIN Issue_status ON Customer.Customer_ID = Issue_status.Issued_Customer
WHERE Customer.Reg_date < '2022-01-01' 
AND
Issue_status.ISBN_Book IS NULL; 

#7) Display the branch numbers and the total count of employees in each branch.
SELECT Branch_No,COUNT(*) FROM Employee GROUP BY Branch_No;

#8)  Display the names of customers who have issued books in the month of June 2023.
SELECT Customer_name FROM Customer
JOIN Issue_status ON Customer.Customer_ID = Issue_status.Issued_customer
WHERE Issue_status.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

#9)Retrieve book_title from book table containing history. 
SELECT Book_Title FROM Books WHERE Category = 'History';

#10) Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_No,COUNT(*) as Total_employee FROM Employee GROUP BY Branch_No HAVING Total_employee > 5;












