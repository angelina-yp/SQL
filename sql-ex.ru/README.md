## [SQL exercises](https://sql-ex.ru/exercises/index.php?act=learn&Lang=1#resPlace)
## **[Database Schema](https://sql-ex.ru/help/select13.php#db_1)**
Short database description "Computer firm"

The database scheme consists of four tables:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, screen, price)
Printer(code, model, color, type, price)
The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

### Ex.1: Find the model number, speed and hard drive capacity for all the PCs with prices below $500. Result set: model, speed, hd.

```sql
SELECT DISTINCT model, speed, hd FROM PC WHERE  price < 500;
```

### Ex.2: List all printer makers. Result set: maker.

```sql
SELECT DISTINCT maker FROM Product WERE type = 'Printer';
```
### Ex.3: Find the model number, RAM and screen size of the laptops with prices over $1000.
```sql
SELECT DISTINCT model, ram, screen FROM Laptop WHERE price > 1000;
```
### Ex.4: Find all records from the Printer table containing data about color printers.
```sql
SELECT * FROM Printer WHERE color= 'y';
```

### Ex.5: Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
```sql
SELECT DISTINCT model, speed, hd  FROM PC WHERE (CD = '24x' OR CD = '12x') AND price < 600;
```
### Ex.6: For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops. Result set: maker, speed.
```sql
SELECT DISTINCT maker, speed FROM Laptop JOIN Product ON Laptop.model = Product.model WHERE hd>=10;
```
### Ex.7: Get the models and prices for all commercially available products (of any type) produced by maker B.
```sql
SELECT * FROM 
(SELECT model, price  FROM PC  UNION
 SELECT model, price  FROM Laptop UNION
 SELECT model, price  FROM Printer ) 
 AS tab
WHERE tab.model IN 
(SELECT model  FROM Product  WHERE maker = 'B' );
```
### Ex.8: Find the makers producing PCs but not laptops.
```sql
1)
SELECT maker FROM (
SELECT maker FROM Product WHERE type='PC'
EXCEPT
SELECT maker FROM Product WHERE type ='Laptop'
) x GROUP BY maker
```

```sql
2)
SELECT maker FROM Product WHERE type = 'PC' AND maker NOT IN (SELECT maker FROM Product WHERE type = 'Laptop') GROUP BY maker;
```
### Ex.9: Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.

```sql
SELECT DISTINCT maker FROM PC JOIN Product ON PC.model = Product.model WHERE speed>=450;
```
### Ex.10: Find the printer models having the highest price. Result set: model, price.

```sql
SELECT model, price FROM Printer																
WHERE price IN (SELECT MAX(price) FROM Printer)	;
```

### Ex.11: Find out the average speed of PCs.
```sql
SELECT AVG(speed) AS AVG_speed FROM PC;
```
### Ex.12: Find out the average speed of the laptops priced over $1000.
```sql
SELECT AVG(speed) AS AVG_speed FROM Laptop
WHERE price > 1000;
```
### Ex.13: Find out the average speed of the PCs produced by maker A.
```sql
SELECT AVG(speed) AS AVG_speed FROM PC
WHERE model IN 
(SELECT model FROM Product WHERE maker =  'A' )
```
