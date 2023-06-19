-- Finding how many drivers owns/rents their cars.

select vehicle_own_or_rent, count(*) from driver group by vehicle_own_or_rent;


-- Finding the driver name along with its id having avg rating >= 4 in 2022.

select driver.driver_id,CONCAT(fname,' ',lname) as driver_name,temp.avg_rating
from driver,
(select driver_id, avg(rd.rating_given_to_driver) as avg_rating
from rides as rd where year(ride_date)=2022 group by driver_id
having avg(rating_given_to_driver)>=4) as temp
where temp.driver_id=driver.driver_id;


-- finding amount of money is recieved from the all types of vehicle

select sum(rent_rate), v.vehicle_type as money_recieved
from rents as rt INNER JOIN vehicle as v
ON rt.vehicle_id=v.vehicle_id group by vehicle_type;


-- finding the list of previous trips a perticular customer had, say that customer has cust_id=72
-- information includes vehicle_type, driver_name, driver_id, rating given to driver.

select ride_id, customer_id, temp.driver_id, temp.vehicle_type, temp.driver_name, rating_given_to_driver, pick_up_location, destination_location 
from rides 
INNER JOIN 
(select driver_id, vehicle_type, CONCAT(d.fname,' ',d.lname) as driver_name
from driver as d INNER JOIN vehicle as v ON v.vehicle_id=d.vehicle_id) as temp 
ON rides.driver_id=temp.driver_id
where customer_id=72 order by rides.ride_date, rides.ride_time;


-- Listing those employee who supervise New York, Hawaii, Alaska and Iowa as region of control

select emp_id, CONCAT(e.emp_fname,' ',e.emp_lname) as emp_name, region_of_control
from employee as e, administration as adm 
where e.admin_id=adm.admin_id and adm.region_of_control in ('New York','Hawaii','Alaska','Iowa');


-- udpate the region of control, Alabama to Nashville 

update administration set region_of_control='Nashville' where region_of_control='Alabama';


-- updating the customer password (there can be a case when the customers forget their password a they want to change it)
-- in this case the customer has customer_id=72

update customer set c_password='snas2132ss' where customer_id=72;


-- a driver deleted his account from the application

delete from driver where driver_id=100;


-- printing the average rating of a perticular driver
-- in this case the driver_id = 64

select driver_id, avg(rating_given_to_driver) as current_rating
from rides as rd group by driver_id having driver_id=64;


-- show all the feedbacks of the of the drivers who drives the luxury car.

select temp.driver_id, feedback_id, feedback_content from driver_feedback,
(select driver_id from driver INNER JOIN vehicle ON driver.vehicle_id=vehicle.vehicle_id
where vehicle_type='luxury') as temp order by temp.driver_id;


-- show all the all types of vehicle rented by every customer

select customer_id, temp.vehicle_type from customer,
(select rent_id, vehicle_type from rents, vehicle where rents.vehicle_id=vehicle.vehicle_id) as temp
where customer.rent_id=temp.rent_id;
