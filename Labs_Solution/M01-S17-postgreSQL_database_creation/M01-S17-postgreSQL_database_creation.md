# Lab | PostgreSQL Database Creation

## Introduction
As a data expert you work at a car dealership company which sells new cars of various brands and models. 
Your company is small and new but it has branches in several countries. 
Now your boss realized your company imperatively needs a database to keep the records about the cars and customers.
Your boss trusts you the challenge to design, create, and manage the database.

## Design the Database
To start the data migration, it was defined that two tables will be created, one for  `cars` and other for `customers`.

**1. Creating the Database**

Create your database with the tables and columns below:  
Cars: `car_id`, `vin`, `manufacturer`, `model`, `car_year`, `color`  
Customers: `cust_id`, `cust_name`, `cust_phone`, `cust_email`, `cust_adress`, `cust_zipcode`

#### Answers:  
```sql
DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
	car_id smallserial PRIMARY KEY,
	vin varchar(30) NOT NULL,
	manufacturer text NOT NULL,
	model text NOT NULL,
	car_year smallint NOT NULL,
	color text NOT NULL
	);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	cust_id bigint PRIMARY KEY,
	cust_name text NOT NULL,
	cust_phone text,
	cust_email text,
	cust_adress text NOT NULL,
	cust_zipcode integer NOT NULL
	);
```


**2. Seeding the Database**

The purpose of *database seeding* is to provide some data for your empty database.
You'll be using the `INSERT INTO` statement for this purpose. The documentation can be found [here](https://www.postgresql.org/docs/12/sql-insert.html).

Here are some examples to insert into your tables:

### Cars

| car_id | vin | manufacturer | model | car_year | color |
| --- | --- | --- | --- | --- | --- |
| 0 | 3K096I98581DHSNUP | Volkswagen | Tiguan | 2019 | Blue |
| 1 | ZM8G7BEUQZ97IH46V | Peugeot | Rifter | 2019 | Red |
| 2 | RKXVNNIHLVVZOUB4M | Ford | Fusion | 2018 | White |
| 3 | HKNDGS7CU31E9Z7JW | Toyota | RAV4 | 2018 | Silver |
| 4 | DAM41UDN3CHU2WVF6 | Volvo | V60 | 2019 | Gray |
| 5 | DAM41UDN3CHU2WVF6 | Volvo | V60 Cross Country | 2019 | Gray |

### Customers

| cust_id | cust_name | cust_phone | cust_email | cust_adress | cust_zipcode |
| --- | --- | --- | --- | --- | --- |
| 10001 | Pablo Picasso | +34 636 17 63 82 | - | Paseo de la Chopera 14 Madrid Spain | 28045 |
| 20001 | Abraham Lincoln | +1 305 907 7086 | - | 120 SW 8th St Mimia United States | 33130 |
| 30001 | Napoléon Bonaparte | +33 1 79 75 40 00 | - | 40 Rue du Colisée Paris France | 75008 |



### Answers: 
```sql
INSERT INTO cars (car_id,vin, manufacturer, model, car_year, color) VALUES 
(0, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
(1, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
(2, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
(3, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
(4, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
(5, 'DAM41UDN3CHU2WVF', 'Volvo','V60 Cross Country', 2019, 'Gray');

--

INSERT INTO customers (cust_id, cust_name, cust_phone, cust_adress, cust_zipcode) VALUES 
(10001,'Pablo Picasso','+34 636 17 63 82','Paseo de la Chopera 14 Madrid Spain', 28045),
(20001,'Abraham Lincoln','+1 305 907 7086','120 SW 8th St Mimia United States', 33130),
(30001,'Napoléon Bonaparte','+33 1 79 75 40 00','40 Rue du Colisée Paris France', 75008);
```


**3. Updating and Deleting Database Records** 
 
Now you find an error you need to fix in your existing data - in the Customers table, you mistakenly spelled *Miami* as *Mimia* for Abraham Lincoln. Also, you received the email addresses of the three customers:

| Name | Email |
| --- | ---|
| Pablo Picasso | ppicasso@gmail.com |
| Abraham Lincoln | lincoln@us.gov |
| Napoléon Bonaparte | hello@napoleon.me |

In addition, you also find a duplicated car entry for VIN `DAM41UDN3CHU2WVF6`.   
You want to delete car ID #4 from the database. 

### Answers:
```sql
-- UPDATE
UPDATE customers
SET cust_adress = '120 SW 8th St Miami United States' WHERE cust_id = 20001;

UPDATE customers
SET cust_email = 'ppicasso@gmail.com' WHERE cust_id = 10001;

UPDATE customers
SET cust_email = 'lincoln@us.gov' WHERE cust_id = 20001;

UPDATE customers
SET cust_email = 'hello@napoleon.me' WHERE cust_id = 30001;

-- DELETE
DELETE FROM cars WHERE car_id=4; 
```
