--3
SELECT Author.name, COUNT(DISTINCT Post_cust.customer_id) AS number_of_distinct_customers
FROM (
  SELECT Customer.customer_id, Post.author_id
  FROM Customer
  INNER JOIN Post
  ON Customer.customer_id = Post.customer_id
  WHERE date between '2018-05-30'::date AND ('2020-05-30'::date + '1 day'::interval)
) AS Post_cust
INNER JOIN Author
ON Author.author_id = Post_cust.author_id
GROUP BY Author.author_id
HAVING COUNT(DISTINCT Post_cust.customer_id) >= 1;

--4
SELECT name, COUNT(Customer.customer_id) AS number_of_orders
FROM Customer
INNER JOIN Post
ON Customer.customer_id = Post.customer_id
WHERE date between '2018-05-30'::date AND ('2020-05-30'::date + '1 day'::interval)
GROUP BY Customer.customer_id
HAVING COUNT(Customer.customer_id) >= 1;

--5
SELECT Social_network.name, COUNT(Post_cust.customer_id) AS number_of_orders
FROM (
  SELECT Customer.customer_id, Post.network_id
  FROM Customer
  INNER JOIN Post
  ON Customer.customer_id = Post.customer_id
  WHERE date between '2018-05-30'::date AND ('2020-05-30'::date + '1 day'::interval)
    AND Customer.customer_id = 4
) AS Post_cust
INNER JOIN Social_network
ON Social_network.network_id = Post_cust.network_id
GROUP BY Social_network.network_id
HAVING COUNT(Post_cust.customer_id) >= 1;

-- 8.	знайти усi спiльнi подiї для автора A та покупця С за вказаний перiод (з дати F по дату T);
-- Події
-- покупець замовляє у автора повiдомлення деякого стилю у соцiальнiй мережi;
-- покупець надає автору доступ до свого облiкогово запису у соцiальнiй мережi;
-- покупець позбавляє автора доступу до свого облiкогово запису у соцiальнiй мережi;
-- покупець замовляє у групи авторiв статтю у соцiальнiй мережi;                       X - not specific to author A and customer C?
-- автор проводить одноденну акцiю 50% знижок;                                         X - not specific to author A and customer C
-- автор проводить тижневу акцiю 50% знижок на повiдомленя деякого стилю;              X - not specific to author A and customer C

PREPARE getEvents (int, int, date, date) AS
SELECT
(
	SELECT CONCAT(post_id) FROM Post
	WHERE customer_id = $1 AND author_id = $2
	AND date between
	$3::date AND $4::date
) as posts_ids,
(
SELECT 
	CONCAT(token_id) FROM Access_token
	WHERE customer_id = $1 AND author_id = $2
	AND given > $3::date
) as tokens_given,
(
SELECT 
	CONCAT(token_id) FROM Access_token
	WHERE customer_id = $1 AND author_id = $2
	AND NOT status AND terminated < $4::date
) as tokens_terminated;

EXECUTE getEvents(10, 7, '2000-05-09', '2021-09-10');
deallocate getEvents;

-- 10.	для покупця С та кожного стилю, у якому вiн замовляв повiдомлення, знайти скiльки замовлень за вказаний перiод
-- (з дати F по дату T) отримали 50% знижку;

PREPARE getDiscountedPosts (int, date, date) AS

SELECT W.style_id as style_id, W.count+D.count as count FROM
(SELECT style_id, count(style_id)
			FROM Post INNER JOIN PromosWeek
			ON Post.date between PromosWeek.start_date and PromosWeek.start_date + '7 days'::interval
			WHERE customer_id = $1 AND
			date between $2 and $3
			GROUP BY style_id) as W
JOIN
(SELECT style_id, count(style_id)
			FROM Post INNER JOIN PromosWeek
			ON Post.date = PromosWeek.start_date
			WHERE customer_id = $1 AND
			date between $2 and $3
			GROUP BY style_id) as D
ON W.style_id=D.style_id;
EXECUTE getDiscountedPosts(1, '2000-05-09', '2021-09-10');
deallocate getDiscountedPosts;

--11
SELECT COUNT(*), DATE_TRUNC('month', date) AS  month 
FROM Post
GROUP BY DATE_TRUNC('month', date);
