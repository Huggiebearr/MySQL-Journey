-- WHERE Clause --

# Learning how to use the WHERE Clause
SELECT * 
FROM employee_salary
WHERE first_name = 'Leslie' 
;

# Using WHERE Clause to find salaries
SELECT * 
FROM employee_salary
WHERE salary > 50000 
; # 50001 & more

# If I want to include 50000 & more 
SELECT * 
FROM employee_salary
WHERE salary >= 50000 
;

# Less than 50000
SELECT * 
FROM employee_salary
WHERE salary < 50000 
;

# Adding 50000 again 
SELECT * 
FROM employee_salary
WHERE salary <= 50000
;

# Changing to Demographics Table 
SELECT * 
FROM employee_demographics;

# Showing only Females
SELECT * 
FROM employee_demographics
WHERE gender = 'Female'
;

# No females just Male
SELECT * 
FROM employee_demographics
WHERE gender != 'Female'
;

# Sorting by birth_date
SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

-- AND OR NOT -- Logical Operators 

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

# Sorting by either birth_date OR gender being male
SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male'
;

# Sorting by either birth_date OR NOT gender being male
SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

# Looking for someone specific 
# PEMDAS Ordering goes for this stuff too
SELECT * 
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;

-- LIKE Statement -- 
# % and _ Special Characters | % = Anything | _ = Specific value 

# % EXAMPLE 
# Can look for specific patterns - Not an exact match
SELECT * 
FROM employee_demographics
WHERE first_name LIKE '%er%'
;

# Everyones name who starts with an exact Letter 
# _ EXAMPLE 
SELECT * 
FROM employee_demographics
WHERE first_name LIKE 'a__'
;
# Can combine both % and _ | Can also use to find birth_dates

SELECT * 
FROM employee_demographics
WHERE birth_date LIKE '1989%'
;

-- GROUP By Clause --

# Rolls up the Group into 1
SELECT gender
FROM employee_demographics
GROUP BY gender
;

# Grouping the gender and averaging out the age in each group 
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

# Adding oldest age 
SELECT gender, AVG(age), MAX(age)
FROM employee_demographics
GROUP BY gender
;

# Adding youngest age 
SELECT gender, AVG(age), MAX(age), MIN(age)
FROM employee_demographics
GROUP BY gender
;

# Counting the amount of entries in each row 
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- ORDER BY -- 

# Organizes in ascending order A-Z
SELECT *
FROM employee_demographics
ORDER BY first_name ASC
;

# Organizes in descending order Z-A
SELECT *
FROM employee_demographics
ORDER BY first_name DESC
;

# Organizing Age from youngest 1-99
SELECT *
FROM employee_demographics
ORDER BY age ASC
;

# Organizing Age from oldest 99-1
SELECT *
FROM employee_demographics
ORDER BY age DESC
;

# Ordering by position of the Field 
SELECT *
FROM employee_demographics
ORDER BY 4 ASC
;

-- Changing Tables -- 

# Categorizing 
SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

-- HAVING vs WHERE --

# HAVING EXAMPLE
Select gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

# Using both HAVING and WHERE in a query 
Select occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;

-- LIMIT & ALIASING

SELECT *
FROM employee_demographics;

# LIMIT = How many rows you want exactly in input
SELECT *
FROM employee_demographics
LIMIT 3
;

# Oldest people
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

# Starting at position 3 and go from there 
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

-- ALIASING
# Way to change the name of the column for the most part 

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

# Changing the name of column 
SELECT gender, AVG(age) AS avg_name
FROM employee_demographics
GROUP BY gender
HAVING avg_name > 40
;
