

CREATE TABLE Entertainers (
				EntertainerID INT NOT NULL CONSTRAINT pk_entId PRIMARY KEY,
				EntStageName CHAR(30) NOT NULL,
				EntSSN CHAR(11) NULL, 
				EntStreetAddress VARCHAR(50) NULL,
				EntCity CHAR(30) NULL,
				EntState CHAR(2) NULL,
				EntZipCode NUMERIC(5) NULL,
				EntPhoneNumber CHAR(8) NULL,
				EntWebPage VARCHAR(100) NULL,
				EntEmailAddress VARCHAR(50) NULL,
				DateEntered DATE NULL)

				GO

CREATE TABLE Members (
				MemberID INT NOT NULL CONSTRAINT pk_agtId PRIMARY KEY,
				MbrFirstName CHAR(30) NOT NULL,
				MbrLastName CHAR(50) NOT NULL,
				MbrPhoneNumber CHAR(8) NULL,
				Gender CHAR(5))
				
				GO

CREATE TABLE Entertainer_Members (
				EntertainerID INT NOT NULL,
				MemberID INT NOT NULL,
				[Status] INT NOT NULL,
				CONSTRAINT pk_ent_membId PRIMARY KEY (EntertainerID, MemberID),
				CONSTRAINT fk_ent_membID FOREIGN KEY (EntertainerID)
						REFERENCES Entertainers (EntertainerID),
				CONSTRAINT fk_membID FOREIGN KEY (MemberID)
						REFERENCES Members (MemberID))
				
			GO

CREATE TABLE Musical_styles (
				StyleID INT NOT NULL CONSTRAINT pk_styleId PRIMARY KEY,
				StyleName VARCHAR(50)) 

				GO
				
CREATE TABLE Entertainer_Styles (
				EntertainerID INT NOT NULL,
				StyleID INT NOT NULL,
				CONSTRAINT pk_ent_styleId PRIMARY KEY (EntertainerID, StyleID),
				CONSTRAINT fk_ent_styleID FOREIGN KEY (EntertainerID)
						REFERENCES Entertainers (EntertainerID),
				CONSTRAINT fk_styleID FOREIGN KEY (StyleID)
						REFERENCES Musical_styles (StyleID))

			GO
			
CREATE TABLE Customers (
				CustomerId INT NOT NULL CONSTRAINT pk_custId PRIMARY KEY,
				CustFirstName CHAR(30) NOT NULL,
				CustLastName CHAR(50) NOT NULL,
				CustStreetAddress VARCHAR(50) NULL,
				CustCity CHAR(30) NULL,
				CustState CHAR(2) NULL,
				CustZipCode NUMERIC(5) NULL,
				CustPhoneNumber CHAR(8) NULL)

				GO

CREATE TABLE Musical_Preferences (
				CustomerID INT NOT NULL,
				StyleID INT NOT NULL,
				CONSTRAINT pk_refId PRIMARY KEY (CustomerID, StyleID),
				CONSTRAINT fk_pref_styleID FOREIGN KEY (StyleID)
						REFERENCES Musical_styles (StyleID),
				CONSTRAINT fk_pref_custID FOREIGN KEY (CustomerID)
						REFERENCES Customers (CustomerID))


				GO


CREATE TABLE Agents (
				AgentID INT NOT NULL CONSTRAINT pk_agntId PRIMARY KEY,
				AgtFirstName CHAR(30) NOT NULL,
				AgtLastName CHAR(50) NOT NULL,
				AgtStreetAddress VARCHAR(50) NULL,
				AgtCity CHAR(30) NULL,
				AgtState CHAR(2) NULL,
				AgtZipCode NUMERIC(5) NULL,
				AgtPhoneNumber CHAR(8) NULL,
				DateHired DATE NULL,
				Salary MONEY NULL,
				CommissionRate FLOAT NULL)

				GO

CREATE TABLE Engagements (
				EngagementNumber INT NOT NULL CONSTRAINT pk_engId PRIMARY KEY,
				StartDate DATE NULL,
				EndDate DATE NULL,
				StartTime TIME NULL,
				StopTime TIME NULL,
				ContractPrice MONEY NULL,
				CustomerID INT NOT NULL,
				AgentID INT NOT NULL,
				EntertainerID INT NOT NULL,
				CONSTRAINT fk_customer FOREIGN KEY (CustomerID)
					REFERENCES Customers (CustomerId),
				CONSTRAINT fk_agent FOREIGN KEY (AgentID)
					REFERENCES Agents (AgentID),
				CONSTRAINT fk_entertainer FOREIGN KEY (EntertainerID)
					REFERENCES Entertainers (EntertainerID))


				GO


INSERT INTO Customers
  VALUES (10001, 'Sally', 'Callahan', '4726 - 11th Ave. N.E.', 
   'Seattle', 'WA', '98105', '555-2671')
INSERT INTO Customers
  VALUES (10002, 'Ann', 'Fuller', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '555-2496')
INSERT INTO Customers
  VALUES (10003, 'James', 'Leverling', '722 Moss Bay Blvd.', 
   'Kirkland', 'WA', '98033', '555-2501')
INSERT INTO Customers
  VALUES (10004, 'Kenneth', 'Peacock', '4110 Old Redmond Rd.', 
   'Redmond', 'WA', '98052', '555-2506')
INSERT INTO Customers
  VALUES (10005, 'Elizabeth', 'Hallmark', 'Route 2, Box 203B', 
   'Auburn', 'WA', '98002', '555-2521')
INSERT INTO Customers
  VALUES (10006, 'Thomas', 'Fuller', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '555-2581')
INSERT INTO Customers
  VALUES (10007, 'Amelia', 'Buchanan', '13920 S.E. 40th Street', 
   'Bellevue', 'WA', '98006', '555-2556')
INSERT INTO Customers
  VALUES (10008, 'Samuel', 'Peacock', '2601 Seaview Lane', 
   'Kirkland', 'WA', '98033', '555-2616')
