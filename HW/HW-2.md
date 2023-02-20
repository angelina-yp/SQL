## HW-1.2

### Ex.1: Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
```sql
SELECT employee_name, monthly_salary from employees join employee_salary on employees.id = employee_salary.employee_id join salary on employee_salary.salary_id =salary.id;
```
### Ex.2: Вывести всех работников у которых ЗП меньше 2000.
```sql
SELECT employee_name from employees join employee_salary on employees.id = employee_salary.employee_id join salary on employee_salary.salary_id =salary.id WHERE salary.monthly_salary<2000 ;
```
 ### Ex.3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
 ```sql
 SELECT r.role_name, s.monthly_salary from roles r 
full outer join roles_employee re
	on r.id  = re.role_id
full outer join employee_salary es
	using(employee_id)
full outer join salary s
	on es.salary_id  = s.id
where r.role_name is not null 
	and s.monthly_salary is not null;
 ```
 ### Ex.4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
  ```sql
 SELECT r.role_name, s.monthly_salary from roles r 
full outer join roles_employee re
	on r.id  = re.role_id
full outer join employee_salary es
	using(employee_id)
full outer join salary s
	on es.salary_id  = s.id
where r.role_name is not null 
	and s.monthly_salary < 2000;
 ```
 ### Ex.5. Найти всех работников кому не начислена ЗП.
  ```sql
  SELECT employee_name, salary_id from employees e 
left join employee_salary es 
	on e.id = es.employee_id 
where salary_id is null;
 ```
 ### Ex.6. Вывести всех работников с названиями их должности.
  ```sql
  SELECT employee_name, role_name from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id;
 ```
  ### Ex.7. Вывести имена и должность только Java разработчиков.
  ```sql
 SELECT employee_name, role_name from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
where role_name like '%Java%';
 ```
  ### Ex.8. Вывести имена и должность только Python разработчиков.
  ```sql
  SELECT employee_name, role_name from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
where role_name like '%Python%';
 ```
  ### Ex.9. Вывести имена и должность всех QA инженеров.
   ```sql
  SELECT employee_name, role_name
from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
where role_name like '%QA%';
 ```
  ### Ex.10. Вывести имена и должность ручных QA инженеров.
  ```sql
  SELECT employee_name, role_name from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
where role_name like '%Manual QA%';
   ```
  ### Ex.11. Вывести имена и должность автоматизаторов QA
   ```sql
  SELECT employee_name, role_name from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
where role_name like '%Automation QA%';
   ```
  ### Ex.12. Вывести имена и зарплаты Junior специалистов
   ```sql
   SELECT employee_name, monthly_salary from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%Junior%';
   ```
  ### Ex.13. Вывести имена и зарплаты Middle специалистов
   ```sql
   select employee_name, monthly_salary from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%Middle%';
   ```
  ### Ex.14. Вывести имена и зарплаты Senior специалистов
   ```sql
   select employee_name, monthly_salary from roles_employee re 
join employees e on re.employee_id = e.id
join roles r on re.role_id = r.id
join employee_salary es on re.employee_id = es.employee_id
join salary s on es.salary_id = s.id  
where role_name like '%Senior%';
   ```
  ### Ex.15. Вывести зарплаты Java разработчиков
   ```sql
   -- добавил данных, чтобы убедиться в правильности запроса
insert into roles_employee(employee_id, role_id)
values (30, 1),
		(29, 2),
		(28, 3),
		(27, 4),
		(26, 5),
		(25, 6),
		(24, 7),
		(23, 8),
		(22, 9),
		(21, 10);
	
select * from roles_employee;

select monthly_salary, role_name from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%Java%';
   ```
  ### Ex.16. Вывести зарплаты Python разработчиков
   ```sql
   select monthly_salary, role_name from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%Python%';
   ```
  ### Ex.17. Вывести имена и зарплаты Junior Python разработчиков
   ```sql
   select monthly_salary, role_name from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%Junior Python%';
   ```
  ### Ex.18. Вывести имена и зарплаты Middle JS разработчиков
   ```sql
   select monthly_salary, role_name from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%Middle JavaScript%';
   ```
  ### Ex.19. Вывести имена и зарплаты Senior Java разработчиков
   ```sql
   select monthly_salary, role_name from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%Senior Java%';
   ```
  ### Ex.20. Вывести зарплаты Junior QA инженеров
   ```sql
   select monthly_salary, role_name from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%Junior QA%';
   ```
 ### Ex.21. Вывести среднюю зарплату всех Junior специалистов
   ```sql
   select avg(monthly_salary) as avg_junior_salary from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%Junior%';
   ```
 ### Ex.22. Вывести сумму зарплат JS разработчиков
   ```sql
   select sum(monthly_salary) as sum_js_dev_salary from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%JavaScript%';
   ```
 ### Ex.23. Вывести минимальную ЗП QA инженеров
   ```sql
   select min(monthly_salary) as min_qa_salary from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%QA%';
   ```
 ### Ex.24. Вывести максимальную ЗП QA инженеров
   ```sql
   select max(monthly_salary) as max_qa_salary from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id  
where role_name like '%QA%';
   ```
 ### Ex.25. Вывести количество QA инженеров
   ```sql
   select count(role_name) as count_role_qa  from roles
where role_name like '%QA%';
   ```
 ### Ex.26. Вывести количество Middle специалистов.
   ```sql
   select count(role_name) as count_role_middle from roles
where role_name like '%Middle%';
   ```
 ### Ex.27. Вывести количество разработчиков
   ```sql
   select count(role_name) as count_role_dev from roles
where role_name like '%developer%';
   ```
 ### Ex.28. Вывести фонд (сумму) зарплаты разработчиков.
   ```sql
   select sum(monthly_salary) as sum_salary  from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id 
where role_name like '%developer%';
   ```
 ### Ex.29. Вывести имена, должности и ЗП всех специалистов по возрастанию
   ```sql
   select employee_name, role_name, monthly_salary from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id 
order by 3;
   ```
 ### Ex.30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
   ```sql
   select employee_name, role_name, monthly_salary  from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id 
where monthly_salary between 1700 and 2300
order by 3;
   ```
 ### Ex.31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
   ```sql
   select employee_name, role_name, monthly_salary  from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id 
where monthly_salary < 2300
order by 3;
   ```
### Ex. 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
  ```sql
   select employee_name, role_name, monthly_salary from roles_employee re 
join employees e 
	on re.employee_id = e.id
join roles r 
	on re.role_id = r.id
join employee_salary es 
	using(employee_id)
join salary s 
	on es.salary_id = s.id 
where monthly_salary in (1100, 1500, 2000)
order by 3;
   ```
