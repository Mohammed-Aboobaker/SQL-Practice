#select * from branches
#select * from cards
#select * from customers
#select * from employees
#select * from loans
#select * from transactions
#select transaction_date, amount
#from transactions
#select card_id, card_type, expiry_date
#from cards;
#select branch_name, city
#from branches;
#select customer_id, gender, annual_income, branch_id
#from customers;
 #elect customer_id, first_name, last_name
 #rom customers
#where city="Pune";
#select customer_id, first_name, last_name
#from customers
#where gender="f";
#select customer_id, account_id,
#from accounts
#where
#Select customer_id, first_name, last_name, credit_score
#from customers
#where credit_score>700;
#select customer_id, loan_id
#from loans
#where loan_status="closed";
#Select customer_id, first_name, last_name, credit_score
#from customers
#order by annual_income;
#select customer_id, account_id, balance
#from accounts
#order by balance;
#select customer_id, first_name, last_name, credit_score
#from customers
#order by credit_score desc
#limit 5;
#Select employee_id, employee_name, hire_date
#from employees
#order by hire_date
#limit 3;
#select distinct city
#from customers;
#select distinct account_type
#from accounts;
#select customer_id, first_name, last_name, gender
#from customers
#where not gender="M";
#select account_id, account_type, balance
#from accounts
#where balance>200000;
#select customer_id, first_name, Last_name
#from customers
#where annual_income<700000;
#select loan_id, loan_amount, customer_id
#from loans
#where interest_rate>=10;
#select employee_id, employee_name, salary
#from employees
#where salary<=100000;
 #elect customer_id, first_name, last_name, state
#from customers
#where state!="karnataka";
#select transaction_id, account_id, amount
#from transactions
#where amount>50000;
#select * from cards
#where expiry_date<"2027-01-01";
#select * from customers
#where date_of_birth > "1993-01-01";
#select * from transactions
#where amount <> 30000;
#select * from Loans
#where end_date < "2030-01-01";
#select * from cards
#where card_type <> "credit";
#select * from accounts
#where balance > 300000;
#select * from customers
#where credit_score - 50 > 650;
#select * from loans
#where loan_amount * interest_rate > 3000000;
#select * from accounts
#where balance / 1000 > 200;
#select * from customers
#where annual_income / 12 >= 18000;
#select * from loans
#where loan_amount - (interest_rate * 10000) > 3000000;
#select * from employees
#where salary * 12 > 1500000;
#select * from transactions
#where amount * 2 >= 200000;
#select * from loans
#where loan_amount / 12 < 50000;
# select * from customers
# where credit_score + 50 >= 800;
# select first_name as "name" 
# from customers;
# select * from customers
# where state="karnataka" AND gender="F";
# select * from accounts
# where account_type = "savings" AND balance > 100000;
# select * from loans
# where loan_type = "personal" and loan_status = "closed";
# select * from customers
# where annual_income > 900000 and credit_score > 700;
#  select * from employees
#  where job_title = "branch manager" OR salary > 100000;
# select * from customers
# where state = "maharashtra" and gender = "F";
# select * from transactions
# where transaction_type = "withdrawal" or Channel = "NEFT";
# select * from customers
# where city = "Kolhapur" or city = "delhi";
# select * from customers
# where state = "maharashtra" and (credit_score > 700 OR annual_income > 100000);
# select * from accounts
# where (account_type = "Savings" OR account_type = "current") AND balance > 200000;
# select * from loans
# where loan_status="active" and (loan_type="home loan" or loan_type= "Business loan"); 
-----------------------------------------------------------------------------------------------
*************************BETWEEN QUERIES*****************************
#  select * from loans
#  where Loan_amount between 200000 and 1000000; 
# select * from accounts
# where balance between 50000 and 200000;
# select * from employees
# where salary between 90000 and 200000;
# select customer_id, first_name, last_name, credit_score
# from customers
# where credit_score between 650 and 750;
# select loan_id, customer_id, loan_type, interest_rate
# from loans
# where interest_rate between 8 and 10;
# select transaction_id, account_id, transaction_date, amount
# from transactions
# where transaction_date between "2026-04-01" and "2026-04-30";
# select loan_id, customer_id, loan_type, start_date
# from loans
# where start_date between "2022-01-01" and "2022-12-31";
# select * from accounts
# where status="active" and balance between 100000 and 400000;
# select * from accounts
# where balance between 100000 and 500000;
# select * from customers
# where credit_score between 700 and 800;
# select * from loans
# where loan_amount between 300000 and 5000000;
# select * from cards
# where issue_date between "2021-01-01" and "2023-12-31";
# select employee_id, employee_name, job_title, salary
# from employees
# where salary between 900000 and 160000;
# select * from transactions
# where amount between 30000 and 130000;
# select account_id, customer_id, account_type, balance
# from accounts
# where balance between 100000 and 500000;
-----------------------------------------------------------------------------------------------
*************************IN and NESTED QUERIES*****************************
# select * from customers
# where city in ("kolhapur","bangaluru");
# select * from customers
# where state in ("karnataka", "Delhi");
# select * from loans
# where loan_status in ("active","closed");
# select * from employees
# where job_title in ("relationship manager", "branch manager");
# select * from branches
# where city in ("Pune","delhi","Mumbai");
# select * from transactions
# where channel in ("UPI","ATM");
# select * from customers
# where credit_score in (742,790,805);
# select * from customers
# where  city not in ("pune","mumbai","Delhi");	
# select * from customers
# where customer_ID in (select customer_id from loans);
# select * from customers
# where customer_id not in (select customer_id from loans);
# select * from customers
# where branch_id in (select branch_id from branches where state="Maharashtra");
# select * from employees where job_title="branch manager" and branch_id in (select branch_id from employees where salary >140000);
# select * from customers where customer_ID in (101,102,103) and city not in ("pune"); 
# select * from transactions where account_id in(select account_id from accounts where account_type="Current");
# select * from cards where customer_id in(select customer_id from customers where credit_score>750);
# select * from accounts where account_id in (select account_id from transactions where amount>100000);
# select * from branches where branch_id in (select branch_id from employees where salary > 100000);
# select * from customers 
# where customer_id in (select customer_id from loans) AND customer_id in (select customer_id from cards);
# select * from loans
# where customer_id in (select customer_id from branches where branch_id in(1,2));
# select * from customers where customer_id not in (select customer_id from accounts where status="Dormant");
# select * from cards where customer_id in (select customer_id from customers order by annual_income desc lIMIT 3);
-----------------------------------------------------------------------------------------------
*************************LIKE QUERIES*****************************
#  select * from customers where first_name like "A%";
# select * from customers where last_name like "A%";
# select * from customers where city like "%U%";
# select * from branches where branch_name like "B%";
# select * from customers where first_name like "%V";
# select * from loans where loan_type like "%loan%";
# select * from employees where job_title like "%manager%";
# select * from customers where last_name like "S%";
# select * from accounts where account_type like "%s%";
# select * from customers where first_name like "_____";
# select * from customers where city like "____";
