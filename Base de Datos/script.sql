use master
go

-- Si existe la DB la borro --
if exists(Select * FROM SysDataBases WHERE name='ObligatorioDisenio1')
BEGIN
	DROP DATABASE ObligatorioDisenio1
END
go

-- Creacion de DB --
CREATE DATABASE ObligatorioDisenio1
go

 -- Uso DB creada --
USE ObligatorioDisenio1
go

--creacion de usuario IIS para que el sitio pueda acceder a la bd------------------------
USE master
GO

CREATE LOGIN [IIS APPPOOL\DefaultAppPool] FROM WINDOWS 
GO

USE ObligatorioDisenio1
GO

CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool]
GO

GRANT Execute to [IIS APPPOOL\DefaultAppPool]
go

-- Creacion de tablas --
CREATE Table Companias
(
	Nombre varchar(30) Not Null Primary Key check (len(Nombre) >= 3),
	Direccion varchar(50) Not Null check (len(Direccion) > 10),
	Telefono varchar(20) Not Null check (len(Telefono) > 3 AND Telefono not like '%[^0-9]%')
)
go 

Create Table Empleados
(
	NombUsuario varchar(8) Not Null Primary Key check (len(NombUsuario) = 8),
	Contrasenia varchar(6) Not Null check (len(Contrasenia) = 6 AND Contrasenia like '%[A-Z]%[A-Z]%[A-Z]%' AND Contrasenia like '%[0-9]%[0-9]%[0-9]%'),
	NombCompleto varchar(50) Not Null check (len(NombCompleto) > 7)
)
go

Create Table Terminales
(
	CodTerminal varchar(6) Not Null Primary Key check (CodTerminal like '[A-Z][A-Z][A-Z][A-Z][A-Z][A-Z]'),
	Ciudad varchar(40) Not Null check (len(Ciudad) >= 4), 
	Estado bit not null default 1
)
go

Create Table Internacionales
(
	CodTerminal varchar(6) Not Null Primary Key Foreign Key References Terminales(CodTerminal),
	Pais varchar(10) Not Null check (len(Pais) >= 4)
)
go

Create Table Nacionales
(
	CodTerminal varchar(6) Not Null Primary Key Foreign Key References Terminales(CodTerminal),
	Taxi bit Not Null
)
go

Create Table Viajes
(
	CodViaje int Not Null Primary Key identity(1,1),
	Precio int Not Null check (Precio > 0),
	Anden int Not Null check (Anden between 1 and 35),
	MaximoPermitido int Not Null check (MaximoPermitido between 1 and 50), 
	FechaYHoraPartida datetime Not null, -- check (FechaYHoraPartida > GETDATE()) Si se corre esto el dia de la defensa da error
	FechaYHoraArribo datetime Not null,
	NomUsuEmp varchar(8) Not Null Foreign Key References Empleados(NombUsuario),
	Compania varchar(30) Not Null Foreign Key References Companias(Nombre),
	check (FechaYHoraArribo > FechaYHoraPartida)
)
go

Create Table Recorren
(
	CodViaje int Not Null Foreign Key References Viajes (CodViaje),
	CodTerminal varchar(6) Not Null Foreign Key References Terminales (CodTerminal),
	Parada int Not Null check (Parada > 0),
	PRIMARY KEY (CodViaje, CodTerminal)
)
go
--- DATOS DE PRUEBA ---

-- Compania --
INSERT INTO Companias (Nombre, Direccion, Telefono) VALUES ('RapidBus', 'Uruguay 1234', '123456789')
INSERT INTO Companias (Nombre, Direccion, Telefono) VALUES ('Expreso', 'Av. Brasil 456', '098123456')
INSERT INTO Companias (Nombre, Direccion, Telefono) VALUES ('TurismoViaja', 'Ruta 8 Km 12', '45678901')
INSERT INTO Companias (Nombre, Direccion, Telefono) VALUES ('ChabonViajes', 'Evita Peron al 1789', '00541166778899')
INSERT INTO Companias (Nombre, Direccion, Telefono) VALUES ('IncheTransporte', 'Taquitos 6666', '00525566775544')
INSERT INTO Companias (Nombre, Direccion, Telefono) VALUES ('DestinoVeloz', 'Av. Libertador 987', '21039485')
INSERT INTO Companias (Nombre, Direccion, Telefono) VALUES ('TurisBus', 'Blvr. España 654', '56781234')
INSERT INTO Companias (Nombre, Direccion, Telefono) VALUES ('Rumbo', 'Ruta 1 Km 23', '87654321')
INSERT INTO Companias (Nombre, Direccion, Telefono) VALUES ('Bagayinho', 'Pele o mais grande 1950', '00555121729840')
INSERT INTO Companias (Nombre, Direccion, Telefono) VALUES ('HolaMundo', 'Uruguay 2421', '01928374')

select * from Terminales

-- Empleados --
INSERT INTO Empleados (NombUsuario, Contrasenia, NombCompleto) VALUES ('LuSoro19', '123abc', 'Lucia Sorozabal')
INSERT INTO Empleados (NombUsuario, Contrasenia, NombCompleto) VALUES ('Dj_Malo_', 'abc123', 'Andres Fariña')
INSERT INTO Empleados (NombUsuario, Contrasenia, NombCompleto) VALUES ('PeGarcia', 'D1e2g3', 'Pedro García')
INSERT INTO Empleados (NombUsuario, Contrasenia, NombCompleto) VALUES ('ASilva98', '1a2B3c', 'Ana Silva')
INSERT INTO Empleados (NombUsuario, Contrasenia, NombCompleto) VALUES ('RRodrig1', 'pqr123', 'Roberto Rodríguez')
INSERT INTO Empleados (NombUsuario, Contrasenia, NombCompleto) VALUES ('MLopez01', 'S567aa', 'María López')
INSERT INTO Empleados (NombUsuario, Contrasenia, NombCompleto) VALUES ('JGonzale', 'Vw89a1', 'José González')
INSERT INTO Empleados (NombUsuario, Contrasenia, NombCompleto) VALUES ('CCastro2', '2Z01xx', 'Carolina Castro')
INSERT INTO Empleados (NombUsuario, Contrasenia, NombCompleto) VALUES ('FMartine', 'AbC123', 'Fernando Martínez')
INSERT INTO Empleados (NombUsuario, Contrasenia, NombCompleto) VALUES ('LPereira', '345GHI', 'Laura Pereira')

