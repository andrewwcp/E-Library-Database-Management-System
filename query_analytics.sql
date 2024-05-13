--how many book has each user borrowed?
select 
u.first_name||' '||u.last_name as name, 
count(distinct book_id)book_borrowed 
from loan
join books_at_library bal using(library_book_id)
join books using(book_id)
join users u using(user_id)
group by 1
order by 2 desc 


--how many books have been borrowed from each library?
with total_book_each_library as(
	select library_name, 
	count(distinct book_id)total from books_at_library bal 
	join libraries l using(library_id)
	group by 1
),
total_borrowed_book as(
	select l.library_name, 
	count(distinct book_id)book_borrowed 
	from loan
	join books_at_library bal using(library_book_id)
	join books using(book_id)
	join libraries l using(library_id)
	group by 1
	order by 2 desc 
)
select 
library_name,
book_borrowed,
total,
(book_borrowed::float / total::float)*100 as pct_borrowed
from total_book_each_library 
join total_borrowed_book using(library_name)
order by 4 desc


--what are books in each library are curently on hold (in queue)
select l.library_name, 
b.book_title, 
count(hold_id)book_on_hold 
from "hold" h 
join books_at_library bal using(library_book_id)
join books b using(book_id)
join users u using(user_id)
join libraries l using(library_id)
where status = 'In Queue'
group by 1,2
order by 3 desc 


--How many quantity of books are there in each category?
select category_name, 
sum(bal.quantity)book_count 
from books_at_library bal 
join books using(book_id)
join categories c using(category_id)
group by 1
order by 2 desc 


--what is the top category for each user? 
with top_customer_by_cat as(
	select u.first_name||' '||u.last_name as "name",
	c.category_name,
	count(loan_id)loan_times 
	from loan l 
	join books_at_library bal using(library_book_id)
	join books using(book_id)
	join categories c using(category_id)
	join users u using(user_id)
	group by 1,2
	order by 3 desc 
),
ranked_category as(
	select *,
	row_number() over(partition by "name" order by loan_times desc) as ranked
	from top_customer_by_cat
)
select name, category_name, loan_times from ranked_category
where ranked = 1
