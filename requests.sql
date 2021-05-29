--1
SELECT Customer.name FROM Customer
  JOIN POST
  ON Customer.customer_id = POST.customer_id
  JOIN Author
  ON POST.author_id = Author.author_id
  WHERE Author.name = 'Pol' AND
 	date between '2018-04-01'::date AND ('2020-05-30'::date + '1 day'::interval)
  GROUP BY Customer.customer_id
  HAVING COUNT(Customer.customer_id) >= 1; -- N = 1

--2
SELECT DISTINCT name FROM (
SELECT Author.name
  FROM Post
  JOIN Author
    ON Post.author_id = Author.author_id
  JOIN Customer
    ON Post.customer_id = Customer.customer_id
  WHERE Customer.name = 'Anya' AND date between '2018-03-01'::date AND ('2021-05-30'::date + '1 day'::interval)
UNION
SELECT Author.name
  FROM Article
  JOIN Customer
    ON Article.customer_id = Customer.customer_id
  JOIN AuthorGroup
    ON Article.author_group_id = AuthorGroup.author_group_id
  JOIN Author
    ON Author.author_group_id = AuthorGroup.author_group_id
  WHERE Customer.name = 'Pavlo' AND date between '2018-03-01'::date AND ('2021-05-30'::date + '1 day'::interval)) AS Auth;

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

-- 6.	для автора А знайти усi облiковi записи у соцiальних мережах, до яких вiн мав доступ протягом вказаного перiоду (з дати F по дату T);
SELECT customer_id FROM
Access_token INNER JOIN
(SELECT author_id from Author WHERE name='Scott') as A
ON A.author_id=Access_token.author_id
AND Access_token.status=true
OR Access_token.given between '2019-08-11'::date and '2019-09-07';

-- 7.	для покупця С знайти усiх авторiв, яким вiн надав доступ до хоча б одного облiкового запису у соцiальнiй мережi, а потiм позбавив його цього доступу;
SELECT Author.name as authors
FROM Access_token
INNER JOIN (SELECT customer_id,name FROM Customer WHERE name='Dmytro') AS C
ON Access_token.customer_id=C.customer_id
INNER JOIN Author ON Author.author_id=Access_token.author_id
WHERE Access_token.status=false;

-- 8.	знайти усi спiльнi подiї для автора A та покупця С за вказаний перiод (з дати F по дату T);
-- Події
-- покупець замовляє у автора повiдомлення деякого стилю у соцiальнiй мережi;
-- покупець надає автору доступ до свого облiкогово запису у соцiальнiй мережi;
-- покупець позбавляє автора доступу до свого облiкогово запису у соцiальнiй мережi;
-- покупець замовляє у групи авторiв статтю у соцiальнiй мережi;                       X - not specific to author A and customer C?
-- автор проводить одноденну акцiю 50% знижок;                                         X - not specific to author A and customer C
-- автор проводить тижневу акцiю 50% знижок на повiдомленя деякого стилю;              X - not specific to author A and customer C

PREPARE getEvents (VARCHAR(50), VARCHAR(50), date, date) AS
SELECT
(
SELECT
	post_id FROM Post
	INNER JOIN (SELECT customer_id, name FROM Customer WHERE Customer.name=$1) as C
	ON Post.customer_id=C.customer_id
	INNER JOIN (SELECT author_id, name FROM Author WHERE Author.name=$2) AS A
	ON Post.author_id=A.author_id
	AND date between
	$3::date AND $4::date
) as posts,
(
SELECT 
	token_id FROM (Access_token
	INNER JOIN Customer ON Customer.customer_id=Access_token.customer_id)
	INNER JOIN Author ON Author.author_id=Access_token.author_id
	WHERE Customer.name = $1 AND Author.name = $2
	AND given > $3::date
) as tokens_given,
(
SELECT 
	token_id FROM Access_token
	INNER JOIN Customer ON Customer.customer_id=Access_token.customer_id
	INNER JOIN Author ON Author.author_id=Access_token.author_id
	WHERE Customer.name = $1 AND Author.name = $2
	AND NOT status AND terminated < $4::date
) as tokens_terminated;

EXECUTE getEvents('Anya', 'Linda', '2000-05-09', '2021-09-10');
deallocate getEvents;

-- 9
SELECT Social_network.name, COUNT(Article.article_id) AS article_number
  FROM Article
  JOIN Author
  ON Article.author_group_id = Author.author_group_id
  JOIN Social_network
  ON Article.network_id = Social_network.network_id
  JOIN (SELECT AuthorGroup.author_group_id, COUNT(AuthorGroup.author_group_id) AS author_amount
        FROM Author
        JOIN AuthorGroup
        ON Author.author_group_id = AuthorGroup.author_group_id
        GROUP BY AuthorGroup.author_group_id) AS AuthorAmount
  ON Article.author_group_id = AuthorAmount.author_group_id
  WHERE Author.name = 'Bill' AND date between '2018-03-01'::date AND ('2021-05-30'::date + '1 day'::interval) AND author_amount >= 1
  GROUP BY Social_network.network_id;

-- 10.	для покупця С та кожного стилю, у якому вiн замовляв повiдомлення, знайти скiльки замовлень за вказаний перiод
-- (з дати F по дату T) отримали 50% знижку;

PREPARE getDiscountedPosts (VARCHAR(50), date, date) AS
SELECT W.style_id as style_id, W.count+D.count as count FROM
(SELECT style_id, count(style_id)
			FROM Post INNER JOIN PromosWeek
			ON Post.date between PromosWeek.start_date and PromosWeek.start_date + '7 days'::interval
			INNER JOIN (SELECT customer_id FROM Customer WHERE Customer.name=$1) as C
 			ON C.customer_id = Post.customer_id AND
			date between $2 and $3
			GROUP BY style_id) as W
JOIN
(SELECT style_id, count(style_id)
			FROM Post INNER JOIN PromosWeek
			ON Post.date = PromosWeek.start_date
			INNER JOIN (SELECT customer_id FROM Customer WHERE Customer.name=$1) as C
 			ON C.customer_id = Post.customer_id AND
			date between $2 and $3
			GROUP BY style_id) as D
ON W.style_id=D.style_id;
EXECUTE getDiscountedPosts('Oleksandr', '2000-05-09', '2021-09-10');
deallocate getDiscountedPosts;

--11
SELECT COUNT(*), DATE_TRUNC('month', date) AS  month 
FROM Post
GROUP BY DATE_TRUNC('month', date);

--12
SELECT Social_network.name
  FROM Post
  JOIN PostStyles
    ON Post.style_id = PostStyles.style_id
  JOIN Author
    ON Post.author_id = Author.author_id
  JOIN Social_network
    ON Post.network_id = Social_network.network_id
  WHERE Author.name = 'Pol' AND date between '2018-03-01'::date AND ('2021-05-30'::date + '1 day'::interval)
  GROUP BY Social_network.name
  ORDER BY COUNT(Post.style_id) DESC;
