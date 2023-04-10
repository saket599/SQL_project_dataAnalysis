--Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
--Return your list ordered alphabetically by email starting with A
select distinct email, first_name, last_name from customer
Join invoice on Customer.customer_id = invoice.customer_id
Join invoice_line on invoice.invoice_id = invoice_line.invoice_id
Where track_id in (
Select track_id from Track
join genre
on Genre.Genre_id = track.Genre_id
where Genre.name like 'Rock')
Order by email

--Q2: Let's invite the artists who have written the most rock music in our dataset. 
--Write a query that returns the Artist name and total track count of the top 10 rock bands.

Select artist.artist_id, artist.name ,count(artist.artist_id) as total_songs
from track 
Join album on album.album_id = track.album_id
Join artist on artist.artist_id = album.artist_id
Join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
Group by artist.artist_id
order by total_songs desc
limit 10


-- Return all the track names that have a song length longer than the average song length. 
--Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.
Select name, milliseconds 
from track

where milliseconds > (select 
					 avg(milliseconds) as avg_length from track)
order by milliseconds desc























