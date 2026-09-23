-- BANKING SQL PRACTICAL DATASET
-- MySQL 8.x
DROP DATABASE IF EXISTS banking_training;
CREATE DATABASE banking_training;
USE banking_training;

CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(80) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    gender CHAR(1),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(40) DEFAULT 'India',
    date_of_birth DATE,
    credit_score INT,
    annual_income DECIMAL(12,2),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    opened_date DATE,
    balance DECIMAL(14,2),
    status VARCHAR(20),
    branch_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_date DATE,
    transaction_type VARCHAR(20),
    amount DECIMAL(12,2),
    channel VARCHAR(20),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_type VARCHAR(30),
    loan_amount DECIMAL(14,2),
    interest_rate DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    loan_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(80),
    job_title VARCHAR(50),
    salary DECIMAL(12,2),
    branch_id INT,
    hire_date DATE,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE cards (
    card_id INT PRIMARY KEY,
    customer_id INT,
    card_type VARCHAR(20),
    issue_date DATE,
    expiry_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO branches VALUES
(1,'Kolhapur Main','Kolhapur','Maharashtra'),
(2,'Pune Central','Pune','Maharashtra'),
(3,'Mumbai Fort','Mumbai','Maharashtra'),
(4,'Bengaluru MG Road','Bengaluru','Karnataka'),
(5,'Delhi Connaught','Delhi','Delhi');

INSERT INTO customers VALUES
(101,'Aarav','Sharma','M','Pune','Maharashtra','India','1992-04-12',742,950000,2),
(102,'Priya','Patil','F','Kolhapur','Maharashtra','India','1995-09-21',681,720000,1),
(103,'Rohan','Mehta','M','Mumbai','Maharashtra','India','1988-01-18',790,1450000,3),
(104,'Sneha','Joshi','F','Pune','Maharashtra','India','1993-07-30',635,610000,2),
(105,'Vikram','Desai','M','Bengaluru','Karnataka','India','1985-11-02',718,1100000,4),
(106,'Ananya','Kulkarni','F','Kolhapur','Maharashtra','India','1998-02-15',655,520000,1),
(107,'Rahul','Nair','M','Delhi','Delhi','India','1990-06-08',805,1750000,5),
(108,'Kavya','Iyer','F','Bengaluru','Karnataka','India','1996-12-11',774,980000,4),
(109,'Neeraj','Shah','M','Mumbai','Maharashtra','India','1987-03-25',612,580000,3),
(110,'Meera','Rao','F','Pune','Maharashtra','India','1991-10-19',728,1250000,2),
(111,'Manish','Verma','M','Delhi','Delhi','India','1989-05-14',690,840000,5),
(112,'Pooja','Gupta','F','Kolhapur','Maharashtra','India','1997-08-05',758,670000,1);

INSERT INTO accounts VALUES
(10001,101,'Savings','2020-01-15',125000,'Active',2),
(10002,101,'Current','2021-06-10',245000,'Active',2),
(10003,102,'Savings','2022-03-18',68000,'Active',1),
(10004,103,'Savings','2019-09-05',310000,'Active',3),
(10005,103,'Current','2020-11-20',525000,'Active',3),
(10006,104,'Savings','2023-02-11',42000,'Active',2),
(10007,105,'Salary','2018-07-01',185000,'Active',4),
(10008,106,'Savings','2024-01-09',36000,'Active',1),
(10009,107,'Savings','2019-04-23',450000,'Active',5),
(10010,108,'Savings','2021-12-13',215000,'Active',4),
(10011,109,'Savings','2023-08-17',29000,'Dormant',3),
(10012,110,'Current','2020-10-28',390000,'Active',2),
(10013,111,'Savings','2022-09-09',97000,'Active',5),
(10014,112,'Savings','2024-05-16',51000,'Active',1);

INSERT INTO transactions VALUES
(1,10001,'2026-01-05','Deposit',50000,'UPI'),
(2,10001,'2026-01-19','Withdrawal',12000,'ATM'),
(3,10002,'2026-02-02','Deposit',100000,'NEFT'),
(4,10003,'2026-02-15','Deposit',25000,'UPI'),
(5,10004,'2026-02-20','Withdrawal',30000,'ATM'),
(6,10005,'2026-03-03','Deposit',150000,'NEFT'),
(7,10006,'2026-03-11','Deposit',18000,'UPI'),
(8,10007,'2026-03-15','Deposit',90000,'Salary'),
(9,10008,'2026-04-01','Withdrawal',7000,'ATM'),
(10,10009,'2026-04-12','Deposit',120000,'NEFT'),
(11,10010,'2026-04-25','Withdrawal',22000,'UPI'),
(12,10012,'2026-05-06','Deposit',80000,'NEFT'),
(13,10013,'2026-05-19','Deposit',35000,'UPI'),
(14,10014,'2026-06-03','Deposit',15000,'UPI'),
(15,10001,'2026-06-17','Deposit',40000,'UPI'),
(16,10004,'2026-06-21','Withdrawal',45000,'ATM'),
(17,10005,'2026-07-02','Deposit',95000,'NEFT'),
(18,10009,'2026-07-08','Withdrawal',50000,'ATM'),
(19,10010,'2026-07-15','Deposit',60000,'UPI'),
(20,10012,'2026-07-22','Withdrawal',30000,'ATM');

INSERT INTO loans VALUES
(501,101,'Home Loan',4500000,8.25,'2021-04-01','2041-04-01','Active'),
(502,102,'Personal Loan',350000,11.50,'2024-02-10','2027-02-10','Active'),
(503,103,'Car Loan',1200000,9.10,'2022-07-15','2027-07-15','Active'),
(504,104,'Personal Loan',200000,12.25,'2025-01-20','2027-01-20','Active'),
(505,105,'Home Loan',5200000,8.00,'2020-09-12','2040-09-12','Active'),
(506,107,'Business Loan',3000000,10.20,'2023-06-05','2030-06-05','Active'),
(507,109,'Personal Loan',150000,13.00,'2025-05-18','2027-05-18','Closed'),
(508,110,'Car Loan',900000,9.50,'2024-08-01','2029-08-01','Active');

INSERT INTO employees VALUES
(201,'Amit Joshi','Branch Manager',125000,1,'2016-04-10'),
(202,'Nisha Patil','Relationship Manager',85000,1,'2019-07-15'),
(203,'Karan Shah','Branch Manager',145000,2,'2014-01-20'),
(204,'Ritu Mehta','Relationship Manager',92000,2,'2020-03-11'),
(205,'Sahil Rao','Branch Manager',160000,3,'2012-06-18'),
(206,'Isha Nair','Credit Analyst',105000,3,'2018-09-01'),
(207,'Dev Kumar','Branch Manager',150000,4,'2015-11-25'),
(208,'Neha Verma','Credit Analyst',98000,5,'2021-02-14');

INSERT INTO cards VALUES
(301,101,'Credit','2022-01-10','2027-01-10','Active'),
(302,102,'Debit','2023-04-15','2028-04-15','Active'),
(303,103,'Credit','2021-09-20','2026-09-20','Active'),
(304,104,'Debit','2024-02-12','2029-02-12','Active'),
(305,105,'Credit','2020-06-05','2025-06-05','Expired'),
(306,107,'Credit','2022-08-18','2027-08-18','Active'),
(307,108,'Debit','2023-11-09','2028-11-09','Active'),
(308,110,'Credit','2024-03-16','2029-03-16','Active');

-- Verify
SELECT COUNT(*) AS customers FROM customers;
SELECT COUNT(*) AS accounts FROM accounts;
SELECT COUNT(*) AS transactions FROM transactions;
SELECT COUNT(*) AS loans FROM loans;
