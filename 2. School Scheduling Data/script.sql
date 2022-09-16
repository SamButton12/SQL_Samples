USE master
CREATE DATABASE SchoolScheduling
GO

USE SchoolScheduling
create table Departments (DepartmentID [int] NOT NULL,
	DepartmentName [nvarchar](255) NULL
	 CONSTRAINT DepartmentID PRIMARY KEY CLUSTERED (DepartmentID)
  )
create table Categories (CategoryID [nchar](3) NOT NULL,
	CategoryDescription [nvarchar](255) NOT NULL,
	DepartmentID [int] NULL
	 CONSTRAINT CategoryID PRIMARY KEY CLUSTERED (CategoryID)
	 CONSTRAINT DepartmentIDf FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID)
  )
create table Subjects (SubjectID [int] NOT NULL,
	CategoryID [nchar](3) NOT NULL,
	SubjectCode [nvarchar](10) NOT NULL,
	SubjectName [nvarchar](255) NOT NULL,
	SubjectDescription [nvarchar](MAX) NOT NULL
	 CONSTRAINT SubjectID PRIMARY KEY CLUSTERED (SubjectID)
	 CONSTRAINT CategoryIDf FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
  )

create table Faculty 
			(StaffID [int] NOT NULL,
			Title [nvarchar](255) NOT NULL,
			Status [nvarchar](255) NOT NULL,
			Tenured  [bit] NOT NULL,
			CONSTRAINT StaffID PRIMARY KEY CLUSTERED (StaffID))


create table Buildings 
			(BuildingCode [nchar](3) NOT NULL,
			BuildingName  [nvarchar](255) NOT NULL,
			NumberofFloors [smallint] NOT NULL,
			ElevatorAccess [bit] NOT NULL,
			SiteParkingAvailable [bit] NOT NULL,
			CONSTRAINT BuildingCode PRIMARY KEY CLUSTERED (BuildingCode))


create table Class_rooms 
			(ClassroomID [int] NOT NULL,
			BuildingCode [nchar](3) NOT NULL,
			PhoneAvailable [bit] NOT NULL,
			CONSTRAINT ClassroomID PRIMARY KEY CLUSTERED (ClassroomID),
			CONSTRAINT BuildingCodef FOREIGN KEY (BuildingCode) REFERENCES Buildings (BuildingCode)
			)

create table Student_Class_Status
			(ClassStatus [int] NOT NULL,
			ClassStatusDescription [nvarchar](255) NOT NULL,
			CONSTRAINT ClassStatus PRIMARY KEY CLUSTERED (ClassStatus)	)
			
			create table Classes (ClassID [int] NOT NULL,
	SubjectID [int] NOT NULL,
	ClassroomID [int] NOT NULL,
	credits [smallint] NULL,
	StartTime [time] NULL,
	Duration [smallint] NULL,
	Monday_Schedule [bit] NULL,	
	Tuesday_Schedule [bit] NULL,
		Wednesday_Schedule [bit] NULL,
			Thursday_Schedule [bit] NULL,
				Friday_Schedule [bit] NULL,
					Saturday_Schedule [bit] NULL,
 CONSTRAINT ClassID PRIMARY KEY CLUSTERED (ClassID),
 CONSTRAINT SubjectIDf FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID),
CONSTRAINT ClassroomIDf FOREIGN KEY (ClassroomID) REFERENCES Class_rooms (ClassroomID)
 
  )
  
  create table Students 
			(StudentID [int] NOT NULL,
			StudFirstName [nvarchar](255) NOT NULL,
			StudLastName [nvarchar](255) NOT NULL,
			StudStreetAddress [nvarchar](255) NULL,
	StudCity [nvarchar](100) NULL,
	StudState [nchar](2) NULL,
	StudZipCode [nchar](5) NULL,	
	StudAreaCode [nchar](3) NULL,
	StudPhoneNumber [nchar](8) NULL,
			CONSTRAINT StudentID PRIMARY KEY CLUSTERED (StudentID)	)
			
create table Student_Schedules
			(StudentID [int] NOT NULL,
			ClassID [int] NOT NULL,
			ClassStatus [int] NOT NULL,
			Grade [decimal] (5,2) NOT NULL,
			CONSTRAINT Student_SchedulesPK PRIMARY KEY CLUSTERED (ClassID,StudentID),
			CONSTRAINT ClassStatusf FOREIGN KEY (ClassStatus) REFERENCES Student_Class_Status (ClassStatus),
			CONSTRAINT StudentIDf FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
			CONSTRAINT ClassIDfk FOREIGN KEY (ClassID) REFERENCES Classes (ClassID))
			
	 create table Faculty_Classes (ClassID [int] NOT NULL,
	StaffID [int] NOT NULL,
	 CONSTRAINT ClassID2 PRIMARY KEY CLUSTERED (ClassID,StaffID),
  CONSTRAINT StaffIDf FOREIGN KEY (StaffID) REFERENCES Faculty (StaffID),
 CONSTRAINT ClassIDf2 FOREIGN KEY (ClassID) REFERENCES Classes (ClassID)
)
go
create table Faculty_Subjects (StaffID [int] NOT NULL,
	SubjectID [int] NOT NULL,
	ProficiencyRating smallint NOT NULL,
	 CONSTRAINT StaffID2 PRIMARY KEY CLUSTERED (StaffID,SubjectID),
  CONSTRAINT StaffIDf2 FOREIGN KEY (StaffID) REFERENCES Faculty (StaffID),
  CONSTRAINT SubjectIDf2 FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID)
)
create table Staff (StaffID [int] NOT NULL,
	StfFirstName [nvarchar](255) NOT NULL,
	StfLastName [nvarchar](255) NOT NULL,
	StfStreetAddress [nvarchar](255) NULL,
	StfCity [nvarchar](100) NULL,
	StfState [nchar](2) NULL,
	StfZipCode [nchar](5) NULL,	
	StfAreaCode [nchar](3) NULL,
	StfPhoneNumber [nchar](8) NULL,
		Salary [money] NULL,
		--***
	DataHired [date] NULL,
	Position [nvarchar](255) NULL,
 CONSTRAINT StaffID3 PRIMARY KEY CLUSTERED (StaffID),
  )
  create table Faculty_Categories (StaffID [int] NOT NULL,
  CategoryID [nchar](3) NOT NULL,
	
	 CONSTRAINT StaffID4 PRIMARY KEY CLUSTERED (StaffID,CategoryID),
  CONSTRAINT StaffIDForeignFaculty FOREIGN KEY (StaffID) REFERENCES Faculty (StaffID),
  CONSTRAINT StaffIDForeignStaff FOREIGN KEY (StaffID) REFERENCES Staff (StaffID),
 CONSTRAINT CategoryIDForeignCategories FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
)
GO

INSERT INTO Departments
  VALUES (1,'')
  INSERT INTO Departments
  VALUES (2,'')
  INSERT INTO Departments
  VALUES (3,'')
  INSERT INTO Departments
  VALUES (4,'')
  INSERT INTO Departments
  VALUES (5,'')
INSERT INTO Categories
  VALUES ('ACC', 'Accounting', 1)
INSERT INTO Categories
  VALUES ('ART', 'Art', 3)
INSERT INTO Categories
  VALUES ('BIO', 'Biology', 2)
INSERT INTO Categories
  VALUES ('BUS', 'Business', 1)
INSERT INTO Categories
  VALUES ('CHE', 'Chemistry', 2)
INSERT INTO Categories
  VALUES ('CIS', 'Computer Information Systems', 5)
INSERT INTO Categories
  VALUES ('CSC', 'Computer Science', 5)
INSERT INTO Categories
  VALUES ('ECO', 'Economics', 4)
INSERT INTO Categories
  VALUES ('ENG', 'English', 3)
INSERT INTO Categories
  VALUES ('GEG', 'Geography', 4)
INSERT INTO Categories
  VALUES ('HIS', 'History', 4)
INSERT INTO Categories
  VALUES ('JRN', 'Journalism', 1)
INSERT INTO Categories
  VALUES ('MAT', 'Math', 2)
INSERT INTO Categories
  VALUES ('MUS', 'Music', 3)
INSERT INTO Categories
  VALUES ('PHY', 'Physics', 2)
INSERT INTO Categories
  VALUES ('POL', 'Political Science', 4)
  INSERT INTO Subjects
  VALUES (1, 'ACC', 'ACC 210', 'Financial Accounting Fundamentals I', 
   'Introduces basic accounting concepts, principles and prodcedures for recording business transactions and developing financial accounting reports. Excel spreadsheet component.')
INSERT INTO Subjects
  VALUES (2, 'ACC', 'ACC 220', 'Financial Accounting Fundamentals II', 
   'Applications of basic accounting concepts, principles and procedures to more complex business situations and to different forms of enterprise ownership. Includes computerized element. Prereq: ACC 210 or instructor permission.')
INSERT INTO Subjects
  VALUES (3, 'ACC', 'ACC 230', 'Fundamentals of Managerial Accounting', 
   'Analysis of accounting data as part of the managerial process of planning, decision making and control. Concentrates on economic decision making in enterprises. Includes computerized element. Prereq: ACC 220 or instructor permission.')
