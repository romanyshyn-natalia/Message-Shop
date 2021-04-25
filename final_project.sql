CREATE TABLE AuthorGroup (
	author_group_id SERIAL PRIMARY KEY,
	name VARCHAR(1000) NOT NULL
);

CREATE TABLE Author (
	author_id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	author_group_id INTEGER
		REFERENCES AuthorGroup(author_group_id)
		ON DELETE SET NULL
);

CREATE TABLE Post (
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

INSERT INTO Post(style_id, author_id, customer_id, date, text, network_id)
VALUES
	(7, 5, 1, CURRENT_DATE, 'Hello world', 3),
	(4, 7, 2, CURRENT_DATE, 'Python is awesome', 2),
	(7, 4, 3, CURRENT_DATE, 'C++ is awesome', 5),
	(2, 4, 4, '2020-09-28', 'C is awesome', 5),
	(8, 8, 4, '2020-08-14', 'JS is awesome', 5),
	(4, 8, 4, '2019-07-22', 'Java is awesome', 1),
	(3, 1, 7, '2019-06-06', 'Rust is awesome', 9),
	(2, 1, 8, '2018-05-30', 'PHP is not awesome', 7),
	(1, 4, 5, '2018-04-02', 'Assembly is awesome', 7),
	(1, 9, 9, '2017-03-15', 'Verilog is awesome', 2);
	
SELECT * FROM AuthorGroup;
SELECT * FROM Author;
SELECT * FROM Post;

SELECT *
    FROM Author, AuthorGroup
    WHERE AuthorGroup.author_group_id = Author.author_group_id;
	
SELECT *
    FROM Post, Author
    WHERE Post.author_id = Author.author_id;



CREATE TABLE IF NOT EXISTS PromosDay(
	promo_day_id SERIAL PRIMARY KEY,
	start_date DATE NOT NULL DEFAULT CURRENT_DATE,
	author_id INTEGER NOT NULL
		REFERENCES Author(author_id)
		ON DELETE CASCADE
);

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

CREATE TABLE IF NOT EXISTS PromosWeek(
	promo_week_id SERIAL PRIMARY KEY,
	start_date DATE NOT NULL DEFAULT CURRENT_DATE,
	author_id INTEGER NOT NULL
		REFERENCES Author(author_id)
		ON DELETE CASCADE
);

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

CREATE TABLE IF NOT EXISTS PostStyles(
	style_id SERIAL PRIMARY KEY,	
	style_name VARCHAR(25) NOT NULL 
);

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
	

SELECT * FROM PromosWeek;
SELECT * FROM PromosDay;
SELECT * FROM PostStyles;
