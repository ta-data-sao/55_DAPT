# Lab | SQL queries

- Open SQL.
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

**2. Which is the genre with the highest number of ratings?**
- To sum the rating use `rating_count_tot` column.

**3. Which is the genre with most apps?**
- Use `prime_genre` column.

**4. Which is the genre with the fewest apps?**
- Use `prime_genre` column.

**5. Find the top 10 apps most rated.**
- Use `track_name` and `rating_count_tot` column.

**6. Find the top 10 apps best rated by users.**
- Use `track_name` and `user_rating` column.

**7. Using the same query from the previous exercise add the column `rating_count_tot`.**
- You'll notice that some of the top-rated don't have many reviews.
- Use `track_name`, `user_rating` and `rating_count_tot`.

**8. Now, find the top 5 ordering by ratings and number of votes.**
- Use `track_name`, `user_rating` and `rating_count_tot` columns.

**9. Find the total number of games available in more than 1 language.**
- Use `track_name` and `langnum` columns.

**10. Find the number of free vs paid apps.**
- Use `price` column.
- You can use `CASE WHEN` to filter free or paid apps.

**11. Find the number of free vs paid apps for each genre.**
- Use `price` and `prime_genre` column.
- You can use `CASE WHEN` to filter free or paid apps.
