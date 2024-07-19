USE Anand_Sql_Task1;
GO
--1.Select firstname, lastname, title, age, salary for everyone in your employee table. 
SELECT 
	FIRSTNAME
	,LASTNAME
	,TITLE
	,AGE
	,SALARY
FROM EMPLOYEE;
--2. Select firstname, age and salary for everyone in your employee table.
SELECT 
	FIRSTNAME
	,AGE
	,SALARY
FROM EMPLOYEE;
--3. Selct firstname and display as 'Name' for everyone in your employee table
SELECT
	FIRSTNAME AS [Name]
FROM EMPLOYEE;
--4. Select firstname and lastname as 'Name' for everyone. Use " " (space) to separate firstname and last.
SELECT 
	CONCAT(FIRSTNAME,' ',LASTNAME) AS [NAME]
FROM EMPLOYEE;
--5. Select all columns for everyone with a salary over 38000. 
SELECT 
	ID
	,FIRSTNAME
	,LASTNAME
	,TITLE
	,AGE
	,SALARY
FROM   EMPLOYEE
WHERE (SALARY > 38000);
--6. Select first and last names for everyone that's under 24 years old. 
SELECT 
	FIRSTNAME
	,LASTNAME
FROM EMPLOYEE
WHERE AGE<24;
--7. Select first name, last name, and salary for anyone with "Programmer" in their title. 
SELECT 
	FIRSTNAME
	,LASTNAME
	,SALARY
FROM   EMPLOYEE
WHERE TITLE = 'Programmer'
--8. Select all columns for everyone whose last name contains "O". 
SELECT 
	* 
FROM EMPLOYEE 
WHERE FIRSTNAME LIKE '%O%';
--9. Select the lastname for everyone whose first name equals "Kelly". 
SELECT 
	* 
FROM EMPLOYEE
WHERE FIRSTNAME='Kelly';
--10. Select all columns for everyone whose last name ends in "Moore". 
SELECT 
	* 
FROM EMPLOYEE
WHERE LASTNAME='%Moore';
--11. Select all columns for everyone who are 35 and above.
SELECT 
	*
FROM EMPLOYEE
WHERE AGE>=35;
--12. Select firstname ,lastname,age and salary of everyone whose age is above 24 and below 43.
SELECT 
	FIRSTNAME
	,LASTNAME
	,AGE
	,SALARY
FROM EMPLOYEE
WHERE AGE>24 AND AGE<43;
--13. Select firstname, title and lastname whose age is in the range 28 and 62 and salary greater than 31250
SELECT 
	FIRSTNAME
	,TITLE
	,LASTNAME
FROM EMPLOYEE
WHERE AGE BETWEEN 28 AND 62 AND SALARY>31250;
--14. Select all columns for everyone whose age is not more than 48 and salary not less than 21520
SELECT
	* 
FROM EMPLOYEE 
WHERE AGE<=48 AND SALARY>=21520;
--15. Select firstname and age of everyone whose firstname starts with "John" and salary in the range 25000
--and 35000
SELECT
	* 
FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'John%' AND SALARY BETWEEN 25000 AND 35000;

GO
--16. Select all columns for everyone by their ages in descending order.
SELECT
	* 
FROM EMPLOYEE 
ORDER BY AGE DESC;
--17. Select all columns for everyone by their ages in ascending order.
SELECT 
	* 
FROM EMPLOYEE
ORDER BY AGE ;
--18. Select all columns for everyone by their salaries in descending order.
SELECT 
	*
FROM EMPLOYEE
ORDER BY SALARY DESC;
--19. Select all columns for everyone by their salaries in ascending order.
SELECT
	*
FROM EMPLOYEE
ORDER BY SALARY;
--20. Select all columns for everyone by their salaries in ascending order whose age not less than 17.
SELECT
	*
FROM EMPLOYEE
WHERE AGE>=17
ORDER BY SALARY;
--21. Select all columns for everyone by their salaries in descending order whose age not more than 34.
SELECT 
	*
FROM EMPLOYEE
WHERE AGE<=34 
ORDER BY SALARY DESC;
--22. Select all columns for everyone by their length of firstname in ascending order.
SELECT 
	*
FROM EMPLOYEE
ORDER BY LEN(FIRSTNAME);
--23. Select the number of employees whose age is above 45
SELECT 
	COUNT(*)
FROM EMPLOYEE
WHERE AGE>=45;
--24. Show the results by adding 5 to ages and removing 250 from salaries of all employees
SELECT 
	FIRSTNAME
	,LASTNAME
	,AGE+5 AS AGE
	,SALARY-250 AS SALARY
FROM EMPLOYEE;
--25. Select the number of employees whose lastname ends with "re" or "ri" or "ks"
SELECT 
	COUNT(*)
FROM EMPLOYEE
WHERE LASTNAME LIKE '%re' or LASTNAME LIKE '%ri' or LASTNAME LIKE '%ks';
--26. Select the average salary of all your employees
SELECT 
	AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEE;
--27. Select the average salary of Freshers
SELECT 
	AVG(SALARY) AS FRESHERS_AVERAGE_SALARY 
FROM EMPLOYEE
WHERE TITLE='Fresher';
--28. Select the average age of Programmers
SELECT 
	AVG(AGE) AS PROGRAMMERS_AVERAGE_AGE 
FROM EMPLOYEE 
WHERE TITLE='Programmer';
--29. Select the average salary of employees whose age is not less than 35 and not more than 50
SELECT 
	AVG(SALARY) AS SALARY_AGE_CONSTRAINT 