INSERT INTO Customers
  VALUES (10009, 'Sarah', 'Thompson', '2222 Springer Road', 
   'Bellevue', 'WA', '98006', '555-2626')
INSERT INTO Customers
  VALUES (10010, 'Zachary', 'Ehrlich', '12330 Kingman Drive', 
   'Kirkland', 'WA', '98033', '555-2721')
INSERT INTO Customers
  VALUES (10011, 'Joyce', 'Bonnicksen', '2424 Thames Drive', 
   'Bellevue', 'WA', '98006', '555-2726')
INSERT INTO Customers
  VALUES (10012, 'Mel', 'Ehrlich', '777 Fenexet Blvd', 
   'Redmond', 'WA', '98052', '555-0399')
INSERT INTO Customers
  VALUES (10013, 'Estella', 'Pundt', '2500 Rosales Lane', 
   'Bellevue', 'WA', '98006', '555-9938')
INSERT INTO Customers
  VALUES (10014, 'Mark', 'Rosales', '323 Advocate Lane', 
   'Bellevue', 'WA', '98006', '555-2286')
INSERT INTO Customers
  VALUES (10015, 'David', 'Nathanson', '754 Fourth Ave', 
   'Seattle', 'WA', '98115', '555-2296')
INSERT INTO Entertainers
  VALUES (1001, 'Carol Peacock Trio', '888-90-1121', 
   '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 
   '555-2691', NULL, NULL, NULL)
INSERT INTO Entertainers
  VALUES (1002, 'Topazz', '888-50-1061', '16 Maple Lane', 
   'Auburn', 'WA', '98002', '555-2591', NULL, NULL, 
   NULL)
INSERT INTO Entertainers
  VALUES (1003, 'JV & the Deep Six', '888-18-1013', 
   '15127 NE 24th, #383', 'Redmond', 'WA', '98052', 
   '555-2511', NULL, NULL, NULL)
INSERT INTO Entertainers
  VALUES (1004, 'Albert Buchanan', '888-26-1025', '13920 S.E. 40th Street', 
   'Bellevue', 'WA', '98009', '555-2531', NULL, NULL, 
   NULL)
INSERT INTO Entertainers
  VALUES (1005, 'Jazz Persuasion', '888-30-1031', '233 West Valley Hwy', 
   'Bellevue', 'WA', '98005', '555-2541', NULL, NULL, 
   NULL)
INSERT INTO Entertainers
  VALUES (1006, 'Modern Dance', '888-66-1085', 'Route 2, Box 203B', 
   'Woodinville', 'WA', '98072', '555-2631', NULL, 
   NULL, NULL)
INSERT INTO Entertainers
  VALUES (1007, 'Coldwater Cattle Company', '888-38-1043', 
   '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 
   '555-2561', NULL, NULL, NULL)
INSERT INTO Entertainers
  VALUES (1008, 'Country Feeling', '888-98-1133', 'PO Box 223311', 
   'Seattle', 'WA', '98125', '555-2711', NULL, NULL, 
   NULL)
INSERT INTO Entertainers
  VALUES (1009, 'Katherine Ehrlich', '888-61-1103', 
   '777 Fenexet Blvd', 'Woodinville', 'WA', '98072', 
   '555-0399', NULL, NULL, NULL)
INSERT INTO Entertainers
  VALUES (1010, 'Saturday Revue', '888-64-1109', '3887 Easy Street', 
   'Seattle', 'WA', '98125', '555-0039', NULL, NULL, 
   NULL)
INSERT INTO Entertainers
  VALUES (1011, 'Julia Schnebly', '888-65-1111', '2343 Harmony Lane', 
   'Seattle', 'WA', '99837', '555-9936', NULL, NULL, 
   NULL)
INSERT INTO Entertainers
  VALUES (1012, 'Susan McLain', '888-70-1121', '511 Lenora Ave', 
   'Bellevue', 'WA', '98006', '555-2301', NULL, NULL, 
   NULL)
INSERT INTO Entertainers
  VALUES (1013, 'Caroline Coie Cuartet', '888-71-1123', 
   '298 Forest Lane', 'Auburn', 'WA', '98002', '555-2306', 
   NULL, NULL, NULL)
INSERT INTO Agents
  VALUES (1, 'Will', 'Thompson', '122 Spring River Drive', 
   'Redmond', 'WA', '98053', '555-2681', NULL, 0, 0)
INSERT INTO Agents
  VALUES (2, 'Steven', 'Buchanan', '66 Spring Valley Drive', 
   'Seattle', 'WA', '98125', '555-2666', NULL, 0, 0)
INSERT INTO Agents
  VALUES (3, 'Margaret', 'Peacock', '667 Red River Road', 
   'Bellevue', 'WA', '98006', '555-2571', NULL, 0, 
   0)
INSERT INTO Agents
  VALUES (4, 'Karen', 'Smith', '30301 - 166th Ave. N.E.', 
   'Seattle', 'WA', '98125', '555-2551', NULL, 0, 0)
INSERT INTO Agents
  VALUES (5, 'Mary', 'Fuller', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '555-2606', NULL, 0, 0)
INSERT INTO Agents
  VALUES (6, 'John', 'Kennedy', '16679 NE 41st Court', 
   'Seattle', 'WA', '98125', '555-2621', NULL, 0, 0)
INSERT INTO Agents
  VALUES (7, 'Gregory', 'Piercy', '4501 Wetland Road', 
   'Redmond', 'WA', '98052', '555-0037', NULL, 0, 0)
INSERT INTO Agents
  VALUES (8, 'Consuelo', 'Maynez', '3445 Cheyenne Road', 
   'Bellevue', 'WA', '98006', '555-2291', NULL, 0, 
   0)
INSERT INTO Engagements
  VALUES (1, '1999-07-01', '1999-07-04', '13:00:00', 
   '15:00:00', 170, 10014, 1, 1009)