-- Terminales --
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('MONTUY', 'Montevideo', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('PUNTUY', 'Punta del Este', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('COLOUY', 'Colonia', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('BAGAYO', 'Chuy', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('ARTIGA', 'Artigas', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('TERMAS', 'Salto', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('CERROL', 'Cerro Largo', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('TACUAR', 'Tacuarembó', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('FRAYBE', 'Fray Bentos', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('OMARGU', 'San José', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('PAYSAN', 'Paysandú', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('PILSEN', 'Durazno', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('LATURI', 'Rivera', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('DONDEE', 'Laguna Garzón', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('AVIONE', 'Melilla', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('SANJMA', 'San José de Mayo', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('PLAYIT', 'Cuchilla Alta', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('RIOVER', 'Río Verde', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('MALDON', 'Maldonado', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('PISCOP', 'Lima', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('CAMBIO', 'Buenos Aires', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('SCHILE', 'Santiago', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('RELOJE', 'Asunción', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('ROCHUY', 'Rocha', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('SINMAR', 'La Paz', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('FERNET', 'Cordoba', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('NIEVEE', 'Bariloche', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('COLOMB', 'Bogotá', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('BRCAPI', 'Brasilia', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('VENECO', 'Caracas', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('PORTOA', 'Porto Alegre', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('ENBOLA', 'Pelotas', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('RARARA', 'Tarariras', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('CAIPIR', 'Florianopolis', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('CASTIL', 'Castillos', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('ALFAJO', 'Minas', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('ORIENT', 'Treinta y Tres', 1)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('USHUAI', 'Ushuaia', 0)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('RIMAAA', 'Cobija', 0)
INSERT INTO Terminales (CodTerminal, Ciudad, Estado) VALUES ('LOSTIT', 'Los Titanes', 0)

-- Internacionales --
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('RIOVER', 'Mexico')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('PISCOP', 'Peru')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('CAMBIO', 'Argentina')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('SCHILE', 'Chile')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('RELOJE', 'Paraguay')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('RIMAAA', 'Bolivia')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('SINMAR', 'Bolivia')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('FERNET', 'Argentina')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('NIEVEE', 'Argentina')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('COLOMB', 'Colombia')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('BRCAPI', 'Brasil')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('VENECO', 'Venezuela')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('PORTOA', 'Brasil')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('ENBOLA', 'Brasil')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('CAIPIR', 'Brasil')
INSERT INTO Internacionales (CodTerminal, Pais) VALUES ('USHUAI', 'Argentina')

-- Nacionales --
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('MONTUY', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('PUNTUY', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('COLOUY', 0)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('BAGAYO', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('ARTIGA', 0)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('TERMAS', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('CERROL', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('TACUAR', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('FRAYBE', 0)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('OMARGU', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('PAYSAN', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('PILSEN', 0)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('LATURI', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('DONDEE', 0)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('AVIONE', 0)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('SANJMA', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('PLAYIT', 0)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('MALDON', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('RARARA', 0)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('CASTIL', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('LOSTIT', 0)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('ALFAJO', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('ORIENT', 1)
INSERT INTO Nacionales (CodTerminal, Taxi) VALUES ('ROCHUY', 1)

select * from Recorren where CodViaje = 3
-- Viajes --
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (350, 1, 33, CONVERT(datetime, '2023-08-13 08:00:00', 120), CONVERT(datetime, '2023-08-13 10:15:00', 120), 'DJ_Malo_', 'RapidBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (900, 2, 48, CONVERT(datetime, '2023-08-13 08:30:00', 120), CONVERT(datetime, '2023-08-13 23:00:00', 120), 'LuSoro19', 'Bagayinho')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (450, 3, 50, CONVERT(datetime, '2023-08-13 09:00:00', 120), CONVERT(datetime, '2023-08-13 11:00:00', 120), 'PeGarcia', 'Expreso')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (500, 4, 20, CONVERT(datetime, '2023-08-13 09:30:00', 120), CONVERT(datetime, '2023-08-13 11:30:00', 120), 'PeGarcia', 'TurismoViaja')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (1000, 5, 48, CONVERT(datetime, '2023-08-13 10:00:00', 120), CONVERT(datetime, '2023-08-13 12:30:00', 120), 'FMartine', 'RapidBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (600, 6, 50, CONVERT(datetime, '2023-08-13 10:30:00', 120), CONVERT(datetime, '2023-08-13 12:00:00', 120), 'FMartine', 'Expreso')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (1500, 7, 48, CONVERT(datetime, '2023-08-13 11:00:00', 120), CONVERT(datetime, '2023-08-13 12:00:00', 120), 'FMartine', 'IncheTransporte')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (450, 8, 20, CONVERT(datetime, '2023-08-14 08:00:00', 120), CONVERT(datetime, '2023-08-14 10:00:00', 120), 'PeGarcia', 'Expreso')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (800, 9, 50, CONVERT(datetime, '2023-08-14 08:30:00', 120), CONVERT(datetime, '2023-08-14 10:30:00', 120), 'PeGarcia', 'RapidBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (550, 10, 48, CONVERT(datetime, '2023-08-14 09:00:00', 120), CONVERT(datetime, '2023-08-14 09:30:00', 120), 'PeGarcia', 'DestinoVeloz')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (600, 11, 20, CONVERT(datetime, '2023-08-14 09:30:00', 120), CONVERT(datetime, '2023-08-14 15:30:00', 120), 'PeGarcia', 'IncheTransporte')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (250, 12, 20, CONVERT(datetime, '2023-08-14 10:00:00', 120), CONVERT(datetime, '2023-08-14 16:30:00', 120), 'PeGarcia', 'Expreso')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (450, 13, 48, CONVERT(datetime, '2023-08-14 10:30:00', 120), CONVERT(datetime, '2023-08-14 17:00:00', 120), 'ASilva98', 'DestinoVeloz')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (700, 14, 50, CONVERT(datetime, '2023-08-14 11:00:00', 120), CONVERT(datetime, '2023-08-14 18:30:00', 120), 'ASilva98', 'RapidBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (600, 15, 48, CONVERT(datetime, '2023-08-14 11:30:00', 120), CONVERT(datetime, '2023-08-14 18:00:00', 120), 'ASilva98', 'DestinoVeloz')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (550, 16, 48, CONVERT(datetime, '2023-08-14 12:00:00', 120), CONVERT(datetime, '2023-08-14 15:45:00', 120), 'ASilva98', 'TurismoViaja')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (450, 17, 20, CONVERT(datetime, '2023-08-14 12:30:00', 120), CONVERT(datetime, '2023-08-14 16:45:00', 120), 'CCastro2', 'DestinoVeloz')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (650, 18, 50, CONVERT(datetime, '2023-08-14 13:00:00', 120), CONVERT(datetime, '2023-08-14 14:45:00', 120), 'ASilva98', 'Expreso')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (500, 19, 20, CONVERT(datetime, '2023-08-14 13:30:00', 120), CONVERT(datetime, '2023-08-14 14:15:00', 120), 'FMartine', 'DestinoVeloz')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (800, 20, 48, CONVERT(datetime, '2023-08-14 14:00:00', 120), CONVERT(datetime, '2023-08-14 16:15:00', 120), 'FMartine', 'RapidBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (900, 21, 48, CONVERT(datetime, '2023-08-15 15:30:00', 120), CONVERT(datetime, '2023-08-15 17:45:00', 120), 'CCastro2', 'IncheTransporte')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (950, 22, 20, CONVERT(datetime, '2023-08-15 16:30:00', 120), CONVERT(datetime, '2023-08-15 19:45:00', 120), 'ASilva98', 'TurisBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (650, 23, 48, CONVERT(datetime, '2023-08-15 17:30:00', 120), CONVERT(datetime, '2023-08-15 20:45:00', 120), 'ASilva98', 'Rumbo')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (700, 24, 50, CONVERT(datetime, '2023-08-15 18:30:00', 120), CONVERT(datetime, '2023-08-15 21:30:00', 120), 'RRodrig1', 'Bagayinho')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (1450, 25, 48, CONVERT(datetime, '2023-08-15 19:30:00', 120), CONVERT(datetime, '2023-08-15 20:30:00', 120), 'RRodrig1', 'RapidBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (2000, 26, 20, CONVERT(datetime, '2023-08-15 20:30:00', 120), CONVERT(datetime, '2023-08-15 22:45:00', 120), 'FMartine', 'TurisBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (1200, 27, 48, CONVERT(datetime, '2023-08-15 21:30:00', 120), CONVERT(datetime, '2023-08-15 23:45:00', 120), 'FMartine', 'Rumbo')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (900, 28, 50, CONVERT(datetime, '2023-08-15 08:30:00', 120), CONVERT(datetime, '2023-08-15 12:45:00', 120), 'RRodrig1', 'Expreso')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (600, 29, 48, CONVERT(datetime, '2023-08-15 09:00:00', 120), CONVERT(datetime, '2023-08-15 12:15:00', 120), 'RRodrig1', 'IncheTransporte')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (550, 30, 20, CONVERT(datetime, '2023-08-16 08:30:00', 120), CONVERT(datetime, '2023-08-16 10:20:00', 120), 'RRodrig1', 'TurisBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (2000, 31, 48, CONVERT(datetime, '2023-08-16 09:00:00', 120), CONVERT(datetime, '2023-08-16 11:15:00', 120), 'CCastro2', 'RapidBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (1500, 32, 48, CONVERT(datetime, '2023-08-16 09:30:00', 120), CONVERT(datetime, '2023-08-16 12:20:00', 120), 'RRodrig1', 'TurisBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (1250, 33, 50, CONVERT(datetime, '2023-08-16 10:00:00', 120), CONVERT(datetime, '2023-08-16 16:10:00', 120), 'CCastro2', 'TurismoViaja')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (950, 34, 48, CONVERT(datetime, '2023-08-16 10:30:00', 120), CONVERT(datetime, '2023-08-16 15:45:00', 120), 'MLopez01', 'Rumbo')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (550, 35, 20, CONVERT(datetime, '2023-08-16 11:00:00', 120), CONVERT(datetime, '2023-08-16 14:45:00', 120), 'MLopez01', 'Bagayinho')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (750, 1, 20, CONVERT(datetime, '2023-08-16 11:30:00', 120), CONVERT(datetime, '2023-08-16 13:45:00', 120), 'MLopez01', 'HolaMundo')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (650, 2, 48, CONVERT(datetime, '2023-08-16 12:00:00', 120), CONVERT(datetime, '2023-08-16 15:15:00', 120), 'MLopez01', 'RapidBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (550, 3, 50, CONVERT(datetime, '2023-08-16 12:30:00', 120), CONVERT(datetime, '2023-08-16 16:45:00', 120), 'MLopez01', 'Rumbo')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (1250, 4, 48, CONVERT(datetime, '2023-08-16 13:00:00', 120), CONVERT(datetime, '2023-08-16 17:45:00', 120), 'MLopez01', 'IncheTransporte')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (2000, 5, 20, CONVERT(datetime, '2023-08-17 08:30:00', 120), CONVERT(datetime, '2023-08-17 12:45:00', 120), 'MLopez01', 'Rumbo')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (900, 6, 20, CONVERT(datetime, '2023-08-17 09:00:00', 120), CONVERT(datetime, '2023-08-17 13:10:00', 120), 'JGonzale', 'Bagayinho')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (980, 7, 48, CONVERT(datetime, '2023-08-17 09:30:00', 120), CONVERT(datetime, '2023-08-17 11:15:00', 120), 'JGonzale', 'RapidBus')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (330, 8, 48, CONVERT(datetime, '2023-08-17 10:00:00', 120), CONVERT(datetime, '2023-08-17 12:45:00', 120), 'JGonzale', 'HolaMundo')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (250, 9, 20, CONVERT(datetime, '2023-08-17 10:30:00', 120), CONVERT(datetime, '2023-08-17 13:15:00', 120), 'JGonzale', 'HolaMundo')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (1250, 10, 48, CONVERT(datetime, '2023-07-17 11:30:00', 120), CONVERT(datetime, '2023-07-17 17:45:00', 120), 'CCastro2', 'HolaMundo')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (450, 11, 50, CONVERT(datetime, '2023-07-17 12:30:00', 120), CONVERT(datetime, '2023-07-17 21:15:00', 120), 'LPereira', 'IncheTransporte')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (650, 12, 48, CONVERT(datetime, '2023-07-17 13:30:00', 120), CONVERT(datetime, '2023-07-17 18:10:00', 120), 'LPereira', 'HolaMundo')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (650, 13, 50, CONVERT(datetime, '2023-07-17 14:30:00', 120), CONVERT(datetime, '2023-07-17 19:50:00', 120), 'LPereira', 'TurismoViaja')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (750, 14, 48, CONVERT(datetime, '2023-07-17 15:30:00', 120), CONVERT(datetime, '2023-07-17 21:45:00', 120), 'DJ_Malo_', 'Bagayinho')
INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
	VALUES (800, 15, 20, CONVERT(datetime, '2023-07-17 16:30:00', 120), CONVERT(datetime, '2023-07-17 22:10:00', 120), 'LuSoro19', 'RapidBus')

-- Rerocorren --
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(1,'COLOUY',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(1,'MONTUY',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(1,'PUNTUY',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(1,'BAGAYO',4)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(2,'COLOUY',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(2,'MONTUY',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(2,'PUNTUY',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(2,'BAGAYO',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(2,'ENBOLA',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(2,'PORTOA',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(2,'CAIPIR',3)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(3,'ENBOLA',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(3,'PORTOA',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(3,'CAIPIR',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(4,'ARTIGA',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(4,'TERMAS',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(4,'CERROL',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(4,'TACUAR',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(4,'PAYSAN',5)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(4,'PILSEN',6)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(5,'ARTIGA',6)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(5,'TERMAS',5)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(5,'CERROL',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(5,'TACUAR',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(5,'PAYSAN',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(5,'PILSEN',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(6,'ALFAJO',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(6,'ORIENT',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(7,'ALFAJO',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(7,'ORIENT',2)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(8,'CAMBIO',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(8,'FERNET',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(8,'NIEVEE',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(8,'USHUAI',4)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(9,'CAMBIO',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(9,'FERNET',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(9,'NIEVEE',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(9,'USHUAI',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(10,'RIOVER',6)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(10,'PISCOP',5)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(10,'SCHILE',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(10,'RELOJE',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(10,'RIMAAA',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(10,'SINMAR',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(11,'RIOVER',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(11,'PISCOP',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(11,'SCHILE',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(11,'RELOJE',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(11,'RIMAAA',5)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(11,'SINMAR',6)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(12,'VENECO',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(12,'COLOMB',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(12,'SINMAR',3)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(13,'VENECO',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(13,'COLOMB',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(13,'SINMAR',3)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(14,'ROCHUY',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(14,'CASTIL',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(14,'BAGAYO',3)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(15,'ROCHUY',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(15,'CASTIL',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(15,'BAGAYO',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(16,'OMARGU',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(16,'PAYSAN',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(16,'PILSEN',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(17,'OMARGU',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(17,'PAYSAN',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(17,'PILSEN',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(18,'SANJMA',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(18,'AVIONE',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(18,'OMARGU',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(18,'TACUAR',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(18,'RIOVER',5)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(18,'LATURI',6)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(19,'SANJMA',6)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(19,'AVIONE',5)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(19,'OMARGU',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(19,'TACUAR',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(19,'RIOVER',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(19,'LATURI',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(20,'TACUAR',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(21,'AVIONE',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(21,'SANJMA',2)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(22,'ALFAJO',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(22,'ORIENT',2)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(23,'RARARA',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(23,'MALDON',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(23,'PLAYIT',2)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(24,'RARARA',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(24,'MALDON',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada)
VALUES(24,'PLAYIT',2)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(48,'ARTIGA',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(48,'TERMAS',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(48,'CERROL',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(48,'TACUAR',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(48,'PAYSAN',5)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(48,'PILSEN',6)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(49,'ENBOLA',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(49,'PORTOA',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(49,'CAIPIR',3)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(50,'COLOUY',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(50,'MONTUY',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(50,'PUNTUY',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(50,'BAGAYO',4)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(47,'MONTUY',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(47,'COLOUY',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(47,'TERMAS',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(47,'CERROL',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(47,'TACUAR',5)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(47,'FRAYBE',6)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(47,'PILSEN',7)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(46,'PORTOA',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(46,'COLOMB',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(46,'USHUAI',3)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(45,'CAMBIO',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(45,'SCHILE',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(45,'RIOVER',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(45,'SINMAR',4)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(44,'COLOUY',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(44,'MONTUY',3) 
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(44,'PUNTUY',2) 
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(44,'BAGAYO',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(43,'CAMBIO',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(43,'SCHILE',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(43,'RIOVER',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(43,'SINMAR',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(42,'TERMAS',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(42,'CERROL',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(42,'TACUAR',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(42,'FRAYBE',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(42,'PILSEN',5)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(41,'CAIPIR',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(41,'RARARA',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(41,'LOSTIT',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(41,'PISCOP',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(41,'DONDEE',5)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(40,'CAIPIR',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(40,'RARARA',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(40,'LOSTIT',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(39,'MONTUY',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(39,'ARTIGA',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(39,'BAGAYO',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(39,'MALDON',4)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(38,'MONTUY',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(38,'ARTIGA',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(38,'BAGAYO',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(38,'MALDON',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(37,'AVIONE',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(37,'PLAYIT',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(37,'RELOJE',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(37,'BRCAPI',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(37,'FERNET',5)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(36,'AVIONE',5)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(36,'PLAYIT',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(36,'RELOJE',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(36,'BRCAPI',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(36,'FERNET',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(35,'ROCHUY',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(35,'NIEVEE',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(35,'RIMAAA',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(34,'PUNTUY',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(34,'SANJMA',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(34,'LATURI',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(34,'TERMAS',4)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(33,'PUNTUY',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(33,'SANJMA',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(33,'LATURI',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(33,'TERMAS',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(32,'MONTUY',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(32,'OMARGU',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(31,'MONTUY',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(31,'OMARGU',2)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(30,'PORTOA',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(29,'MALDON',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(29,'RIOVER',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(29,'DONDEE',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(29,'SINMAR',4)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(28,'SANJMA',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(28,'RIOVER',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(28,'BRCAPI',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(28,'FRAYBE',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(28,'RELOJE',5)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(27,'SANJMA',5)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(27,'RIOVER',4)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(27,'BRCAPI',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(27,'FRAYBE',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(27,'RELOJE',1)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(26,'BRCAPI',1)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(26,'FRAYBE',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(26,'RELOJE',3)

INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(25,'BRCAPI',3)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(25,'FRAYBE',2)
INSERT INTO Recorren(CodViaje, CodTerminal, Parada) 
VALUES(25,'RELOJE',1)
GO

-- STORED PROCEDURES --

-- Empleado --
CREATE PROCEDURE BuscarEmpleado @NombUsuario varchar(8) 
AS
BEGIN
	SELECT *
	FROM Empleados
	WHERE NombUsuario = @NombUsuario
END
GO

/*exec BuscarEmpleado 'LuSoro19'
GO*/

CREATE PROCEDURE AltaEmpleado @NombUsuario varchar(8), @Contrasenia varchar(6), @NombCompleto varchar(50) 
AS
BEGIN
	if exists(select * from Empleados where NombUsuario = @NombUsuario)
		return -1 -- ya existe el empleado

	INSERT INTO Empleados(NombUsuario,Contrasenia,NombCompleto)  
		VALUES (@NombUsuario, @Contrasenia, @NombCompleto)
	
	IF (@@Error <> 0)
		return -2

	return 1 -- se creo el empleado con exito
END
GO

/*declare @return int
exec @return = AltaEmpleado 'Usuario1' , 'A1B2C3' , 'Nombre del Usuario' 


if(@return = -1)
	print 'EL NOMBRE DE USUARIO YA EXISTE - No se crea.'
else if(@return = -2)
	print 'NO SE PUDO CREAR EL EMPLEADO.'
else
	print'ALTA EXITOSA.'
GO*/

CREATE PROCEDURE LogueoEmpleado @NombUsuario varchar(8), @Contrasenia varchar(6) 
AS
BEGIN
	SELECT *
	FROM Empleados
	WHERE NombUsuario = @NombUsuario AND Contrasenia = @Contrasenia
END
GO

/*exec LogueoEmpleado 'Usuario1','A1B2C3' --usuario y contraseña son correctos si se corrió el SP AltaEmpleado.
GO*/

-- Compania --
CREATE PROCEDURE BuscarCompania @Nombre varchar(30) 
AS
BEGIN
	SELECT *
	FROM Companias
	WHERE Nombre = @Nombre
END
GO

/*exec BuscarCompania 'RapidBus'
GO*/

CREATE PROCEDURE AltaCompania @Nombre varchar(30), @Direccion varchar(50), @Telefono varchar(20) 
AS
BEGIN
	if exists(SELECT * FROM Companias WHERE Nombre = @Nombre)
		return -1 -- ya existe una Compañia con dicho nombre.
	
	INSERT INTO Companias(Nombre, Direccion, Telefono) 
		VALUES (@Nombre, @Direccion, @Telefono)
		
	IF (@@Error <> 0)
		return -2

	return 1 -- se creó la Compañia con éxito
END
GO

/*declare @return int
exec @return = AltaCompania 'Stark' , 'Calle Uno 1234', '099999999' -- el nombre no existe, va a crearla correctamente.

if(@return = -1)
	print 'EL NOMBRE DE LA COMPAÑIA YA EXISTE - No se crea.'
else if(@return = -2)
	print 'NO SE PUDO AGREGAR LA COMPAÑÍA.'
else
	print'ALTA EXITOSA.'
GO*/

CREATE PROCEDURE ListarCompanias 
AS
BEGIN
	SELECT *
	FROM Companias
END
GO

/*exec ListarCompanias
GO*/

-- Viajes --
CREATE PROCEDURE AltaViaje @Precio int, @Anden int, @MaximoPermitido int, @FechaYHoraPartida datetime, 
				@FechaYHoraArribo datetime, @NomUsuEmp varchar(8), @Compania varchar(30)
AS
BEGIN
	
	-- Se declaran porque no funciona si se pasa directo el dateadd dentro del between
	declare @FechaAntes datetime = DATEADD(MINUTE, -29, @FechaYHoraPartida)
	declare @FechaDespues datetime = DATEADD(MINUTE, 29, @FechaYHoraPartida)
		
	if not exists(SELECT * FROM Empleados WHERE NombUsuario = @NomUsuEmp)
		return -1 -- no existe un Empleado con ese Nombre de Usuario.
	if not exists(SELECT * FROM Companias WHERE Nombre = @Compania)
		return -2 -- no existe una Compañia con ese Nombre.
	if exists (SELECT * FROM Viajes WHERE Anden = @Anden AND FechaYHoraPartida BETWEEN @FechaAntes AND @FechaDespues)
		return -3 -- FechaYHoraPartida debe tener minimo 30 minutos de diferencia con el viaje anterior / posterior.
	
	INSERT INTO Viajes (Precio, Anden, MaximoPermitido, FechaYHoraPartida, FechaYHoraArribo, NomUsuEmp, Compania) 
		VALUES (@Precio, @Anden, @MaximoPermitido, @FechaYHoraPartida, @FechaYHoraArribo, @NomUsuEmp, @Compania)
		
	IF (@@Error <> 0)
		return -4

	return @@IDENTITY -- se creó el viaje con éxito, devuelvo CodViaje
END
GO

/*
declare @FechaYHoraPartida datetime = CONVERT(datetime, '2023-08-17 16:30:00', 120)
declare @FechaYHoraArribo datetime = CONVERT(datetime, '2023-08-17 18:10:00', 120)
-- los declaré porque daba error el CONVERT al colocarlo directamente en el exec
declare @return int
exec @return = AltaViaje 300, 15, 28, @FechaYHoraPartida, @FechaYHoraArribo, 'LuSoro19', 'RapidBus' -- da error por la hora de partida.

if(@return = -1)
	print 'NO EXISTE EL EMPLEADO - No se crea.'
else if(@return = -2)
	print 'NO EXISTE LA COMPAÑÍA - No se crea.'
else if(@return = -3)
	print 'LA FECHA Y HORA DE PARTIDA DEBE TENER MINIMO 30 MINUTOS DE DIFERENCIA CON EL VIAJE ANTERIOR/POSTERIOR DEL MISMO ANDÉN - No se crea.'
else if(@return = -4)
	print 'LA FECHA Y HORA DE ARRIBO DEBE SER MAYOR QUE LA DE PARTIDA - No se crea.'
else if(@return = -5)
	print 'NO SE PUDO CREAR EL VIAJE.'
else
	print'ALTA EXITOSA.'
GO*/

CREATE PROCEDURE ViajesSinPartir  
AS
BEGIN
	/*se mostrarán todos los viajes que aún no partieron, es decir todos los viajes cuya fecha/hora de salida sean a futuro. 
	Este listado debe estar ordenado por fecha y hora (siendo el primero en listarse el viaje más próximo a partir) */
	SELECT *
	FROM Viajes
	WHERE FechaYHoraPartida > GETDATE()
	ORDER BY FechaYHoraPartida
return
END
GO

/*exec ViajesSinPartir
GO*/

CREATE PROCEDURE ViajesDelMes   
AS
BEGIN
	SELECT *
	FROM Viajes
	WHERE DATEPART(MONTH, FechaYHoraPartida) = DATEPART(MONTH, GETDATE()) 
	AND DATEPART(YEAR, FechaYHoraPartida) = DATEPART(YEAR, GETDATE()) 
END
GO

/*exec ViajesDelMes
GO*/

-- Recorre --
CREATE PROCEDURE AgregarParada @CodViaje int, @CodTerminal varchar(6), @Parada int
AS
BEGIN
    if not exists(SELECT * FROM Viajes WHERE CodViaje = @CodViaje)
		return -1 -- El viaje no existe
	if exists(SELECT * FROM Recorren WHERE CodViaje = @CodViaje AND (Parada = @Parada or CodTerminal = @CodTerminal))
		return -2 -- el número de parada está repetido || la Terminal ingresda ya está dentro del recorrido del viaje.
	if not exists(SELECT * FROM Terminales WHERE CodTerminal = @CodTerminal AND Estado = 1)
            return -3 -- la terminal que se esta ingresando no esta activa || no existe.
		
	INSERT INTO Recorren(CodTerminal, CodViaje, Parada)
		VALUES (@CodTerminal, @CodViaje, @Parada)
		
	IF (@@Error <> 0)
		return -4
		
	return 1
END
GO

/*declare @return int
exec @return = AgregarParada 1, 'RELOJE', 9 --No se agrega por número de parada

if @return = -1)
	print 'EL VIAJE NO EXISTE - No se agrega recorrido.'
else if(@return = -2)
	print 'EL NÚMERO DE PARADA O LA TERMINAL ESTÁN REPETIDOS - No se agrega al recorrido.'
else if(@return = -3)
	print 'LA TERMINAL INGRESADA NO ESTÁ ACTIVA - No se agrega al recorrido.'
else if(@return = -4)
	print 'NO SE PUDO AGREGAR LA TERMINAL AL RECORRIDO.'
else
	print 'LA TERMINAL SE AGREGÓ CORRECTAMENTE AL RECORRIDO.'
GO*/

CREATE PROCEDURE ListarRecorridoDeUnViaje @CodViaje int   
AS
BEGIN
	SELECT *
	FROM Recorren
	WHERE CodViaje = @CodViaje
return
END
GO

/*exec ListarREcorridoDeUnViaje 1
GO*/

-- Terminales --
CREATE PROCEDURE BuscarTerminalNacional @CodTerminal varchar(6) 
AS
BEGIN
	SELECT *
	FROM Nacionales
	INNER JOIN Terminales
	ON Nacionales.CodTerminal = Terminales.CodTerminal
	WHERE Nacionales.CodTerminal = @CodTerminal
END
GO

/*exec BuscarTerminalNacional 'BAGAYO'
GO*/

CREATE PROCEDURE BuscarTerminalNacionalActiva @CodTerminal varchar(6) 
AS
BEGIN
	SELECT *
	FROM Nacionales
	INNER JOIN Terminales
	ON Nacionales.CodTerminal = Terminales.CodTerminal
	WHERE Nacionales.CodTerminal = @CodTerminal
	AND Terminales.Estado = 1
END
GO

/*exec BuscarTerminalNacionalActiva 'ALFAJO'
GO*/

CREATE PROCEDURE BuscarTerminalInternacional @CodTerminal varchar(6) 
AS
BEGIN
	SELECT *
	FROM Internacionales
	INNER JOIN Terminales
	ON Internacionales.CodTerminal = Terminales.CodTerminal
	WHERE Internacionales.CodTerminal = @CodTerminal
END
GO

/*exec BuscarTerminalInternacional 'RELOJE'
GO*/

CREATE PROCEDURE BuscarTerminalInternacionalActiva @CodTerminal varchar(6) 
AS
BEGIN
	SELECT *
	FROM Internacionales
	INNER JOIN Terminales
	ON Internacionales.CodTerminal = Terminales.CodTerminal
	WHERE Internacionales.CodTerminal = @CodTerminal
	AND Terminales.Estado = 1
END
GO

/*exec BuscarTerminalInternacionalActiva 'USHUAI'-- inactiva
GO*/

CREATE PROCEDURE AltaTerminalNacional @CodTerminal varchar(6), @Ciudad varchar(40), @Taxi bit
AS
BEGIN
	if exists(SELECT * FROM Terminales T INNER JOIN Nacionales N ON T.CodTerminal = N.CodTerminal WHERE N.CodTerminal = @CodTerminal AND Estado = 0)
	BEGIN
		BEGIN TRANSACTION
			UPDATE Terminales
			SET 
			Estado = 1,
			Ciudad = @Ciudad
			WHERE CodTerminal = @CodTerminal -- activo la terminal porque ya sé que existe y no es internaiconal.
			
			if(@@ERROR <> 0)
			BEGIN
				ROLLBACK TRAN
				return -2
			END
							
			UPDATE Nacionales
			SET 
			Taxi = @Taxi
			WHERE CodTerminal = @CodTerminal -- Actualizo dato de Nacionales.
			
			if(@@ERROR <> 0)
			BEGIN
				ROLLBACK TRAN
				return -2
			END
		COMMIT TRAN
		return 1
	END
		
	if exists(SELECT * FROM Terminales WHERE CodTerminal = @CodTerminal)
		return -1 -- existe una terminal con el CodTerminal
	
	-- Si llego hasta aca es porque no existe la terminal, la creo
	BEGIN TRANSACTION
    	INSERT INTO Terminales(CodTerminal,Ciudad)
    		VALUES(@CodTerminal,@Ciudad) -- estado default 1
    		
    	if(@@ERROR <> 0)
    	BEGIN
    		ROLLBACK TRAN
    		return -2
    	END
    		
    	INSERT INTO Nacionales(CodTerminal,Taxi)
    		VALUES(@CodTerminal,@Taxi)
    	
    	if(@@ERROR <> 0)
    	BEGIN
    		ROLLBACK TRAN
    		return -2
    	END
	
	COMMIT TRAN
	return 1
END
GO

/*declare @return int
exec @return = AltaTerminalNacional 'ELPUEB', '18 de Julio', 1

if(@return = -1)
	print 'YA EXISTE UNA TERMINAL CON DICHO CÓDIGO - No se crea.'
else if(@return = -2) 
	print 'NO SE PUDO CREAR LA TERMINAL.'
else if(@return = 1) 
	print 'ALTA EXITOSA.'*/

CREATE PROCEDURE ModificarTerminalNacional @CodTerminal varchar(6), @Ciudad varchar(40), @Taxi bit
AS
BEGIN
	if not exists(SELECT * FROM Terminales T INNER JOIN Nacionales N ON T.CodTerminal = N.CodTerminal WHERE N.CodTerminal = @CodTerminal AND Estado = 1)
		return -1 -- La terminal NACIONAL no existe / está dada de baja.
	
	BEGIN TRANSACTION
	
	UPDATE Terminales
	SET Ciudad = @Ciudad
	WHERE CodTerminal = @CodTerminal
	
	if(@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN
		return -2
	END
	
	UPDATE Nacionales
	SET Taxi = @Taxi 
	WHERE CodTerminal = @CodTerminal
	
	if(@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN
		return -2
	END
	
	COMMIT TRAN
	return 1

END
GO

/*declare @return int
exec @return = ModificarTerminalNacional 'BAGAYO', 'Chuy', 1

if(@return = -1)
	print 'NO EXISTE UNA TERMINAL NACIONAL CON DICHO CÓDIGO - No se modifica.'
else if(@return = -2) 
	print 'NO SE PUDO MODIFICAR LA TERMINAL.'
else if(@return = 1) 
	print 'MODIFICACIÓN EXITOSA.'*/

CREATE PROCEDURE AltaTerminalInternacional @CodTerminal varchar(6), @Ciudad varchar(40), @Pais varchar(10)
AS
BEGIN
	if exists(SELECT * FROM Terminales T INNER JOIN Internacionales I ON T.CodTerminal = I.CodTerminal WHERE I.CodTerminal = @CodTerminal AND Estado = 0)
	BEGIN
		BEGIN TRANSACTION
			UPDATE Terminales
			SET 
			Estado = 1,
			Ciudad = @Ciudad
			WHERE CodTerminal = @CodTerminal -- activo la terminal porque ya sé que existe y no es nacional.
			
			if(@@ERROR <> 0)
			BEGIN
				ROLLBACK TRAN
				return -2
			END
							
			UPDATE Internacionales
			SET 
			Pais = @Pais
			WHERE CodTerminal = @CodTerminal -- Actualizo dato de Internacional
			
			if(@@ERROR <> 0)
			BEGIN
				ROLLBACK TRAN
				return -2
			END
		COMMIT TRAN
		return 1
	END
	
	if exists(SELECT * FROM Terminales WHERE CodTerminal = @CodTerminal)
		return -1 -- existe una terminal con el CodTerminal
	
	BEGIN TRANSACTION
    	INSERT INTO Terminales(CodTerminal,Ciudad)
    		VALUES(@CodTerminal,@Ciudad) -- estado default 1
    		
    	if(@@ERROR <> 0)
    	BEGIN
    		ROLLBACK TRAN
    		return -2
    	END
    		
    	INSERT INTO Internacionales(CodTerminal,Pais)
    		VALUES(@CodTerminal,@Pais)
    	
    	if(@@ERROR <> 0)
    	BEGIN
    		ROLLBACK TRAN
    		return -2
    	END
	
	COMMIT TRAN
	return 1
return 
END
GO

/*declare @return int
exec @return = AltaTerminalInternacional 'SANVIC', 'Santa Vitória do Palmar', 'Brasil'

if(@return = -1)
	print 'YA EXISTE UNA TERMINAL CON DICHO CÓDIGO - No se crea.'
else if(@return = -2) 
	print 'NO SE PUDO CREAR LA TERMINAL.'
else if(@return = 1) 
	print 'ALTA EXITOSA.'*/

CREATE PROCEDURE ModificarTerminalInternacional @CodTerminal varchar(6), @Ciudad varchar(40), @Pais varchar(10)
AS
BEGIN
	if not exists(SELECT * FROM Terminales T INNER JOIN Internacionales I ON T.CodTerminal = I.CodTerminal WHERE I.CodTerminal = @CodTerminal AND Estado = 1)
		return -1 -- La terminal INTERNACIONAL no existe / está dada de baja.
	
	BEGIN TRANSACTION
	
	UPDATE Terminales
	SET Ciudad = @Ciudad
	WHERE CodTerminal = @CodTerminal
	
	if(@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN
		return -2
	END
	
	UPDATE Internacionales
	SET Pais = @Pais 
	WHERE CodTerminal = @CodTerminal
	
	if(@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN
		return -2
	END
	
	COMMIT TRAN
	return 1
END
GO

/*declare @return int
exec @return = ModificarTerminalInternacional 'RELOJE', 'Otra Ciudad de Paraguay', 'Paraguay'

if(@return = -1)
	print 'NO EXISTE UNA TERMINAL INERNACIONAL CON DICHO CÓDIGO - No se modifica.'
else if(@return = -2) 
	print 'NO SE PUDO MODIFICAR LA TERMINAL.'
else if(@return = 1) 
	print 'MODIFICACIÓN EXITOSA.'
GO*/

CREATE PROCEDURE BajaTerminal @CodTerminal varchar(6) 
AS
BEGIN
	if not exists(SELECT * FROM Terminales WHERE CodTerminal = @CodTerminal AND Estado = 1)
		return -1 -- la terminal no existe / está dada de baja
	if exists(SELECT * FROM Recorren WHERE CodTerminal = @CodTerminal)
	BEGIN
		-- BAJA LÓGICA
		UPDATE Terminales
		SET Estado = 0
		WHERE CodTerminal = @CodTerminal
		
		return 1
	END
	
	BEGIN TRANSACTION
	
		--No da error si no encuentra nada para eliminar en una de las dos (Nacional || Internacional).
		DELETE FROM Nacionales WHERE CodTerminal = @CodTerminal
		
		if(@@ERROR <> 0)
    	BEGIN
    		ROLLBACK TRAN
    		return -2
    	END
    	
		DELETE FROM Internacionales WHERE CodTerminal = @CodTerminal
    	
    	if(@@ERROR <> 0)
    	BEGIN
    		ROLLBACK TRAN
    		return -2
    	END
    	
    	DELETE FROM Terminales WHERE CodTerminal = @CodTerminal
    	
    	if(@@ERROR <> 0)
    	BEGIN
    		ROLLBACK TRAN
    		return -2
    	END
	
	COMMIT TRAN
	return 1
END
GO

/*declare @return int
exec @return = BajaTerminal 'RELOJE'

if(@return = -1)
	print 'NO EXISTE UNA TERMINAL CON DICHO CÓDIGO - No se elimina.'
else if(@return = -2) 
	print 'NO SE PUDO ELIMINAR LA TERMINAL.'
else if(@return = 1) 
	print 'ELIMINACIÓN EXITOSA.'
GO*/


CREATE PROCEDURE ListarTerminalesNacionales
AS
BEGIN
	SELECT *
	FROM Terminales
	INNER JOIN Nacionales
	ON Nacionales.CodTerminal = Terminales.CodTerminal
	WHERE Estado = 1
return
END
GO

/*exec ListarTerminalesNacionales
GO*/

CREATE PROCEDURE ListarTerminalesInternacionales
AS
BEGIN
	SELECT *
	FROM Terminales
	INNER JOIN Internacionales
	ON Internacionales.CodTerminal = Terminales.CodTerminal
	WHERE Estado = 1
return
END
GO

/*exec ListarTerminalesInternacionales
GO*/



