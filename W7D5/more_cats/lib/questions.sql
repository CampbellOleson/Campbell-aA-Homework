EXPLAIN
SELECT cats.breed
FROM cats 
WHERE cats.name = 'Noel';

EXPLAIN
SELECT
    toys.name
FROM
    toys
JOIN
    cattoys ON cattoys.toy_id = toys.id
JOIN
    cats ON cattoys.cat_id = cats.id 
WHERE
    cats.name = 'Freyja';

EXPLAIN
SELECT toys.name, cats.name
FROM toys
JOIN
    cattoys ON cattoys.toy_id = toys.id
JOIN
    cats ON cattoys.cat_id = cats.id 
WHERE cats.color = 'Red' OR toys.color = 'Red';

EXPLAIN
SELECT
    toys.name
FROM
    toys
JOIN
    cattoys ON cattoys.toy_id = toys.id
JOIN
    cats ON cattoys.cat_id = cats.id 
WHERE
    cats.breed = 'British Shorthair';

EXPLAIN
SELECT toys.name
FROM toys
WHERE toys.price < 10;