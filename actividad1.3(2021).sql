create database act1_3
go

use act1_3 
go

create table clientes(
idclientes bigint  not null primary key identity (0,1),
razonsocial varchar(50) not null,
cuit varchar(30) not null unique,
tipo varchar (30) not null,
mail varchar(40) not null,
telefono varchar(20),
celular varchar(20)
)
go

create table proyectos(
idproyecto varchar (8) not null primary key,
idclientes bigint not null foreign key references clientes(idclientes),
nombre varchar(30) not null,
Descripcion varchar (400),
CostoEstimado money not null,
F_inicio smalldatetime not null check (f_inicio <= getdate()),
F_fin smalldatetime not null,
Nomb_Encargado varchar(50) not null
)
go

create table tareas(
Idproyecto varchar(8) not null foreign key references proyectos(idproyecto),
NumTarea int not null primary key,
TareaARealizar varchar(50) not null unique,
Descripcion varchar(300),
NombSupervisor varchar(50) not null
)
go

create table colaboladores(
Idproyecto varchar(8) not null foreign key references proyectos(idproyecto),
IdColaborador int not null primary key identity(100,1),
NombreColaborador varchar(40) not null unique
)
go

create table aportes(
idcolaborador int not null foreign key references colaboladores(idcolaborador),
TipoDeAporte varchar(50) not null,
CostoEstimado money not null,
FechaDeRegistro smalldatetime not null check(FechaDeRegistro <=getdate()),
)
go