INSERT INTO Engagements
  VALUES (2, '1999-07-01', '1999-07-05', '13:00:00', 
   '15:00:00', 200, 10006, 4, 1004)
INSERT INTO Engagements
  VALUES (3, '1999-07-10', '1999-07-15', '13:00:00', 
   '15:00:00', 590, 10001, 3, 1005)
INSERT INTO Engagements
  VALUES (4, '1999-07-11', '1999-07-17', '20:00:00', 
   '00:00:00', 470, 10007, 3, 1004)
INSERT INTO Engagements
  VALUES (5, '1999-07-11', '1999-07-14', '16:00:00', 
   '19:00:00', 1130, 10006, 5, 1003)
INSERT INTO Engagements
  VALUES (6, '1999-07-10', '1999-07-14', '15:00:00', 
   '21:00:00', 2300, 10014, 7, 1008)
INSERT INTO Engagements
  VALUES (7, '1999-07-11', '1999-07-18', '17:00:00', 
   '20:00:00', 770, 10004, 4, 1002)
INSERT INTO Engagements
  VALUES (8, '1999-07-18', '1999-07-25', '20:00:00', 
   '23:00:00', 1850, 10006, 3, 1007)
INSERT INTO Engagements
  VALUES (9, '1999-07-18', '1999-07-28', '19:00:00', 
   '21:00:00', 1370, 10010, 2, 1010)
INSERT INTO Engagements
  VALUES (10, '1999-07-17', '1999-07-26', '13:00:00', 
   '17:00:00', 3650, 10005, 3, 1003)
INSERT INTO Engagements
  VALUES (11, '1999-07-15', '1999-07-16', '18:00:00', 
   '00:00:00', 950, 10005, 4, 1008)
INSERT INTO Engagements
  VALUES (12, '1999-07-18', '1999-07-26', '18:00:00', 
   '22:00:00', 1670, 10014, 8, 1001)
INSERT INTO Engagements
  VALUES (13, '1999-07-17', '1999-07-20', '20:00:00', 
   '23:00:00', 770, 10003, 1, 1006)
INSERT INTO Engagements
  VALUES (14, '1999-07-24', '1999-07-29', '16:00:00', 
   '22:00:00', 2750, 10001, 1, 1008)
INSERT INTO Engagements
  VALUES (15, '1999-07-24', '1999-07-29', '17:00:00', 
   '19:00:00', 770, 10007, 1, 1013)
INSERT INTO Engagements
  VALUES (16, '1999-08-01', '1999-08-05', '20:00:00', 
   '01:00:00', 1550, 10010, 5, 1013)
INSERT INTO Engagements
  VALUES (17, '1999-07-29', '1999-08-01', '18:00:00', 
   '20:00:00', 530, 10002, 8, 1010)
INSERT INTO Engagements
  VALUES (18, '1999-07-29', '1999-08-04', '17:00:00', 
   '22:00:00', 575, 10006, 4, 1009)
INSERT INTO Engagements
  VALUES (19, '1999-07-29', '1999-08-04', '20:00:00', 
   '23:00:00', 365, 10009, 8, 1004)
INSERT INTO Engagements
  VALUES (20, '1999-07-31', '1999-08-04', '18:00:00', 
   '20:00:00', 800, 10008, 4, 1007)
INSERT INTO Engagements
  VALUES (21, '1999-07-30', '1999-08-02', '12:00:00', 
   '16:00:00', 1490, 10005, 1, 1003)
INSERT INTO Engagements
  VALUES (22, '1999-07-30', '1999-08-04', '12:00:00', 
   '15:00:00', 590, 10004, 5, 1002)
INSERT INTO Engagements
  VALUES (23, '1999-07-30', '1999-07-30', '20:00:00', 
   '00:00:00', 290, 10012, 4, 1013)
INSERT INTO Engagements
  VALUES (24, '1999-07-31', '1999-08-06', '12:00:00', 
   '18:00:00', 1940, 10001, 4, 1001)
INSERT INTO Engagements
  VALUES (25, '1999-07-31', '1999-08-07', '19:00:00', 
   '21:00:00', 1010, 10011, 4, 1006)
INSERT INTO Engagements
  VALUES (26, '1999-08-08', '1999-08-13', '17:00:00', 
   '22:00:00', 950, 10001, 6, 1002)
INSERT INTO Engagements
  VALUES (27, '1999-08-06', '1999-08-11', '12:00:00', 
   '16:00:00', 2210, 10015, 7, 1003)
INSERT INTO Engagements
  VALUES (28, '1999-08-05', '1999-08-14', '17:00:00', 
   '22:00:00', 3800, 10003, 4, 1007)
INSERT INTO Engagements
  VALUES (29, '1999-08-08', '1999-08-10', '18:00:00', 
   '00:00:00', 320, 10011, 4, 1011)
INSERT INTO Engagements
  VALUES (30, '1999-08-05', '1999-08-07', '17:00:00', 
   '22:00:00', 275, 10009, 5, 1011)
INSERT INTO Engagements
  VALUES (31, '1999-08-06', '1999-08-15', '16:00:00', 
   '20:00:00', 2450, 10002, 8, 1010)
INSERT INTO Engagements
  VALUES (32, '1999-08-06', '1999-08-15', '13:00:00', 
   '15:00:00', 1250, 10010, 7, 1013)
INSERT INTO Engagements
  VALUES (33, '1999-08-14', '1999-08-19', '17:00:00', 
   '20:00:00', 1670, 10008, 1, 1003)
INSERT INTO Engagements
  VALUES (34, '1999-08-13', '1999-08-19', '16:00:00', 
   '18:00:00', 680, 10004, 8, 1005)
INSERT INTO Engagements
  VALUES (35, '1999-08-13', '1999-08-14', '19:00:00', 
   '23:00:00', 410, 10005, 8, 1001)
