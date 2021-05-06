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
	name VARCHAR(100),
	author_group_id INTEGER
		REFERENCES AuthorGroup(author_group_id)
		ON DELETE SET NULL
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
	date DATE NOT NULL DEFAULT CURRENT_DATE,
	text VARCHAR(1000) NOT NULL,
	network_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Article (
    article_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    author_group_id INTEGER NOT NULL
	  REFERENCES AuthorGroup(author_group_id)
	  ON DELETE CASCADE,
    network_id INTEGER NOT NULL,
	header VARCHAR(100) NOT NULL,
	text VARCHAR(10000) NOT NULL,
	date DATE NOT NULL DEFAULT CURRENT_DATE
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
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PromosWeek (
	promo_week_id SERIAL PRIMARY KEY,
	start_date DATE NOT NULL DEFAULT CURRENT_DATE,
	author_id INTEGER NOT NULL
		REFERENCES Author(author_id)
		ON DELETE CASCADE
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

INSERT INTO Author(name, author_group_id)
VALUES
	('Bill', 1),
	('Mary', 6),
	('Tom', 2),
	('Pol', 1),
	('Andrew', NULL),
	('Sabina', NULL),
	('Linda', 9),
	('Herman', 8),
	('Scott', 8),
	('Tony', 8);
	
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

INSERT INTO Post(style_id, author_id, customer_id, date, text, network_id)
VALUES
	(7, 5, 1, CURRENT_DATE, 'Hello world', 3),
	(4, 7, 2, CURRENT_DATE, 'Python is awesome', 2),
	(7, 4, 3, CURRENT_DATE, 'C++ is awesome', 5),
	(2, 4, 4, '2020-09-28', 'C is awesome', 5),
	(2, 4, 1, '2020-09-25', 'C is really awesome', 1),
	(3, 4, 1, '2020-09-22', 'C is really awesome', 9),
	(8, 8, 4, '2020-08-14', 'JS is awesome', 5),
	(4, 8, 4, '2019-07-22', 'Java is awesome', 1),
	(3, 1, 7, '2019-06-06', 'Rust is awesome', 9),
	(2, 1, 8, '2018-05-30', 'PHP is not awesome', 7),
	(1, 4, 5, '2018-04-02', 'Assembly is awesome', 7),
	(1, 9, 9, '2017-03-15', 'Verilog is awesome', 2),
	(1, 7, 10, '2019-03-15', 'Hello message!', 2);
	
INSERT INTO Article(customer_id, author_group_id, network_id, header, text)
VALUES
	(1, 4, 2, 'Coronavirus', 'Coronavirus disease (COVID-19) is an infectious disease caused by a newly
	 discovered coronavirus. Most people infected with the COVID-19 virus will experience mild to moderate
	 respiratory illness and recover without requiring special treatment. Older people, and those with
	 underlying medical problems like cardiovascular disease, diabetes, chronic respiratory disease, and
	 cancer are more likely to develop serious illness.'),
	(5, 5, 1, 'What Is Mental Health?', 'Mental health includes our emotional, psychological, and social
	 well-being. It affects how we think, feel, and act. It also helps determine how we handle stress,
	 relate to others, and make choices. Mental health is important at every stage of life, from childhood
	 and adolescence through adulthood.'),
	(10, 1, 2, 'Why Sport Matters?', 'One of the best reasons for kids and adults to play sport is for the
	 incredible health benefits. With experts recommending 150 minutes of moderate exercise a week, it can
	 be hard to find the time and motivation to fit this into a busy schedule. Sport makes it easy. Firstly,
	 the sport tends to involve vigorous exercise, meaning you only need to aim for 75 minutes a week to
	 get the same benefits. This makes achieving a healthy level of exercise easier.'),
	(2, 5, 6, 'What Is True Love?', 'An indicator of true love is that you understand and accept your partner
	 for the person who he or she truly is. You’re not trying to change your mate, fix him or her and/or turn
	 him or her into a different person. Rather, you fully accept, appreciate and adore your partner, flaws
	 and all.'),
	(3, 3, 3, 'TRENDS IN THE IT SPHERE TODAY', 'We have seen everything from mobile phones to watches, LED
	 TVs to security cameras turning smart in the last decade. In the next decade, we will see the entire
	 cities turning into smart cities.Technologies of IoT (Internet of Things) together with AI
	 (Artificial Intelligence) and Blockchain will power the economies of the smart cities. The citizens
	 of these cities will have seamless experience related to work, businesses, investments, shopping,
	 travel, and everything we can imagine. '),
    (9, 1, 8, 'Mobile Technology', 'People spend a considerable amount of time looking at their smartphone
	 screens, checking notifications, socializing, checking emails, playing games, shopping and much more
	 on their mobile phones every day. Mobile phones have become an integral part of our lives and software
	 companies use the mobile devices to collect consumer data, health data, and data related to different
	 services.'),
	(9, 6, 6, 'Albania', 'Albania, country in southern Europe, located in the western part of the Balkan
	 Peninsula on the Strait of Otranto, the southern entrance to the Adriatic Sea. The capital city is
	 Tirana (Tiranë).'),
	(8, 4, 10, 'Elephants', 'Elephants are the largest land mammals on earth and have distinctly massive
	 bodies, large ears, and long trunks. They use their trunks to pick up objects, trumpet warnings,
	 greet other elephants, or suck up water for drinking or bathing, among other uses.'),
	(4, 2, 1, 'Tips to beat insomnia', 'Going to bed and getting up at roughly the same time every day
	 will programme your body to sleep better. Choose a time when you are likely to feel tired and sleepy.
	 Your bedroom should be a peaceful place for rest and sleep. Temperature, lighting and noise should be
	 controlled so that your bedroom environment helps you to fall (and stay) asleep.'),
	(7, 7, 2, 'Summer 2021 Trends', 'In a world with no simple answers or even straightforward questions,
	 designers showed a predilection for black and white – most often, together. At Dolce & Gabbana,
	 chequerboard patchwork dresses utilised archive rolls of fabrics from previous collections,
	 while at Chanel, crisp layering semaphored a new mood of restraint.');
	 
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

INSERT INTO PromosDay(start_date, author_id) VALUES
	('2018-05-19', 5),
	('2020-02-10', 2),
	('2021-04-26', 8),
	('2021-04-27', 7),
	('2021-04-28', 9),
	('2021-04-28', 1),
	('2021-04-29', 4),
	('2021-04-30', 3),
	('2021-05-01', 6),
	('2020-05-02', 10);
	
INSERT INTO PromosWeek(start_date, author_id) VALUES
	('2018-06-18', 4),
	('2020-09-28', 3),
	('2021-04-26', 6),
	('2021-05-12', 10),
	('2021-05-28', 1),
	('2021-06-03', 9),
	('2021-06-11', 7),
	('2021-06-19', 8),
	('2021-06-28', 2),
	('2020-07-12', 5);

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



