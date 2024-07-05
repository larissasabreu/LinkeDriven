-- Questão 01
SELECT * FROM companies LIMIT 5;

--Questão 02
SELECT * FROM companies WHERE name = 'Driven' ;

--Questão 03 
INSERT INTO companies (name, image_url) VALUES ('Apple', 
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaX4ZaOVCaAMFCsY9MEHOKR-GHa_o27TDlew&s');

--Questão 04
DELETE FROM companies WHERE name = 'Apple';

--Questão 05
UPDATE companies SET name = 'Google' WHERE name = 'Gogle' ;

--Questão 06
UPDATE jobs SET salary = 1500 WHERE id = 1;

--Questão 07
SELECT users.id FROM users WHERE users.name = 'Kelly' --3
SELECT companies.id FROM companies WHERE companies.name = 'Nubank' --6
SELECT roles.id FROM roles WHERE roles.name = 'CTO' --5

INSERT INTO experiences (user_id, company_id, role_id, start_date, end_date) VALUES 
(3, 6, 5, '2024-07-05', NULL)

--Questão 08
SELECT users.id FROM users WHERE users.name = 'Kelly' --3

SELECT jobs.id as id, companies.name as company, roles.name as roles
FROM jobs
	JOIN companies
		ON jobs.company_id = companies.id
	JOIN roles
		ON jobs.role_id = roles.id
	WHERE companies.name = 'Carrefour'
GROUP BY jobs.id, companies.name, roles.name; --2

DELETE FROM applicants WHERE user_id = 3 AND job_id = 2;

--Questão 09
SELECT jobs.id as id, jobs.description as description, jobs.salary as salary FROM jobs
ORDER BY salary DESC LIMIT 3;

--Questão 10
SELECT MIN(jobs.salary) AS salary, companies.name
FROM jobs
	JOIN companies
		ON jobs.company_id = companies.id
GROUP BY companies.name, jobs.salary
ORDER BY salary 
LIMIT 1;

--Questão 11 
SELECT users.id, users.name, cities.name AS city
FROM users 
	JOIN cities
		ON users.city_id = cities.id 
	WHERE cities.name = 'Rio de Janeiro'

--Questão 12
-- ???
SELECT writer.name as writer, testimonials.message, recipient.name as recipient
FROM testimonials
	JOIN users writer
		ON testimonials.writer_id = writer.id
	JOIN users recipient
		ON testimonials.recipient_id = recipient.id
GROUP BY testimonials.message, writer.name, recipient.name;

--Questão 13
SELECT users.id, users.name, courses.name AS course, schools.name AS school
FROM educations
	JOIN users
		ON educations.user_id = users.id
	JOIN courses
		ON educations.course_id = courses.id
	JOIN schools
		ON educations.school_id = schools.id
	WHERE educations.status = 'finished' AND educations.user_id = 5
GROUP BY users.id, users.name, courses.name, schools.name;

--Questão 14
SELECT users.name, roles.name as role, companies.name as company, experiences.start_date
FROM experiences
	JOIN users 
		ON experiences.user_id = users.id
	JOIN roles
		ON experiences.role_id = roles.id
	JOIN companies
		ON experiences.company_id = companies.id
	WHERE start_date IS NOT NULL AND users.id = 10
GROUP BY users.name, roles.name, companies.name, start_date;

--Questão 15
SELECT schools.id, 
schools.name AS school, 
courses.name AS course, 
companies.name AS company, 
roles.name AS roles
	FROM applicants
	JOIN jobs 
		ON applicants.job_id = jobs.id
	JOIN users 
		ON applicants.user_id = users.id
	JOIN educations 
		ON users.id = educations.user_id
	JOIN schools 
		ON educations.school_id = schools.id
	JOIN courses 
		ON educations.course_id = courses.id
	JOIN companies 
		ON jobs.company_id = companies.id
	JOIN roles 
		ON jobs.role_id = roles.id
	WHERE jobs.active IS TRUE AND roles.name = 'Engenheiro de Software Pleno' AND companies.id = 1;


--Questão 16
-- ???
SELECT COUNT (end_date) AS current_experiences
FROM experiences;

--Questão 17
SELECT users.id, users.name, 
COUNT (user_id) AS educations
FROM educations
JOIN users
	ON educations.user_id = users.id
GROUP BY users.id, users.name
ORDER BY educations DESC;

--Questão 18
SELECT users.name AS writer, 
COUNT (writer_id) AS testimonialCount
FROM testimonials
	JOIN users 
		ON testimonials.writer_id = users.id
	WHERE users.id = 9
GROUP BY users.name;

--Questão 19
SELECT MAX(salary) AS "maximum_salary", roles.name AS role
	FROM jobs
	JOIN roles 
		ON roles.id = jobs.role_id
	WHERE active IS true
	GROUP BY roles.name
	ORDER BY maximum_salary;

--Questão 20
SELECT schools.name AS school,
courses.name AS courses,
COUNT (educations.course_id) AS student_count
	FROM educations
	JOIN schools  
		ON educations.school_id = schools.id
	JOIN courses
		ON educations.course_id = courses.id
		WHERE educations.status = 'finished'
	GROUP BY schools.name, courses
	ORDER BY student_count DESC
	LIMIT 3;