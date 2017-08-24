drop database if exists Formulariob;
create database Formulariob;
use Formulariob;
create table datos(
idp int(12) not null auto_increment primary key,
    nombre varchar (20) not null,
    apat varchar (20) not null,
    amat varchar (20) not null,
	escuela nvarchar (20) not null
);

drop procedure  if exists Llenarpersona;

delimiter **
create procedure LlenarPersona (in nombre varchar(20) , in  apat varchar(20) , in  amat varchar(20) , in escuela nvarchar(20))
begin

	declare ID int;
    
    set ID = (SELECT IFNULL(MAX(idp),0)+1 FROM datos);
    
	insert into datos (idp, nombre, apat , amat , escuela)
	values (ID,nombre,apat,amat,escuela);
end;
**

delimiter ;

/*Mandar a llamar un procedimiento*/
call LlenarPersona ('Daniela' , 'Quintana' , 'Montaño' , 'Batiz');
select * from datos;
