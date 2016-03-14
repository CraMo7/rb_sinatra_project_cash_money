CREATE TABLE merchants(
id SERIAL4 PRIMARY KEY,
name VARCHAR(127)
);
CREATE TABLE categories(
id SERIAL4 PRIMARY KEY,
name VARCHAR(127)
);
CREATE TABLE transactions(
id SERIAL4 PRIMARY KEY,
description VARCHAR(255),
amount NUMERIC(16,6),
merchant_id INT4 REFERENCES merchants(id),
category_id INT4 REFERENCES categories(id)
);