INSERT INTO Subjects
  VALUES (4, 'ACC', 'ACC 251', 'Intermediate Accounting', 
   'In-depth review of financial accounting principles. Emphasizes the conceptual framework of accounting, revenue and expense recognition. Accounts Receivable, Depreciation, and Amortization, etc. Prereq: ACC 220 or instructor permission.')
INSERT INTO Subjects
  VALUES (5, 'ACC', 'ACC 257', 'Business Tax Accounting', 
   'Basic principles, practices and governmental regulations (Federal, Washington, State, and local) involved in business tax accounting including filing returns, record keeping, tax planning, and registrations and business licenses. Prereq: ACC 220 or instructors permissions.')
INSERT INTO Subjects
  VALUES (6, 'BUS', 'BUS 101', 'Introduction to Business', 
   'Survey of businss practices. Covers business terminology, forms of business ownership, franchising, small and international businesses, leadership and management, marketing principles, financing and investment methods, and business environment.')
INSERT INTO Subjects
  VALUES (7, 'BUS', 'BUS 155', 'Developing A Feasibility Plan', 
   'With the aid of a counselor, a feasibility plan will be developed which will be the basis or start of your business plan. Must be concurrently enrolled in BUS 151.')
INSERT INTO Subjects
  VALUES (8, 'BUS', 'BUS 151', 'Introduction to Enterpreneurship', 
   'Overview of the entrepreneurial process, examination of the marketplace, and discussion of successful business strategies. Product selection, selling and marketing strategies. Sources of information and assistance. Must be concurrently enrolled in BUS 155.')
INSERT INTO Subjects
  VALUES (9, 'BUS', 'BUS 170', 'Information Technology I', 
   'Uses Word for Windows word processing skills, document formatting, keyboarding, and 10-key keypad skills. Emphasis on preparing letters, memos, reports, and tables. Introduces Excel spreadsheet basics.')
INSERT INTO Subjects
  VALUES (10, 'BUS', 'BUS 171', 'Information Technology II', 
   'Uses intermediate Word features including formatting and production, mail merge, macros, text columns, graphics, and fonts; Excel spreadsheet; and introduction to PowerPoint presentation software, Internet and email. Prereq: BUS 170 or permission from instructor.')
INSERT INTO Subjects
  VALUES (11, 'ART', 'ART 100', 'Introduction to Art', 
   'Historical backgrounds and design fundamentals which have affected art. Includes slide lectures, reading and practical studio applications.')
INSERT INTO Subjects
  VALUES (12, 'ART', 'ART 101', 'Design', 'Studio sudies in the fundamentals of two-dimensional art with problems based on line, space, texture, shape and color theories. Includes practical applications of these theories to design.')
INSERT INTO Subjects
  VALUES (13, 'ART', 'ART 111', 'Drawing', 'Study of line, value, space, perspective, and compostion through the use o charcoal, pencil, pen, and brush.')
INSERT INTO Subjects
  VALUES (14, 'ART', 'ART 201', 'Painting', 'Beginning painting in oil or synthetic media using still life. Emphasis on basics such as composition, value studies, color mixing, canvas preparation, and various styles and techniques. No prerequisite; some drawing background important.')
INSERT INTO Subjects
  VALUES (15, 'ART', 'ART 210', 'Computer Art', 'Explore the elements of art such as line, value, space, composition, and color through the use of the computer. Sudents will create works of art using the computer.')
INSERT INTO Subjects
  VALUES (16, 'ART', 'ART 251', 'Art History', 'Surveys major forms of visual expression from the Paleolithic, Egyptian, Mesopotamian, Greek, Roman, and Early Christian periods. Includes painting, sculpture, architecture, lectures, slides, and readings.')
INSERT INTO Subjects
  VALUES (17, 'BIO', 'BIO 100', 'Biological Principles', 
   'An introductory biology course with lab for the non-science major. May include maintenance of the balance between man and his environment, nutrition, genetics and inheritence, ecological principles, plant and animal diversity, and evolution.')
INSERT INTO Subjects
  VALUES (18, 'BIO', 'BIO 101', 'General Biology', 
   'Basic bilogical concepts with emphasis on general cell processes, plant and animal diversity, morphyology, limited reproduction, phylogeny of the living organisms, exploration of molecular genetics.')
INSERT INTO Subjects
  VALUES (19, 'BIO', 'BIO 280', 'Microbiology', 'Introduction to micro-organisms including microbial cell structure and function; metabolism; microbial genetics; and the role of micro-organisms in disease, immunity, and other selected applied areas.')
INSERT INTO Subjects
  VALUES (20, 'CHE', 'CHE 101', 'Chemistry', 'General chemistry for non-science majors. Completion of CHE 101 fulfills chemistry requirements for many health science majors.')
INSERT INTO Subjects
  VALUES (21, 'CHE', 'CHE 139', 'Fundamentals of Chemistry', 
   'Prepatory for the science major chemistry courses for students without prior chemistry experience. This lecture format will include chemical mathematics, basic atomic structure, chemical bonding, chemical equation balancing and mole concept, and chemical stoichiometry.')
INSERT INTO Subjects
  VALUES (22, 'CHE', 'CHE 231', 'Organic Chemistry', 
   'Structure, nomenclature, reactions, and synthesis of the main types of organic compounds.')
INSERT INTO Subjects
  VALUES (23, 'CIS', 'CIS 101', 'Microcomputer Applications', 
   'This is a "hands-on" course. Students will learn how to use word processing, spreadsheet, and database applications. General operation systems activities such as deleting files, renaming files, and creating and navigating directory structures will also be covered.')
INSERT INTO Subjects
  VALUES (24, 'CIS', 'CIS 102', 'Information Systems Concepts', 
   'Provides a broad introduction to computers and information systems. Includes coverage of hardware, software, data organization, data communications, and systems development. Also covers the evolving role of computers in society.')
INSERT INTO Subjects
  VALUES (25, 'CIS', 'CIS 114', 'Problem Solving and Structured Programming', 
   'Covers design, documentation, and coding of programs using top-down design and structured programming principles. Includes introduction to multi-user systems, text editors, data access and storage techniques.')
INSERT INTO Subjects
  VALUES (26, 'CIS', 'CIS 236', 'Database Management', 
   'Includes database concepts, data management techniques, database environment, record relationships, and advantages and limitations of the database approach. Includes data modeling and database design.')
INSERT INTO Subjects
  VALUES (27, 'CSC', 'CSC 110', 'Programming in BASIC', 
   'Computer programming and program design using the Visual Basic programming language. Emphasis is on Program Design and Algorithm Development while writing programs primarily about mathematical and scientific applications.')
INSERT INTO Subjects
  VALUES (28, 'CSC', 'CIS 142', 'Computer Programming', 
   'Introduction to computer science using the C programming language. Emphasizes design, algorithmics, abstraction, and analysis.')
INSERT INTO Subjects
  VALUES (29, 'JRN', 'JRN 104', 'College Publications', 
   'Hands-on course in college publishing. Covers basics of reporting and writing through work on college newspaper and other assignments.')
INSERT INTO Subjects
  VALUES (30, 'ECO', 'ECO 100', 'Survey of Economics', 
   'Economics applied to various comtemporary social problems and issues. Provides an introduction to economic principles concerning national prosperity, market behavior, income inequality, the role of government, and economic fluctuations.')
INSERT INTO Subjects
  VALUES (31, 'ECO', 'ECO 200', 'Principles of Economics: Microeconomics', 
   'Covers resource allocation and income distribution with emphasis on price determination, production costs, and market structures. Intermediate algebra or equivalent required.')
INSERT INTO Subjects
  VALUES (32, 'ECO', 'ECO 201', 'Principles of Economics: Macroeconomics', 
   'Analysis of the aggregate economy: GDP, inflation, business cycles, trade and finance. Intermediate algebra or equivalent required.')
INSERT INTO Subjects
  VALUES (33, 'MUS', 'MUS 100', 'Music in the Western World', 
   'An introduction to music. Features music from a global perspective with a focus on Western Music. Many musical examples, listening, videos on great musicians of the past.')
INSERT INTO Subjects
  VALUES (34, 'MUS', 'MUS 101', 'First Year Theory and Ear Training', 
   'Rudiments of music - notation, scales, intervals, and triads, rhythmic and melodic sight-reading and dictation. Studies of historical periods.')
INSERT INTO Subjects
  VALUES (35, 'MUS', 'MUS 201', 'Second Year Music Theory', 
   'Continuation of MUS 101. Chromatic harmony, modulations and related modern concepts.')
INSERT INTO Subjects
  VALUES (36, 'MUS', 'MUS 204', 'History of Jazz', 
   'Traces the roots of jazz in America from New Orleans, New York, Chicago, Kansas City, the Big Band Era, Be-Bop to modern jazz through films, lectures, recordings and live performances.')
INSERT INTO Subjects
  VALUES (37, 'ENG', 'ENG 101', 'Composition - Fundamentals', 
   'Introduces the nature of the writing process in its various stages: gathering, shaping, establishing audience, editing, revising, polishing, and proffreading. Writing assignments concentrate on the major strategies of nonfiction prose - narration, description, and exposition.')
