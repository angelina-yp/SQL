
/*Таблица employees*/

/*1.Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null*/

create table employees(
  id serial primary key,
  employee_name varchar(50) not null
);
select * from employees;

/*2.Наполнить таблицу employee 70 строками.*/
insert into employees(employee_name)
values ('Reggie Batey'), 
('Clara Poore'), 
('Tammy Galindo'), 
('Rickey Jones'), 
('Jill Anspach'), 
('Lacy Racicot'), 
('David Macias'), 
('Jessica Manns'), 
('Amber Holcomb'), 
('Betty Wells'), 
('Miguel Fletcher'), 
('Joseph Hodges'), 
('Ida Bohannon'), 
('Cindy Merrifield'), 
('Mary Dowell'), 
('Marie Thomas'), 
('Donald Fierro'), 
('Anna Wick'), 
('Robert Harian'), 
('Michael Mark'), 
('Lucius Patterson'), 
('Lorna Rose'), 
('Karen Santiago'), 
('Peggy Beachler'), 
('Chester Baird'), 
('Ronda Colley'), 
('Robert Chapman'), 
('Sandra Hibbard'), 
('Steven Pagano'), 
('Ramona Russell'), 
('Ryan Morgan'), 
('Shannon Daugherty'), 
('Charlene Little'), 
('Steve Lewandowski'), 
('Donnie Shoemaker'), 
('Veronica Treto'), 
('Jonathon Belanger'), 
('William Hughes'), 
('Courtney Alston'), 
('Isaac Walters'), 
('Leon Ashcraft'), 
('Daniel Patterson'), 
('Randall Phillips'), 
('James Williams'), 
('Nancy Searles'), 
('Edward Hilliard'), 
('Joel Vandevelde'), 
('Nancy Bravo'), 
('Jesse Clark'), 
('Gregory Magelssen'), 
('Ella Cortez'), 
('Michael Diaz'), 
('Robert Walsh'), 
('Valorie Seibert'), 
('Yoshiko Miller'), 
('Timothy Johnson'), 
('Lita Webb'), 
('Lindsay Barrera'), 
('Jacqulyn Matthews'), 
('Lee Rehart'), 
('Fred Spencer'), 
('Melinda Webster'), 
('Shawn Pretti'), 
('Betty Schaefer'), 
('Barbara Teets'), 
('Patricia Tomas'), 
('Mattie Kelley'), 
('Mary Yates'), 
('Andrea Croes'), 
('Amanda Riley');

select * from employees;

/*Таблица salary

3.Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null*/

create table salary(
  id serial primary key,
  monthly_salary int not null
);
select * from salary;
/*4.Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500*/
insert into salary (monthly_salary)
values ('1000'), 
('1100'),
('1200'),
('1300'),
('1400'),
('1500'),
('1600'),
('1700'),
('1800'),
('1900'),
('2000'),
('2100'),
('2200'),
('2300'),
('2400'),
('2500');
select * from salary;

/*5.Таблица employee_salary

Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null*/
create table employee_salary(
  id serial primary key,
  employee_id int not null unique,
  salary_id Int not null
);
select * from employee_salary;
/*6.Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id*/
insert into employee_salary (employee_id, salary_id)
values (3, 7),
	(1,9),
	(40, 13),
	(23, 4),
	(11, 2),
	(15, 13),
	(26, 4),
	(16, 1),
	(33, 76),
	(11, 5),
	(12, 4),
	(13, 3),
	(14, 2),
	(15, 1),
	(16, 15),
	(17, 14),
	(18, 13),
	(19, 12),
	(20, 11),
	(21, 10),
	(22, 9),
	(23, 8),
	(24, 7),
	(25, 6),
	(26, 5),
	(27, 4),
	(28, 3),
	(29, 2),
	(30, 1),
	(31, 15),
	(32, 14),
	(33, 13),
	(34, 12),
	(35, 11),
	(36, 10),
	(37, 9),
	(38, 8),
	(39, 7),
	(40, 6);
	
select * from employee_salary;
/*Таблица roles

7.Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique*/

create table roles(
  id serial primary key,
  employee_id int not null unique,
  role_name Int not null unique
  select * from roles;
  
/*8.Поменять тип столба role_name с int на varchar(30)*/
 
alter table roles
alter column role_name type varchar(30) using role_name::varchar(30);

select * from roles;

/*9.Наполнить таблицу roles 20 строками:*/
insert into roles ( role_name)
values ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Desinger'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');
	
select * from roles;
/*Таблица roles_employee

10.Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)*/
create table roles_employee(
  id serial primary key,
  employee_id int not null unique,
  role_id Int not null
  select * from roles_employee;

/*11.Наполнить таблицу roles_employee 40 строками:*/
insert into roles_employee (employee_id, role_id)
values (7, 2),
		(20, 4),
		(3, 9),
		(5, 13),
		(23, 4),
		(11, 2),
		(10, 9),
		(22, 13),
		(21, 3),
		(34, 4),
		(6, 7),
		(1, 12),
		(2, 13),
		(3, 14),
		(4, 15),
		(5, 16),
		(6, 17),
		(7, 18),
		(8, 19),
		(9, 20),
		(10, 1),
		(11, 2),
		(12, 3),
		(13, 4),
		(14, 5),
		(15, 6),
		(16, 7),
		(17, 8),
		(18, 9),
		(19, 10),
		(20, 11),
		(21, 12),
		(22, 13),
		(23, 14),
		(24, 15),
		(25, 16),
		(26, 17),
		(27, 18),
		(28, 19),
		(29, 20);
		
select * from roles_employee;