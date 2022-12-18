-- �������� ��

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
INSERT INTO ProductStatus(Title) VALUES('�������');
INSERT INTO ProductStatus(Title) VALUES('��������');
INSERT INTO ProductStatus(Title) VALUES('������� �������');
INSERT INTO ProductStatus(Title) VALUES('������ �������');

--Product
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product1', '���������� ������� � �����', '2022-05-07 16:00:00', '2022-11-03 16:00:00', 14, 4);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product2', '����� � �������', '2022-04-11 12:00:00', '2022-25-11 12:00:00', 2, 4);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product3', '��� ���-��', '2022-22-11', '2022-11-03', 1, 1);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product4', '��������� �����', '2022-06-08', '2022-15-12', 10, 2);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product5', '���� ����������', '2022-15-08', '2022-15-12', 2, 3);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product6', '�������� (���������)', '2022-05-07 00:00:00', '2022-11-03 00:00:00', 10, 1);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product7', '�������� � �������', '2022-07-05', '2022-23-12', 2, 1);
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID) VALUES('img/product8', '�������� ��������', '2022-05-07 00:00:00', '2022-11-03 00:00:00', 4, 1);

--Position
INSERT INTO Position(Title) VALUES ('��������');
INSERT INTO Position(Title) VALUES ('������� ��������');
INSERT INTO Position(Title) VALUES ('��������');

--User
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('�����','�����','���������', 1, 'qwerty', 'qwerty');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('������','��������','����������', 1, 'MoseevTolik', 'Tolik2004');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('����������','������','������������', 1, 'nikitaBoss', '123');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('�������','��������','����������', 2, 'veroni4ka', '0123456789');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('��������','�����','����������', 2, 'iLovEBeshparmak', '123');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('������','������','����������', 1, '6a6ka_B_kegax', '2004');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('������','�����','��������', 1, 'admin', 'admin');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('��������','���������','���������', 1, 'Kate', '**da14&!adac');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('���������','�������','����������', 2, 'Elizarova', '&daxXaw152*');
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('�������','������','�������������', 1, 'moRo4Ka', '!@#$%^&*');

-- ����������

-- ���������� ������ ����������
INSERT INTO [User](UserSurname, [UserName], UserMiddleName, PositionID, [Login], [Password]) VALUES ('������������','���������','����������', 1, 'qwerty', 'qwerty');

-- ����� ������ � ���������� ����������
UPDATE [User] SET [Password] = 'Zusupova' WHERE UserID = 5;

-- ����� ��������� � ���������� ����������
UPDATE [User] SET PositionID = 3 WHERE UserID = 7;

-- �������� ���������� ����������
DELETE [User] WHERE UserID = 3;

-- ����� ���� �����������
SELECT UserID, UserSurname, UserName, UserMiddleName, Title
FROM [User], Position
WHERE [User].PositionID = Position.PositionID
ORDER BY Title;

-- ����� ������� ��������� 
SELECT UserID, UserSurname, UserName, UserMiddleName, Title
FROM [User], Position
WHERE [User].PositionID = Position.PositionID AND Position.PositionID = 2;

-- ����� ���������
SELECT UserID, UserSurname, UserName, UserMiddleName, Title
FROM [User], Position
WHERE [User].PositionID = Position.PositionID AND Position.PositionID = 3;

-- ��������

-- �������� �������
INSERT INTO Product(Photo, Title, Manafactured, BestBefore, [Count], StatusID)
VALUES('img/krolik.png', '������� �� �������', '2022-07-05', '2022-19-12 15:00:00', 14, 4);

-- �������� ���� �� ����������
UPDATE Product SET Photo = '../temp/krolik.png' WHERE ProductID = 13;

-- �������� �������� ��������
UPDATE Product SET Title = '���������� ������� �� �������' WHERE ProductID = 13;

-- �������� ���� ������������
UPDATE Product SET Manafactured = '2022-04-05 00:00:00' WHERE ProductID = 13;

-- �������� ���� ����� ����� ��������
UPDATE Product SET Manafactured = '2022-12-31 00:00:00' WHERE ProductID = 13;

-- �������� ���������� ��������
UPDATE Product SET [Count] = 10 WHERE ProductID = 13;

-- �������� ������ ��������
UPDATE Product SET StatusID = 1 WHERE ProductID = 13;

-- ������� �������
DELETE Product WHERE ProductID = 5;

-- ��� ��������
SELECT *
FROM Product;

-- �������, ������� ����� ������� ������� �������
SELECT *
FROM Product
WHERE DAY(GETDATE()) = Day(BestBefore) - 1
	AND MONTH(GETDATE()) = MONTH(BestBefore)
	AND YEAR(GETDATE()) = YEAR(BestBefore)
	AND DATEPART(hh, BestBefore) = 0
	AND StatusID != 1;

-- �������, ������� ����� ������� �������
SELECT *
FROM Product
WHERE DAY(GETDATE()) = Day(BestBefore)
	AND MONTH(GETDATE()) = MONTH(BestBefore)
	AND YEAR(GETDATE()) = YEAR(BestBefore)
	AND StatusID != 1;

-- ������� �� �������� "������ �������"
SELECT *
FROM Product
WHERE GETDATE() > BestBefore AND StatusID != 1;

-- ������� �� �������� "�������"
SELECT *
FROM Product
WHERE StatusID = 1;

-- ������� �� �������� "��������"
SELECT *
FROM Product
WHERE StatusID = 2
ORDER BY [Count];