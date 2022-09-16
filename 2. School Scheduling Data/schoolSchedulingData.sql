/*
1)	Which faculty has the most teachers? 
•	I have assumed that faculty refers to the categories table because the departmentName field is Null.
•	The math faculty has the most teachers with 12.*/
SELECT TOP 1 COUNT(categories.categoryid) AS StaffCount, categories.categorydescription FROM faculty
INNER JOIN faculty_categories
ON faculty_categories.staffId = faculty.staffID
INNER JOIN staff
ON staff.staffID = faculty_categories.staffID
INNER JOIN categories
ON categories.categoryid = faculty_categories.categoryid
GROUP BY categories.categorydescription
ORDER BY count(categories.categoryid) DESC

/*
2)	What are the 3 most popular subjects among students? 
•	Business Tax Account 11 students, Art History 10 students and Composition – Intermediate 7 students*/
SELECT TOP 3 SubjectName, COUNT(student_schedules.studentID) AS Students
FROM Subjects
INNER JOIN classes
ON Classes.SubjectID = subjects.subjectID
INNER JOIN student_schedules
ON student_schedules.classID = classes.classID
GROUP BY subjectname
ORDER BY COUNT(student_schedules.studentID) DESC

/*
3)	Which city has the most students? 
•	Seattle with 3*/
SELECT COUNT(studcity) AS amountOfStudents, studcity AS City FROM Students
GROUP BY studcity
ORDER BY COUNT(studcity) DESC

/*
4)	Students from which city study painting the most?
•	There are 6 students who study Painting and they are all from different cities. If this was meant to be state, then simply replace city for state in the SELECT, COUNT, GROUP BY and ORDER BY.*/
SELECT studcity AS City, COUNT(studcity) AS students FROM students
INNER JOIN student_schedules
ON students.studentid = student_schedules.studentID
INNER JOIN classes
ON student_schedules.classID = classes.classID
INNER JOIN subjects
ON subjects.subjectID = classes.subjectID
WHERE subjectname = 'painting'
GROUP BY studcity
ORDER BY COUNT(studcity) DESC

/*
5)	What class starts at 8 a.m. on Monday in room 1627? 
•	ClassID 1004 Drawing*/
SELECT classID, subjects.subjectname FROM Classes
INNER JOIN subjects
ON subjects.subjectID = classes.subjectID
WHERE classes.starttime = '08:00:00' AND ClassroomID = '1627'

/*
6)	Which classes are free on Wednesday at 11.00 and have a phone? 
•	I have assumed that free means that Wednesday_schedule is 0.
•	ClassID 1642 */
SELECT ClassID FROM class_rooms
INNER JOIN classes
ON class_rooms.classroomID = classes.classroomID
WHERE phoneavailable = '1' AND Wednesday_schedule = '0' AND starttime = '11:00:00'

/*
7) In which building are the most activities? 
•	Instructional Building with 31*/
SELECT buildingName, COUNT(classID) AS numberOfClasses FROM buildings
INNER JOIN class_rooms
ON class_rooms.buildingcode = buildings.buildingcode
INNER JOIN classes
ON classes.classroomID = class_rooms.classroomID
GROUP BY buildingname
ORDER BY COUNT(classID) DESC

/*
8) What is the average salary of the staff? 
•	51042.67 */
SELECT DISTINCT ROUND(AVG(salary),0) AS AvgSalary FROM STAFF

/*
9) Which of the teachers has been working at the school the longest? 
•	John Levering who has hired 1982-11-20*/
SELECT staffid, CONCAT(stffirstname,' ',stflastname) AS staffName, datahired AS dateHired from staff
ORDER BY datahired

/*
10) Display the name and surname of the student with the highest rating.
•	I have assumed that highest rating refers to the single highest grade, rather than the average for each student, however this can be easily changed by using AVG instead of MAX.
•	Steven Pundt 98.74*/
SELECT TOP 1 CONCAT(studfirstname,' ', studlastname) AS studentName, MAX(student_schedules.grade) AS Grade FROM Students
INNER JOIN student_schedules
ON students.studentid = student_schedules.studentID
GROUP BY studfirstname, studlastname
ORDER BY Grade DESC


