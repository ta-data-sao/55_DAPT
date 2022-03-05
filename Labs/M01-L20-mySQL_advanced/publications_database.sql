CREATE DATABASE lab_publication;

USE lab_publication;

DROP TABLE IF EXISTS lab_publication.authors;

CREATE TABLE lab_publication.authors (
    au_id varchar(11) DEFAULT '',
    au_lname varchar(14) DEFAULT '',
    au_fname varchar(11) DEFAULT '',
    phone varchar(12) DEFAULT '',
    address varchar(20) DEFAULT '',
    city varchar(14) DEFAULT '',
    state varchar(2) DEFAULT '',
    zip int,
    contract smallint);

DROP TABLE IF EXISTS lab_publication.publishers;

CREATE TABLE lab_publication.publishers (
    pub_id smallint,
    pub_name varchar(21) DEFAULT '',
    city varchar(10) DEFAULT '',
    state varchar(2) DEFAULT '',
    country varchar(7) DEFAULT '');


DROP TABLE IF EXISTS lab_publication.sales;


CREATE TABLE lab_publication.sales (
    stor_id smallint,
    ord_num varchar(8) DEFAULT '',
    ord_date varchar(19) DEFAULT '',
    qty smallint,
    payterms varchar(10) DEFAULT '',
    title_id varchar(6) DEFAULT '');


DROP TABLE IF EXISTS lab_publication.titleauthor;

CREATE TABLE lab_publication.titleauthor (
    au_id varchar(11) DEFAULT '',
    title_id varchar(6) DEFAULT '',
    au_ord smallint,
    royaltyper smallint);


DROP TABLE IF EXISTS lab_publication.titles;

CREATE TABLE lab_publication.titles (
    title_id varchar(6) DEFAULT '',
    title varchar(63) DEFAULT '',
    type varchar(12) DEFAULT '',
    pub_id smallint,
    price varchar(7) DEFAULT '',
    advance varchar(10) DEFAULT '',
    royalty varchar(2) DEFAULT '',
    ytd_sales varchar(5) DEFAULT '',
    notes varchar(179) DEFAULT '',
    pubdate varchar(19) DEFAULT '');



INSERT INTO lab_publication.authors (au_id, au_lname, au_fname, phone, address, city, state, zip, contract) VALUES
('172-32-1176', 'White', 'Johnson', '408 496-7223', '10932 Bigge Rd.', 'Menlo Park', 'CA', 94025, 1),
('213-46-8915', 'Green', 'Marjorie', '415 986-7020', '309 63rd St. #411', 'Oakland', 'CA', 94618, 1),
('238-95-7766', 'Carson', 'Cheryl', '415 548-7723', '589 Darwin Ln.', 'Berkeley', 'CA', 94705, 1),
('267-41-2394', 'O''Leary', 'Michael', '408 286-2428', '22 Cleveland Av. #14', 'San Jose', 'CA', 95128, 1),
('274-80-9391', 'Straight', 'Dean', '415 834-2919', '5420 College Av.', 'Oakland', 'CA', 94609, 1),
('341-22-1782', 'Smith', 'Meander', '913 843-0462', '10 Mississippi Dr.', 'Lawrence', 'KS', 66044, 0),
('409-56-7008', 'Bennet', 'Abraham', '415 658-9932', '6223 Bateman St.', 'Berkeley', 'CA', 94705, 1),
('427-17-2319', 'Dull', 'Ann', '415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', 94301, 1),
('472-27-2349', 'Gringlesby', 'Burt', '707 938-6445', 'PO Box 792', 'Covelo', 'CA', 95428, 1),
('486-29-1786', 'Locksley', 'Charlene', '415 585-4620', '18 Broadway Av.', 'San Francisco', 'CA', 94130, 1),
('527-72-3246', 'Greene', 'Morningstar', '615 297-2723', '22 Graybar House Rd.', 'Nashville', 'TN', 37215, 0),
('648-92-1872', 'Blotchet-Halls', 'Reginald', '503 745-6402', '55 Hillsdale Bl.', 'Corvallis', 'OR', 97330, 1),
('672-71-3249', 'Yokomoto', 'Akiko', '415 935-4228', '3 Silver Ct.', 'Walnut Creek', 'CA', 94595, 1),
('712-45-1867', 'del Castillo', 'Innes', '615 996-8275', '2286 Cram Pl. #86', 'Ann Arbor', 'MI', 48105, 1),
('722-51-5454', 'DeFrance', 'Michel', '219 547-9982', '3 Balding Pl.', 'Gary', 'IN', 46403, 1),
('724-08-9931', 'Stringer', 'Dirk', '415 843-2991', '5420 Telegraph Av.', 'Oakland', 'CA', 94609, 0),
('724-80-9391', 'MacFeather', 'Stearns', '415 354-7128', '44 Upland Hts.', 'Oakland', 'CA', 94612, 1),
('756-30-7391', 'Karsen', 'Livia', '415 534-9219', '5720 McAuley St.', 'Oakland', 'CA', 94609, 1),
('807-91-6654', 'Panteley', 'Sylvia', '301 946-8853', '1956 Arlington Pl.', 'Rockville', 'MD', 20853, 1),
('846-92-7186', 'Hunter', 'Sheryl', '415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', 94301, 1),
('893-72-1158', 'McBadden', 'Heather', '707 448-4982', '301 Putnam', 'Vacaville', 'CA', 95688, 0),
('899-46-2035', 'Ringer', 'Anne', '801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', 84152, 1),
('998-72-3567', 'Ringer', 'Albert', '801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', 84152, 1);