FROM EMPLOYEE 
WHERE AGE BETWEEN 35 AND 50;
--30. Select the number of Freshers
SELECT 
	COUNT(*) AS FRESHERS_COUNT
FROM EMPLOYEE 
WHERE TITLE='FRESHER';
--31. What percentage of programmers constitute your employees
SELECT 
	COUNT(*)*100.0/(SELECT COUNT(*) FROM EMPLOYEE) AS PROGRAMMER_PERCENTAGE 
FROM EMPLOYEE
WHERE TITLE='PROGRAMMER';
--32. What is the combined salary that you need to pay to the employees whose age is not less than 40
SELECT 
	SUM(SALARY) AS SALARY
FROM EMPLOYEE 
WHERE AGE>=40;
--33. What is the combined salary that you need to pay to all the Freshers and Programmers for 1 month
SELECT 
	SUM(SALARY) AS COMBINED_SALARY
FROM EMPLOYEE 
WHERE TITLE IN ('FRESHER','PROGRAMMER');
--34. What is the combined salary that you need to pay to all the Freshers whose age is greater than 27 for 
--3years 
SELECT 
	SUM(SALARY)*36 AS FRESHER_SALARY
FROM EMPLOYEE 
WHERE AGE>27 AND TITLE='FRESHER';

GO
--35. Select the eldest employee's firstname, lastname and age whose salary is less than 35000
SELECT 
	TOP 1
	FIRSTNAME
	,LASTNAME
	,AGE
FROM EMPLOYEE 
WHERE SALARY<35000 ORDER BY AGE DESC;
--36. Who is the youngest General Manager
SELECT 
	TOP 1 
	FIRSTNAME
	,LASTNAME
	,AGE 
FROM EMPLOYEE 
WHERE TITLE='MANAGER'
ORDER BY AGE;
--37. Select the eldest fresher whose salary is less than 35000
SELECT 
	TOP 1
	FIRSTNAME
	,LASTNAME
	,AGE 
FROM EMPLOYEE 
WHERE SALARY <35000 AND TITLE='FRESHER' 
ORDER BY AGE DESC;
--Select firstname and age of everyone whose firstname starts with "John" or "Michael" and salary in the 
--range 17000 and 26000
SELECT 
	FIRSTNAME
	,AGE
FROM   EMPLOYEE
WHERE (FIRSTNAME LIKE 'JOHN%') OR
             (FIRSTNAME LIKE 'MICHEAL%') AND (SALARY BETWEEN 17000 AND 26000)
--39. How many employees are having each unique title. Select the title and display the number of employees 
--present in ascending order
SELECT 
	TITLE
	,COUNT(TITLE) AS [COUNT]
FROM   EMPLOYEE
GROUP BY TITLE ORDER BY [COUNT]
--40. What is the average salary of each unique title of the employees. Select the title and display the average 
--salary of employees in each
SELECT 
	TITLE
	,AVG(SALARY) AS AVERAGE_SALARY 
FROM EMPLOYEE 
GROUP BY TITLE;
--41. What is the average salary of employees excluding Freshers
SELECT 
	AVG(SALARY) AS SALARY 
FROM EMPLOYEE 
WHERE TITLE <> 'FRESHER';
--42. What is the average age of employees of each unique title.
SELECT 
	TITLE
	,AVG(AGE) AS AVERAGE_AGE 
FROM EMPLOYEE 
GROUP BY TITLE;

SELECT 
	TITLE
	,AGE
FROM EMPLOYEE
ORDER BY TITLE;

GO
--43. In the age range of 25 to 40 get the number of employees under each unique title.
SELECT 
	TITLE
	,(	SELECT COUNT(1) 
		FROM EMPLOYEE E1 
		WHERE E1.TITLE=E2.tITLE 
			AND E1.AGE BETWEEN 25 AND 40
	) AS TitleWiseCount
FROM EMPLOYEE E2 (NOLOCK) GROUP BY TITLE;
--44. Show the average salary of each unique title of employees only if the average salary is not less than 
--25000
SELECT 
	TITLE
	,AVG(SALARY) AS AVERAGE_SALARY
FROM   EMPLOYEE
GROUP BY TITLE
HAVING AVG(SALARY) > 25000
--45. Show the sum of ages of each unique title of employee only if the sum of age is greater than 30
SELECT 
	TITLE
	,SUM(AGE) AS TOTAL_SUM
FROM  EMPLOYEE
GROUP BY TITLE
HAVING SUM(AGE) > 30
 --Lisa Ray just got married to Michael Moore. She has requested that her last name be updated to Moore. 
UPDATE EMPLOYEE
SET LASTNAME = 'Moore'
WHERE FIRSTNAME = 'Lisa' AND LASTNAME = 'Ray'
--? Ginger Finger's birthday is today, add 1 to his age and a bonus of 5000
UPDATE EMPLOYEE
SET AGE=AGE+1
	,SALARY=SALARY+5000 
WHERE FIRSTNAME='Ginger' AND LASTNAME='Finger';
--? All 'Programmer's are now called "Engineer"s. Update all titles accordingly.
UPDATE EMPLOYEE SET TITLE='Engineer' WHERE TITLE='Programmer';
--? Everyone whose making under 30000 are to receive a 3500 bonus. 
UPDATE EMPLOYEE 
SET SALARY=SALARY+3500
WHERE SALARY<30000;
SELECT * 
FROM EMPLOYEE;
--? Everyone whose making over 35500 are to be deducted 15% of their salaries
UPDATE EMPLOYEE 
SET SALARY=SALARY-(SALARY*15.0/100)
WHERE SALARY<35500;
SELECT * 
FROM EMPLOYEE;


