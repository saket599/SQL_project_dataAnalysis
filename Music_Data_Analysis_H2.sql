--Q2: We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
--with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
--the maximum number of purchases is shared return all Genres


With popular_genre as (
  select count(invoice_line.quantity ) as purchases, customer.country,
	genre.name, genre.genre_id,
	Row_number() over(Partition by customer.country order by count(invoice_line.quantity)DESC)
	RowNo
	From invoice_line
	Join invoice ON invoice.invoice_id = invoice_line.invoice_id
	Join customer ON customer.customer_id = invoice.customer_id
	Join track on track.track_id = invoice_line.track_id
	Join genre ON genre.genre_id = track.genre_id
	Group by 2,3,4
	Order by 2 ASC, 1 DESC
)

Select * From popular_genre wHERE RowNo <=1