INSERT INTO Engagements
  VALUES (36, '1999-08-12', '1999-08-22', '18:00:00', 
   '22:00:00', 710, 10014, 3, 1011)
INSERT INTO Engagements
  VALUES (37, '1999-08-12', '1999-08-18', '14:00:00', 
   '19:00:00', 2675, 10006, 3, 1008)
INSERT INTO Engagements
  VALUES (38, '1999-08-13', '1999-08-17', '14:00:00', 
   '20:00:00', 1850, 10013, 4, 1006)
INSERT INTO Engagements
  VALUES (39, '1999-08-20', '1999-08-24', '16:00:00', 
   '19:00:00', 950, 10008, 7, 1006)
INSERT INTO Engagements
  VALUES (40, '1999-08-20', '1999-08-29', '16:00:00', 
   '18:00:00', 1250, 10011, 1, 1010)
INSERT INTO Engagements
  VALUES (41, '1999-08-19', '1999-08-27', '18:00:00', 
   '21:00:00', 860, 10013, 3, 1002)
INSERT INTO Engagements
  VALUES (42, '1999-08-19', '1999-08-25', '17:00:00', 
   '22:00:00', 2150, 10002, 1, 1013)
INSERT INTO Engagements
  VALUES (43, '1999-08-20', '1999-08-20', '14:00:00', 
   '16:00:00', 140, 10001, 8, 1001)
INSERT INTO Engagements
  VALUES (44, '1999-08-21', '1999-08-25', '14:00:00', 
   '19:00:00', 1925, 10006, 3, 1008)
INSERT INTO Engagements
  VALUES (45, '1999-08-20', '1999-08-27', '14:00:00', 
   '18:00:00', 530, 10015, 1, 1012)
INSERT INTO Engagements
  VALUES (46, '1999-08-27', '1999-09-04', '15:00:00', 
   '17:00:00', 1400, 10009, 4, 1008)
INSERT INTO Engagements
  VALUES (47, '1999-09-04', '1999-09-12', '18:00:00', 
   '20:00:00', 1130, 10008, 2, 1010)
INSERT INTO Engagements
  VALUES (48, '1999-09-04', '1999-09-05', '16:00:00', 
   '22:00:00', 950, 10002, 1, 1007)
INSERT INTO Engagements
  VALUES (49, '1999-09-12', '1999-09-18', '12:00:00', 
   '14:00:00', 680, 10014, 5, 1001)
INSERT INTO Engagements
  VALUES (50, '1999-09-11', '1999-09-15', '18:00:00', 
   '20:00:00', 200, 10012, 7, 1009)
INSERT INTO Engagements
  VALUES (51, '1999-09-12', '1999-09-13', '20:00:00', 
   '01:00:00', 650, 10013, 3, 1013)
INSERT INTO Engagements
  VALUES (52, '1999-09-12', '1999-09-13', '16:00:00', 
   '21:00:00', 650, 10010, 3, 1006)
INSERT INTO Engagements
  VALUES (53, '1999-09-10', '1999-09-11', '17:00:00', 
   '19:00:00', 350, 10002, 5, 1007)
INSERT INTO Engagements
  VALUES (54, '1999-09-10', '1999-09-16', '16:00:00', 
   '20:00:00', 2150, 10011, 3, 1008)
INSERT INTO Engagements
  VALUES (55, '1999-09-18', '1999-09-25', '20:00:00', 
   '02:00:00', 770, 10002, 3, 1011)
INSERT INTO Engagements
  VALUES (56, '1999-09-24', '1999-09-27', '14:00:00', 
   '19:00:00', 1550, 10010, 3, 1007)
INSERT INTO Engagements
  VALUES (57, '1999-09-25', '1999-09-29', '20:00:00', 
   '22:00:00', 350, 10011, 7, 1002)
INSERT INTO Engagements
  VALUES (58, '1999-09-30', '1999-10-03', '17:00:00', 
   '23:00:00', 770, 10001, 2, 1002)
INSERT INTO Engagements
  VALUES (59, '1999-09-30', '1999-10-03', '15:00:00', 
   '19:00:00', 290, 10004, 6, 1012)
INSERT INTO Engagements
  VALUES (60, '1999-10-01', '1999-10-03', '13:00:00', 
   '17:00:00', 230, 10010, 8, 1004)
INSERT INTO Engagements
  VALUES (61, '1999-10-02', '1999-10-09', '17:00:00', 
   '20:00:00', 410, 10015, 8, 1011)
INSERT INTO Engagements
  VALUES (62, '1999-10-08', '1999-10-09', '20:00:00', 
   '01:00:00', 500, 10003, 2, 1005)
INSERT INTO Engagements
  VALUES (63, '1999-10-17', '1999-10-20', '14:00:00', 
   '16:00:00', 650, 10009, 3, 1008)
INSERT INTO Engagements
  VALUES (64, '1999-10-24', '1999-11-02', '14:00:00', 
   '16:00:00', 1250, 10007, 3, 1013)
INSERT INTO Engagements
  VALUES (65, '1999-10-23', '1999-11-02', '18:00:00', 
   '21:00:00', 545, 10003, 1, 1009)
INSERT INTO Engagements
  VALUES (66, '1999-10-21', '1999-10-28', '20:00:00', 
   '02:00:00', 2930, 10005, 5, 1006)
INSERT INTO Engagements
  VALUES (67, '1999-10-23', '1999-10-24', '17:00:00', 
   '23:00:00', 770, 10011, 6, 1010)
INSERT INTO Engagements
  VALUES (68, '1999-10-23', '1999-10-28', '16:00:00', 
   '22:00:00', 1670, 10009, 1, 1005)
INSERT INTO Engagements
  VALUES (69, '1999-10-21', '1999-10-22', '15:00:00', 
   '18:00:00', 500, 10004, 7, 1008)
