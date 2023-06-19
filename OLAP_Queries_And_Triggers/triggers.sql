-- creating a backup for the employee incase they rejoin the company.
delimiter \\
create trigger emp_backup_trigger 
before delete on employee
for each row
begin
insert into BackupEmployee(emp_id, emp_fname, emp_lname, emp_role, emp_salary, email_id, dob, addr_str_no, addr_str_name, addr_city, addr_state, manager_emp_id, admin_id) 
values (old.emp_id,old.emp_fname,old.emp_lname,old.emp_role,old.emp_salary, old.email_id, old.dob, old.addr_str_no, old.addr_str_name, old.addr_city, old.addr_state, old.manager_emp_id, old.admin_id);
end;

-- updating the rating of the driver and the customer after the trip.

delimiter \\
create trigger rating_trigger
after insert on rides 
for each row
begin
update customer set num_trips=num_trips+1 where customer_id=new.customer_id;
update customer set curr_rating=(curr_rating+new.rating_given_to_customer)/num_trips where customer_id=new.customer_id;
update driver set num_trips=num_trips+1 where driver_id=new.driver_id;
update driver set curr_rating=(curr_rating+new.rating_given_to_customer)/num_trips where driver_id=new.driver_id;
end;