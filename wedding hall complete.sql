/*create table Hall(
ID int NOT Null,
seating_capacity int,
price money,
primary key(ID));

create table catering(
ID int not null,
silverware varchar(100),
tableware varchar(100),
price money,
primary key(ID));

create table decor(
ID int not null,
lighting varchar(100),
flowers varchar(100),
stage varchar(100),
seating varchar(100),
price money,
primary key(ID));

create table menu(
code int not null,
starter varchar(100),
entre varchar(100),
desert varchar(100),
price money,
primary key(code));

create table dance_floor(
ID int not null,
floor_type varchar(100),
price money,
primary key(ID));

create table customer(
ID int not null,
Name varchar(100),
number varchar(100),
primary key(ID));

create table Evnt(
ID int not null,
customer_ID int foreign key references customer(ID),
Hall_ID int foreign key references Hall(ID),
Decor_ID int foreign key references Decor(ID),
catering_ID int foreign key references catering(ID),
Event_date date,
price money,
primary key(ID));

insert into hall(ID,seating_capacity,price)
values(001,500,50000);
insert into hall(ID,seating_capacity,price)
values(002,1000,100000);
insert into hall(ID,seating_capacity,price)
values(003,1500,150000);

insert into menu(code,starter,entre,desert,price)
values(001,'soup','biryani','kulfi',500);
insert into menu(code,starter,entre,desert,price)
values(002,'fish and chips','mutton korma and roghni naan','trifle',1000);
insert into menu(code,starter,entre,desert,price)
values(003,'prawns','BBQ platter','tiramisu',1500);

insert into dance_floor(ID,floor_type,price)
values (01,'small',10000);
insert into dance_floor(ID,floor_type,price)
values (02,'medium',25000);
insert into dance_floor(ID,floor_type,price)
values (03,'large',50000);

insert into catering(ID,silverware,tableware,price)
values(01,'plastic','plastic',100);
insert into catering(ID,silverware,tableware,price)
values(02,'steel','ceramic',200);
insert into catering(ID,silverware,tableware,price)
values(03,'silver','bone china',300);
                            -- For Catering
create procedure Insert_Catering(
@inc_id int, @slvr varchar(100), @tblvr varchar(100), @price money)
as
begin
insert into catering
values(@inc_id , @slvr, @tblvr, @price)
end


create procedure delete_Catering(
@dec_id int)
as 
begin

if(@dec_id is null)
begin
	print 'Invalid'
end
else
	begin
		delete from catering where ID=@dec_id
	end
end



create procedure Update_Catering(@upc_id int, @slvr varchar(100), @tblvr varchar(100), @price money)
as 
begin
update catering
set Id=@upc_id, silverware=@slvr, tableware=@tblvr, price=@price
end

                             -- For Customer

create procedure Insert_Customer(
@incu_id int, @name varchar(100), @number varchar(100))
as
begin
insert into customer
values(@incu_id, @name, @number)
end

create procedure delete_Customer(
@decu_id int)
as 
begin

if(@decu_id is null)
begin
	print 'Invalid'
end
else
	begin
		delete from customer where ID=@decu_id
	end
end



create procedure Update_Customer(@upcu_id int, @name varchar(100), @number varchar(100))
as 
begin
update customer
set Id=@upcu_id, Name=@name, number=@number
end

                               --Dance Floor

create procedure Insert_Dance_Floor(
@indf_id int, @flrtp varchar(100), @price money)
as
begin
insert into dance_floor
values(@indf_id, @flrtp, @price)
end


create procedure delete_Dance_Floor(
@dedf_id int)
as 
begin

if(@dedf_id is null)
begin
	print 'Invalid'
end
else
	begin
		delete from dance_floor where ID=@dedf_id
	end
end



create procedure Update_Dance_Floor(@updf_id int, @flrtp varchar(100), @price money)
as 
begin
update dance_floor
set Id=@updf_id, floor_type=@flrtp, price=@price
end

								-- For Decor

create procedure Insert_Decor(
@id int, @liting varchar(100), @flors varchar(100), @stg varchar(100), @setng varchar(100), @price money)
as
begin
insert into decor
values(@id, @liting, @flors, @stg, @setng, @price)
end




create procedure delete_Decor(
@dedcr_id int)
as 
begin

if(@dedcr_id is null)
begin
	print 'Invalid'
end
else
	begin
		delete from decor where ID=@dedcr_id
	end
end



create procedure Update_Decor(
@updcr_id int, @liting varchar(100), @flors varchar(100), @stg varchar(100), @setng varchar(100), @price money)
as 
begin
update decor
set Id=@updcr_id, lighting=@liting, flowers=@flors, stage=@stg, seating=@setng, price=@price
end

                               -- For Event
								

create procedure Insert_Event(
@inevnt_id int, @cust_id int, @hal_id int, @dcr_id int,@catr_id int,@evnt_date date, @price money, @evnt_name varchar(100))
as
begin
insert into Evnt
values(@inevnt_id, @cust_id, @hal_id, @dcr_id, @catr_id, @evnt_date, @price, @evnt_name)
end


create procedure delete_Event(
@deevnt_id int)
as 
begin

if(@deevnt_id is null)
begin
	print 'Invalid'
end
else
	begin
		delete from Evnt where ID=@deevnt_id
	end
end



create procedure Update_Event(@upevnt_id int, @cust_id int, @hal_id int, @dcr_id int,@catr_id int,@evnt_date date, @price money, @evnt_name varchar(100))
as 
begin
update Evnt
set Id=@upevnt_id, customer_ID=@cust_id, Hall_ID=@hal_id, Decor_ID=@dcr_id, catering_ID=@catr_id, Event_date=@evnt_date, price=@price, evnt_Name=@evnt_name
end

                                 -- For Hall

create procedure Insert_Hall(
@inhl_id int, @stg_cpcty int, @price money)
as
begin
insert into Hall
values(@inhl_id, @stg_cpcty, @price)
end


create procedure delete_Hall(
@dehl_id int)
as 
begin

if(@dehl_id is null)
begin
	print 'Invalid'
end
else
	begin
		delete from Hall where ID=@dehl_id
	end
end



create procedure Update_Catering(@upctr_id int, @stng_cpst int, @price money)
as 
begin
update Hall
set Id=@upctr_id, seating_capacity=@stng_cpst, price=@price
end



create procedure Insert_Menu(
@code int, @strtr varchar(100), @entre varchar(100), @dsrt varchar(100), @price money)
as
begin
insert into menu
values(@code, @strtr, @entre, @dsrt, @price)
end


create procedure delete_Menu(
@code int)
as 
begin

if(@code is null)
begin
	print 'Invalid'
end
else
	begin
		delete from menu where code=@code
	end
end



create procedure Update_Menu(@code int, @strtr varchar(100), @entre varchar(100), @dsrt varchar(100), @price money)
as 
begin
update menu
set code=@code, starter=@strtr, entre=@entre, desert=@dsrt, price=@price

end




alter trigger afterInsert on customer
after insert
as
   declare @custId int
   declare @log_Action varchar(50)

   select @custId=i.Id from inserted i
   set @log_Action ='New Customer Inserted'

insert into customer_Log 
values(@custId,@log_Action,getdate());*/