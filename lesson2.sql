DROP DATABASE IF EXISTS lesson_2; -- Удаляет БД lesson_2, если она существует
CREATE DATABASE lesson_2;
USE lesson_2;

-- DDL: CREATE, DROP, ALTER (ДОБАВИТЬ СУЩ. ТАБЛИЦУ: НОВЫЙ СТОЛБЕЦ ИЛИ УДАЛИТЬ), RENAME, TRUNCATE (ОЧИСТКА ТАБЛИЦЫ)
-- DML: INSERT, DELETE, UPDATE, SELECT

DROP TABLE IF EXISTS movie;
CREATE TABLE movie
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(45) CHARACTER SET utf8mb4 NOT NULL,
    title_eng VARCHAR(45),
    year_movie YEAR NOT NULL, -- YYYY(2023)
    count_min INT,
    storyline TEXT CHARACTER SET utf8mb4
);

INSERT INTO movie (title, title_eng, year_movie, count_min, storyline)
VALUES
('Игры разума', 'A Beautiful Mind', 2001, 135, 'От всемирной известности до греховных глубин — все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.'),
('Форрест Гамп', 'Forrest Gump', 1994, 142, 'Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.'),
('Иван Васильевич меняет профессию', NULL, 1998, 128,'Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком - точнее, с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский. На их место в двадцатом веке «переселяется» великий государь. Поломка машины приводит ко множеству неожиданных и забавных событий...'),
('Назад в будущее', 'Back to the Future', 1985, 116, 'Подросток Марти с помощью машины времени, сооружённой его другом-профессором доком Брауном, попадает из 80-х в далекие 50-е. Там он встречается со своими будущими родителями, ещё подростками, и другом-профессором, совсем молодым.'),
('Криминальное чтиво', 'Pulp Fiction', 1994, 154, NULL);

SELECT * FROM movie;

-- movie -> cinema
RENAME TABLE movie TO cinema;
SHOW FULL TABLES;

SELECT * FROM cinema;

-- ALTER
ALTER TABLE cinema
ADD COLUMN test INT, -- NULL
ADD price INT DEFAULT 200;

SELECT * FROM cinema;

-- Удаление столбца
ALTER TABLE cinema
DROP test;

SELECT * FROM cinema;

UPDATE cinema
SET price = price + 150 -- price = price + 150
WHERE title = "Иван Васильевич меняет профессию";

SELECT * FROM cinema;


-- CASE
-- price от 0 до 200 рублей включительно, то фильм "Не самый популярный"
-- price >= 201 рублей, то фильм "Популярный"
SELECT
    title AS "Название",
    price,
CASE
    WHEN price BETWEEN 0 AND 200 -- price >= 0 AND price <= 200
        THEN "Не самый популярный"
    WHEN price >= 201
        THEN "Популярный"
    ELSE "Error"
END AS resulte
FROM cinema;