INSERT INTO Engagements
  VALUES (70, '1999-10-22', '1999-10-25', '13:00:00', 
   '15:00:00', 410, 10010, 6, 1001)
INSERT INTO Engagements
  VALUES (71, '1999-10-21', '1999-10-26', '14:00:00', 
   '17:00:00', 1670, 10002, 1, 1003)
INSERT INTO Engagements
  VALUES (72, '1999-10-21', '1999-10-31', '20:00:00', 
   '01:00:00', 875, 10012, 4, 1011)
INSERT INTO Engagements
  VALUES (73, '1999-10-28', '1999-11-06', '19:00:00', 
   '22:00:00', 1400, 10014, 5, 1001)
INSERT INTO Engagements
  VALUES (74, '1999-10-31', '1999-11-05', '13:00:00', 
   '15:00:00', 590, 10004, 1, 1005)
INSERT INTO Engagements
  VALUES (75, '1999-10-31', '1999-11-10', '17:00:00', 
   '20:00:00', 2525, 10001, 7, 1007)
INSERT INTO Engagements
  VALUES (76, '1999-10-29', '1999-11-02', '16:00:00', 
   '22:00:00', 500, 10005, 7, 1012)
INSERT INTO Engagements
  VALUES (77, '1999-10-29', '1999-11-03', '17:00:00', 
   '20:00:00', 1670, 10015, 5, 1003)
INSERT INTO Engagements
  VALUES (78, '1999-10-31', '1999-11-02', '16:00:00', 
   '20:00:00', 770, 10010, 4, 1010)
INSERT INTO Engagements
  VALUES (79, '1999-10-29', '1999-11-02', '12:00:00', 
   '17:00:00', 1550, 10006, 8, 1006)
INSERT INTO Engagements
  VALUES (80, '1999-10-30', '1999-10-31', '17:00:00', 
   '21:00:00', 650, 10002, 5, 1008)
INSERT INTO Engagements
  VALUES (81, '1999-10-31', '1999-11-08', '13:00:00', 
   '17:00:00', 1130, 10013, 4, 1002)
INSERT INTO Engagements
  VALUES (82, '1999-11-07', '1999-11-08', '20:00:00', 
   '01:00:00', 950, 10014, 8, 1003)
INSERT INTO Engagements
  VALUES (83, '1999-11-05', '1999-11-09', '13:00:00', 
   '15:00:00', 650, 10010, 2, 1006)
INSERT INTO Engagements
  VALUES (84, '1999-11-05', '1999-11-10', '17:00:00', 
   '19:00:00', 230, 10007, 3, 1012)
INSERT INTO Engagements
  VALUES (85, '1999-11-05', '1999-11-07', '14:00:00', 
   '19:00:00', 1175, 10015, 4, 1008)
INSERT INTO Engagements
  VALUES (86, '1999-11-07', '1999-11-16', '17:00:00', 
   '22:00:00', 2300, 10008, 5, 1005)
INSERT INTO Engagements
  VALUES (87, '1999-11-04', '1999-11-04', '16:00:00', 
   '19:00:00', 275, 10007, 6, 1008)
INSERT INTO Engagements
  VALUES (88, '1999-11-06', '1999-11-16', '12:00:00', 
   '14:00:00', 1370, 10004, 8, 1013)
INSERT INTO Engagements
  VALUES (89, '1999-11-05', '1999-11-06', '14:00:00', 
   '16:00:00', 290, 10003, 8, 1010)
INSERT INTO Engagements
  VALUES (90, '1999-11-07', '1999-11-07', '20:00:00', 
   '02:00:00', 320, 10006, 5, 1001)
INSERT INTO Engagements
  VALUES (91, '1999-11-04', '1999-11-11', '13:00:00', 
   '19:00:00', 770, 10009, 3, 1004)
INSERT INTO Engagements
  VALUES (92, '1999-11-11', '1999-11-15', '19:00:00', 
   '00:00:00', 1925, 10012, 6, 1008)
INSERT INTO Engagements
  VALUES (93, '1999-11-14', '1999-11-18', '17:00:00', 
   '23:00:00', 500, 10011, 8, 1012)
INSERT INTO Engagements
  VALUES (94, '1999-11-14', '1999-11-22', '17:00:00', 
   '22:00:00', 725, 10001, 5, 1009)
INSERT INTO Engagements
  VALUES (95, '1999-11-14', '1999-11-17', '20:00:00', 
   '01:00:00', 1550, 10010, 6, 1007)
INSERT INTO Engagements
  VALUES (96, '1999-11-21', '1999-11-30', '15:00:00', 
   '17:00:00', 950, 10009, 6, 1005)
INSERT INTO Engagements
  VALUES (97, '1999-11-18', '1999-11-18', '17:00:00', 
   '21:00:00', 110, 10012, 8, 1004)
INSERT INTO Engagements
  VALUES (98, '1999-11-19', '1999-11-26', '20:00:00', 
   '02:00:00', 2930, 10012, 2, 1010)
INSERT INTO Engagements
  VALUES (99, '1999-11-21', '1999-11-30', '14:00:00', 
   '20:00:00', 4550, 10005, 6, 1008)
INSERT INTO Engagements
  VALUES (100, '1999-11-18', '1999-11-22', '12:00:00', 
   '18:00:00', 1850, 10015, 3, 1006)
INSERT INTO Engagements
  VALUES (101, '1999-11-21', '1999-11-29', '14:00:00', 
   '18:00:00', 1670, 10004, 5, 1001)
INSERT INTO Engagements
  VALUES (102, '1999-11-21', '1999-11-30', '12:00:00', 
   '15:00:00', 2300, 10013, 5, 1007)
INSERT INTO Engagements
  VALUES (103, '1999-11-20', '1999-11-26', '12:00:00', 
   '17:00:00', 575, 10010, 4, 1011)
