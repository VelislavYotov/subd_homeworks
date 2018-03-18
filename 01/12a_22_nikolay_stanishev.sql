DROP DATABASE IF EXISTS 12a_22_nikolay_stanishev;

CREATE DATABASE 12a_22_nikolay_stanishev;

USE 12a_22_nikolay_stanishev;

CREATE TABLE User (
    id int NOT NULL AUTO_INCREMENT,
    username varchar(64),
    password varchar(256),
    email varchar(128),
    first_name varchar(128),
    second_name varchar(128),
    phone_number varchar(13),
    adress varchar(1024),

    PRIMARY KEY (id)
);

CREATE TABLE Items (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(128),
    price float,
    description text,
    size float,
    rating ENUM ('1', '2', '3', '4', '5'),

    PRIMARY KEY (id)
);

CREATE TABLE Cart (
    id int NOT NULL AUTO_INCREMENT,
    userId int,
    active bool,

    PRIMARY KEY (id),
    FOREIGN KEY (userId) REFERENCES User(id)
);

CREATE TABLE CartItem (
    id int NOT NULL AUTO_INCREMENT,
    cartId int,
    itemsId int,

    PRIMARY KEY (id),
    FOREIGN KEY (cartId) REFERENCES Cart (id),
    FOREIGN KEY (itemsId) REFERENCES Items (id)
);

INSERT INTO
    User (username, password, email, first_name, second_name, phone_number, adress)
VALUES
    ('Petar.Ivanov', 'jdnfasdnfansdfnasdfbhasodbfu8qiuwnqwoieq983np9qrqienwfn9q38nq2', 'Petar.Ivanov@gmail.com','Petar', 'Ivanov', '+359872895359', 'Mladost 1, TUES, 31'),
    ('Ivan.Petrov', 'jdnfasdnfansdfnasdfbhasodbfu8qiuwnqwoieq983np9qrqienwfn9q38nq3', 'Ivan.Petrov@gmail.com','Ivan', 'Petrov', '+359872895358', 'Mladost 1, TUES, 34'),
    ('Vasil.Todorov', 'jdnfasdnfansdfnasdfbhasodbfu8qiuwnqwoieq983np9qrqienwfn9q38nq4', 'Vasil.Todorov@gmail.com','Vasil', 'Todorov', '+359872895357', 'Mladost 1, TUES, 35'),
    ('Todor.Mihaylov', 'jdnfasdnfansdfnasdfbhasodbfu8qiuwnqwoieq983np9qrqienwfn9q38nq5', 'Todor.Mihaylov@gmail.com','Todor', 'Mihaylov', '+359872895356', 'Mladost 1, TUES, 36'),
    ('Mihail.Vasilev', 'jdnfasdnfansdfnasdfbhasodbfu8qiuwnqwoieq983np9qrqienwfn9q38nq6', 'Mihail.Vasilev@gmail.com','Mihail', 'Vasilev', '+359872895355', 'Mladost 1, TUES, 37');

INSERT INTO
    Items (name, price, description, size, rating)
VALUES
    ('Egg', '10', 'This is Egg.', '5', '1'),
    ('Milk', '15', 'This is Milk.', '4', '2'),
    ('Cucumber', '20', 'This is Cucumber.', '3', '3'),
    ('Orange', '25', 'This is Orange.', '2', '4'),
    ('Banana', '30', 'This is Banana.', '1', '5');

INSERT INTO
    Cart (userId, active)
VALUES
    (1, true),
    (2, true),
    (3, true),
    (4, true),
    (5, true);

INSERT INTO
    CartItem (cartId, itemsId)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 3),
    (3, 3),
    (3, 4),
    (4, 4),
    (4, 5),
    (5, 5),
    (5, 1);

UPDATE Cart
SET active = false
WHERE id % 2 = 0;

SELECT *
FROM User;

SELECT *
FROM Items;

SELECT *
FROM Cart;

SELECT *
FROM CartItem;
