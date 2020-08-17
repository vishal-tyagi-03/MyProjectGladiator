sp_help LiveBid
sp_help CropSell

alter table LiveBid alter column TransBidId int null

alter table CropSell alter column AdminApprove int

select * from Documents

update Documents set ApproveStatus = 1 where email like 'dev@gmail.com'

select * from Farmer

create proc viewFarmer
as
select f.Name,f.Femail,f.ContactNo,f.Address,f.City,f.State,f.PIN,f.AccNo, f.IFSC, d.Aadhar,d.PAN,d.CertificateFarmer  from Farmer f inner join
Documents d on f.Femail = d.Email
where f.RegStatus = 1 and d.ApproveStatus = 1

exec viewFarmer

select * from Bidder

create proc viewBidder
as
select b.Name,b.Bemail,b.ContactNo,b.Address,b.City,b.State,b.PIN,b.AccNo,b.IFSC, d.Aadhar,d.PAN,d.TraderLi  from Bidder b inner join
Documents d on b.Bemail = d.Email
where b.RegStatus = 1 and d.ApproveStatus = 1

exec viewBidder

create proc farmerApproval(@email nvarchar(50))
as
update Farmer set RegStatus = 0 where  Femail = @email


update Farmer set RegStatus = 0 where name like 'ramu' 

update Documents set ApproveStatus = 0 where email like 'ramu@gmail.com' 

create proc farmerDocApproval(@email nvarchar(50))
as
update Documents set ApproveStatus = 1 where Email = @email

create proc bidderApproval(@email nvarchar(50))
as
update Bidder set RegStatus = 1 where Bemail = @email

create proc bidderDocApproval(@email nvarchar(50))
as
update Documents set ApproveStatus = 1 where Email = @email



create proc farmerDecline(@email nvarchar(50))
as
delete from Farmer where femail = @email 

create proc farmerDocDecline(@email nvarchar(50))
as
delete from Documents where Email = @email

create proc bidderDecilne(@email nvarchar(50))
as
delete from Bidder where Bemail = @email

create proc bidderDocDecline(@email nvarchar(50))
as
delete from Documents where Email = @email

insert into Farmer values('Ramu','ramu@gmail.com','7854125478','dsfi','ugdu','duihi','7854','sfu','abfb','shiu',0)

create proc viewFarmerApproval
as
select f.Name,f.Femail,f.ContactNo,f.Address,f.City,f.State,f.PIN,f.AccNo, f.IFSC, d.Aadhar,d.PAN,d.CertificateFarmer  from Farmer f inner join
Documents d on f.Femail = d.Email
where f.RegStatus = 0 and d.ApproveStatus = 0

create proc viewBidderApproval
as
select b.Name,b.Bemail,b.ContactNo,b.Address,b.City,b.State,b.PIN,b.AccNo,b.IFSC, d.Aadhar,d.PAN,d.TraderLi  from Bidder b inner join
Documents d on b.Bemail = d.Email
where b.RegStatus = 0 and d.ApproveStatus = 0

select * from Documents


select * from Documents