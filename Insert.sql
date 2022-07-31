#Personas

INSERT INTO `universidad`.`alumnos`
(`Cedula`,
`Nombres`,
`Apellidos`,
`Celular`)
VALUES
('1040752310' ,
'Juan Camilo' ,
'Urrego Serna' ,
'3008446406' );


INSERT INTO `universidad`.`alumnos`
(`Cedula`,
`Nombres`,
`Apellidos`,
`Celular`)
VALUES
('1152716515' ,
'Sidny Yuliana' ,
'Zapata Hoyos' ,
'3012162691' );

INSERT INTO `universidad`.`alumnos`
(`Cedula`,
`Nombres`,
`Apellidos`,
`Celular`)
VALUES
('1152716514' ,
'Natalia Andrea' ,
'Rojas ' ,
'3132145676' );

INSERT INTO `universidad`.`alumnos`
(`Cedula`,
`Nombres`,
`Apellidos`,
`Celular`)
VALUES
('43756409' ,
'Dary ' ,
'Hoyos' ,
'3147140970' );

# Carreras

INSERT INTO `universidad`.`carreras`
(`Codigo`,
`Nombre`)
VALUES
('01' ,
'Ingenieria de Sistemas' );

INSERT INTO `universidad`.`carreras`
(`Codigo`,
`Nombre`)
VALUES
('02' ,
'Ingenieria Ambiental' );

INSERT INTO `universidad`.`carreras`
(`Codigo`,
`Nombre`)
VALUES
('03' ,
'Psicologia' ); 

#Matriculas

INSERT INTO `universidad`.`matriculas`
(`Carrera`,
`Alumno`,
`FechaInicio`)
VALUES
('02',
'1040752310',
'2008-07-04');

INSERT INTO `universidad`.`matriculas`
(`Carrera`,
`Alumno`,
`FechaInicio`)
VALUES
('02',
'1152716515',
'2008-07-04');


#Casilleros

INSERT INTO `universidad`.`casilleros`
(`Numero`,
`Dueño`)
VALUES
('10',
'1040752310');

#Materias

INSERT INTO `universidad`.`materias`
(`Codigo`,
`Nombre`,
`Creditos`,
`Contenido`)
VALUES
('01' ,
'Palinologia' ,
4 ,
Contenido );

INSERT INTO `universidad`.`materias`
(`Codigo`,
`Nombre`,
`Creditos`,
`Contenido`)
VALUES
('02' ,
'Geologia' ,
4 ,
Contenido );

INSERT INTO `universidad`.`materias`
(`Codigo`,
`Nombre`,
`Creditos`,
`Contenido`)
VALUES
('03',
'Cálculo diferencial',
4,
Contenido );

INSERT INTO `universidad`.`materias`
(`Codigo`,
`Nombre`,
`Creditos`,
`Contenido`)
VALUES
('04',
'Cálculo integral',
4,
Contenido );



#Grupos 

INSERT INTO `universidad`.`grupos`
(`Codigo`,
`Materia`)
VALUES
( Codigo ,
 '01' );

INSERT INTO `universidad`.`grupos`
(`Codigo`,
`Materia`)
VALUES
( Codigo ,
 '02' );

INSERT INTO `universidad`.`grupos`
(`Codigo`,
`Materia`)
VALUES
(Codigo ,
'03');

INSERT INTO `universidad`.`grupos`
(`Codigo`,
`Materia`)
VALUES
(Codigo ,
'04');

# Horarios

INSERT INTO `universidad`.`horarios`
(`Codigo`,
`Grupo`,
`Dia`,
`HoraInicial`,
`HoraFinal`,
`Bloque`,
`Salon`)
VALUES
(   '01' ,
   01 ,
   'L-W' ,
   '08:00:00',
   '10:00:00',
   '12',
   '101' );

INSERT INTO `universidad`.`horarios`
(`Codigo`,
`Grupo`,
`Dia`,
`HoraInicial`,
`HoraFinal`,
`Bloque`,
`Salon`)
VALUES
(   '02' ,
   02 ,
   'M-J' ,
   '10:00:00',
   '12:00:00',
   '11',
   '202' );

INSERT INTO `universidad`.`horarios`
(`Codigo`,
`Grupo`,
`Dia`,
`HoraInicial`,
`HoraFinal`,
`Bloque`,
`Salon`)
VALUES
(   '03' ,
   '3' ,
   'M-J' ,
   '09:00:00',
   '11:00:00',
   '21',
   '202' );

INSERT INTO `universidad`.`horarios`
(`Codigo`,
`Grupo`,
`Dia`,
`HoraInicial`,
`HoraFinal`,
`Bloque`,
`Salon`)
VALUES
(   '04' ,
   04 ,
   'w-v' ,
   '10:00:00',
   '12:00:00',
   '11',
   '312' );
#Pensums

INSERT INTO `universidad`.`pensums`
(`Codigo`,
`Carrera`,
`Materia`)
VALUES
('01',
'01',
'03');

INSERT INTO `universidad`.`pensums`
(`Codigo`,
`Carrera`,
`Materia`)
VALUES
('01',
'01',
'04');

INSERT INTO `universidad`.`pensums`
(`Codigo`,
`Carrera`,
`Materia`)
VALUES
('02',
'02',
'02');   


INSERT INTO `universidad`.`pensums`
(`Codigo`,
`Carrera`,
`Materia`)
VALUES
('02',
'02',
'03');  

INSERT INTO `universidad`.`pensums`
(`Codigo`,
`Carrera`,
`Materia`)
VALUES
('02',
'02',
'04');  

#semestre 

INSERT INTO `universidad`.`semestres`
(`Periodo`,
`Grupo`,
`Alumno`)
VALUES
('2022-1',
03,
'1040752310');

INSERT INTO `universidad`.`semestres`
(`Periodo`,
`Grupo`,
`Alumno`)
VALUES
('2022-1',
04,
'1040752310');

INSERT INTO `universidad`.`semestres`
(`Periodo`,
`Grupo`,
`Alumno`)
VALUES
('2022-1',
01,
'1152716515');

INSERT INTO `universidad`.`semestres`
(`Periodo`,
`Grupo`,
`Alumno`)
VALUES
('2022-1',
02,
'1152716515');

INSERT INTO `universidad`.`semestres`
(`Periodo`,
`Grupo`,
`Alumno`)
VALUES
('2022-1',
04,
'1152716515');