INSERT INTO Engagements
  VALUES (104, '1999-11-27', '1999-12-01', '13:00:00', 
   '16:00:00', 1400, 10010, 6, 1003)
INSERT INTO Engagements
  VALUES (105, '1999-11-26', '1999-12-01', '12:00:00', 
   '17:00:00', 1850, 10002, 4, 1013)
INSERT INTO Engagements
  VALUES (106, '1999-11-28', '1999-12-01', '15:00:00', 
   '18:00:00', 770, 10003, 6, 1006)
INSERT INTO Engagements
  VALUES (107, '1999-11-28', '1999-11-29', '16:00:00', 
   '21:00:00', 200, 10007, 4, 1004)
INSERT INTO Engagements
  VALUES (108, '1999-12-02', '1999-12-04', '18:00:00', 
   '00:00:00', 320, 10004, 5, 1012)
INSERT INTO Engagements
  VALUES (109, '1999-12-11', '1999-12-15', '13:00:00', 
   '19:00:00', 1850, 10014, 5, 1010)
INSERT INTO Engagements
  VALUES (110, '1999-12-11', '1999-12-19', '15:00:00', 
   '19:00:00', 1670, 10006, 8, 1001)
INSERT INTO Engagements
  VALUES (111, '1999-12-12', '1999-12-14', '15:00:00', 
   '18:00:00', 185, 10012, 1, 1004)
INSERT INTO Engagements
  VALUES (112, '1999-12-19', '1999-12-24', '18:00:00', 
   '22:00:00', 410, 10015, 7, 1011)
INSERT INTO Engagements
  VALUES (113, '1999-12-19', '1999-12-27', '16:00:00', 
   '21:00:00', 3425, 10008, 7, 1007)
INSERT INTO Engagements
  VALUES (114, '1999-12-19', '1999-12-28', '12:00:00', 
   '17:00:00', 1550, 10005, 1, 1002)
INSERT INTO Engagements
  VALUES (115, '1999-12-19', '1999-12-22', '12:00:00', 
   '18:00:00', 1490, 10007, 5, 1013)
INSERT INTO Engagements
  VALUES (116, '1999-12-16', '1999-12-25', '14:00:00', 
   '19:00:00', 800, 10003, 6, 1012)
INSERT INTO Engagements
  VALUES (117, '1999-12-17', '1999-12-24', '18:00:00', 
   '23:00:00', 650, 10011, 3, 1009)
INSERT INTO Engagements
  VALUES (118, '1999-12-18', '1999-12-18', '19:00:00', 
   '00:00:00', 350, 10014, 1, 1010)
INSERT INTO Engagements
  VALUES (119, '1999-12-19', '1999-12-28', '18:00:00', 
   '21:00:00', 500, 10012, 2, 1004)
INSERT INTO Engagements
  VALUES (120, '1999-12-17', '1999-12-20', '20:00:00', 
   '23:00:00', 950, 10002, 7, 1008)
INSERT INTO Engagements
  VALUES (121, '1999-12-16', '1999-12-22', '17:00:00', 
   '23:00:00', 2570, 10004, 3, 1006)
INSERT INTO Engagements
  VALUES (122, '1999-12-24', '1999-12-27', '15:00:00', 
   '19:00:00', 1010, 10014, 5, 1010)
INSERT INTO Engagements
  VALUES (123, '1999-12-25', '1999-12-28', '16:00:00', 
   '20:00:00', 770, 10013, 1, 1001)
INSERT INTO Engagements
  VALUES (124, '1999-12-23', '1999-12-30', '14:00:00', 
   '17:00:00', 1850, 10006, 1, 1008)
INSERT INTO Engagements
  VALUES (125, '1999-12-23', '1999-12-28', '13:00:00', 
   '15:00:00', 1130, 10001, 3, 1003)
INSERT INTO Engagements
  VALUES (126, '1999-12-24', '1999-12-31', '18:00:00', 
   '20:00:00', 1010, 10009, 6, 1006)
INSERT INTO Engagements
  VALUES (127, '1999-12-24', '1999-12-28', '20:00:00', 
   '22:00:00', 500, 10010, 4, 1005)
INSERT INTO Engagements
  VALUES (128, '1999-12-26', '1999-12-28', '19:00:00', 
   '01:00:00', 320, 10003, 4, 1011)
INSERT INTO Engagements
  VALUES (129, '1999-12-24', '2000-01-02', '17:00:00', 
   '21:00:00', 2450, 10004, 5, 1013)
INSERT INTO Engagements
  VALUES (130, '1999-12-24', '2000-01-01', '14:00:00', 
   '18:00:00', 590, 10015, 8, 1009)
INSERT INTO Engagements
  VALUES (131, '1999-12-31', '2000-01-09', '15:00:00', 
   '17:00:00', 1850, 10014, 1, 1003)
INSERT INTO Members
  VALUES (101, 'Andrew', 'Fuller', '555-2701', 'M')
INSERT INTO Members
  VALUES (102, 'Suzanne', 'Viescas', '555-2686', 'F')
INSERT INTO Members
  VALUES (103, 'Gary', 'Hallmark', '555-2676', 'M')
INSERT INTO Members
  VALUES (104, 'Jeffrey', 'Smith', '555-2596', 'M')
INSERT INTO Members
  VALUES (105, 'Michael', 'Davolio', '555-2491', 'M')
INSERT INTO Members
  VALUES (106, 'Laura', 'Callahan', '555-2526', 'F')
INSERT INTO Members
  VALUES (107, 'Sara', 'Kennedy', '555-2566', 'F')
INSERT INTO Members
  VALUES (108, 'Rachel', 'Patterson', '555-2546', 'F')
INSERT INTO Members
  VALUES (109, 'David', 'Viescas', '555-2661', 'M')
INSERT INTO Members
  VALUES (110, 'Andrea', 'Buchanan', '555-2641', 'F')
INSERT INTO Members
  VALUES (111, 'Kathryn', 'Patterson', '555-2651', 
   'F')
