create database ContactBook;
use ContactBook;

create table Contacts (
    contact_id int auto_increment primary key,
    name varchar(100),
    phone char(10),
    email varchar(100),
    city varchar(50)
);

select * from contacts;




delimiter $$
create procedure add_contact(in p_name varchar(100),in p_phone char(10),in p_email varchar(100),in p_city varchar(50)
)
begin
    if p_name = '' or p_phone = '' then
        select 'Error: Name or Phone cannot be empty' as Message;
    else
        insert into Contacts(name, phone, email, city)
        values (p_name, p_phone, p_email, p_city);
        select contact_id, 'Contact added successfully' as Message
        from Contacts
        where contact_id = last_insert_id();
    end if;
end $$
delimiter ;

call add_contact("rahul", 9848404848, "rahulm@gmail.com","ktm");




delimiter $$
create procedure search_contact(
    in p_partial_name varchar(100)
)
begin
    select * from contacts
    where name like concat('%', p_partial_name, '%');
end $$
delimiter ;

call search_contact('ram');


delimiter $$
create procedure update_phone(
    in p_contact_id int,
    in p_new_phone varchar(20)
)
begin
    if exists (
        select * from contacts
        where contact_id = p_contact_id
    ) then
        update contacts
        set phone = p_new_phone
        where contact_id = p_contact_id;
        select 'phone updated successfully' as message;
    else
        select 'contact not found' as message;
    end if;
end $$
delimiter ;

call update_phone(1, '9848404848');




delimiter $$
create procedure delete_contact(
    in p_contact_id int
)
begin
    if exists (
        select * from contacts
        where contact_id = p_contact_id
    ) then
        delete from contacts
        where contact_id = p_contact_id;
        select 'contact deleted successfully' as message;
    else
        select 'error: contact not found' as message;
    end if;
end $$
delimiter ;

call delete_contact(1);