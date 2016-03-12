CREATE TABLE merchants(
id SERIAL4,
merchant VARCHAR(127)
);
CREATE TABLE categorys(
id SERIAL4,
category VARCHAR(127)
);
CREATE TABLE details(
id SERIAL4,
description VARCHAR(255),
amount NUMERIC(16,6)
);