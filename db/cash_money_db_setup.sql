CREATE TABLE merchants(
id SERIAL4 PRIMARY KEY,
merchant VARCHAR(127)
);
CREATE TABLE categorys(
id SERIAL4 PRIMARY KEY,
category VARCHAR(127)
);
CREATE TABLE transactions(
id SERIAL4 PRIMARY KEY,
description VARCHAR(255),
amount NUMERIC(16,6),
merchant_id INT4 REFERENCES merchants(id),
category_id INT4 REFERENCES categorys(id)
);