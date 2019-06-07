DROP TABLE IF EXISTS cattoys;
DROP TABLE IF EXISTS toys;
DROP TABLE IF EXISTS cats;

CREATE TABLE cats (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    breed VARCHAR(255) NOT NULL
);

CREATE TABLE toys (
    id SERIAL NOT NULL PRIMARY KEY,
    price INTEGER NOT NULL,
    color VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE cattoys (
    id SERIAL PRIMARY KEY,
    cat_id INTEGER REFERENCES cats(id),
    toy_id INTEGER REFERENCES toys(id)
);

-- INSERT INTO
--   users (name, age, height_in_inches)
-- VALUES
--     ('Santa Claus', 876, 34);

INSERT INTO
  cats ( name, color, breed)
VALUES
    ('Santa Claus', 'Red', 'Siamese'),
    ( 'Sergey', 'Blue', 'Sphynx'),
    ( 'Jesse', 'White', 'Munchkin'),
    ( 'Mashu', 'Black', 'Bengal'),
    ( 'Ryan', 'Silver', 'Mangey');


INSERT INTO
  toys (price, color, name)
VALUES
    (10, 'black', 'mouse'),
    (5, 'green', 'rope toy'),
    (7, 'yellow','squeak toy'),
    (600, 'tan', 'jungle gym apperatus'),
    (1000, 'orange', 'tin foil');

INSERT INTO
  cattoys (cat_id, toy_id)
VALUES
    ((SELECT id FROM cats WHERE name = 'Santa Claus'), (SELECT id FROM toys WHERE name = 'mouse')),
    ((SELECT id FROM cats WHERE name = 'Sergey'), (SELECT id FROM toys WHERE name = 'rope toy')),
    ((SELECT id FROM cats WHERE name = 'Jesse'), (SELECT id FROM toys WHERE name = 'squeak toy')),
    ((SELECT id FROM cats WHERE name = 'Mashu'), (SELECT id FROM toys WHERE name = 'jungle gym apperatus')),
    ((SELECT id FROM cats WHERE name = 'Ryan'), (SELECT id FROM toys WHERE name = 'tin foil'));


INSERT INTO
cattoys (cat_id, toy_id)
VALUES
(1,4);


DELETE FROM
  table_name
WHERE
  conditions

DELETE FROM
  accounts
WHERE
  customer_id = 666;


INSERT INTO
    toys (price, color, name)
VALUES
    (50, 'beige', 'gunna get deleted'); 

DELETE FROM
cattoys 
WHERE 
cat_id = 5 AND toy_id = 5;

DELETE FROM
toys
WHERE
id = 5;

EXPLAIN SELECT * FROM cats;

EXPLAIN SELECT toys
FROM toys
  JOIN cattoys
  ON cattoys.toy_id = toys.id
  JOIN cats
  ON cattoys.cat_id = cats.id
WHERE cats.name = 'Sergey';

EXPLAIN
    SELECT
        cats.name, toys.name
    FROM
        toys  
    FULL OUTER JOIN cattoys
        ON cattoys.toy_id = toys.id
    FULL OUTER JOIN cats
        ON cats.id = cattoys.cat_id 
    WHERE
        cats.color ILIKE 'black' OR toys.color ILIKE 'black';

EXPLAIN
SELECT toys.name
FROM toys 
   JOIN cattoys
        ON cattoys.toy_id = toys.id
    JOIN cats
        ON cattoys.cat_id = cats.id
    WHERE cats.breed = 'Siamese';

UPDATE
  table_name
SET
  col_name1 = value1,
  col_name2 = value2
WHERE
  conditions

EXPLAIN
    UPDATE
        cats
    SET
        breed = 'Lion'
    WHERE
        name = 'Sergey';

EXPLAIN
DELETE FROM
  cats
WHERE
  name = 'Ryan';

EXPLAIN ANALYZE
INSERT INTO
cattoys (cat_id, toy_id)
VALUES
(
(SELECT id
FROM cats
WHERE name = 'Ryan')
,
(SELECT id
FROM toys
WHERE name = 'tin foil')
);

