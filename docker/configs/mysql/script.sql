use devops_app;
create table grupo4 (id int not null AUTO_INCREMENT, description varchar(255) not null, PRIMARY KEY (id));
insert into grupo4 (description) values ('vagrant'),('docker'),('mysql'),('nodejs');
