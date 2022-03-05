# Lab | mySQL Select

## Introduction
In this lab you will practice `SELECT` statement which will be extremely useful in your future work as a data analyst/scientist/engineer.  
- Use code from `publications_database.sql` to create your databese, tables and insert data. 
  
**1. Who have published what at where?**

In this challenge you will write a mySQL `SELECT` query that `JOIN` various tables to figure out what titles each author has published at which publishers.   
Your output should have at least the following columns:  
From `authors` table:  
- `au_id` - the ID of the author.
- `au_lname` - author last name. 
- `au_fname` - author first name.   

From `titles` table:  
- `title` - name of the published title.  

From `publishers` table:  
- `pub_name` - name of the publisher where the title was published.

If your query is correct, the total rows in your output should be the same as the total number of records in table `titleauthor`.

#### Answers:
```sql
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    titles.title AS "TITLE",
    publishers.pub_name AS "PUBLISHER"
FROM 
    authors
JOIN 
    titleauthor
    ON authors.au_id = titleauthor.au_id
LEFT JOIN 
    titles
    ON titleauthor.title_id = titles.title_id
LEFT JOIN 
    publishers
    ON titles.pub_id = publishers.pub_id;

-- Check the output
SELECT COUNT(au_id) FROM titleauthor;
```


**2. Who have published how many at where?**

Elevating from your solution in challenge 1, query how many titles each author has published at each publisher. Order your output by the title count in descending order.  

*Note: the screenshot above is not the complete output.*  

To check if your output is correct, sum up the `TITLE COUNT` column. The sum number should be the same as the total number of records in Table `titleauthor`.  

*Hint: In order to count the number of titles published by an author, you need to use [COUNT](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html).  Also check out [GROUP BY](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html) because you will count the rows of different groups of data.*

#### Answers:

```sql
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    publishers.pub_name AS "PUBLISHER",
    COUNT(*) AS "TITLE COUNT"
FROM 
    authors
JOIN 
    titleauthor
    ON authors.au_id = titleauthor.au_id
LEFT JOIN 
    titles
    ON titleauthor.title_id = titles.title_id
LEFT JOIN 
    publishers
    ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name
ORDER BY 
    "TITLE COUNT" DESC;

-- Sum up the `TITLE COUNT`

SELECT 
    SUM(titles_count.title_count)
  FROM (
    SELECT 
        authors.au_id,
        authors.au_lname,
        authors.au_fname,
        publishers.pub_name,
        COUNT(*) AS title_count
    FROM 
        authors
    JOIN 
        titleauthor
        ON authors.au_id = titleauthor.au_id
    LEFT JOIN 
        titles
        ON titleauthor.title_id = titles.title_id
    LEFT JOIN 
        publishers
        ON titles.pub_id = publishers.pub_id
    GROUP BY 
        authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
    ORDER BY 
        title_count DESC
    ) AS titles_count;
```


**3. Best selling authors**

Who are the top 3 authors who have sold the highest number of titles?   
Your output should have at least the following columns:  

From `authors` table:  
- `au_id` - the ID of the author.
- `au_lname` - author last name. 
- `au_fname` - author first name. 
  
From `sales` table:
- `qty` - quantity
  
Your output should be ordered based on `TOTAL` from high to low.  
Only output the top 3 best selling authors.

Your output should look something like below:

#### Answers:
```sql
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    SUM(sales.qty) AS "TOTAL"
FROM 
    authors
JOIN 
    titleauthor
    ON authors.au_id = titleauthor.au_id
LEFT JOIN 
    titles
    ON titleauthor.title_id = titles.title_id
LEFT JOIN 
    sales
    ON titles.title_id = sales.title_id
GROUP BY 
    authors.au_id,
    authors.au_lname,
    authors.au_fname
ORDER BY 
    "TOTAL" DESC
LIMIT 3;
```

**4. Best selling authors ranking**

Now modify your solution in challenge 3 so that the output will display all 23 authors instead of the top 3.  Note that the authors who have sold 0 titles should also appear in your output, ideally display `0` instead of `NULL`.   
Also order your results based on `TOTAL` from high to low. 

#### Answers:
```sql
SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    COALESCE(SUM(sales.qty), 0) AS "TOTAL"
FROM 
    authors
LEFT JOIN 
    titleauthor
    ON authors.au_id = titleauthor.au_id
LEFT JOIN 
    titles
    ON titleauthor.title_id = titles.title_id
LEFT JOIN 
    sales
    ON titles.title_id = sales.title_id
GROUP BY 
    authors.au_id,
    authors.au_lname,
    authors.au_fname
ORDER BY 
    "TOTAL" DESC;
```