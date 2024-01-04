create database real_estate;
use real_estate;

create table year (
  year_id int auto_increment,
  `year` varchar(4),
  PRIMARY KEY (`year_id`)
);


create table fha_avg_interest (
  id int auto_increment,
  year_id int,
  interest_rate float,
  primary key (id),
  CONSTRAINT `year_ref` FOREIGN KEY (`year_id`) REFERENCES `year` (`year_id`)
);

create table fha_avg_mortgage (
  id int auto_increment,
  year_id int,
  mortgage_amount float,
  primary key (id),
  CONSTRAINT `year_ref_mortgage` FOREIGN KEY (`year_id`) REFERENCES `year` (`year_id`) 
);

create table counties (
	county_id INT PRIMARY KEY AUTO_INCREMENT,
    county_name VARCHAR(50) UNIQUE
);


/* decived to merge with cdbg_grant table as they repeat the same id, county_id, and year_id
create table income_avg (
  id int primary key auto_increment,
  county_id int, 
  year_id int, -- year_id?
  extremely_low int,
  very_low int,
  low int,
  unique (county_id,year_id),
  CONSTRAINT `year_ref_income` FOREIGN KEY (`year_id`) REFERENCES `year` (`year_id`),
  CONSTRAINT `county_ref_income` FOREIGN KEY (`county_id`) REFERENCES `counties` (`county_id`)
); */

create table cdbg_grant (
  id int auto_increment,
  county_id int,
  year_id int,
  value int,
  extremely_low int,
  very_low int,
  low int,
  primary key (id),
  unique (county_id,year_id),
  CONSTRAINT `cdbg_ref` FOREIGN KEY (`county_id`) REFERENCES `counties` (`county_id`),
  CONSTRAINT `cdbg_ref_year` FOREIGN KEY (`year_id`) REFERENCES `year` (`year_id`)
);

-- insert year as its only 5 
insert into year (year)
values (2018),
	   (2019),
       (2020),
       (2021),
       (2022);

-- insert fha_avg_interest
insert into fha_avg_interest (year_id,interest_rate)
values (1,4.471869205099044),
	   (2,4.374229740564477),
       (3,4.374229740564477),
       (4,3.1106115082218513),
       (5,4.80621418096669);

-- insert counties
insert into counties (county_id,county_name)
values (1,'Aguadilla'),
            (2,'Arecibo'),
            (3,'Bayamon'),
            (4,'Cabo Rojo'),
            (5,'Caguas'),
            (6,'Canovanas'),
            (7,'Carolina'),
            (8,'Cayey'),
            (9,'Cidra'),
            (10,'Fajardo'),
            (11,'Guayama'),
            (12,'Guaynabo'),
            (13,'Humacao'),
            (14,'Isabela'),
            (15,'Juana Diaz'),
            (16,'Manati'),
            (17,'Mayaguez'),
            (18,'Ponce'),
            (19,'Rio Grande'),
            (20,'San German'),
            (21,'San Juan'),
            (22,'San Sebastian'),
            (23,'Toa Alta'),
            (24,'Toa Baja'),
            (25,'Trujillo Alto'),
            (26,'Vega Baja');
       
select * from year;
select * from counties;
select * from fha_avg_interest;
select * from fha_avg_mortgage; -- inserted using table import from file avg_interest.json

select * from cdbg_grant;-- inserted using table import from file il_cdbg.csv