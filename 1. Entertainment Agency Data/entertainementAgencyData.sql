
/*
1)	Find Agent-Client pairs that have previously worked with each other.
•	I have assumed that client and entertainer are used interchangeably. 
•	There are 79 Agent-Entertainer pairs that have previously worked with each other.*/
SELECT DISTINCT Engagements.EntertainerID, entertainers.entstagename, agents.agentID, CONCAT(agents.agtfirstname,' ',agents.agtlastname) AS AgentName
FROM Entertainers
INNER JOIN Engagements
ON Entertainers.EntertainerID = Engagements.EntertainerID
INNER JOIN Agents
ON engagements.agentID = Agents.agentID

/*
2)	Find agents who have more than three clients. 
•	I have assumed that client and entertainer are used interchangeably. 
•	All of the Agents have more than three clients.*/
SELECT agents.agentID
FROM Entertainers
INNER JOIN Engagements
ON Entertainers.EntertainerID = Engagements.EntertainerID
INNER JOIN Agents
ON engagements.agentID = Agents.agentID
GROUP BY agents.agentID
HAVING COUNT(Agents.agentID)>3

/*
3)	Find all customers who are interested in rock music (any direction) and output their data for sending advertising. */
SELECT * FROM Customers
INNER JOIN Musical_preferences
ON customers.customerID = Musical_Preferences.customerID
INNER JOIN Musical_Styles
ON Musical_preferences.styleID = Musical_styles.styleID
WHERE Musical_styles.stylename
LIKE '%Rock%'

/*
4)	List all classical music events held in Seattle.
•	Engagement numbers 29, 30, 36, 55, 61, 72, 103, 112 & 128.*/
SELECT Engagements.EngagementNumber FROM Engagements
INNER JOIN Entertainers
ON engagements.entertainerID = entertainers.entertainerID
INNER JOIN Entertainer_Styles
ON entertainers.entertainerID = entertainer_styles.entertainerID
INNER JOIN Musical_styles
ON entertainer_styles.styleID = Musical_styles.styleID
WHERE entertainers.entcity = 'Seattle' AND Musical_styles.stylename = 'Classical'

/*
5)	List all activities in which more women than men participated. 
•	I got a bit confused at what this question wants me to do. At first, I thought that I would query the customers genders but that data is not provided. The only Gender data is related to members of the entertainers. I’ve successfully joined the tables with the below query but I cannot work out the syntax to count the amount of each gender for each engagement and then compare them against each other to return the engagements in which more females than males attend. I also tried nesting joins and where clauses to no avail, I’m looking forward to seeing how this query should be!*/
SELECT * FROM Engagements
INNER JOIN Entertainers
ON entertainers.entertainerID = engagements.entertainerID
INNER JOIN entertainer_members
ON entertainer_members.entertainerID = entertainers.EntertainerID
INNER JOIN Members
ON members.memberID = entertainer_members.memberID

/*
6)	Which client pays their agent the most? 
•	Agent salary and commissionRate are null so I have assumed that the Entertainer with the highest total sum of contractPrice’s will pay their agent the most.
•	26675.00 Entertained 1008 with entStageName Country Feeling */
SELECT SUM(Engagements.contractprice) AS SumOfContractPrice, entertainers.entstagename, entertainers.entertainerID
FROM Entertainers
INNER JOIN Engagements
ON Entertainers.EntertainerID = Engagements.EntertainerID
INNER JOIN Agents
ON engagements.agentID = Agents.agentID
GROUP BY entertainers.entstagename, entertainers.entertainerID
ORDER BY SUM(engagements.contractprice) DESC

/*
7) What contracts expire on July 15, 1999? 
•	Assuming that a contract is an engagement.
•	EngagementNumber 3.*/
SELECT * FROM Engagements WHERE EndDate='1999-07-15';

/*
8) Find your customers who live in Bellevue and love classical music. 
•	10011 Joyce Bonnicksen*/
SELECT customers.customerID, CONCAT(customers.custfirstname,' ',customers.custlastname) AS customerName, custcity AS City, stylename AS Style 
FROM Customers
INNER JOIN Musical_preferences
ON customers.customerID = Musical_Preferences.customerID
INNER JOIN Musical_Styles
ON Musical_preferences.styleID = Musical_styles.styleID
WHERE Musical_styles.stylename = 'Classical'AND customers.custcity = 'Bellevue'


/*
9) Which state had the most concerts in the third quarter of 1999?
•	WA with 57*/
SELECT TOP 1 COUNT(entstate) AS AmountOfEngagements, entstate AS State FROM entertainers
INNER JOIN engagements
ON engagements.entertainerID = entertainers.entertainerID
WHERE startdate BETWEEN '1999-07-01' AND '1999-09-30'
AND enddate BETWEEN '1999-07-01' AND '1999-09-30'
GROUP BY entstate
ORDER BY COUNT(entstate) DESC

/*
10) Which of the agents received the largest profits in 1999?
•	AgentID 3 Margaret with 27600*/
SELECT sum(Engagements.contractprice) as sumProfit, CONCAT(agents.agtfirstname,' ',agents.agtlastname) AS Agent, agents.AgentID
FROM Entertainers
INNER JOIN Engagements
ON Entertainers.EntertainerID = Engagements.EntertainerID
INNER join agents
ON engagements.agentID = agents.agentID
where Engagements.StartDate >= '1999-01-01'
AND Engagements.EndDate < '2000-01-01'
GROUP BY agents.agtfirstname, agents.agentID, agents.agtlastname
ORDER by sumProfit DESC
