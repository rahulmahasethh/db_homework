create database college_notice_board;
use college_notice_board;

-- Users Table
create table users(
	user_id int auto_increment primary key,
	username varchar(50) unique not null,
    user_password varchar(50) not null,
    role enum('teacher','student') not null
);

select * from users;


-- Notices Table
create table notices (
    notice_id int auto_increment primary key,
    title varchar(100) not null,
    content text not null,
    created_by int,
    created_at timestamp default current_timestamp,
    foreign key (created_by) references users(user_id)
);

select * from notices;


delimiter $$

-- 1. Register User
create procedure registeruser(
    in p_username varchar(50),
    in p_password varchar(50),
    in p_role varchar(20)
)
begin
	insert into users(username, user_password, role)
    values(p_username, p_password, p_role);
    
    select 'User Registered Successfully' AS message;
end $$

delimiter ;



-- 2. User Login
delimiter $$
create procedure userlogin(
	in p_username varchar(50),
    in p_password varchar(50)
)
begin
    select * from users
    where username = p_username and user_password = p_password;
END $$

delimiter ;


-- 4. Create Notice
delimiter $$
create procedure createnotice(
	  in p_title varchar(100),
      in p_content text,
      in p_created_by int
)
begin
    declare allowed boolean;

    call checkpermission(p_user_id, allowed);

    if allowed then
        insert into notices(title, content, created_by)
        values(p_title, p_content, p_user_id);
    else
        signal sqlstate '45000'
        set message_text = 'ERROR: Only teachers can create notices';
    end if;
end $$

delimiter ;


-- 5.viewnotices 
delimiter $$
create procedure viewnotices()
begin
	select n.notice_id,n.title,n.content,u.username AS created_by,n.created_at 
    from notices n
    join users u
    on n.created_by = u.user_id;
end $$

-- 6. Update Notice
delimiter $$
create procedure updatenotice(
    in p_user_id int,
    in p_notice_id int,
    in p_title varchar(200),
    in p_content text
)
begin
    declare allowed boolean;

    call checkpermission(p_user_id, allowed);

    if allowed then
        update notices
        set title = p_title,
            content = p_content
        where notice_id = p_notice_id;
    else
        signal sqlstate '45000'
        set message_text = 'ERROR: Only teachers can update notices';
    end if;
end $$

delimiter ;

CALL updatenotice(2, 1, 'Updated Exam Notice', 'Exam postponed by 2 days');


-- deletenotice
delimiter $$
create procedure deletenotice(
    in p_user_id int,
    in p_notice_id int
)
begin
    declare allowed boolean;

    call checkpermission(p_user_id, allowed);

    if allowed then
        delete from notices
        where notice_id = p_notice_id;
    else
        signal sqlstate '45000'
        set message_text = 'ERROR: Only teachers can delete notices';
    end if;
end $$

delimiter ;

CALL deletenotice(2, 1);

SELECT * FROM users;





