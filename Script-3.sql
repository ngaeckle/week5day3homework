CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	customer_id integer,
	movie_id integer,
	cost_ integer,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);


CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	movie_id integer,
	name_ varchar(255),
	FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);

CREATE TABLE concession_product(
	product_id SERIAL PRIMARY KEY,
	customer_id integer,
	product_name varchar(255),
	product_desc TEXT,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE concession_purchases(
	purchase_id SERIAL PRIMARY KEY,
	product_id integer,
	customer_id integer,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(product_id) REFERENCES concession_product(product_id)
);

CREATE TABLE theater(
	theater_id SERIAL PRIMARY KEY,
	name_ varchar(255)
);

CREATE TABLE movies(
	movie_id SERIAL PRIMARY KEY,
	theater_id integer,
	title varchar(255),
	FOREIGN KEY(theater_id) REFERENCES theater(theater_id)
);

INSERT INTO ticket(
	cost_
)values(
	10
),(
	20
)

INSERT INTO customer(
	name_
)values(
	'Noah Gaeckle'
),(
	'Tom Cruise'
)

INSERT INTO concession_product(
	product_name,
	product_desc
)values(
	'Popcorn',
	'Salty sweet goodness'
),(
	'Soda',
	'carbonated beverage'
)

INSERT INTO movies(
	title
)values(
	'Avengers: Endgame'
),(
	'Avengers: Age of ultron'
)

INSERT INTO theater(
	name_
)values(
	'AMC Theater'
)

CREATE OR REPLACE FUNCTION adjustTicketPrice(
	ticketID integer,
	newPrice FLOAT
)
RETURNS INTEGER
LANGUAGE plpgsql AS $$
BEGIN 
	UPDATE ticket 
	SET cost_ = newPrice
	WHERE ticket_id  = ticketID ;
	RETURN ticketID;
END;
$$

SELECT *
FROM ticket
WHERE ticket_id = (SELECT adjustTicketPrice(1,25.00))


