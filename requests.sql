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

--11
SELECT COUNT(*), DATE_TRUNC('month', date) AS  month 
FROM Post
GROUP BY DATE_TRUNC('month', date);
