create table admin(
	admin_id int auto_increment primary key,
	admin_email varchar(50) not null,
	admin_pwd varchar(50) not null,
	admin_name varchar(50)
);

insert into admin(admin_email, admin_pwd, admin_name) values('admin@gmail.com', 'admin','Test');

create table providers(
	providers_id int auto_increment primary key,
	name varchar(50) not null,
	contact varchar(10) not null,
	email varchar(100) not null,
	description varchar(100) not null,
	addr1 varchar(50) not null,
	addr2 varchar(50) not null,
	city varchar(50) not null,
	password varchar(50) not null,
	category varchar(50) not null,
	status varchar(10) not null default 'Inactive'
);

INSERT INTO providers(name,contact,email, description,addr1,addr2,city,password,category) values
('Aishwarya Rai','9823374979','aish007@gmail.com','We specialize in briadal makeup','Ganesh Vision','Akurdi','Pune','test','Beautician'),
('Madhuri Dixit','8823374979','mdnene1974@gmail.com','We provide all types of beauty services at resanable price','Aishwaryam','Akurdi','Pune','test','Beautician'),
('Rani Mukerji','7823374979','rm2000@gmail.com','Try once our beauty treatments once, you will try it again','Aishwaryam','Akurdi','Pune','test','Beautician'),
('Hema Malini','6823374979','dreamgirl@gmail.com','We specialize in birdal makeovers','Swapna Majusha','Chinchwad','Pune','test','Beautician');

create table services(
	service_id int auto_increment primary key,
	service_name varchar(100) not null,
	service_cost float not null,
	providers_id int references providers(providers_id) on delete cascade
);

insert into services(service_name, service_cost, providers_id) values
('Facial', 350, 1),
('Hand Waxing', 400, 1),
('Full Body Waxing', 1500, 1),
('Eyebrow Threading', 200, 1);


create table customer(
	customer_id int auto_increment primary key,
	name varchar(50) not null,
	email varchar(50) not null,
	contact varchar(10) not null,
	addr1 varchar(50) not null,
	addr2 varchar(50) not null,
	city varchar(50) not null,
	password varchar(50) not null,
	status varchar(10) not null default 'Inactive'
);

insert into customer(name, email, contact, addr1, addr2, city, password) values
('Ameya Desai','ameya2003@gmail.com','7889786756','Aishwaryam Ventures','Akurdi','Pune','test'),
('Laksh Bhosale','lakshu1998@gmail.com','8889786776','Chintamani Hos Soc','Chinchwad Goan','Pune','test'),
('Amit Shinde','shinde.amit@gmail.com','8119786776','Daulat Bldg','Khadki','Pune','test'),
('Ram Satpute','ram1998@gmail.com','6889786776','Shreeram Hos Soc','Hinjewadi','Pune','test');


create table booking(
	booking_id int auto_increment primary key,
	booking_date date not null default current_date,
	service_date date not null,
	service_time time not null,
	customer_id int references customer(customer_id) on delete cascade,
	providers_id int references providers(providers_id) on delete cascade,
	booking_status varchar(20) not null default 'Pending',
	payment_status varchar(20) not null default 'Pending'
);

create table payment(
	payment_id int auto_increment primary key,
	payment_date date not null,
	payment_amount float not null,
	booking_id int references booking(booking_id) on delete cascade,
	card_no varchar(20) not null,
	card_holder varchar(50) not null,
	feedback varchar(200) not null
);

create table feedback(
	feedback_id int auto_increment primary key,
	feedback_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	feedback_msg text,
	user_name varchar(50),
	emailid varchar(100)
);

