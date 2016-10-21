create sequence hibernate_sequence minvalue 1000;

create table wallets(
	wallet_id varchar(255) primary key
);

create table users(
	user_id integer primary key,
	email varchar(255) not null unique,
	name varchar(255),
	password varchar(255) not null,
	is_active boolean not null default 't',
	wallet_id varchar(255) not null references wallets(wallet_id)
);

create table addresses(
	address_id integer primary key,
	address varchar(255),
	is_primary boolean not null default 'f',
	label varchar(255),
	USD integer not null default 0,
	bitcoins integer not null default 0,
	wallet_id varchar(255) not null references wallets(wallet_id)
);

create table transactions(
	transaction_id integer primary key,
	tx_id varchar(255) not null unique,
	USD integer not null,
	bitcoin integer not null,
	confirmations integer not null,
	trans_date timestamp not null,
	sender_address_id integer not null references addresses(address_id),
	receiver_address_id integer not null references addresses(address_id),
	sender_user_id integer not null references users(user_id),
	receiver_user_id integer not null references users(user_id),
	notified_sender boolean default 'f',
	notified_receiver boolean default 'f'
);

insert into wallets(wallet_id) values ('sevak123wallet');
insert into wallets(wallet_id) values ('dipesh123wallet');
insert into wallets(wallet_id) values ('carlos123wallet');
insert into wallets(wallet_id) values ('daxesh123wallet');

insert into users(user_id, email, name, password, is_active, wallet_id) values
(1, 'sevak@gmail.com', 'Sevak', 'Sevak123', true, 'sevak123wallet');
insert into users(user_id, email, name, password, is_active, wallet_id) values
(2, 'dipesh@gmail.com', 'Dipesh', 'Dipesh123', true, 'dipesh123wallet');
insert into users(user_id, email, name, password, is_active, wallet_id) values
(3, 'carlos@gmail.com', 'Carlos', 'Carlos123', true, 'carlos123wallet');
insert into users(user_id, email, name, password, is_active, wallet_id) values
(4, 'daxesh@gmail.com', 'Daxesh', 'Daxesh123', true, 'daxesh123wallet');

insert into addresses(address_id, address, is_primary,label, USD, bitcoins, wallet_id) values
(100, 'sevakAddress123', true, 'Saving', 10000, 158800 , 'sevak123wallet');
insert into addresses(address_id, address, is_primary, label, USD, bitcoins, wallet_id) values
(101, 'sevakAddress234', false, 'Checking' , 6000, 956260 , 'sevak123wallet'); 
insert into addresses(address_id, address, is_primary,label, USD, bitcoins, wallet_id) values
(102, 'sevakAddress345', false, 'Personal',11280, 179100, 'sevak123wallet');
insert into addresses(address_id, address, is_primary,label, USD, bitcoins, wallet_id) values
(103, 'dipeshAddress123', false, 'home', 5999 , 95250, 'dipesh123wallet');
insert into addresses(address_id, address, is_primary,label, USD, bitcoins, wallet_id) values
(104, 'dipeshAddress234', false,'business' , 1010 , 16040 ,  'dipesh123wallet'); 
insert into addresses(address_id, address, is_primary,label, USD, bitcoins, wallet_id) values
(105, 'dipeshAddress345', true, 'Personal', 2888,45870, 'dipesh123wallet'); 

insert into transactions(transaction_id, tx_id, USD, bitcoin, confirmations, trans_date, sender_address_id, receiver_address_id, sender_user_id, receiver_user_id, notified_sender, notified_receiver) values
(1000, 'trans1000', 100,10, 1,TIMESTAMP '2016-08-15 15:36:38',100,104,1,2,false,false);
insert into transactions(transaction_id, tx_id, USD, bitcoin, confirmations, trans_date, sender_address_id, receiver_address_id, sender_user_id, receiver_user_id, notified_sender, notified_receiver) values
(1001, 'trans1001', 200,20, 3,TIMESTAMP '2016-08-14 20:30:38',101,105,1,2,false,false);
insert into transactions(transaction_id, tx_id, USD, bitcoin, confirmations, trans_date, sender_address_id, receiver_address_id, sender_user_id, receiver_user_id, notified_sender, notified_receiver) values
(1002, 'trans1002', 500,50, 2,TIMESTAMP '2016-07-10 9:00:30',103,102,2,1,false,false);
insert into transactions(transaction_id, tx_id, USD, bitcoin, confirmations, trans_date, sender_address_id, receiver_address_id, sender_user_id, receiver_user_id, notified_sender, notified_receiver) values
(1003, 'trans1003', 200,20, 4,TIMESTAMP '2016-06-15 10:35:32',105,100,2,1,false,false);