INSERT INTO Members
  VALUES (112, 'Kendra', 'Bonnicksen', '555-2716', 
   'F')
INSERT INTO Members
  VALUES (113, 'Steven', 'Pundt', '555-9938', 'M')
INSERT INTO Members
  VALUES (114, 'George', 'Chavez', '555-9930', 'M')
INSERT INTO Members
  VALUES (115, 'Joe', 'Rosales III', '555-2281', 'M')
INSERT INTO Members
  VALUES (116, 'Ryan', 'Ehrlich', '555-2311', 'M')
INSERT INTO Members
  VALUES (117, 'Allan', 'Davis', '555-2316', 'M')
INSERT INTO Members
  VALUES (118, 'Carol', 'Peacock', '555-2691', 'F')
INSERT INTO Members
  VALUES (119, 'John', 'Viescas', '555-2511', 'M')
INSERT INTO Members
  VALUES (120, 'Michael', 'Hernandez', '555-2711', 
   'M')
INSERT INTO Members
  VALUES (121, 'Katherine', 'Ehrlich', '555-0399', 
   'F')
INSERT INTO Members
  VALUES (122, 'Julia', 'Schnebly', '555-9936', 'F')
INSERT INTO Members
  VALUES (123, 'Susan', 'McLain', '555-2301', 'F')
INSERT INTO Members
  VALUES (124, 'Caroline', 'Coie', '555-2306', 'F')
INSERT INTO Members
  VALUES (125, 'Albert', 'Buchanan', '555-2531', NULL)
INSERT INTO Entertainer_Members
  VALUES (1001, 106, 1)
INSERT INTO Entertainer_Members
  VALUES (1001, 107, 1)
INSERT INTO Entertainer_Members
  VALUES (1001, 118, 2)
INSERT INTO Entertainer_Members
  VALUES (1002, 120, 2)
INSERT INTO Entertainer_Members
  VALUES (1002, 121, 1)
INSERT INTO Entertainer_Members
  VALUES (1003, 102, 1)
INSERT INTO Entertainer_Members
  VALUES (1003, 103, 1)
INSERT INTO Entertainer_Members
  VALUES (1003, 104, 1)
INSERT INTO Entertainer_Members
  VALUES (1003, 109, 1)
INSERT INTO Entertainer_Members
  VALUES (1003, 117, 1)
INSERT INTO Entertainer_Members
  VALUES (1003, 119, 2)
INSERT INTO Entertainer_Members
  VALUES (1004, 125, 2)
INSERT INTO Entertainer_Members
  VALUES (1005, 116, 1)
INSERT INTO Entertainer_Members
  VALUES (1005, 120, 2)
INSERT INTO Entertainer_Members
  VALUES (1005, 121, 1)
INSERT INTO Entertainer_Members
  VALUES (1006, 104, 1)
INSERT INTO Entertainer_Members
  VALUES (1006, 113, 1)
INSERT INTO Entertainer_Members
  VALUES (1006, 118, 1)
INSERT INTO Entertainer_Members
  VALUES (1006, 120, 2)
INSERT INTO Entertainer_Members
  VALUES (1007, 101, 1)
INSERT INTO Entertainer_Members
  VALUES (1007, 102, 1)
INSERT INTO Entertainer_Members
  VALUES (1007, 105, 1)
INSERT INTO Entertainer_Members
  VALUES (1007, 107, 2)
INSERT INTO Entertainer_Members
  VALUES (1007, 110, 1)
INSERT INTO Entertainer_Members
  VALUES (1008, 103, 1)
INSERT INTO Entertainer_Members
  VALUES (1008, 105, 1)
INSERT INTO Entertainer_Members
  VALUES (1008, 111, 1)
INSERT INTO Entertainer_Members
  VALUES (1008, 114, 2)
INSERT INTO Entertainer_Members
  VALUES (1008, 115, 1)
INSERT INTO Entertainer_Members
  VALUES (1009, 121, 2)
INSERT INTO Entertainer_Members
  VALUES (1010, 108, 1)
INSERT INTO Entertainer_Members
  VALUES (1010, 112, 2)
INSERT INTO Entertainer_Members
  VALUES (1010, 123, 1)
INSERT INTO Entertainer_Members
  VALUES (1010, 124, 1)
INSERT INTO Entertainer_Members
  VALUES (1011, 122, 2)
INSERT INTO Entertainer_Members
  VALUES (1012, 123, 2)
INSERT INTO Entertainer_Members
  VALUES (1013, 112, 1)
INSERT INTO Entertainer_Members
  VALUES (1013, 114, 1)
INSERT INTO Entertainer_Members
  VALUES (1013, 117, 1)
INSERT INTO Entertainer_Members
  VALUES (1013, 124, 2)
INSERT INTO Musical_Styles
  VALUES (1, '40''s Ballroom Music')
INSERT INTO Musical_Styles
  VALUES (2, '50''s Music')
INSERT INTO Musical_Styles
  VALUES (3, '60''s Music')
INSERT INTO Musical_Styles
  VALUES (4, '70''s Music')
INSERT INTO Musical_Styles
  VALUES (5, '80''s Music')
INSERT INTO Musical_Styles
  VALUES (6, 'Country')
INSERT INTO Musical_Styles
  VALUES (7, 'Classical')
INSERT INTO Musical_Styles
  VALUES (8, 'Classic Rock & Roll')
INSERT INTO Musical_Styles
  VALUES (9, 'Rap')
INSERT INTO Musical_Styles
  VALUES (10, 'Contemporary')
INSERT INTO Musical_Styles
  VALUES (11, 'Country Rock')
INSERT INTO Musical_Styles
  VALUES (12, 'Elvis')
INSERT INTO Musical_Styles
  VALUES (13, 'Folk')
INSERT INTO Musical_Styles
  VALUES (14, 'Chamber Music')
