#Personas

INSERT INTO `mydb`.`alumnos`
(`Cedula`,
`Nombres`,
`Apellidos`,
`Celular`)
VALUES
('1152716515' ,
'Sidny Yuliana' ,
'Zapata Hoyos' ,
'3012162691' );

INSERT INTO `mydb`.`alumnos`
(`Cedula`,
`Nombres`,
`Apellidos`,
`Celular`)
VALUES
('1040752310' ,
'Juan Camilo' ,
'Urrego Serna' ,
'3008446406' );

# Carreras

INSERT INTO `mydb`.`carreras`
(`Codigo`,
`Nombre`)
VALUES
('01' ,
'Ingenieria de Sistemas' );

INSERT INTO `mydb`.`carreras`
(`Codigo`,
`Nombre`)
VALUES
('02' ,
'Ingenieria Ambiental' );


#Matriculas

INSERT INTO `mydb`.`matriculas`
(`Carrera`,
`Alumno`,
`FechaInicio`)
VALUES
('02',
'1040752310',
'2008-07-04');

INSERT INTO `mydb`.`matriculas`
(`Carrera`,
`Alumno`,
`FechaInicio`)
VALUES
('02',
'1152716515',
'2008-07-04');


#Casilleras

INSERT INTO `mydb`.`casilleros`
(`Numero`,
`Dueño`)
VALUES
('10',
'1040752310');

#Materias

INSERT INTO `mydb`.`materias`
(`Codigo`,
`Nombre`,
`Creditos`,
`Contenido`,
`Alumno`)
VALUES
('01' ,
'Palinologia' ,
Creditos ,
Contenido ,
Alumno );

# Horarios

INSERT INTO `mydb`.`horarios`
(`Salon`,
`Dias`,
`HoraInicial`,
`HoraFinal`,
`Grupo`)
VALUES
('',
'M-W',
'8:0:0',
'10:0:0',
'01');