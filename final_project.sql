CREATE TABLE IF NOT EXISTS Customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS AuthorGroup (
	author_group_id SERIAL PRIMARY KEY,
	name VARCHAR(1000) NOT NULL
);

CREATE TABLE IF NOT EXISTS Author (
	author_id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Social_network (
    network_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS PostStyles (
	style_id SERIAL PRIMARY KEY,	
	style_name VARCHAR(25) NOT NULL 
);

CREATE TABLE IF NOT EXISTS Post (
	post_id SERIAL PRIMARY KEY,
	style_id INTEGER,
	author_id INTEGER NOT NULL
		REFERENCES Author(author_id)
		ON DELETE CASCADE,
	customer_id INTEGER NOT NULL,
	network_id INTEGER NOT NULL,
	description VARCHAR(1000) NOT NULL,
	text VARCHAR(1000),
	date DATE NOT NULL DEFAULT CURRENT_DATE,
	update DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS Article (
    article_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    author_group_id INTEGER NOT NULL
	  REFERENCES AuthorGroup(author_group_id)
	  ON DELETE CASCADE,
    network_id INTEGER NOT NULL,
	header VARCHAR(100) NOT NULL,
	description VARCHAR(10000) NOT NULL,
	text VARCHAR(10000),
	date DATE NOT NULL DEFAULT CURRENT_DATE,
	update DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS Access_token (
    token_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL
		REFERENCES Customer(customer_id)
		ON DELETE CASCADE,
    author_id INTEGER NOT NULL,
    status BOOLEAN DEFAULT FALSE,
	given DATE NOT NULL DEFAULT CURRENT_DATE,
	terminated DATE DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS PromosDay (
	promo_day_id SERIAL PRIMARY KEY,
	start_date DATE NOT NULL DEFAULT CURRENT_DATE,
	author_id INTEGER NOT NULL
		REFERENCES Author(author_id)
		ON DELETE CASCADE,
	amount INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS PromosWeek (
	promo_week_id SERIAL PRIMARY KEY,
	start_date DATE NOT NULL DEFAULT CURRENT_DATE,
	author_id INTEGER NOT NULL
		REFERENCES Author(author_id)
		ON DELETE CASCADE,
	amount INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Author_AuthorGroup (
	author_id INTEGER REFERENCES Author(author_id),
	author_group_id INTEGER REFERENCES AuthorGroup(author_group_id),
	PRIMARY KEY (author_id, author_group_id)
);

INSERT INTO Customer(name)
VALUES
	('Sofia'),
	('Natalia'),
	('Yevgen'),
	('Oleksandr'),
	('Diana'),
	('Andriy'),
	('Dmytro'),
	('Yana'),
	('Pavlo'),
	('Anya');

INSERT INTO AuthorGroup(name)
VALUES
	('Red Group'),
	('White Group'),
	('Blue Group'),
	('Green Group'),
	('Yellow Group'),
	('Purple Group'),
	('Gray Group'),
	('Violet Group'),
	('Orange Group'),
	('Cyan Group');

INSERT INTO Author(name)
VALUES
	('Bill'),
	('Mary'),
	('Tom'),
	('Pol'),
	('Andrew'),
	('Sabina'),
	('Linda'),
	('Herman'),
	('Scott'),
	('Tony');

INSERT INTO Author_AuthorGroup(author_id, author_group_id)
VALUES
	(1, 1),
	(2, 6),
	(3, 2),
	(4, 1),
	(5, 9),
	(6, 8),
	(7, 8),
	(8, 8);

INSERT INTO Social_network(name)
VALUES
	('Instagram'),
	('Facebook'),
	('LinkedIn'),
	('Twitter'),
	('Ask.fm'),
	('Pinterest'),
	('Reddit'),
	('Telegram'),
	('WhatsApp'),
	('LiveJournal');
	
INSERT INTO PostStyles(style_name) VALUES
	('Business'),
	('Academic'),
	('Marketing'),
	('Prose'),
	('Poetry'),
	('Diaries'),
	('Casual'),
	('Journalism'),
	('Memoris'),
	('Scripts');

INSERT INTO Post(style_id, author_id, customer_id, network_id, description, text, date, update)
VALUES
	(7, 5, 1, 3, 'Just usual greeting', 'Good morning everybody', '2021-05-20', CURRENT_DATE),
	(4, 7, 2, 2, 'Some fictional story about animals. It should not be very big.', 'Tired of the bragging of a speedy hare, a tortoise challenges it to a race. 
	 The overconfident hare accepts the competition and runs as fast as it can after the race begins.', '2021-02-11', '2021-03-03'),
	(7, 4, 3, 5, 'Some facts about programming language C', NULL, CURRENT_DATE, NULL),
	(2, 4, 4, 5, 'Some facts about programming language Python', NULL, CURRENT_DATE, NULL),
	(2, 4, 1, 1, 'Few sentences about coronavirus nowadays', 'Coronavirus disease (COVID-19) is an infectious disease caused by a newly
	 discovered coronavirus. Most people infected with the COVID-19 virus will experience mild to moderate
	 respiratory illness and recover without requiring special treatment.', '2020-09-25', '2020-10-25'),
	(3, 4, 1, 9, 'Few sentences about my product - recognition application. Its advantages.', 'To increase corporate culture in your company and
	 give an employee feeling that he is part of the company you can use our solution. An application Bonusly will allow you to send gratitudes together with virtual
	 coins to your colleagues for their good job', '2019-02-01', '2019-04-03'),
	(8, 8, 4, 5, 'Interesting facts about animals in the Carpathians', NULL, '2018-02-26', NULL),
	(4, 8, 4, 1, 'Some story about liitle friends in the forest. About their adventures', NULL, '2017-03-15', NULL),
	(3, 1, 7, 9, 'Few sentences about our school', 'Evshan school is a great opportunity for your kids to gain skills in
	 computer science', '2018-05-10', '2018-05-30'),
	(2, 1, 8, 7, 'Some words about PHP', 'PHP is not awesome', '2018-04-30', '2018-05-30'),
	(1, 4, 5, 7, 'Some words about Assembly', 'Assembly is awesome', '2018-03-31', '2018-04-02'),
	(1, 9, 9, 2, 'Some facts about Verilog', NULL, '2017-03-15', NULL),
	(1, 7, 10, 2, 'Few sentences about our product', NULL, '2018-05-19', NULL);
	
INSERT INTO Article(customer_id, author_group_id, network_id, header, description, text, date, update)
VALUES
	(1, 4, 2, 'Coronavirus', 'Some interesting and important facts about coronavirus', 'Coronavirus disease (COVID-19) is an infectious disease caused by a newly
	 discovered coronavirus. Most people infected with the COVID-19 virus will experience mild to moderate
	 respiratory illness and recover without requiring special treatment. Older people, and those with
	 underlying medical problems like cardiovascular disease, diabetes, chronic respiratory disease, and
	 cancer are more likely to develop serious illness.', '2019-11-12', '2019-12-22'),
	(5, 5, 1, 'What Is Mental Health?', 'Some interesting and important facts about mental health', 'Mental health includes our emotional, psychological, and social
	 well-being. It affects how we think, feel, and act. It also helps determine how we handle stress,
	 relate to others, and make choices. Mental health is important at every stage of life, from childhood
	 and adolescence through adulthood.', '2018-09-10', '2018-11-13'),
	(10, 1, 2, 'Why Sport Matters?', 'Articel about sport and its importance', 'One of the best reasons for kids and adults to play sport is for the
	 incredible health benefits. With experts recommending 150 minutes of moderate exercise a week, it can
	 be hard to find the time and motivation to fit this into a busy schedule. Sport makes it easy. Firstly,
	 the sport tends to involve vigorous exercise, meaning you only need to aim for 75 minutes a week to
	 get the same benefits. This makes achieving a healthy level of exercise easier.', '2020-06-11', '2019-08-11'),
	(2, 5, 6, 'What Is True Love?', 'Article about love and indicators that show your feelings', 'An indicator of true love is that you understand and accept your partner
	 for the person who he or she truly is. You’re not trying to change your mate, fix him or her and/or turn
	 him or her into a different person. Rather, you fully accept, appreciate and adore your partner, flaws
	 and all.', '2019-01-08', '2019-03-02'),
	(3, 3, 3, 'TRENDS IN THE IT SPHERE TODAY', 'Article about IT sphere nowadays', 'We have seen everything from mobile phones to watches, LED
	 TVs to security cameras turning smart in the last decade. In the next decade, we will see the entire
	 cities turning into smart cities.Technologies of IoT (Internet of Things) together with AI
	 (Artificial Intelligence) and Blockchain will power the economies of the smart cities. The citizens
	 of these cities will have seamless experience related to work, businesses, investments, shopping,
	 travel, and everything we can imagine.', '2020-05-22', '2020-07-10'),
    (9, 1, 8, 'Mobile Technology', 'Article about mobile technologies nowadays', 'People spend a considerable amount of time looking at their smartphone
	 screens, checking notifications, socializing, checking emails, playing games, shopping and much more
	 on their mobile phones every day. Mobile phones have become an integral part of our lives and software
	 companies use the mobile devices to collect consumer data, health data, and data related to different
	 services.', '2018-03-29', '2018-05-16'),
	(9, 6, 6, 'Albania', 'Interesting facts about Albania, its nature and culture.', NULL, '2021-04-11', NULL),
	(8, 4, 10, 'Elephants', 'Article about interesting facts about Elephants', 'Elephants are the largest land mammals on earth and have distinctly massive
	 bodies, large ears, and long trunks. They use their trunks to pick up objects, trumpet warnings,
	 greet other elephants, or suck up water for drinking or bathing, among other uses.', '2019-03-09', '2019-05-07'),
	(4, 2, 1, 'Tips to beat insomnia', 'Article about insomnia and how to beat it.', NULL, '2017-01-30', NULL),
	(7, 7, 2, 'Summer 2021 Trends', 'Text about Summer 2021 Trends', 'In a world with no simple answers or even straightforward questions,
	 designers showed a predilection for black and white – most often, together. At Dolce & Gabbana,
	 chequerboard patchwork dresses utilised archive rolls of fabrics from previous collections,
	 while at Chanel, crisp layering semaphored a new mood of restraint.', '2021-03-11', '2021-04-20');
	 
INSERT INTO Access_token (customer_id, author_id, given, status)
VALUES 
	(1, 4, '2002-09-10', true),
	(4, 2, '2010-11-09', true),
	(3, 6, '2020-03-30', true),
	(2, 1, '2016-07-11', true),
	(5, 9, '2019-10-10', true),
	(2, 9, '2019-10-07', true),
	(1, 9, '2019-11-09', true);

INSERT INTO Access_token (customer_id, author_id, given, terminated)
VALUES 
	(9, 8, '2010-07-10', '2010-07-11'),
	(10, 7, '2020-10-09', '2010-11-02'),
	(8, 3, '2002-01-02', '2019-06-07'),
	(6, 5, '2016-09-03', '2016-09-02'),
	(7, 10, '2020-09-10', '2020-09-15'),
	(7, 9, '2019-08-10', '2019-09-05');

INSERT INTO PromosDay(start_date, author_id, amount) VALUES
	('2018-05-19', 5, 40),
	('2020-02-10', 2, 50),
	('2021-04-26', 8, 40),
	('2021-04-27', 7, 90),
	('2021-04-28', 9, 80),
	('2021-04-28', 1, 10),
	('2021-04-29', 4, 17),
	('2021-04-30', 3, 25),
	('2021-05-01', 6, 33),
	('2020-05-02', 10, 65);
	
INSERT INTO PromosWeek(start_date, author_id, amount) VALUES
	('2018-06-18', 4, 0),
	('2020-09-28', 3, 78),
	('2021-04-26', 6, 67),
	('2021-05-12', 10, 55),
	('2021-05-28', 1, 34),
	('2021-06-03', 9, 25),
	('2021-06-11', 7, 60),
	('2021-06-19', 8, 40),
	('2021-06-28', 2, 30),
	('2020-07-12', 5, 20);

CREATE INDEX author_id_index ON Author(author_id);
CREATE INDEX customer_id_index ON Customer(customer_id);
CREATE INDEX post_date_index ON Post(date);
CREATE INDEX access_token_author_id_index ON Access_token(author_id);
CREATE INDEX article_date_index ON Article(date);


SELECT * FROM Customer;
SELECT * FROM AuthorGroup;
SELECT * FROM Author;
SELECT * FROM Social_network;
SELECT * FROM PostStyles;
SELECT * FROM Post;
SELECT * FROM Article;
SELECT * FROM Access_token;
SELECT * FROM PromosDay;
SELECT * FROM PromosWeek;

SELECT *
    FROM Author, AuthorGroup
    WHERE AuthorGroup.author_group_id = Author.author_group_id;

SELECT *
    FROM Author, Author_AuthorGroup
    WHERE Author_AuthorGroup.author_id = Author.author_id;

SELECT *
    FROM Post, Author
    WHERE Post.author_id = Author.author_id;
	
SELECT *
    FROM Post, PostStyles
    WHERE Post.style_id = PostStyles.style_id;

SELECT *
    FROM Post, Customer
    WHERE Post.customer_id = Customer.customer_id;
	
SELECT *
    FROM Article, AuthorGroup
    WHERE Article.author_group_id = AuthorGroup.author_group_id;

SELECT *
    FROM Article, Social_network
    WHERE Article.network_id = Social_network.network_id;
	
SELECT *
    FROM Access_token, Customer
    WHERE Access_token.customer_id = Customer.customer_id;

SELECT *
    FROM Access_token, Author
    WHERE Access_token.author_id = Author.author_id;
	
SELECT *
    FROM PromosDay, Author
    WHERE PromosDay.author_id = Author.author_id;

SELECT *
    FROM PromosWeek, Author
    WHERE PromosWeek.author_id = Author.author_id;