INSERT INTO Musical_Styles
  VALUES (15, 'Jazz')
INSERT INTO Musical_Styles
  VALUES (16, 'Karaoke')
INSERT INTO Musical_Styles
  VALUES (17, 'Motown')
INSERT INTO Musical_Styles
  VALUES (18, 'Modern Rock')
INSERT INTO Musical_Styles
  VALUES (19, 'Rhythm and Blues')
INSERT INTO Musical_Styles
  VALUES (20, 'Show Tunes')
INSERT INTO Musical_Styles
  VALUES (21, 'Standards')
INSERT INTO Musical_Styles
  VALUES (22, 'Top 40 Hits')
INSERT INTO Musical_Styles
  VALUES (23, 'Variety')
INSERT INTO Musical_Styles
  VALUES (24, 'Salsa')
INSERT INTO Musical_Styles
  VALUES (25, '90''s Music')
INSERT INTO Entertainer_Styles
  VALUES (1001, 10)
INSERT INTO Entertainer_Styles
  VALUES (1001, 20)
INSERT INTO Entertainer_Styles
  VALUES (1001, 21)
INSERT INTO Entertainer_Styles
  VALUES (1002, 17)
INSERT INTO Entertainer_Styles
  VALUES (1002, 19)
INSERT INTO Entertainer_Styles
  VALUES (1002, 23)
INSERT INTO Entertainer_Styles
  VALUES (1003, 3)
INSERT INTO Entertainer_Styles
  VALUES (1003, 8)
INSERT INTO Entertainer_Styles
  VALUES (1004, 13)
INSERT INTO Entertainer_Styles
  VALUES (1005, 15)
INSERT INTO Entertainer_Styles
  VALUES (1005, 19)
INSERT INTO Entertainer_Styles
  VALUES (1005, 24)
INSERT INTO Entertainer_Styles
  VALUES (1006, 22)
INSERT INTO Entertainer_Styles
  VALUES (1006, 23)
INSERT INTO Entertainer_Styles
  VALUES (1006, 24)
INSERT INTO Entertainer_Styles
  VALUES (1007, 6)
INSERT INTO Entertainer_Styles
  VALUES (1007, 11)
INSERT INTO Entertainer_Styles
  VALUES (1008, 3)
INSERT INTO Entertainer_Styles
  VALUES (1008, 6)
INSERT INTO Entertainer_Styles
  VALUES (1009, 7)
INSERT INTO Entertainer_Styles
  VALUES (1009, 14)
INSERT INTO Entertainer_Styles
  VALUES (1009, 21)
INSERT INTO Entertainer_Styles
  VALUES (1010, 4)
INSERT INTO Entertainer_Styles
  VALUES (1010, 21)
INSERT INTO Entertainer_Styles
  VALUES (1010, 22)
INSERT INTO Entertainer_Styles
  VALUES (1011, 7)
INSERT INTO Entertainer_Styles
  VALUES (1011, 14)
INSERT INTO Entertainer_Styles
  VALUES (1011, 20)
INSERT INTO Entertainer_Styles
  VALUES (1012, 7)
INSERT INTO Entertainer_Styles
  VALUES (1012, 13)
INSERT INTO Entertainer_Styles
  VALUES (1013, 10)
INSERT INTO Entertainer_Styles
  VALUES (1013, 15)
INSERT INTO Musical_Preferences
  VALUES (10001, 10)
INSERT INTO Musical_Preferences
  VALUES (10001, 22)
INSERT INTO Musical_Preferences
  VALUES (10002, 3)
INSERT INTO Musical_Preferences
  VALUES (10002, 8)
INSERT INTO Musical_Preferences
  VALUES (10003, 17)
INSERT INTO Musical_Preferences
  VALUES (10003, 19)
INSERT INTO Musical_Preferences
  VALUES (10004, 15)
INSERT INTO Musical_Preferences
  VALUES (10004, 21)
INSERT INTO Musical_Preferences
  VALUES (10005, 7)
INSERT INTO Musical_Preferences
  VALUES (10005, 14)
INSERT INTO Musical_Preferences
  VALUES (10006, 13)
INSERT INTO Musical_Preferences
  VALUES (10006, 23)
INSERT INTO Musical_Preferences
  VALUES (10007, 4)
INSERT INTO Musical_Preferences
  VALUES (10007, 8)
INSERT INTO Musical_Preferences
  VALUES (10007, 19)
INSERT INTO Musical_Preferences
  VALUES (10008, 10)
INSERT INTO Musical_Preferences
  VALUES (10008, 21)
INSERT INTO Musical_Preferences
  VALUES (10009, 6)
INSERT INTO Musical_Preferences
  VALUES (10009, 11)
INSERT INTO Musical_Preferences
  VALUES (10009, 18)
INSERT INTO Musical_Preferences
  VALUES (10010, 15)
INSERT INTO Musical_Preferences
  VALUES (10010, 19)
INSERT INTO Musical_Preferences
  VALUES (10010, 24)
INSERT INTO Musical_Preferences
  VALUES (10011, 1)
INSERT INTO Musical_Preferences
  VALUES (10011, 7)
INSERT INTO Musical_Preferences
  VALUES (10011, 21)
INSERT INTO Musical_Preferences
  VALUES (10012, 10)
INSERT INTO Musical_Preferences
  VALUES (10012, 20)
INSERT INTO Musical_Preferences
  VALUES (10013, 15)
INSERT INTO Musical_Preferences
  VALUES (10013, 24)
INSERT INTO Musical_Preferences
  VALUES (10014, 5)
INSERT INTO Musical_Preferences
  VALUES (10014, 18)
INSERT INTO Musical_Preferences
  VALUES (10014, 22)
INSERT INTO Musical_Preferences
  VALUES (10015, 1)
INSERT INTO Musical_Preferences
  VALUES (10015, 20)
INSERT INTO Musical_Preferences
  VALUES (10015, 21)