INSERT INTO lab_publication.publishers (pub_id, pub_name, city, state, country) VALUES 
(736, 'New Moon Books', 'Boston', 'MA', 'USA'),
(877, 'Binnet & Hardley', 'Washington', 'DC', 'USA'),
(1389, 'Algodata Infosystems', 'Berkeley', 'CA', 'USA'),
(1622, 'Five Lakes Publishing', 'Chicago', 'IL', 'USA'),
(1756, 'Ramona Publishers', 'Dallas', 'TX', 'USA'),
(9901, 'GGG&G', 'Mnchen', NULL, 'Germany'),
(9952, 'Scootney Books', 'New York', 'NY', 'USA'),
(9999, 'Lucerne Publishing', 'Paris', NULL, 'France');


INSERT INTO lab_publication.sales (stor_id, ord_num, ord_date, qty, payterms, title_id) VALUES 
(6380, '6871', '1994-09-14 00:00:00', 5, 'Net 60', 'BU1032'),
(6380, '722a', '1994-09-13 00:00:00', 3, 'Net 60', 'PS2091'),
(7066, 'A2976', '1993-05-24 00:00:00', 50, 'Net 30', 'PC8888'),
(7066, 'QA7442.3', '1994-09-13 00:00:00', 75, 'ON invoice', 'PS2091'),
(7067, 'D4482', '1994-09-14 00:00:00', 10, 'Net 60', 'PS2091'),
(7067, 'P2121', '1992-06-15 00:00:00', 40, 'Net 30', 'TC3218'),
(7067, 'P2121', '1992-06-15 00:00:00', 20, 'Net 30', 'TC4203'),
(7067, 'P2121', '1992-06-15 00:00:00', 20, 'Net 30', 'TC7777'),
(7131, 'N914008', '1994-09-14 00:00:00', 20, 'Net 30', 'PS2091'),
(7131, 'N914014', '1994-09-14 00:00:00', 25, 'Net 30', 'MC3021'),
(7131, 'P3087a', '1993-05-29 00:00:00', 20, 'Net 60', 'PS1372'),
(7131, 'P3087a', '1993-05-29 00:00:00', 25, 'Net 60', 'PS2106'),
(7131, 'P3087a', '1993-05-29 00:00:00', 15, 'Net 60', 'PS3333'),
(7131, 'P3087a', '1993-05-29 00:00:00', 25, 'Net 60', 'PS7777'),
(7896, 'QQ2299', '1993-10-28 00:00:00', 15, 'Net 60', 'BU7832'),
(7896, 'TQ456', '1993-12-12 00:00:00', 10, 'Net 60', 'MC2222'),
(7896, 'X999', '1993-02-21 00:00:00', 35, 'ON invoice', 'BU2075'),
(8042, '423LL922', '1994-09-14 00:00:00', 15, 'ON invoice', 'MC3021'),
(8042, '423LL930', '1994-09-14 00:00:00', 10, 'ON invoice', 'BU1032'),
(8042, 'P723', '1993-03-11 00:00:00', 25, 'Net 30', 'BU1111'),
(8042, 'QA879.1', '1993-05-22 00:00:00', 30, 'Net 30', 'PC1035');