INSERT INTO Subjects
  VALUES (38, 'ENG', 'ENG 102', 'Composition - Intermediate', 
   'Continues instruction on the writing process, extending it to include source-based writing of the kind typically done in academic settings. Topics for reading and writing will vary instructor to instructor.')
INSERT INTO Subjects
  VALUES (39, 'ENG', 'ENG 104', 'Advanced English Grammar', 
   'Study of the grammar and rhetoric of the English sentence. Not a remedial course.')
INSERT INTO Subjects
  VALUES (40, 'GEG', 'GEG 100', 'Introduction to Geography', 
   'An introduction to the major cultures of the world (Hebrew, Christian, Islamic, Hindu, Buddhist), their origins, values, heroes, rituals, scriptures and cross-cultural influences.')
INSERT INTO Subjects
  VALUES (41, 'GEG', 'GEG 205', 'Physical Geography', 
   'Study of the Earth, the materials that make it up, and plate tectonics. Special attention to the Pacific Northwest. Includes laboratory and field trip work.')
INSERT INTO Subjects
  VALUES (42, 'HIS', 'HIS 101', 'World History to 1500', 
   'Historic foundations and development of the great civilizations from prehistoric days to the Renaissance with emphasis on social, political, economic and geographic aspects. Attention to the nature of history as an intellectual and academic discipline.')
INSERT INTO Subjects
  VALUES (43, 'HIS', 'HIS 111', 'U.S. History to 1877', 
   'American history from the colonial period through Reconstruction. Emphasis on the American Revolution, the National Period, slavery, territorial expansion, the Civil War and Reconstruction.')
INSERT INTO Subjects
  VALUES (44, 'HIS', 'HIS 112', 'U.S. History Since 1865', 
   'Includes Reconstruction, industrialization, urbanization, westward movement, political reform movements, agrarian protest, progressive period, 1920''s Great Depressioin and the New Deal, WWII, the conservative 50''s, liberalism of the 60''s and 70''s, and into the next century.')
INSERT INTO Subjects
  VALUES (45, 'MAT', 'MAT 080', 'Preparatory Mathematics', 
   'Individualized instruction in Arithmetic, Algebra I and II, Geometry, nad Intermediate Algebra.')
INSERT INTO Subjects
  VALUES (46, 'MAT', 'MAT 097', 'Elementary Algebra', 
   'First course in Algebra includes signed numbers, linear equations, linear inequalities, products and factorization of polynomials, and operations with quotients of polynomials.')
INSERT INTO Subjects
  VALUES (47, 'MAT', 'MAT 098', 'Intermediate Algebra', 
   'Sets and the real number system, polynomial and rational expressions, exponents and radicals, first and second degree equations, linear systems of equations, and graphs.')
INSERT INTO Subjects
  VALUES (48, 'MAT', 'MAT 103', 'Geometry and Visualization', 
   'Basic plane geometry concepts, emphasizing problem-solving. Right triangle trigonometry. Introduction to 3-D geometry/spatial thinking. Directed towards students with no high school geometry but who plan a career in science/engineering.')
INSERT INTO Subjects
  VALUES (49, 'MAT', 'MAT 104', 'Trigonometry', 'Elementary plane goemetry, right triangle tirgonometry, general angels, identities, equations, word problems, and selected topics.')
INSERT INTO Subjects
  VALUES (50, 'PHY', 'PHY 100', 'Survey Of Physics', 
   'Basic laws of phyics from the laws of motion through nuclear physics. Also examines the origins and impact on society of the basic physics concepts.')
INSERT INTO Subjects
  VALUES (51, 'PHY', 'PHY 101', 'General Physics', 
   'Classical mechanics; kinematics and dynamics. Includes development of concepts of force, work/energy, impulse/momentum, and the conservation laws.')
INSERT INTO Subjects
  VALUES (52, 'PHY', 'PHY 201', 'Engineering Physics I', 
   'Development of the basic principles of classical mechanics. A calculus approach is used to introduce kinematics, Newton''s laws, the work-energy theorem, and conservation laws.')
INSERT INTO Subjects
  VALUES (53, 'PHY', 'PHY 203', 'Engineering Physics II', 
   'Waves and oscillations. Mechanical waves and sound are studied as well as geometric and physical optics. The wave aspect of an electron is introduced as it applies to the stationary states of the hydrogen atom.')
INSERT INTO Subjects
  VALUES (54, 'POL', 'POL 101', 'Introduction to Political Science', 
   'Introduction to theory, organization, politics and administration of government. Includes political theory, comparative systems, political socialization, public administration, political parties and elections, and international relations.')
INSERT INTO Subjects
  VALUES (55, 'POL', 'POL 102', 'American Government', 
   'Origin and development of the U.S. government. Covers the stucture and function of Congress, the Presidency and courts as well as civil liberties, political behavior and political parties.')
INSERT INTO Subjects
  VALUES (56, 'POL', 'POL 213', 'Women and Politics', 
   'Introduction to concepts of power and policy issues as they relate to women. Theoretical, historical and empirical studies of women''s participation in social and political movements nationally and internationally. Study of women''s diverse roles in relations to family, economics, labor, government, and law.')
INSERT INTO Buildings
  VALUES ('AS', 'Arts and Sciences', 3, 1, 1)
INSERT INTO Buildings
  VALUES ('CC', 'College Center', 3, 1, 0)
INSERT INTO Buildings
  VALUES ('GYM', 'PE and Wellness', 1, 0, 1)
INSERT INTO Buildings
  VALUES ('IB', 'Instructional Building', 3, 1, 1)
INSERT INTO Buildings
  VALUES ('LB', 'Library', 2, 1, 1)
INSERT INTO Buildings
  VALUES ('TB', 'Technology Building', 2, 1, 1)  
 INSERT INTO Class_Rooms
  VALUES (1131, 'LB', 1)
INSERT INTO Class_Rooms
  VALUES (1142, 'LB', 0)
INSERT INTO Class_Rooms
  VALUES (1231, 'LB', 1)
INSERT INTO Class_Rooms
  VALUES (1514, 'AS', 1)
INSERT INTO Class_Rooms
  VALUES (1515, 'AS', 1)
INSERT INTO Class_Rooms
  VALUES (1519, 'AS', 0)
INSERT INTO Class_Rooms
  VALUES (1525, 'AS', 1)
INSERT INTO Class_Rooms
  VALUES (1530, 'AS', 1)
INSERT INTO Class_Rooms
  VALUES (1532, 'AS', 0)
INSERT INTO Class_Rooms
  VALUES (1619, 'AS', 0)
INSERT INTO Class_Rooms
  VALUES (1622, 'AS', 1)
INSERT INTO Class_Rooms
  VALUES (1624, 'AS', 0)
INSERT INTO Class_Rooms
  VALUES (1627, 'AS', 0)
INSERT INTO Class_Rooms
  VALUES (1639, 'TB', 1)
INSERT INTO Class_Rooms
  VALUES (2357, 'CC', 1)
INSERT INTO Class_Rooms
  VALUES (2408, 'IB', 0)
INSERT INTO Class_Rooms
  VALUES (2423, 'IB', 0)
INSERT INTO Class_Rooms
  VALUES (3305, 'IB', 1)
INSERT INTO Class_Rooms
  VALUES (3307, 'IB', 0)
INSERT INTO Class_Rooms
  VALUES (3309, 'IB', 0)
INSERT INTO Class_Rooms
  VALUES (3313, 'IB', 0)
INSERT INTO Class_Rooms
  VALUES (3315, 'IB', 0)
INSERT INTO Class_Rooms
  VALUES (3317, 'IB', 1)
INSERT INTO Class_Rooms
  VALUES (3319, 'IB', 0)
INSERT INTO Class_Rooms
  VALUES (3322, 'IB', 0)
INSERT INTO Class_Rooms
  VALUES (3330, 'IB', 1)
INSERT INTO Class_Rooms
  VALUES (3343, 'CC', 0)
INSERT INTO Class_Rooms
  VALUES (3345, 'CC', 0)
INSERT INTO Class_Rooms
  VALUES (3346, 'CC', 1)
INSERT INTO Class_Rooms
  VALUES (3352, 'CC', 1)
INSERT INTO Class_Rooms
  VALUES (3353, 'CC', 0)
INSERT INTO Class_Rooms
  VALUES (3355, 'CC', 0)
INSERT INTO Class_Rooms
  VALUES (3404, 'IB', 0)
INSERT INTO Class_Rooms
  VALUES (3406, 'IB', 1)
INSERT INTO Class_Rooms
  VALUES (3409, 'IB', 1)
INSERT INTO Class_Rooms
  VALUES (3415, 'IB', 1)
INSERT INTO Class_Rooms
  VALUES (3420, 'IB', 0)
INSERT INTO Class_Rooms
  VALUES (3422, 'IB', 1)
INSERT INTO Class_Rooms
  VALUES (3431, 'IB', 0)
INSERT INTO Class_Rooms
  VALUES (3443, 'CC', 0)
INSERT INTO Class_Rooms
  VALUES (3445, 'CC', 1)
INSERT INTO Class_Rooms
  VALUES (3446, 'CC', 0)
INSERT INTO Class_Rooms
  VALUES (3452, 'CC', 0)
