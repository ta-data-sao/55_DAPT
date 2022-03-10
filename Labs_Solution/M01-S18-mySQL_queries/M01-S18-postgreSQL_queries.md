# Lab | mySQL queries

- Open the PgAdmin server from mySQL.
- Create a database called **applestore**  and a table called **apple_table**. Use code from `applesotre_DATABASE.sql` to create table and insert data. 

Here is the description of columns for your knowledge:
- `id` : App ID
- `track_name`: App Name
- `size_bytes`: Size (in Bytes)
- `currency`: Currency Type
- `price`: Price amount
- `rating_count_tot`: User Rating counts (for all version)
- `rating_count_ver`: User Rating counts (for current version)
- `user_rating`: Average User Rating value (for all version)
- `user_rating_ver`: Average User Rating value (for current version)
- `ver`: Latest version code
- `cont_rating`: Content Rating
- `prime_genre`: Primary Genre
- `sup_devicesnum`: Number of supporting devices
- `ipadSc_urlsnum`: Number of screenshots showed for display
- `langnum`: Number of supported languages
- `vpp_lic`: Vpp Device Based Licensing Enabled

Answer the following questions using the **apple_table**:

**1. What are the different genres?**
- Use `prime_genre` column.

```sql
SELECT 
    prime_genre
FROM 
    apple_table
GROUP BY 
    prime_genre;
```


**2. Which is the genre with the highest number of ratings?**
- To sum the rating use `rating_count_tot` column.

```sql
SELECT 
	prime_genre AS GENRE,
	SUM(rating_count_tot) AS TOTAL_RATING_COUNT
FROM 
	apple_table
WHERE 
	rating_count_tot > 0
GROUP BY 
	prime_genre
ORDER BY 
	TOTAL_RATING_COUNT DESC
LIMIT 10;
```

**3. Which is the genre with most apps?**
- Use `prime_genre` column.

```sql
SELECT 
    prime_genre,
    COUNT(ID) AS COUNT_APP
FROM 
    apple_table
GROUP BY 
    prime_genre
ORDER BY 
    COUNT_APP DESC
LIMIT 5;
```


**4. Which is the genre with the fewest apps?**
- Use `prime_genre` column.

```sql
SELECT 
    prime_genre,
    COUNT(ID) AS COUNT_APP
FROM 
    apple_table
GROUP BY 
    prime_genre
ORDER BY 
    COUNT_APP
LIMIT 5;
```

**5. Find the top 10 apps most rated.**
- Use `track_name` and `rating_count_tot` column.

```sql
SELECT 
    track_name,
	rating_count_tot
FROM 
    apple_table
ORDER BY 
    rating_count_tot DESC
LIMIT 10;
```

**6. Find the top 10 apps best rated by users.**
- Use `track_name` and `user_rating` column.

```sql
SELECT 
	track_name,
    user_rating
FROM 
	apple_table
ORDER BY 
	 user_rating DESC
LIMIT 10;
```


**7. Using the same query from the previous exercise add the column `rating_count_tot`.**
- You'll notice that some of the top-rated don't have many reviews.
- Use `track_name`, `user_rating` and `rating_count_tot`.

```sql
SELECT 
	track_name,
    user_rating,
    rating_count_tot
FROM 
	apple_table
ORDER BY 
	 user_rating DESC
LIMIT 10;
```


**8. Now, find the top 5 ordering by ratings and number of votes.**
- Use `track_name`, `user_rating` and `rating_count_tot` columns.

```sql
SELECT 
    track_name,
    user_rating,
    rating_count_tot
FROM 
    apple_table
ORDER BY 
    user_rating DESC, 
    rating_count_tot DESC
LIMIT 5; 
```

**9. Find the total number of games available in more than 1 language.**
- Use `track_name`, `prime_genre` and `langnum` columns.

```sql
SELECT
    count(track_name) 
FROM
    apple_table
WHERE
	prime_genre = 'Games' AND
	langnum > 1;
```

**10. Find the number of free vs paid apps.**
- Use `price` column.
- You can use `CASE WHEN` to filter free or paid apps.

```sql
-- METHOD 1
SELECT 
	COUNT(CASE 
			WHEN price = 0 THEN 'free'  
		  END) as "free_app",
	COUNT(CASE 
			WHEN price > 0 THEN 'paid'  
		  END) as "paid_app"
FROM 
	apple_table;

-- METHOD 2
SELECT 
	CASE 
		WHEN price > 0 THEN 'paid' 
		WHEN price = 0 THEN 'free' 
	END AS is_paid,
	COUNT(id)
FROM
	apple_table
GROUP BY
	is_paid

```


**11. Find the number of free vs paid apps for each genre.**
- Use `price` and `prime_genre` column.
- You can use `CASE WHEN` to filter free or paid apps.

```sql
SELECT 
	prime_genre,
	COUNT(CASE 
			WHEN price = 0 THEN 'free'  
		  END) as paid_app,
	COUNT(CASE 
			WHEN price > 0 THEN 'paid'  
		  END) as free_app
FROM 
	apple_table
GROUP BY
	prime_genre
ORDER BY
	paid_app DESC
```
