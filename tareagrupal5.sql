/*parte 1 crear entorno de trabajo*/

CREATE SCHEMA horario;
USE horario;

CREATE USER 'usuario2'@'localhost' IDENTIFIED BY 'Contrasegna.1';
GRANT ALL PRIVILEGES ON horario . * TO 'usuario2'@'localhost';

/*parte 2 crear tablas*/
create table usuario (
	id_usuario INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	contraseña VARCHAR(50),
    zona_h VARCHAR(20) NOT NULL DEFAULT 'UTC-3',
	gender VARCHAR(50),
	telefono VARCHAR(50),
    PRIMARY KEY (id_usuario)
);

CREATE TABLE fechahora
(
	id_ingreso INT NOT NULL AUTO_INCREMENT,
	id_usuario INT NOT NULL,
	fecha_hora_ingreso TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY(id_ingreso),
    INDEX (id_usuario),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

/*parte 3 alterar tabla usuario*/

ALTER TABLE usuario
	CHANGE COLUMN zona_h zona_h VARCHAR(20) NOT NULL DEFAULT 'UTC-2';

/*parte 3.5 que no se si es necesaria: alterar la zona horaria que da fecha_hora_ingreso*/

ALTER TABLE contacto 
	CHANGE COLUMN fecha_hora_ingreso fecha_hora_ingreso TIMESTAMP NOT NULL DEFAULT (DATE_ADD(NOW(), INTERVAL 2 HOUR));



/*parte 4 poblar tablas*/

insert into usuario (id_usuario, nombre, apellido, contraseña, zona_h, gender, telefono) values (1, 'Chelsea', 'Clewley', 'o97IdtqWn', 'UTC-3', 'Agender', '5273215936');
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_h, gender, telefono) values (2, 'Ezri', 'Mapham', 'iwhd9cmKg', 'UTC-3', 'Male', '2594868588');
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_h, gender, telefono) values (3, 'Theda', 'Debling', 'O1QNOW', 'UTC-3', 'Female', '4127930089');
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_h, gender, telefono) values (4, 'Shurlock', 'Camier', 'KCDtCTaVdE', 'UTC-3', 'Male', '7178297353');
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_h, gender, telefono) values (5, 'Bret', 'Humphrey', 'XqTtjzkv7gO', 'UTC-3', 'Male', '8953581823');
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_h, gender, telefono) values (6, 'Barnabas', 'Klempke', 'fEAoFwpep3py', 'UTC-3', 'Male', '4989709985');
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_h, gender, telefono) values (7, 'Livvyy', 'Revington', '8COUuoG2rukP', 'UTC-3', 'Female', '4947980745');
insert into usuario (id_usuario, nombre, apellido, contraseña, zona_h, gender, telefono) values (8, 'Marilin', 'Jovicic', '5wUTriaSDc', 'UTC-3', 'Female', '2056238839');

insert into fechahora (id_usuario) values (1);
insert into fechahora (id_usuario) values (2);
insert into fechahora (id_usuario) values (3);
insert into fechahora (id_usuario) values (4);
insert into fechahora (id_usuario) values (5);
insert into fechahora (id_usuario) values (7);
insert into fechahora (id_usuario) values (2);
insert into fechahora (id_usuario) values (3);

/*parte 5 justificando tipos de datos*/

/* 
En los lugares que se ocupan INT son para poder ingresar números enteros, y para hacerlo autoincremental (AUTO-INCREMENT)

Por lo tanto, el ID usuario tambien es INT para hacer la busqueda mucho más rápida.

Ocupamos VARCHAR(), ya que así se puede agregar números y letras, con mayor campos para ingresar información.

TIMESTAMP NOT NULL DEFAULT (DATE_ADD(NOW(), INTERVAL 2 HOUR)),  nos permite cambiar la hora de manera automática con el intervalo de 2 horas.
*/

/*parte 6 tabla contactos*/

CREATE TABLE contacto
(
	id_contacto INT NOT NULL AUTO_INCREMENT,
	id_usuario INT NOT NULL,
    telefono VARCHAR(50),
    email VARCHAR(50),
    PRIMARY KEY(id_contacto)
);

/*parte 7 editar para formar relacion*/

ALTER TABLE contacto 
	ADD FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario);