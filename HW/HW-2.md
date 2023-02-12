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
 ```
 ### Ex.6. Вывести всех работников с названиями их должности.
  ```sql
 ```
  ### Ex.7. Вывести имена и должность только Java разработчиков.
  ### Ex.8. Вывести имена и должность только Python разработчиков.
  ### Ex.9. Вывести имена и должность всех QA инженеров.
  ### Ex.10. Вывести имена и должность ручных QA инженеров.
  ### Ex.11. Вывести имена и должность автоматизаторов QA
  ### Ex.12. Вывести имена и зарплаты Junior специалистов
  ### Ex.13. Вывести имена и зарплаты Middle специалистов
  ### Ex.14. Вывести имена и зарплаты Senior специалистов
  ### Ex.15. Вывести зарплаты Java разработчиков
  ### Ex.16. Вывести зарплаты Python разработчиков
  ### Ex.17. Вывести имена и зарплаты Junior Python разработчиков
  ### Ex.18. Вывести имена и зарплаты Middle JS разработчиков
  ### Ex.19. Вывести имена и зарплаты Senior Java разработчиков
  ### Ex.20. Вывести зарплаты Junior QA инженеров
 21. Вывести среднюю зарплату всех Junior специалистов
 22. Вывести сумму зарплат JS разработчиков
 23. Вывести минимальную ЗП QA инженеров
 24. Вывести максимальную ЗП QA инженеров
 25. Вывести количество QA инженеров
 26. Вывести количество Middle специалистов.
 27. Вывести количество разработчиков
 28. Вывести фонд (сумму) зарплаты разработчиков.
 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
