use trial;

create table a(id int ,name varchar(30));
create table b(id int,city varchar(30));

insert into a values(1,'john');
insert into a values(2,'bob');

insert into b values(1,'LA');
insert into b values(2,'NYC');

select * from a join b on a.id=b.id;

use retail;


