-- 1. Average Attrition rate for all Departments

select Department, count(Attrition) as count_attrition
from hr_analytics.hr_1
group by Department;

-- 2. Average Hourly rate of Male Research Scientist

select avg(HourlyRate) as 'Avg Hourly Rate Of Male Research Scientist'
from hr_analytics.hr_1
where Gender = "Male" and JobRole = "Research Scientist";

-- 3. Attrition rate Vs Monthly income stats

select Attrition, sum(MonthlyIncome) as MonthlyIncome
from hr_analytics.hr_1 h1
inner join
	hr_analytics.hr_2 h2
    on h1.EmployeeNumber = h2.`Employee ID`
group by Attrition;

-- 4. Average working years for each Department

select Department, avg(TotalWorkingYears) as 'Average Working Years'
from hr_analytics.hr_1 h1
inner join
	hr_analytics.hr_2 h2
    on h1.EmployeeNumber = h2.`Employee ID`
group by Department;

-- 5. Job Role Vs Work life balance

select JobRole, sum(WorkLifeBalance) as 'Work life balance'
from hr_analytics.hr_1 h1
inner join
	hr_analytics.hr_2 h2
    on h1.EmployeeNumber = h2.`Employee ID`
group by JobRole;

-- 6. Attrition rate Vs Year since last promotion relation

select Attrition, 
count(distinct YearsSinceLastPromotion) as 'Count of year', 
group_concat(distinct YearsSinceLastPromotion) as 'Year since last promotion'
from hr_analytics.hr_1 h1
inner join
	hr_analytics.hr_2 h2
    on h1.EmployeeNumber = h2.`Employee ID`
group by Attrition;