INSERT INTO Class_Rooms
  VALUES (3455, 'CC', 1)

   INSERT INTO Classes
  VALUES (1000, 11, 1231, 5, '10:00:00', 50, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (1002, 12, 1619, 4, '15:30:00', 110, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (1004, 13, 1627, 4, '08:00:00', 50, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (1006, 13, 1627, 4, '09:00:00', 110, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (1012, 14, 1627, 4, '13:00:00', 170, 0, 1, 
   0, 1, 0, 0)
INSERT INTO Classes
  VALUES (1020, 15, 3404, 4, '13:00:00', 110, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (1030, 16, 1231, 5, '11:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (1031, 16, 1231, 5, '14:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (1156, 37, 3443, 5, '08:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (1162, 37, 3443, 5, '09:00:00', 80, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (1168, 37, 3445, 5, '11:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (1180, 38, 3446, 5, '11:30:00', 80, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (1183, 38, 3415, 5, '13:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (1184, 38, 3415, 5, '14:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (1196, 39, 3415, 5, '15:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (1500, 33, 1142, 5, '08:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (1502, 34, 1142, 5, '09:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (1560, 35, 2408, 3, '10:00:00', 50, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (1562, 36, 2408, 5, '12:00:00', 110, 1, 0, 
   1, 0, 0, 0)
INSERT INTO Classes
  VALUES (1642, 29, 1514, 2, '11:00:00', 70, 0, 1, 
   0, 1, 0, 0)
INSERT INTO Classes
  VALUES (2001, 20, 1519, 5, '07:30:00', 110, 1, 0, 
   1, 0, 0, 0)
INSERT INTO Classes
  VALUES (2005, 20, 1515, 5, '11:00:00', 50, 1, 0, 
   1, 1, 0, 0)
INSERT INTO Classes
  VALUES (2015, 21, 1131, 5, '09:00:00', 110, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (2051, 22, 1515, 4, '13:00:00', 50, 1, 1, 
   1, 1, 0, 0)
INSERT INTO Classes
  VALUES (2071, 50, 1624, 5, '10:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (2075, 51, 1624, 5, '07:00:00', 110, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (2089, 52, 1624, 5, '12:00:00', 50, 1, 1, 
   0, 1, 1, 0)
INSERT INTO Classes
  VALUES (2103, 53, 1624, 5, '11:00:00', 50, 1, 1, 
   0, 1, 1, 0)
INSERT INTO Classes
  VALUES (2213, 17, 1532, 5, '10:00:00', 110, 1, 0, 
   1, 1, 0, 0)
INSERT INTO Classes
  VALUES (2223, 18, 1532, 5, '12:00:00', 50, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (2245, 19, 1530, 5, '13:30:00', 110, 1, 0, 
   1, 0, 0, 0)
INSERT INTO Classes
  VALUES (2431, 27, 3322, 5, '09:00:00', 50, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (2451, 27, 1639, 5, '13:00:00', 50, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (2633, 48, 3420, 5, '16:00:00', 50, 0, 1, 
   0, 1, 0, 0)
INSERT INTO Classes
  VALUES (2639, 49, 3353, 3, '09:00:00', 50, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (2647, 49, 3353, 3, '18:00:00', 50, 0, 1, 
   0, 1, 0, 0)
INSERT INTO Classes
  VALUES (2889, 45, 2423, 5, '09:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (2891, 45, 2423, 5, '11:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (2895, 45, 2423, 5, '13:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (2907, 46, 3445, 5, '08:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (2911, 46, 3445, 5, '12:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (2915, 46, 3353, 5, '10:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (2917, 47, 3422, 5, '14:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (2925, 47, 3422, 5, '15:00:00', 50, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (2933, 47, 3422, 5, '09:00:00', 240, 0, 0, 
   0, 0, 0, 1)
INSERT INTO Classes
  VALUES (3030, 30, 3352, 5, '09:00:00', 80, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (3031, 30, 3352, 5, '13:30:00', 80, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (3040, 31, 3352, 5, '11:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (3045, 31, 3352, 5, '12:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (3050, 32, 3343, 5, '10:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (3055, 32, 3317, 5, '15:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (3065, 40, 3345, 5, '08:00:00', 110, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (3070, 42, 3346, 5, '10:30:00', 140, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (3082, 44, 3346, 5, '08:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (3085, 43, 3346, 5, '09:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (3090, 44, 3346, 5, '13:30:00', 110, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (3115, 54, 3352, 5, '08:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (3120, 54, 3352, 5, '10:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (3123, 56, 3346, 5, '12:00:00', 110, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (3600, 41, 3420, 5, '13:00:00', 140, 1, 0, 
   1, 0, 0, 0)
INSERT INTO Classes
  VALUES (4025, 4, 3315, 5, '11:00:00', 50, 1, 0, 1, 
   0, 1, 0)
INSERT INTO Classes
  VALUES (4055, 5, 3313, 5, '14:00:00', 50, 1, 0, 1, 
   0, 1, 0)
INSERT INTO Classes
  VALUES (4172, 8, 3317, 3, '09:00:00', 50, 1, 0, 1, 
   0, 1, 0)
INSERT INTO Classes
  VALUES (4192, 9, 3309, 4, '08:00:00', 50, 1, 1, 1, 
   1, 1, 0)
INSERT INTO Classes
  VALUES (4196, 10, 3309, 4, '10:30:00', 140, 0, 1, 
   0, 1, 0, 0)
INSERT INTO Classes
  VALUES (4750, 1, 3313, 5, '09:00:00', 50, 1, 1, 0, 
   1, 1, 0)
INSERT INTO Classes
  VALUES (4751, 1, 3313, 5, '13:00:00', 50, 1, 1, 0, 
   1, 1, 0)
INSERT INTO Classes
  VALUES (4755, 2, 3415, 5, '08:00:00', 50, 1, 1, 1, 
   1, 0, 0)
INSERT INTO Classes
  VALUES (4760, 3, 3415, 5, '10:00:00', 50, 1, 1, 0, 
   1, 1, 0)
INSERT INTO Classes
  VALUES (4768, 6, 3307, 5, '15:00:00', 110, 0, 1, 
   1, 1, 0, 0)
INSERT INTO Classes
  VALUES (4800, 23, 3305, 5, '08:00:00', 50, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (4810, 23, 3319, 5, '08:00:00', 50, 0, 1, 
   0, 1, 0, 0)
INSERT INTO Classes
  VALUES (4812, 24, 3330, 3, '12:00:00', 80, 0, 1, 
   0, 1, 0, 0)
INSERT INTO Classes
  VALUES (4813, 24, 3406, 3, '10:00:00', 50, 1, 0, 
   1, 0, 1, 0)
INSERT INTO Classes
  VALUES (4825, 25, 3319, 5, '11:00:00', 50, 1, 1, 
   1, 1, 1, 0)
INSERT INTO Classes
  VALUES (4880, 26, 1231, 5, '13:30:00', 110, 1, 0, 
   1, 0, 1, 0)
   
INSERT INTO Faculty
  VALUES (98005, 'Instructor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98007, 'Associate Professor', 'Full Time', 
   1)
INSERT INTO Faculty
  VALUES (98010, 'Associate Professor', 'On Leave', 
   1)
INSERT INTO Faculty
  VALUES (98011, 'Instructor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98012, 'Instructor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98013, 'Instructor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98014, 'Professor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98019, 'Instructor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98020, 'Instructor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98025, 'Associate Professor', 'Full Time', 
   1)
INSERT INTO Faculty
  VALUES (98028, 'Professor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98030, 'Instructor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98036, 'Professor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98040, 'Associate Professor', 'Full Time', 
   1)
INSERT INTO Faculty
  VALUES (98042, 'Associate Professor', 'Full Time', 
   1)
INSERT INTO Faculty
  VALUES (98045, 'Professor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98048, 'Professor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98052, 'Instructor', 'Part Time', 0)
INSERT INTO Faculty
  VALUES (98053, 'Instructor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98055, 'Professor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98059, 'Instructor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98062, 'Associate Professor', 'Full Time', 
   0)
INSERT INTO Faculty
  VALUES (98063, 'Instructor', 'Full Time', 1)
INSERT INTO Faculty
  VALUES (98064, 'Professor', 'Full Time', 1)

   INSERT INTO Faculty_Subjects
  VALUES (98005, 12, 10)
INSERT INTO Faculty_Subjects
  VALUES (98005, 16, 10)
INSERT INTO Faculty_Subjects
  VALUES (98005, 34, 9)
INSERT INTO Faculty_Subjects
  VALUES (98005, 36, 8)
INSERT INTO Faculty_Subjects
  VALUES (98005, 38, 8)
INSERT INTO Faculty_Subjects
  VALUES (98007, 2, 9)
INSERT INTO Faculty_Subjects
  VALUES (98007, 5, 10)
INSERT INTO Faculty_Subjects
  VALUES (98007, 14, 8)
INSERT INTO Faculty_Subjects
  VALUES (98007, 24, 10)
INSERT INTO Faculty_Subjects
  VALUES (98007, 46, 10)
INSERT INTO Faculty_Subjects
  VALUES (98010, 2, 8)
INSERT INTO Faculty_Subjects
  VALUES (98010, 5, 10)
INSERT INTO Faculty_Subjects
  VALUES (98010, 24, 8)
INSERT INTO Faculty_Subjects
  VALUES (98010, 48, 10)
INSERT INTO Faculty_Subjects
  VALUES (98011, 38, 9)
INSERT INTO Faculty_Subjects
  VALUES (98011, 43, 8)
INSERT INTO Faculty_Subjects
  VALUES (98011, 49, 10)
INSERT INTO Faculty_Subjects
  VALUES (98012, 1, 9)
INSERT INTO Faculty_Subjects
  VALUES (98012, 4, 10)
INSERT INTO Faculty_Subjects
  VALUES (98012, 32, 9)
INSERT INTO Faculty_Subjects
  VALUES (98012, 45, 9)
INSERT INTO Faculty_Subjects
  VALUES (98013, 23, 9)
INSERT INTO Faculty_Subjects
  VALUES (98013, 26, 8)
INSERT INTO Faculty_Subjects
  VALUES (98013, 27, 10)
INSERT INTO Faculty_Subjects
  VALUES (98013, 28, 9)
INSERT INTO Faculty_Subjects
  VALUES (98013, 46, 10)
INSERT INTO Faculty_Subjects
  VALUES (98014, 11, 9)
INSERT INTO Faculty_Subjects
  VALUES (98014, 15, 9)
INSERT INTO Faculty_Subjects
  VALUES (98014, 39, 9)
INSERT INTO Faculty_Subjects
  VALUES (98014, 42, 9)
INSERT INTO Faculty_Subjects
  VALUES (98014, 44, 9)
INSERT INTO Faculty_Subjects
  VALUES (98019, 13, 9)
INSERT INTO Faculty_Subjects
  VALUES (98019, 32, 9)
INSERT INTO Faculty_Subjects
  VALUES (98019, 47, 8)
INSERT INTO Faculty_Subjects
  VALUES (98020, 20, 8)
INSERT INTO Faculty_Subjects
  VALUES (98020, 22, 10)
INSERT INTO Faculty_Subjects
  VALUES (98020, 25, 8)
INSERT INTO Faculty_Subjects
  VALUES (98020, 50, 8)
INSERT INTO Faculty_Subjects
  VALUES (98020, 52, 8)
INSERT INTO Faculty_Subjects
  VALUES (98025, 3, 10)
INSERT INTO Faculty_Subjects
  VALUES (98025, 7, 10)
INSERT INTO Faculty_Subjects
  VALUES (98025, 9, 10)
INSERT INTO Faculty_Subjects
  VALUES (98025, 47, 10)
INSERT INTO Faculty_Subjects
  VALUES (98028, 11, 8)
INSERT INTO Faculty_Subjects
  VALUES (98028, 15, 10)
INSERT INTO Faculty_Subjects
  VALUES (98028, 33, 9)
INSERT INTO Faculty_Subjects
  VALUES (98028, 35, 8)
INSERT INTO Faculty_Subjects
  VALUES (98028, 39, 8)
INSERT INTO Faculty_Subjects
  VALUES (98030, 14, 10)
INSERT INTO Faculty_Subjects
  VALUES (98030, 30, 8)
INSERT INTO Faculty_Subjects
  VALUES (98030, 42, 10)
INSERT INTO Faculty_Subjects
  VALUES (98030, 44, 9)
INSERT INTO Faculty_Subjects
  VALUES (98030, 48, 9)
INSERT INTO Faculty_Subjects
  VALUES (98036, 12, 10)
INSERT INTO Faculty_Subjects
  VALUES (98036, 16, 9)
INSERT INTO Faculty_Subjects
  VALUES (98036, 34, 9)
INSERT INTO Faculty_Subjects
  VALUES (98036, 36, 8)
INSERT INTO Faculty_Subjects
  VALUES (98040, 25, 8)
INSERT INTO Faculty_Subjects
  VALUES (98040, 27, 8)
INSERT INTO Faculty_Subjects
  VALUES (98040, 28, 10)
INSERT INTO Faculty_Subjects
  VALUES (98040, 45, 8)
INSERT INTO Faculty_Subjects
  VALUES (98042, 31, 9)
INSERT INTO Faculty_Subjects
  VALUES (98042, 40, 8)
INSERT INTO Faculty_Subjects
  VALUES (98042, 41, 10)
INSERT INTO Faculty_Subjects
  VALUES (98042, 55, 8)
INSERT INTO Faculty_Subjects
  VALUES (98042, 56, 9)
INSERT INTO Faculty_Subjects
  VALUES (98045, 13, 10)
INSERT INTO Faculty_Subjects
  VALUES (98045, 23, 8)
INSERT INTO Faculty_Subjects
  VALUES (98045, 26, 9)
INSERT INTO Faculty_Subjects
  VALUES (98045, 33, 9)
INSERT INTO Faculty_Subjects
  VALUES (98045, 35, 9)
INSERT INTO Faculty_Subjects
  VALUES (98048, 7, 10)
INSERT INTO Faculty_Subjects
  VALUES (98048, 9, 8)
INSERT INTO Faculty_Subjects
  VALUES (98048, 30, 8)
INSERT INTO Faculty_Subjects
  VALUES (98048, 54, 9)
INSERT INTO Faculty_Subjects
  VALUES (98048, 55, 10)
INSERT INTO Faculty_Subjects
  VALUES (98052, 17, 8)
INSERT INTO Faculty_Subjects
  VALUES (98052, 18, 8)
INSERT INTO Faculty_Subjects
  VALUES (98052, 21, 10)
INSERT INTO Faculty_Subjects
  VALUES (98052, 50, 10)
INSERT INTO Faculty_Subjects
  VALUES (98052, 52, 9)
INSERT INTO Faculty_Subjects
  VALUES (98053, 18, 9)
INSERT INTO Faculty_Subjects
  VALUES (98053, 19, 9)
INSERT INTO Faculty_Subjects
  VALUES (98053, 21, 8)
INSERT INTO Faculty_Subjects
  VALUES (98053, 51, 9)
INSERT INTO Faculty_Subjects
  VALUES (98053, 53, 9)
INSERT INTO Faculty_Subjects
  VALUES (98055, 3, 8)
INSERT INTO Faculty_Subjects
  VALUES (98055, 6, 8)
INSERT INTO Faculty_Subjects
  VALUES (98055, 8, 9)
INSERT INTO Faculty_Subjects
  VALUES (98055, 10, 10)
INSERT INTO Faculty_Subjects
  VALUES (98055, 37, 10)
INSERT INTO Faculty_Subjects
  VALUES (98059, 31, 8)
INSERT INTO Faculty_Subjects
  VALUES (98059, 43, 10)
INSERT INTO Faculty_Subjects
  VALUES (98059, 54, 9)
INSERT INTO Faculty_Subjects
  VALUES (98059, 56, 9)
INSERT INTO Faculty_Subjects
  VALUES (98062, 1, 10)
INSERT INTO Faculty_Subjects
  VALUES (98062, 4, 8)
INSERT INTO Faculty_Subjects
  VALUES (98062, 6, 8)
INSERT INTO Faculty_Subjects
  VALUES (98062, 8, 10)
INSERT INTO Faculty_Subjects
  VALUES (98062, 10, 10)
INSERT INTO Faculty_Subjects
  VALUES (98062, 49, 9)
INSERT INTO Faculty_Subjects
  VALUES (98063, 17, 9)
INSERT INTO Faculty_Subjects
  VALUES (98063, 19, 9)
INSERT INTO Faculty_Subjects
  VALUES (98063, 20, 9)
INSERT INTO Faculty_Subjects
  VALUES (98063, 22, 8)
INSERT INTO Faculty_Subjects
  VALUES (98063, 51, 9)
INSERT INTO Faculty_Subjects
  VALUES (98063, 53, 8)
INSERT INTO Faculty_Subjects
  VALUES (98064, 29, 9)
INSERT INTO Faculty_Subjects
  VALUES (98064, 37, 8)
INSERT INTO Faculty_Subjects
  VALUES (98064, 40, 9)
INSERT INTO Faculty_Subjects
  VALUES (98064, 41, 8)
  INSERT INTO Faculty_Classes
  VALUES (1000, 98014)
INSERT INTO Faculty_Classes
  VALUES (1002, 98036)
INSERT INTO Faculty_Classes
  VALUES (1004, 98019)
INSERT INTO Faculty_Classes
  VALUES (1006, 98045)
INSERT INTO Faculty_Classes
  VALUES (1012, 98030)
INSERT INTO Faculty_Classes
  VALUES (1020, 98028)
INSERT INTO Faculty_Classes
  VALUES (1030, 98036)
INSERT INTO Faculty_Classes
  VALUES (1031, 98005)
INSERT INTO Faculty_Classes
  VALUES (1156, 98055)
INSERT INTO Faculty_Classes
  VALUES (1162, 98064)
INSERT INTO Faculty_Classes
  VALUES (1168, 98055)
INSERT INTO Faculty_Classes
  VALUES (1180, 98011)
INSERT INTO Faculty_Classes
  VALUES (1183, 98005)
INSERT INTO Faculty_Classes
  VALUES (1184, 98011)
INSERT INTO Faculty_Classes
  VALUES (1196, 98028)
INSERT INTO Faculty_Classes
  VALUES (1500, 98028)
INSERT INTO Faculty_Classes
  VALUES (1502, 98036)
INSERT INTO Faculty_Classes
  VALUES (1560, 98028)
INSERT INTO Faculty_Classes
  VALUES (1562, 98036)
INSERT INTO Faculty_Classes
  VALUES (1642, 98064)
INSERT INTO Faculty_Classes
  VALUES (2001, 98020)
INSERT INTO Faculty_Classes
  VALUES (2005, 98063)
INSERT INTO Faculty_Classes
  VALUES (2015, 98053)
INSERT INTO Faculty_Classes
  VALUES (2051, 98020)
INSERT INTO Faculty_Classes
  VALUES (2071, 98020)
INSERT INTO Faculty_Classes
  VALUES (2075, 98053)
INSERT INTO Faculty_Classes
  VALUES (2089, 98052)
INSERT INTO Faculty_Classes
  VALUES (2103, 98053)
INSERT INTO Faculty_Classes
  VALUES (2213, 98052)
INSERT INTO Faculty_Classes
  VALUES (2223, 98053)
INSERT INTO Faculty_Classes
  VALUES (2245, 98063)
INSERT INTO Faculty_Classes
  VALUES (2431, 98012)
INSERT INTO Faculty_Classes
  VALUES (2451, 98040)
INSERT INTO Faculty_Classes
  VALUES (2633, 98030)
INSERT INTO Faculty_Classes
  VALUES (2639, 98011)
INSERT INTO Faculty_Classes
  VALUES (2647, 98011)
INSERT INTO Faculty_Classes
  VALUES (2889, 98040)
INSERT INTO Faculty_Classes
  VALUES (2891, 98012)
INSERT INTO Faculty_Classes
  VALUES (2895, 98013)
INSERT INTO Faculty_Classes
  VALUES (2907, 98013)
INSERT INTO Faculty_Classes
  VALUES (2911, 98013)
INSERT INTO Faculty_Classes
  VALUES (2915, 98013)
INSERT INTO Faculty_Classes
  VALUES (2917, 98025)
INSERT INTO Faculty_Classes
  VALUES (2925, 98019)
INSERT INTO Faculty_Classes
  VALUES (2933, 98025)
INSERT INTO Faculty_Classes
  VALUES (3030, 98048)
INSERT INTO Faculty_Classes
  VALUES (3031, 98030)
INSERT INTO Faculty_Classes
  VALUES (3040, 98059)
INSERT INTO Faculty_Classes
  VALUES (3045, 98042)
INSERT INTO Faculty_Classes
  VALUES (3050, 98012)
INSERT INTO Faculty_Classes
  VALUES (3055, 98012)
INSERT INTO Faculty_Classes
  VALUES (3065, 98042)
INSERT INTO Faculty_Classes
  VALUES (3070, 98030)
INSERT INTO Faculty_Classes
  VALUES (3082, 98030)
INSERT INTO Faculty_Classes
  VALUES (3085, 98059)
INSERT INTO Faculty_Classes
  VALUES (3090, 98014)
INSERT INTO Faculty_Classes
  VALUES (3115, 98048)
INSERT INTO Faculty_Classes
  VALUES (3120, 98059)
INSERT INTO Faculty_Classes
  VALUES (3123, 98059)
INSERT INTO Faculty_Classes
  VALUES (3600, 98042)
INSERT INTO Faculty_Classes
  VALUES (4025, 98062)
INSERT INTO Faculty_Classes
  VALUES (4055, 98007)
INSERT INTO Faculty_Classes
  VALUES (4172, 98055)
INSERT INTO Faculty_Classes
  VALUES (4192, 98025)
INSERT INTO Faculty_Classes
  VALUES (4196, 98062)
INSERT INTO Faculty_Classes
  VALUES (4750, 98062)
INSERT INTO Faculty_Classes
  VALUES (4751, 98012)
INSERT INTO Faculty_Classes
  VALUES (4755, 98007)
INSERT INTO Faculty_Classes
  VALUES (4760, 98055)
INSERT INTO Faculty_Classes
  VALUES (4768, 98055)
INSERT INTO Faculty_Classes
  VALUES (4800, 98045)
INSERT INTO Faculty_Classes
  VALUES (4810, 98045)
INSERT INTO Faculty_Classes
  VALUES (4812, 98007)
INSERT INTO Faculty_Classes
  VALUES (4813, 98007)
INSERT INTO Faculty_Classes
  VALUES (4825, 98020)
INSERT INTO Faculty_Classes
  VALUES (4880, 98045)
  INSERT INTO Staff
  VALUES (98005, 'Suzanne', 'Viescas', '15127 NE 24th, #383', 
   'Redmond', 'WA', '98052', '425', '555-2686', 44000, 
   '1986-05-31', 'Faculty')
INSERT INTO Staff
  VALUES (98007, 'Gary', 'Hallmark', 'Route 2, Box 203B', 
   'Auburn', 'WA', '98002', '253', '555-2676', 53000, 
   '1985-01-21', 'Faculty')
INSERT INTO Staff
  VALUES (98010, 'Jeffrey', 'Smith', '30301 - 166th Ave. N.E.', 
   'Fremont', 'CA', '94538', '510', '555-2596', 52000, 
   '1983-10-06', 'Faculty')
INSERT INTO Staff
  VALUES (98011, 'Ann', 'Patterson', '16 Maple Lane', 
   'Auburn', 'WA', '98002', '253', '555-2591', 45000, 
   '1983-10-16', 'Faculty')
INSERT INTO Staff
  VALUES (98012, 'Michael', 'Davolio', '672 Lamont Ave', 
   'Houston', 'TX', '77201', '713', '555-2491', 49000, 
   '1989-02-09', 'Faculty')
INSERT INTO Staff
  VALUES (98013, 'Ann', 'Fuller', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '253', '555-2496', 44000, 
   '1986-07-05', 'Faculty')
INSERT INTO Staff
  VALUES (98014, 'James', 'Leverling', '722 Moss Bay Blvd.', 
   'Kirkland', 'WA', '98033', '425', '555-2501', 60000, 
   '1986-07-16', 'Faculty')
INSERT INTO Staff
  VALUES (98019, 'Laura', 'Callahan', '901 Pine Avenue', 
   'Portland', 'OR', '97208', '503', '555-2526', 45000, 
   '1989-11-02', 'Faculty')
INSERT INTO Staff
  VALUES (98020, 'Albert', 'Buchanan', '13920 S.E. 40th Street', 
   'Bellevue', 'WA', '98009', '425', '555-2531', 45000, 
   '1985-08-02', 'Faculty')
--INSERT INTO Staff  VALUES (98021, 'Tim', 'Smith', '30301 - 166th Ave. N.E.',    'Seattle', 'WA', '98106', '206', '555-2536', 40000,   '1988-12-17', 'Registrar')
INSERT INTO Staff
  VALUES (98025, 'Janet', 'Leverling', '722 Moss Bay Blvd.', 
   'Kirkland', 'WA', '98033', '425', '555-2576', 50000, 
   '1984-04-12', 'Faculty')
INSERT INTO Staff
  VALUES (98028, 'Alaina', 'Hallmark', 'Route 2, Box 203B', 
   'Woodinville', 'WA', '98072', '425', '555-2631', 
   57000, '1984-01-17', 'Faculty')
INSERT INTO Staff
  VALUES (98030, 'Amelia', 'Buchanan', '13920 S.E. 40th Street', 
   'Bellevue', 'WA', '98006', '425', '555-2556', 48000, 
   '1988-05-31', 'Faculty')
INSERT INTO Staff
  VALUES (98036, 'John', 'Leverling', '611 Alpine Drive', 
   'Palm Springs', 'CA', '92263', '760', '555-2611', 
   60000, '1982-11-20', 'Faculty')
INSERT INTO Staff
  VALUES (98040, 'David', 'Callahan', '101 NE 88th', 
   'Salem', 'OR', '97301', '503', '555-2636', 50000, 
   '1987-01-13', 'Faculty')
INSERT INTO Staff
  VALUES (98042, 'David', 'Smith', '311 20th Ave. N.E.', 
   'Fremont', 'CA', '94538', '510', '555-2646', 52000, 
   '1991-12-17', 'Faculty')
--INSERT INTO Staff VALUES (98043, 'Kathryn', 'Patterson', '16 Maple Lane',    'Seattle', 'WA', '98115', '206', '555-2651', 25000,    '1984-11-14', 'Secretary')
INSERT INTO Staff
  VALUES (98045, 'Michael', 'Hernandez', 'PO Box 223311', 
   'Tacoma', 'WA', '98413', '253', '555-2711', 60000, 
   '1990-08-20', 'Faculty')
INSERT INTO Staff
  VALUES (98048, 'Joyce', 'Bonnicksen', '2424 Thames Drive', 
   'Bellevue', 'WA', '98006', '425', '555-2726', 60000, 
   '1986-03-02', 'Faculty')
INSERT INTO Staff
  VALUES (98052, 'Katherine', 'Ehrlich', '777 Fenexet Blvd', 
   'Redmond', 'WA', '98052', '425', '555-0399', 45000, 
   '1985-03-08', 'Faculty')
INSERT INTO Staff
  VALUES (98053, 'Gregory', 'Piercy', '4501 Wetland Road', 
   'Long Beach', 'CA', '90809', '562', '555-0037', 
   45000, '1992-02-10', 'Faculty')
INSERT INTO Staff
  VALUES (98055, 'Alastair', 'Black', '3887 Easy Street', 
   'Seattle', 'WA', '98125', '206', '555-0039', 60000, 
   '1988-12-11', 'Faculty')
--INSERT INTO Staff  VALUES (98057, 'Joe', 'Rosales III', '7288 Barrister Ave N',    'Tacoma', 'WA', '98413', '253', '555-2281', 35000,    '1988-11-25', 'Graduate Advisor')
INSERT INTO Staff
  VALUES (98059, 'Consuelo', 'Maynez', '3445 Cheyenne Road', 
   'El Paso', 'TX', '79993', '915', '555-2291', 48000, 
   '1986-09-17', 'Faculty')
INSERT INTO Staff
  VALUES (98062, 'Caroline', 'Coie', '298 Forest Lane', 
   'Seattle', 'WA', '98125', '206', '555-2306', 52000, 
   '1983-01-28', 'Faculty')
INSERT INTO Staff
  VALUES (98063, 'Ryan', 'Ehrlich', '455 West Palm Ave', 
   'San Antonio', 'TX', '78284', '210', '555-2311', 
   45000, '1988-03-02', 'Faculty')
INSERT INTO Staff
  VALUES (98064, 'Allan', 'Davis', '877 145th Ave SE', 
   'Portland', 'OR', '97208', '503', '555-2316', 56000, 
   '1989-08-20', 'Faculty')
   
   
INSERT INTO Faculty_Categories
  VALUES (98005, 'ART')
INSERT INTO Faculty_Categories
  VALUES (98005, 'ENG')
INSERT INTO Faculty_Categories
  VALUES (98005, 'MUS')
INSERT INTO Faculty_Categories
  VALUES (98007, 'ACC')
INSERT INTO Faculty_Categories
  VALUES (98007, 'ART')
INSERT INTO Faculty_Categories
  VALUES (98007, 'CIS')
INSERT INTO Faculty_Categories
  VALUES (98007, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98010, 'ACC')
INSERT INTO Faculty_Categories
  VALUES (98010, 'CIS')
INSERT INTO Faculty_Categories
  VALUES (98010, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98011, 'ENG')
INSERT INTO Faculty_Categories
  VALUES (98011, 'HIS')
INSERT INTO Faculty_Categories
  VALUES (98011, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98012, 'ACC')
INSERT INTO Faculty_Categories
  VALUES (98012, 'ECO')
INSERT INTO Faculty_Categories
  VALUES (98012, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98013, 'CIS')
INSERT INTO Faculty_Categories
  VALUES (98013, 'CSC')
INSERT INTO Faculty_Categories
  VALUES (98013, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98014, 'ART')
INSERT INTO Faculty_Categories
  VALUES (98014, 'ENG')
INSERT INTO Faculty_Categories
  VALUES (98014, 'HIS')
INSERT INTO Faculty_Categories
  VALUES (98019, 'ART')
INSERT INTO Faculty_Categories
  VALUES (98019, 'ECO')
INSERT INTO Faculty_Categories
  VALUES (98019, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98020, 'CHE')
INSERT INTO Faculty_Categories
  VALUES (98020, 'CIS')
INSERT INTO Faculty_Categories
  VALUES (98020, 'PHY')
INSERT INTO Faculty_Categories
  VALUES (98025, 'ACC')
INSERT INTO Faculty_Categories
  VALUES (98025, 'BUS')
INSERT INTO Faculty_Categories
  VALUES (98025, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98028, 'ART')
INSERT INTO Faculty_Categories
  VALUES (98028, 'ENG')
INSERT INTO Faculty_Categories
  VALUES (98028, 'MUS')
INSERT INTO Faculty_Categories
  VALUES (98030, 'ART')
INSERT INTO Faculty_Categories
  VALUES (98030, 'ECO')
INSERT INTO Faculty_Categories
  VALUES (98030, 'HIS')
INSERT INTO Faculty_Categories
  VALUES (98030, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98036, 'ART')
INSERT INTO Faculty_Categories
  VALUES (98036, 'ENG')
INSERT INTO Faculty_Categories
  VALUES (98036, 'MUS')
INSERT INTO Faculty_Categories
  VALUES (98040, 'CIS')
INSERT INTO Faculty_Categories
  VALUES (98040, 'CSC')
INSERT INTO Faculty_Categories
  VALUES (98040, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98042, 'ECO')
INSERT INTO Faculty_Categories
  VALUES (98042, 'GEG')
INSERT INTO Faculty_Categories
  VALUES (98042, 'POL')
INSERT INTO Faculty_Categories
  VALUES (98045, 'ART')
INSERT INTO Faculty_Categories
  VALUES (98045, 'CIS')
INSERT INTO Faculty_Categories
  VALUES (98045, 'MUS')
INSERT INTO Faculty_Categories
  VALUES (98048, 'BUS')
INSERT INTO Faculty_Categories
  VALUES (98048, 'ECO')
INSERT INTO Faculty_Categories
  VALUES (98048, 'POL')
INSERT INTO Faculty_Categories
  VALUES (98052, 'BIO')
INSERT INTO Faculty_Categories
  VALUES (98052, 'CHE')
INSERT INTO Faculty_Categories
  VALUES (98052, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98052, 'PHY')
INSERT INTO Faculty_Categories
  VALUES (98053, 'BIO')
INSERT INTO Faculty_Categories
  VALUES (98053, 'CHE')
INSERT INTO Faculty_Categories
  VALUES (98053, 'PHY')
INSERT INTO Faculty_Categories
  VALUES (98055, 'ACC')
INSERT INTO Faculty_Categories
  VALUES (98055, 'BUS')
INSERT INTO Faculty_Categories
  VALUES (98055, 'ENG')
INSERT INTO Faculty_Categories
  VALUES (98055, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98059, 'ECO')
INSERT INTO Faculty_Categories
  VALUES (98059, 'HIS')
INSERT INTO Faculty_Categories
  VALUES (98059, 'POL')
INSERT INTO Faculty_Categories
  VALUES (98062, 'ACC')
INSERT INTO Faculty_Categories
  VALUES (98062, 'BUS')
INSERT INTO Faculty_Categories
  VALUES (98062, 'MAT')
INSERT INTO Faculty_Categories
  VALUES (98063, 'BIO')
INSERT INTO Faculty_Categories
  VALUES (98063, 'CHE')
INSERT INTO Faculty_Categories
  VALUES (98063, 'PHY')
INSERT INTO Faculty_Categories
  VALUES (98064, 'ENG')
INSERT INTO Faculty_Categories
  VALUES (98064, 'GEG')
INSERT INTO Faculty_Categories
  VALUES (98064, 'JRN')

  
INSERT INTO Students
  VALUES (1001, 'Nancy', 'Davolio', '9877 Hacienda Drive', 
   'San Antonio', 'TX', '78284', '210', '555-2706')
INSERT INTO Students
  VALUES (1002, 'Andrew', 'Fuller', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '253', '555-2701')
INSERT INTO Students
  VALUES (1003, 'Sarah', 'Leverling', '611 Alpine Drive', 
   'Palm Springs', 'CA', '92263', '760', '555-2696')
INSERT INTO Students
  VALUES (1004, 'Carol', 'Peacock', '4110 Old Redmond Rd.', 
   'Redmond', 'WA', '98052', '425', '555-2691')
INSERT INTO Students
  VALUES (1005, 'Sally', 'Callahan', '4726 - 11th Ave. N.E.', 
   'Seattle', 'WA', '98105', '206', '555-2671')
INSERT INTO Students
  VALUES (1006, 'Steven', 'Buchanan', '66 Spring Valley Drive', 
   'Medford', 'OR', '97501', '541', '555-2666')
INSERT INTO Students
  VALUES (1007, 'Elizabeth', 'Hallmark', 'Route 2, Box 203B', 
   'Auburn', 'WA', '98002', '253', '555-2521')
INSERT INTO Students
  VALUES (1008, 'Sara', 'Kennedy', '16679 NE 41st Court', 
   'Portland', 'OR', '97208', '503', '555-2566')
INSERT INTO Students
  VALUES (1009, 'Karen', 'Smith', '30301 - 166th Ave. N.E.', 
   'Eugene', 'OR', '97401', '541', '555-2551')
INSERT INTO Students
  VALUES (1010, 'Mary', 'Fuller', '908 W. Capital Way', 
   'Tacoma', 'WA', '98413', '253', '555-2606')
INSERT INTO Students
  VALUES (1011, 'John', 'Kennedy', '16679 NE 41st Court', 
   'Portland', 'OR', '97208', '503', '555-2621')
INSERT INTO Students
  VALUES (1012, 'Sarah', 'Thompson', '2222 Springer Road', 
   'Lubbock', 'TX', '79402', '806', '555-2626')
INSERT INTO Students
  VALUES (1013, 'Michael', 'Viescas', '15127 NE 24th, #383', 
   'Redmond', 'WA', '98052', '425', '555-2656')
INSERT INTO Students
  VALUES (1014, 'Kendra', 'Bonnicksen', '12330 Larchlemont Lane', 
   'Seattle', 'WA', '98105', '206', '555-2716')
INSERT INTO Students
  VALUES (1015, 'Mel', 'Ehrlich', '777 Fenexet Blvd', 
   'Long Beach', 'CA', '90809', '562', '555-0399')
INSERT INTO Students
  VALUES (1016, 'Steven', 'Pundt', '2500 Rosales Lane', 
   'Dallas', 'TX', '79915', '972', '555-9938')
INSERT INTO Students
  VALUES (1017, 'George', 'Chavez', '281 Old Navy Road', 
   'Bremerton', 'WA', '98310', '360', '555-9930')
INSERT INTO Students
  VALUES (1018, 'David', 'Nathanson', '754 Fourth Ave', 
   'Seattle', 'WA', '98115', '206', '555-2296')
   INSERT INTO Student_Class_Status
  VALUES (1, 'Enrolled')
INSERT INTO Student_Class_Status
  VALUES (2, 'Completed')
INSERT INTO Student_Class_Status
  VALUES (3, 'Withdrew')


INSERT INTO Student_Schedules
  VALUES (1001, 1560, 2, 93.28)
INSERT INTO Student_Schedules
  VALUES (1001, 2071, 2, 66.41)
INSERT INTO Student_Schedules
  VALUES (1001, 4055, 1, 62.85)
INSERT INTO Student_Schedules
  VALUES (1001, 4760, 3, 0)
INSERT INTO Student_Schedules
  VALUES (1001, 4812, 2, 66.91)
INSERT INTO Student_Schedules
  VALUES (1002, 1560, 2, 84.75)
INSERT INTO Student_Schedules
  VALUES (1002, 2071, 2, 76.02)
INSERT INTO Student_Schedules
  VALUES (1002, 4055, 1, 68.5)
INSERT INTO Student_Schedules
  VALUES (1002, 4760, 2, 79.43)
INSERT INTO Student_Schedules
  VALUES (1002, 4812, 1, 58.27)
INSERT INTO Student_Schedules
  VALUES (1003, 1560, 2, 82.85)
INSERT INTO Student_Schedules
  VALUES (1003, 2071, 1, 77.2)
INSERT INTO Student_Schedules
  VALUES (1003, 4055, 1, 75.38)
INSERT INTO Student_Schedules
  VALUES (1003, 4760, 2, 90.67)
INSERT INTO Student_Schedules
  VALUES (1003, 4812, 1, 81.9)
INSERT INTO Student_Schedules
  VALUES (1004, 1031, 2, 80.78)
INSERT INTO Student_Schedules
  VALUES (1004, 1180, 1, 56.36)
INSERT INTO Student_Schedules
  VALUES (1004, 1502, 1, 69.32)
INSERT INTO Student_Schedules
  VALUES (1004, 4768, 1, 61.1)
INSERT INTO Student_Schedules
  VALUES (1005, 1180, 1, 69.71)
INSERT INTO Student_Schedules
  VALUES (1005, 1502, 2, 76.28)
INSERT INTO Student_Schedules
  VALUES (1005, 1562, 2, 67.59)
INSERT INTO Student_Schedules
  VALUES (1005, 4768, 2, 79.31)
INSERT INTO Student_Schedules
  VALUES (1006, 1000, 1, 89.2)
INSERT INTO Student_Schedules
  VALUES (1006, 1012, 2, 85.05)
INSERT INTO Student_Schedules
  VALUES (1006, 1031, 2, 91.72)
INSERT INTO Student_Schedules
  VALUES (1006, 1168, 2, 85.31)
INSERT INTO Student_Schedules
  VALUES (1006, 3115, 1, 83.23)
INSERT INTO Student_Schedules
  VALUES (1006, 4055, 2, 87.82)
INSERT INTO Student_Schedules
  VALUES (1007, 1000, 2, 93.27)
INSERT INTO Student_Schedules
  VALUES (1007, 1012, 1, 98.36)
INSERT INTO Student_Schedules
  VALUES (1007, 1031, 2, 79.59)
INSERT INTO Student_Schedules
  VALUES (1007, 1168, 2, 92.9)
INSERT INTO Student_Schedules
  VALUES (1007, 3115, 1, 92.25)
INSERT INTO Student_Schedules
  VALUES (1007, 4055, 2, 90.24)
INSERT INTO Student_Schedules
  VALUES (1008, 1560, 1, 79.93)
INSERT INTO Student_Schedules
  VALUES (1008, 2071, 1, 82.31)
INSERT INTO Student_Schedules
  VALUES (1008, 4055, 2, 89.27)
INSERT INTO Student_Schedules
  VALUES (1008, 4760, 2, 90.58)
INSERT INTO Student_Schedules
  VALUES (1008, 4812, 2, 71.73)
INSERT INTO Student_Schedules
  VALUES (1009, 1560, 2, 92.08)
INSERT INTO Student_Schedules
  VALUES (1009, 2071, 3, 0)
INSERT INTO Student_Schedules
  VALUES (1009, 4055, 1, 63.56)
INSERT INTO Student_Schedules
  VALUES (1009, 4760, 1, 95.59)
INSERT INTO Student_Schedules
  VALUES (1009, 4812, 2, 67.44)
INSERT INTO Student_Schedules
  VALUES (1010, 1180, 2, 73.68)
INSERT INTO Student_Schedules
  VALUES (1010, 1502, 1, 69.34)
INSERT INTO Student_Schedules
  VALUES (1010, 1562, 2, 98.26)
INSERT INTO Student_Schedules
  VALUES (1010, 4768, 1, 82.02)
INSERT INTO Student_Schedules
  VALUES (1011, 1000, 1, 81.88)
INSERT INTO Student_Schedules
  VALUES (1011, 1012, 1, 89.52)
INSERT INTO Student_Schedules
  VALUES (1011, 1031, 1, 87.17)
INSERT INTO Student_Schedules
  VALUES (1011, 1168, 2, 93.7)
INSERT INTO Student_Schedules
  VALUES (1011, 3115, 2, 72.68)
INSERT INTO Student_Schedules
  VALUES (1011, 4055, 2, 71.45)
INSERT INTO Student_Schedules
  VALUES (1012, 1031, 2, 73.29)
INSERT INTO Student_Schedules
  VALUES (1012, 1180, 2, 97.39)
INSERT INTO Student_Schedules
  VALUES (1012, 1502, 1, 85.92)
INSERT INTO Student_Schedules
  VALUES (1012, 4768, 1, 89.22)
INSERT INTO Student_Schedules
  VALUES (1013, 1000, 1, 66.61)
INSERT INTO Student_Schedules
  VALUES (1013, 1012, 1, 79.74)
INSERT INTO Student_Schedules
  VALUES (1013, 1031, 2, 74.01)
INSERT INTO Student_Schedules
  VALUES (1013, 1168, 1, 77.91)
INSERT INTO Student_Schedules
  VALUES (1013, 3115, 2, 73.96)
INSERT INTO Student_Schedules
  VALUES (1013, 4055, 2, 90.01)
INSERT INTO Student_Schedules
  VALUES (1014, 1000, 2, 88.27)
INSERT INTO Student_Schedules
  VALUES (1014, 1012, 2, 92.05)
INSERT INTO Student_Schedules
  VALUES (1014, 1031, 2, 91.56)
INSERT INTO Student_Schedules
  VALUES (1014, 1168, 3, 0)
INSERT INTO Student_Schedules
  VALUES (1014, 3115, 2, 75.8)
INSERT INTO Student_Schedules
  VALUES (1014, 4055, 1, 80.43)
INSERT INTO Student_Schedules
  VALUES (1015, 1180, 2, 93.86)
INSERT INTO Student_Schedules
  VALUES (1015, 1502, 2, 90.16)
INSERT INTO Student_Schedules
  VALUES (1015, 1562, 2, 96.36)
INSERT INTO Student_Schedules
  VALUES (1015, 4768, 1, 67.67)
INSERT INTO Student_Schedules
  VALUES (1016, 1000, 1, 73.71)
INSERT INTO Student_Schedules
  VALUES (1016, 1012, 1, 70.77)
INSERT INTO Student_Schedules
  VALUES (1016, 1031, 2, 72.79)
INSERT INTO Student_Schedules
  VALUES (1016, 1168, 1, 98.74)
INSERT INTO Student_Schedules
  VALUES (1016, 3115, 2, 77.46)
INSERT INTO Student_Schedules
  VALUES (1016, 4055, 2, 84.37)
INSERT INTO Student_Schedules
  VALUES (1017, 1031, 2, 77.45)
INSERT INTO Student_Schedules
  VALUES (1017, 1180, 1, 78.34)
INSERT INTO Student_Schedules
  VALUES (1017, 1502, 2, 72.15)
INSERT INTO Student_Schedules
  VALUES (1017, 4768, 2, 85.26)
INSERT INTO Student_Schedules
  VALUES (1018, 1031, 2, 87.05)
INSERT INTO Student_Schedules
  VALUES (1018, 1180, 2, 69.88)
INSERT INTO Student_Schedules
  VALUES (1018, 1502, 2, 67.13)
INSERT INTO Student_Schedules
  VALUES (1018, 4768, 1, 81.23)