INSERT INTO lab_publication.titleauthor (au_id, title_id, au_ord, royaltyper) VALUES 
('172-32-1176', 'PS3333', 1, 100),
('213-46-8915', 'BU1032', 2, 40),
('213-46-8915', 'BU2075', 1, 100),
('238-95-7766', 'PC1035', 1, 100),
('267-41-2394', 'BU1111', 2, 40),
('267-41-2394', 'TC7777', 2, 30),
('274-80-9391', 'BU7832', 1, 100),
('409-56-7008', 'BU1032', 1, 60),
('427-17-2319', 'PC8888', 1, 50),
('472-27-2349', 'TC7777', 3, 30),
('486-29-1786', 'PC9999', 1, 100),
('486-29-1786', 'PS7777', 1, 100),
('648-92-1872', 'TC4203', 1, 100),
('672-71-3249', 'TC7777', 1, 40),
('712-45-1867', 'MC2222', 1, 100),
('722-51-5454', 'MC3021', 1, 75),
('724-80-9391', 'BU1111', 1, 60),
('724-80-9391', 'PS1372', 2, 25),
('756-30-7391', 'PS1372', 1, 75),
('807-91-6654', 'TC3218', 1, 100),
('846-92-7186', 'PC8888', 2, 50),
('899-46-2035', 'MC3021', 2, 25),
('899-46-2035', 'PS2091', 2, 50),
('998-72-3567', 'PS2091', 1, 50),
('998-72-3567', 'PS2106', 1, 100);


INSERT INTO lab_publication.titles (title_id, title, type, pub_id, price, advance, royalty, ytd_sales, notes, pubdate) VALUES 
('BU1032', 'The Busy Executive''s Database Guide', 'business', 1389, '19.9900', '5000.0000', '10', '4095', 'An overview of available database systems with emphasis on common business applications. Illustrated.', '1991-06-12 00:00:00'),
('BU1111', 'Cooking with Computers: Surreptitious Balance Sheets', 'business', 1389, '11.9500', '5000.0000', '10', '3876', 'Helpful hints on how to use your electronic resources to the best advantage.', '1991-06-09 00:00:00'),
('BU2075', 'You Can Combat Computer Stress!', 'business', 736, '2.9900', '10125.0000', '24', '18722', 'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.', '1991-06-30 00:00:00'),
('BU7832', 'Straight Talk About Computers', 'business', 1389, '19.9900', '5000.0000', '10', '4095', 'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.', '1991-06-22 00:00:00'),
('MC2222', 'Silicon Valley Gastronomic Treats', 'mod_cook', 877, '19.9900', '0.0000', '12', '2032', 'Favorite recipes for quick, easy, and elegant meals.', '1991-06-09 00:00:00'),
('MC3021', 'The Gourmet Microwave', 'mod_cook', 877, '2.9900', '15000.0000', '24', '22246', 'Traditional French gourmet recipes adapted for modern microwave cooking.', '1991-06-18 00:00:00'),
('MC3026', 'The Psychology of Computer Cooking', 'UNDECIDED', 877, NULL, NULL, NULL, NULL, NULL, '2014-11-07 10:39:37'),
('PC1035', 'But Is It User Friendly?', 'popular_comp', 1389, '22.9500', '7000.0000', '16', '8780', 'A survey of software for the naive user, focusing on the ''friendliness'' of each.', '1991-06-30 00:00:00'),
('PC8888', 'Secrets of Silicon Valley', 'popular_comp', 1389, '20.0000', '8000.0000', '10', '4095', 'Muckraking reporting on the world''s largest computer hardware and software manufacturers.', '1994-06-12 00:00:00'),
('PC9999', 'Net Etiquette', 'popular_comp', 1389, NULL, NULL, NULL, NULL, 'A must-read for computer conferencing.', '2014-11-07 10:39:37'),
('PS1372', 'Computer Phobic AND Non-Phobic Individuals: Behavior Variations', 'psychology', 877, '21.5900', '7000.0000', '10', '375', 'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don''t.', '1991-10-21 00:00:00'),
('PS2091', 'Is Anger the Enemy?', 'psychology', 736, '10.9500', '2275.0000', '12', '2045', 'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.', '1991-06-15 00:00:00'),
('PS2106', 'Life Without Fear', 'psychology', 736, '7.0000', '6000.0000', '10', '111', 'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.', '1991-10-05 00:00:00'),
('PS3333', 'Prolonged Data Deprivation: Four Case Studies', 'psychology', 736, '19.9900', '2000.0000', '10', '4072', 'What happens when the data runs dry?  Searching evaluations of information-shortage effects.', '1991-06-12 00:00:00'),
('PS7777', 'Emotional Security: A New Algorithm', 'psychology', 736, '7.9900', '4000.0000', '10', '3336', 'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.', '1991-06-12 00:00:00'),
('TC3218', 'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean', 'trad_cook', 877, '20.9500', '7000.0000', '10', '375', 'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.', '1991-10-21 00:00:00'),
('TC4203', 'Fifty Years in Buckingham Palace Kitchens', 'trad_cook', 877, '11.9500', '4000.0000', '14', '15096', 'More anecdotes from the Queen''s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.', '1991-06-12 00:00:00'),
('TC7777', 'Sushi, Anyone?', 'trad_cook', 877, '14.9900', '8000.0000', '10', '4095', 'Detailed instructions on how to make authentic Japanese sushi in your spare time.', '1991-06-12 00:00:00');
