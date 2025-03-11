
DROP DATABASE IF EXISTS prsdb;
	
CREATE DATABASE prsdb;

USE prsdb;

CREATE TABLE User(
	ID				INT				primary key auto_increment,
	Username		VARCHAR(20)		NOT NULL,
	Password		VARCHAR(10)		NOT NUll,
	FirstName		VARCHAR(20)		NOT NULL,
	LastName		VARCHAR(20)		NOT NULL,
	PhoneNumber		VARCHAR(12)		NOT NULL,
	Email			VARCHAR(75)		NOT NULL,
	Reviewer		BIT				NOT NULL,
	Admin			BIT				NOT NULL,
	CONSTRAINT uname UNIQUE (Username)
	);
	

CREATE TABLE Vendor(
	ID					INT							NOT NULL		primary key auto_increment,
	Code				VARCHAR(10)					NOT NULL,
	Name				VARCHAR(255)				NOT NULL,
	Address				VARCHAR(255)				NOT NULL,
	City				VARCHAR(255)				NOT NULL,
	State				VARCHAR(255)				NOT NULL,
	Zip					VARCHAR(5)					NOT NULL,
	PhoneNumber			VARCHAR(12)					NOT NULL,
	Email				VARCHAR(100)				NOT NULL,
	CONSTRAINT	vcode UNIQUE (Code)
	);


CREATE TABLE Product(
	ID					INT							NOT NULL		primary key auto_increment,
	VendorID			INT							NOT NULL,
	PartNumber			VARCHAR(50)					NOT NULL,
	Name				VARCHAR(150)				NOT NULL,
	Price				DECIMAL(10,2)				NOT NULL,	
	Unit				VARCHAR(255),
	Photopath			VARCHAR(255),
	CONSTRAINT vendor_part UNIQUE (VendorID, PartNumber),
	CONSTRAINT FK_ProductVendor FOREIGN KEY (VendorID) REFERENCES Vendor(ID)
	);
	

CREATE TABLE Request(
	ID					INT							NOT NULL		primary key auto_increment,
	UserID				INT							NOT NULL,
	RequestNumber		VARCHAR(20)					NOT NULL,
	Description			VARCHAR(100)				NOT NULL,
	Justification		VARCHAR(255)				NOT NULL,
	DateNeeded			DATE						NOT NULL,
	DeliveryMode		VARCHAR(25)					NOT NULL,
	Status				VARCHAR(20)					NOT NULL		default('NEW'),
	Total				DECIMAL(10,2)				NOT NULL		default(0.0),
	SubmittedDate		DATETIME					NOT NULL,
	ReasonForRejection	VARCHAR(100),
	CONSTRAINT FK_RequestUser FOREIGN KEY (UserID) REFERENCES User(ID)
	);
	

CREATE TABLE LineItem(
	ID					INT							NOT NULL		primary key auto_increment,
	RequestID			INT							NOT NULL,
	ProductID			INT							NOT NULL,
	Quantity			INT							NOT NULL,
	CONSTRAINT FK_LineItemProduct FOREIGN KEY (ProductID) REFERENCES Product(ID),
	CONSTRAINT FK_LineItemRequest FOREIGN KEY (RequestID) REFERENCES Request(ID),
	CONSTRAINT req_pdt UNIQUE(RequestID, ProductID)
	);
	
DROP USER IF EXISTS prsdb_user@localhost;
CREATE USER prsdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prsdb.* TO prsdb_user@localhost;