-- СОЗДАНИЕ БД

Create DATABASE ShelfLife;

use ShelfLife;

CREATE TABLE ProductStatus (
	StatusID int IDENTITY(1, 1),
	Title varchar(255) NOT NULL,
	PRIMARY KEY (StatusID)
);

CREATE TABLE Product (
	ProductID int IDENTITY(1, 1),
	Photo varchar(255) NOT NULL,
	Title varchar(255),
	Manafactured smalldatetime NOT NULL,
	BestBefore smalldatetime NOT NULL,
	[Count] int NOT NULL,
	StatusID int FOREIGN KEY REFERENCES ProductStatus(StatusID),
	PRIMARY KEY(ProductID)
);

CREATE TABLE Position (
	PositionID int IDENTITY(1, 1),
	Title varchar(255) NOT NULL,
	PRIMARY KEY(PositionID)
);

CREATE TABLE  [User] (
	UserID int IDENTITY(1, 1),
	UserSurname varchar(255) NOT NULL,
	UserName varchar(255) NOT NULL,
	UserMiddleName varchar(255),
	PositionID int FOREIGN KEY REFERENCES Position(PositionID),
	[Login] varchar(255) NOT NULL,
	[Password] varchar(255) NOT NULL
);

-- ProductStatus
INSERT INTO ProductStatus(Title) VALUES('Списано');
INSERT INTO ProductStatus(Title) VALUES('Ожидание');
INSERT INTO ProductStatus(Title) VALUES('Списать сегодня');
INSERT INTO ProductStatus(Title) VALUES('Срочно списать');

--Product
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product1', 'Гурманские котлеты с сыром', '2022-05-07 16:00:00', '2022-11-03 16:00:00', 14, 4);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product2', 'Горох в стакане', '2022-04-11 12:00:00', '2022-25-11 12:00:00', 2, 4);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product3', 'Суп том-ям', '2022-22-11', '2022-11-03', 1, 1);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product4', 'Воздушный зефир', '2022-06-08', '2022-15-12', 10, 2);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product5', 'Микс спортивный', '2022-15-08', '2022-15-12', 2, 3);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product6', 'Фалафель (заморозка)', '2022-05-07 00:00:00', '2022-11-03 00:00:00', 10, 1);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product7', 'Пельмени с курицей', '2022-07-05', '2022-23-12', 2, 1);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product8', 'Пельмени рыбацкие', '2022-05-07 00:00:00', '2022-11-03 00:00:00', 4, 1);

--Position
INSERT INTO Position(Title) VALUES ('Продавец');
INSERT INTO Position(Title) VALUES ('Старший продавец');
INSERT INTO Position(Title) VALUES ('Директор');

--User
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('Агеев','Павел','Сергеевич', 1, 'qwerty', 'qwerty');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('Мосеев','Анатолий','Дмитриевич', 1, 'MoseevTolik', 'Tolik2004');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('Колясников','Никита','Владимирович', 1, 'nikitaBoss', '123');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('Киселёва','Вероника','Алексеевна', 2, 'veroni4ka', '0123456789');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('Жусупова','Айман','Буркатовна', 2, 'iLovEBeshparmak', '123');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('Жданов','Даниил','Максимович', 1, '6a6ka_B_kegax', '2004');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('Гариев','Денис','Олегович', 1, 'admin', 'admin');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('Анчугова','Екатерина','Андреевна', 1, 'Kate', '**da14&!adac');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('Елизарова','Валерия','Алексеевна', 2, 'Elizarova', '&daxXaw152*');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('Морочка','Ксения','Александровна', 1, 'moRo4Ka', '!@#$%^&*');

-- СОТРУДНИКИ

-- Добавление нового сотрудника
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('Вознесенская','Анастасия','Эдуардовна', 1, 'qwerty', 'qwerty');

-- Смена пароля у выбранного сотрудника
UPDATE [User] SET [Password] = 'Zusupova' WHERE UserID = 5;

-- Смена должности у выбранного сотрудника
UPDATE [User] SET PositionID = 3 WHERE UserID = 7;

-- Удаление выбранного сотрудника
DELETE [User] WHERE UserID = 3;

-- Вывод всех сотрудников
SELECT UserID, UserSurname, UserName, UserMiddleName, Title
FROM [User], Position
WHERE [User].PositionID = Position.PositionID
ORDER BY Title;

-- Вывод старших продавцов 
SELECT UserID, UserSurname, UserName, UserMiddleName, Title
FROM [User], Position
WHERE [User].PositionID = Position.PositionID AND Position.PositionID = 2;

-- Вывод директора
SELECT UserID, UserSurname, UserName, UserMiddleName, Title
FROM [User], Position
WHERE [User].PositionID = Position.PositionID AND Position.PositionID = 3;

-- ПРОДУКТЫ

-- Добавить продукт
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID)
VALUES('img/krolik.png', 'Котлеты из кролика', '2022-07-05', '2022-19-12 15:00:00', 14, 4);

-- Изменить путь до фотографии
UPDATE Product SET Photo = '../temp/krolik.png' WHERE ProductID = 13;

-- Изменить название продукта
UPDATE Product SET Title = 'Гурманские котлеты из кролика' WHERE ProductID = 13;

-- Изменить дату производства
UPDATE Product SET Manafactured = '2022-04-05 00:00:00' WHERE ProductID = 13;

-- Изменить дату конца срока годности
UPDATE Product SET Manafactured = '2022-12-31 00:00:00' WHERE ProductID = 13;

-- Изменить количество продукта
UPDATE Product SET [Count] = 10 WHERE ProductID = 13;

-- Изменить статус продукта
UPDATE Product SET StatusID = 1 WHERE ProductID = 13;

-- Удалить продукт
DELETE Product WHERE ProductID = 5;

-- Все продукты
SELECT *
FROM Product;

-- Позиции, которые нужно списать сегодня вечером
SELECT *
FROM Product
WHERE DAY(GETDATE()) = Day(BestBefore) - 1
	AND MONTH(GETDATE()) = MONTH(BestBefore)
	AND YEAR(GETDATE()) = YEAR(BestBefore)
	AND DATEPART(hh, BestBefore) = 0
	AND StatusID != 1;

-- Позиции, которые нужно списать сегодня
SELECT *
FROM Product
WHERE DAY(GETDATE()) = Day(BestBefore)
	AND MONTH(GETDATE()) = MONTH(BestBefore)
	AND YEAR(GETDATE()) = YEAR(BestBefore)
	AND StatusID != 1;

-- Позиции со статусом "Срочно списать"
SELECT *
FROM Product
WHERE GETDATE() > BestBefore AND StatusID != 1;

-- Позиции со статусом "Списано"
SELECT *
FROM Product
WHERE StatusID = 1;

-- Позиции со статусом "Ожидание"
SELECT *
FROM Product
WHERE StatusID = 2
ORDER BY [Count];