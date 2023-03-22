-- Restaurant Owners
-- 5 Tables
-- 1x Fact, 4x Dimention
-- how to add foreign key
-- 1x subquery/ with

.mode markdown
.header on

-- fact table 
create table orders(
    order_id int primary key,
    order_date DATE,
    menu_id int,
    staff_id int,
    customer_id int,
    amount real,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (staff_id) REFERENCES staffs(staff_id),
FOREIGN KEY (menu_id) REFERENCES menus(menu_id))
;

insert into orders values
    (1,"2023-02-15",1,1,1,150),
    (2,"2023-02-15",5,1,1,200),
    (3,"2023-02-15",3,1,1,120),
    (4,"2023-02-15",5,1,2,200),
    (5,"2023-02-15",2,1,2,100),
    (6,"2023-02-15",4,3,3,80),
    (7,"2023-02-15",5,3,2,200),
    (8,"2023-02-15",1,3,1,150),
    (9,"2023-02-15",5,3,1,200),
    (10,"2023-02-15",3,3,1,120),
    (11,"2023-02-14",1,2,4,150),
    (12,"2023-02-14",5,1,5,200),
    (13,"2023-02-14",3,2,6,120),
    (14,"2023-02-14",1,2,7,150),
    (15,"2023-02-14",2,2,1,100),
    (16,"2023-02-13",4,3,1,80),
    (17,"2023-02-13",5,3,4,200),
    (18,"2023-02-13",1,2,5,150),
    (19,"2023-02-13",5,2,3,200),
    (20,"2023-02-12",3,1,6,120),
    (21,"2023-02-12",1,2,1,150),
    (22,"2023-02-12",5,3,2,200),
    (23,"2023-02-12",3,3,5,120),
    (24,"2023-02-11",5,3,3,200),
    (25,"2023-02-11",2,3,6,100),
    (26,"2023-02-11",4,3,7,80),
    (27,"2023-02-10",5,2,4,200),
    (28,"2023-02-10",1,1,1,150),
    (29,"2023-02-09",5,3,5,200),
    (30,"2023-02-09",3,1,7,120);

-- dimention table
create table customers(
    customer_id int primary key,
    firstname TEXT,
    lastname TEXT,
    memberpoint int,
    branch_id int,
    contact int,
FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

insert into customers values
    (1,"Claire","Gute",1200,1,0970366734),
    (2,"Pete","Kriz",240,1,0905854794),
    (3,"Sean","Donnell",360,1,0975648448),
    (4,"Brosina","Hoffman",360,1,0888035823),
    (5,"Andrew","Allen",1200,1,0975100377),
    (6,"Irene","Maddox",1200,2,0858925605),
    (7,"Harold ","Pawlan",1200,2,0856697580);
    
create table staff(
    staff_id int primary key,
    firstname TEXT,
    lastname TEXT,
    startdate date,
    branch_id int,
FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

insert into staff values
    (1,"Ted","Butterfield","2023-01-03",1),
    (2,"Kunst","Miller","2023-01-04",1),
    (3,"Brendan","Sweed","2023-02-10",2);
    
create table menus(
    menu_id int primary key,
    menuname TEXT,
    costs int
);

insert into menus values
    (1,"Tonyumkung",150),
    (2,"Crispyfried",100),
    (3,"Padthai",120),
    (4,"Thaifried",80),
    (5,"Grilledchicken",200);
    
create table branch(
    breanch_id int primary key,
    country TEXT,
    province TEXT
);
insert into branch values
    (1,"Thailand","Bangkok"),
    (2,"Thailand","Changmai");

-- top 5 the most order customer

/*SELECT 
	ord.order_date,
    cus.firstname,
    cus.lastname,
    sum(ord.amount) total,
        bra.province
FROM orders ord
join customers cus ON ord.customer_id = cus.customer_id
JOIN branch bra on bra.breanch_id =cus.branch_id
GROUP by cus.firstname 
ORDER by total DESC
limit 5*/


-- top 3 menus ordered in the restaurant--

/*SELECT
    menuname,
    count(ord.amount) as n
from orders as ord
join menus  on ord.menu_id = menus.menu_id
group by menuname
order by n desc
limit 3*/

-- Show the top seller staff from top to lowest performance?
WITH sub_q AS(
  SELECT 
  	stf.staff_id as id,
    stf.firstname || ' ' || stf.lastname AS staff_name,
  	men.menuname AS menu_count
      FROM   staff AS stf
    JOIN orders AS ord  ON ord.staff_id == stf.staff_id
  	JOIN menus AS men 	ON ord.menu_id == men.menu_id
)

SELECT 
	id,
    staff_name,
    menu_count,
  	count (*) AS number_of_order
FROM sub_q
GROUP BY 1
ORDER BY 4 desc 
;
