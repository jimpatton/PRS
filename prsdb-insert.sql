-- PRS DB
USE PRSDB
GO

INSERT INTO [User] (Username, Password, FirstName, LastName,PhoneNumber, Email, Reviewer, Admin)
VALUES	('SarlacSlayer','BountyHunt', 'Boba', 'Fett', 513-555-1111, 'boba@slave1.com', 0,0),
		('BluePrint', 'CloneArmy', 'Jango', 'Fett', 513-555-2222, 'jango@slave1.com', 1, 1),
		('Mando', 'TheWay', 'Din', 'Djarin', 513-555-3333, 'din@clanmudhorn.com', 0,0);

INSERT INTO Vendor (Code, Name, Address, City, State, Zip, PhoneNumber, Email)
VALUES	('MMA', 'Mandori Mandalorian Armory', '1 Bounty Hunter LN', 'Mandalore', 'OH', '45011', '513-555-7523', 'mandori@mma.com'),
		('JAW', 'Jawa Traders', '67 Desert St', 'Tatooine', 'NV', '89101', '702-555-2358', 'jawa@utinni.com'),
		('JAR', 'Jareal Droids', '15 Mechanical Way', 'Outer Rim', 'NY', '10013', '212-555-4586', 'jareal@droids.com'),
		('BTI', 'BlasTech Industries','13 Pew Pew Blvd', 'Alpha', 'NM','87101', '505-575-5741', 'weapons@blastech.com'),
		('KSE', 'Kuat Systems Engineering', '75 Starship Ave', 'Corelia', 'MI', '48201', '313-555-4782', 'starships@kuatsys.com');
		
INSERT INTO [Product] (VendorID, PartNumber, Name, Price)
VALUES	(1, 'BA355', 'Beskar Armor', 1899.00),
		(1, 'BA356', 'Helmet', 400.00),
		(1, 'JP110', 'Jetpack Fuel Cell', 250.00),
		(1, 'GH005', 'Grappling Hook', 150.00),
		(2, 'TD5', 'Tracking Device', 75.00),
		(2, 'R2456', 'Rations', 25.00),
		(3, 'RD63', 'Reconnaissance Droid', 400.00),
		(3, 'PD32', 'Protocol Droid', 10200.00),
		(3, 'IG88', 'Assassin Droid', 15550.00),
		(4, 'EE3', 'Carbine Rifle', 550.00),
		(4, 'WB7', 'Whistling Birds', 300.00),
		(4, 'JP3', 'Jet Pack', 10250.00),
		(4, 'VB18', 'Vibroblade', 75.00),
		(4, 'EX10', 'Explosives', 225.00),
		(5, 'S1', 'Firespray 31 Patrol Craft', 125650.00),
		(5, 'N1', 'Naboo Starfighter', 97500.00);




