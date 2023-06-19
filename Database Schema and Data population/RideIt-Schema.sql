create database RideIt;

use RideIt;

create table Driver(
	driver_id Int Primary Key,
    d_password varchar(50) Not Null,
    fname varchar(50) Not Null,
    lname varchar(50) Not Null,
    email_id varchar(50) not null,
    dob Date,
    addr_str_no int,
    addr_str_name varchar(50),
    addr_city varchar(50),
    addr_state varchar(50),
    vehicle_own_or_rent varchar(50),
    vehicle_id int,
    foreign key (vehicle_id) references Vehicle(vehicle_id) on delete set null on update cascade,
    rent_id int,
    foreign key (rent_id) references Rents(rent_id) on delete set null on update cascade,
    admin_id int,
    foreign key (admin_id) references Administration(admin_id) on delete set null on update cascade
);

create table driver_phone_no(
	driver_id int Not Null,
    foreign key (driver_id) references Driver(driver_id) on delete cascade on update cascade,
    phone_no bigint Not Null,
    PRIMARY KEY(driver_id,phone_no)
);

create table Driver_feedback(
	driver_id int Not Null,
    feedback_id int Not Null,
    foreign key (driver_id) references Driver(driver_id) on delete cascade on update cascade,
    feedback_date DATE,
    feedback_time TIME,
    feedback_content varchar(500),
    PRIMARY KEY(driver_id,feedback_id)
);

create table Customer(
	customer_id Int Primary Key,
    fname varchar(50) not null,
    lname varchar(50) not null,
    email_id varchar(50) not null,
    c_password varchar(50) not null,
    dob Date,
    haddr_str_no varchar(50),
    haddr_str_name varchar(50),
    haddr_city varchar(50),
    haddr_state varchar(50),
	waddr_str_no varchar(50),
    waddr_str_name varchar(50),
    waddr_city varchar(50),
    waddr_state varchar(50),
    membership_id Int ,
    foreign key (membership_id) references Membership(membership_id) on delete set null on update cascade,
    rent_id Int,
    foreign key (rent_id) references Rents(rent_id) on delete set null on update cascade,
	admin_id Int,
    foreign key (admin_id) references Administration(admin_id) on delete set null on update cascade
);

create table customer_phone_no(
	customer_id int not null,
    foreign key (customer_id) references Customer(customer_id) on delete cascade on update cascade,
    phone_no bigint not null,
    PRIMARY KEY(customer_id,phone_no)
);

create table Customer_feedback(
	cust_id int not null,
    feedback_id int not null,
    foreign key (cust_id) references Customer(customer_id) on delete cascade on update cascade,
    feedback_date DATE,
    feedback_time TIME,
    feedback_content varchar(500),
    PRIMARY KEY(cust_id,feedback_id)
);

create table Vehicle(
	vehicle_id Int Primary Key,
    vehicle_type varchar(50),
    brand_name varchar(50),
    model_name varchar(50),
    license_no varchar(50) not null,
    owned_or_rented varchar(50)
);

create table Membership(
	membership_id Int Primary Key,
    start_date Date,
    end_date Date
);

create table Rents(
	rent_id int primary key,
    start_date DATE,
    end_date DATE,
    rent_rate int,
    rating_given int,
    vehicle_id int,
    foreign key (vehicle_id) references Vehicle(vehicle_id) on delete set null on update cascade,
    admin_id int,
    foreign key (admin_id) references Administration(admin_id) on delete set null on update cascade
);

create table Rides(
	ride_id Int Primary Key,
    ride_date Date,
    ride_time time,
    pick_up_location varchar(100),
    destination_location varchar(100),
    ride_fare int,
    fare_mode varchar(50),
    rating_given_to_driver Int,
    rating_given_to_customer Int,
	customer_id Int,
    foreign key (customer_id) references Customer(customer_id) on delete set null on update cascade,
    driver_id Int,
    foreign key (driver_id) references Driver(driver_id) on delete set null on update cascade,
	admin_id Int,
    foreign key (admin_id) references Administration(admin_id) on delete set null on update cascade
);

create table Administration(
	admin_id Int primary key,
    office_addr_city varchar(50),
    office_addr_state varchar(50),
    region_of_control varchar(50)
);

create table Employee(
	emp_id int primary key,
    emp_fname varchar(50) not null,
    emp_lname varchar(50) not null,
    emp_role varchar(50),
    emp_salary int,
    email_id varchar(50) not null,
    dob date,
    addr_str_no int,
    addr_str_name varchar(50),
    addr_city varchar(50),
    addr_state varchar(50),
    manager_emp_id int,
    foreign key (manager_emp_id) references Employee(emp_id) on delete set null on update cascade,
    admin_id int,
    foreign key (admin_id) references Administration(admin_id) on delete set null on update cascade
);

create table employee_phone_no(
	emp_id int not null,
    foreign key (emp_id) references Employee(emp_id) on delete cascade on update cascade,
    phone_no bigint not null,
    PRIMARY KEY(emp_id,phone_no)
);