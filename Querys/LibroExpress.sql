DROP DATABASE IF EXISTS libro_express;
CREATE DATABASE libro_express;
USE libro_express;

CREATE TABLE tb_clientes (
  id_cliente VARCHAR(36) PRIMARY KEY DEFAULT UUID(),
  nombre_cliente VARCHAR(50) NOT NULL,
  email_cliente VARCHAR(100) NOT NULL,
  telefono VARCHAR(10) NOT NULL
);


CREATE TABLE tb_prestamos (
  id_prestamo VARCHAR(36) PRIMARY KEY DEFAULT UUID(),
  id_cliente VARCHAR(36) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_devolucion DATE NOT NULL,
  estado ENUM('Activo', 'Inactivo') NOT NULL,
  CONSTRAINT fk_prestamo_cliente
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
    ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE tb_generos_libros (
  id_genero_libro VARCHAR(36) PRIMARY KEY DEFAULT UUID(),
  nombre_genero_libro VARCHAR(50) NOT NULL
);

CREATE TABLE tb_libros (
  id_libro VARCHAR(36) PRIMARY KEY DEFAULT UUID(),
  titulo_libro VARCHAR(50) NOT NULL,
  anio_publicacion INT NOT NULL,
  id_genero_libro VARCHAR(36) NOT NULL,
  estado ENUM('Disponible', 'Prestado') NOT NULL,
  CONSTRAINT fk_libro_genero
    FOREIGN KEY (id_genero_libro) REFERENCES tb_generos_libros(id_genero_libro)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tb_detalles_prestamos (
  id_detalle_prestamo VARCHAR(36) PRIMARY KEY DEFAULT UUID(),
  id_prestamo VARCHAR(36) NOT NULL,
  id_libro VARCHAR(36) NOT NULL,
  CONSTRAINT fk_detalle_prestamo
    FOREIGN KEY (id_prestamo) REFERENCES tb_prestamos(id_prestamo)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_detalle_libro
    FOREIGN KEY (id_libro) REFERENCES tb_libros(id_libro)
    ON DELETE CASCADE ON UPDATE CASCADE
);


/*Trigger*/
DELIMITER //
CREATE TRIGGER actualizar_estado_libro
AFTER INSERT ON tb_detalles_prestamos
FOR EACH ROW
BEGIN
    UPDATE tb_libros
    SET estado = 'Prestado'
    WHERE id_libro = NEW.id_libro;
END //
DELIMITER ;
 
/* Proceso de almacenamiento de la tabla clientes*/
DELIMITER //
 
CREATE PROCEDURE agregar_cliente(nombre_cliente VARCHAR(50), email_cliente VARCHAR(100), telefono VARCHAR(10))
BEGIN
 
    INSERT INTO tb_clientes(nombre_cliente, email_cliente, telefono) VALUES (nombre_cliente, email_cliente, telefono);
 
END //
 
DELIMITER ;

CALL agregar_cliente('John Doe', 'johndoe@example.com', '1234567890');
CALL agregar_cliente('Jane Smith', 'janesmith@example.com', '9876543210');
CALL agregar_cliente('Michael Johnson', 'michaeljohnson@example.com', '5551234567');
CALL agregar_cliente('Emily Davis', 'emilydavis@example.com', '7894561230');
CALL agregar_cliente('David Wilson', 'davidwilson@example.com', '3216549870');
CALL agregar_cliente('Jessica Thompson', 'jessicathompson@example.com', '9998887776');
CALL agregar_cliente('Daniel Garcia', 'danielgarcia@example.com', '4445556667');
CALL agregar_cliente('Sophia Rodriguez', 'sophiarodriguez@example.com', '2223334445');
CALL agregar_cliente('Matthew Martinez', 'matthewmartinez@example.com', '1112223334');
CALL agregar_cliente('Olivia Hernandez', 'oliviahernandez@example.com', '7778889991');
CALL agregar_cliente('Andrew Lopez', 'andrewlopez@example.com', '6665554442');
CALL agregar_cliente('Isabella Gonzalez', 'isabellagonzalez@example.com', '8889990003');
CALL agregar_cliente('Ethan Perez', 'ethanperez@example.com', '4443332221');
CALL agregar_cliente('Ava Torres', 'avatorres@example.com', '6667778889');
CALL agregar_cliente('James Flores', 'jamesflores@example.com', '1119998887');
 
/* Proceso de almacenamiento de la tabla prestamos*/
DELIMITER //
 
CREATE PROCEDURE agregar_prestamo(nombreCliente VARCHAR(50), fecha_inicio DATE, fecha_devolucion DATE, estado ENUM('Activo','Inactivo'))
BEGIN
    DECLARE cliente_id BINARY(36);
    -- Encierra la consulta SELECT entre paréntesis
    SET cliente_id = (SELECT id_cliente FROM tb_clientes WHERE nombre_cliente = nombreCliente);
    INSERT INTO tb_prestamos(id_cliente, fecha_inicio, fecha_devolucion, estado) VALUES (cliente_id, fecha_inicio, fecha_devolucion, estado);
END //
 
DELIMITER ;

CALL agregar_prestamo('John Doe', '2024-02-01', '2024-03-01', 'Activo');
CALL agregar_prestamo('Jane Smith', '2024-02-15', '2024-03-15', 'Activo');
CALL agregar_prestamo('Michael Johnson', '2024-03-01', '2024-04-01', 'Activo');
CALL agregar_prestamo('Emily Davis', '2024-02-10', '2024-03-10', 'Activo');
CALL agregar_prestamo('David Wilson', '2024-02-20', '2024-03-20', 'Activo');
CALL agregar_prestamo('Jessica Thompson', '2024-02-05', '2024-03-05', 'Activo');
CALL agregar_prestamo('Daniel Garcia', '2024-02-25', '2024-03-25', 'Activo');
CALL agregar_prestamo('Sophia Rodriguez', '2024-02-08', '2024-03-08', 'Activo');
CALL agregar_prestamo('Matthew Martinez', '2024-02-18', '2024-03-18', 'Activo');
CALL agregar_prestamo('Olivia Hernandez', '2024-02-03', '2024-03-03', 'Activo');
CALL agregar_prestamo('Andrew Lopez', '2024-02-28', '2024-03-28', 'Activo');
CALL agregar_prestamo('Isabella Gonzalez', '2024-02-12', '2024-03-12', 'Activo');
CALL agregar_prestamo('Ethan Perez', '2024-02-07', '2024-03-07', 'Activo');
CALL agregar_prestamo('Ava Torres', '2024-02-27', '2024-03-27', 'Activo');
CALL agregar_prestamo('James Flores', '2024-02-14', '2024-03-14', 'Activo');
 
/* Proceso de almacenamiento de la tabla generos_libros*/
DELIMITER //

CREATE PROCEDURE agregar_genero_libro(nombre_genero_libro VARCHAR(50))
BEGIN
    INSERT INTO tb_generos_libros(nombre_genero_libro) VALUES (nombre_genero_libro);
END //

DELIMITER ;

CALL agregar_genero_libro('Ciencia ficción');
CALL agregar_genero_libro('Romance');
CALL agregar_genero_libro('Misterio');
CALL agregar_genero_libro('Aventura');
CALL agregar_genero_libro('Fantasía');
CALL agregar_genero_libro('Drama');
CALL agregar_genero_libro('Thriller');
CALL agregar_genero_libro('Suspenso');
CALL agregar_genero_libro('Comedia');
CALL agregar_genero_libro('Histórico');
CALL agregar_genero_libro('Biografía');
CALL agregar_genero_libro('No ficción');
CALL agregar_genero_libro('Poesía');
CALL agregar_genero_libro('Terror');
CALL agregar_genero_libro('Autoayuda');
 
/* Proceso de almacenamiento de la tabla Libro*/
DELIMITER //
 
CREATE PROCEDURE agregar_libro(titulo_libro VARCHAR(50), anio_publicacion INT, NombreGenero VARCHAR(50), estado ENUM('Disponible','Prestado'))
BEGIN
	DECLARE generoLibro_id BINARY(36);
    -- Encierra la consulta SELECT entre paréntesis
   SET generoLibro_id = (SELECT id_genero_libro FROM tb_generos_libros WHERE nombre_genero_libro = NombreGenero);
 
   INSERT INTO tb_libros(titulo_libro, anio_publicacion, id_genero_libro, estado) VALUES (titulo_libro, anio_publicacion, generoLibro_id, estado);
 
END //
 
DELIMITER ;

CALL agregar_libro('1984', 1949, 'Ciencia ficción', 'Disponible');
CALL agregar_libro('Orgullo y prejuicio', 1813, 'Romance', 'Disponible');
CALL agregar_libro('El código Da Vinci', 2003, 'Misterio', 'Disponible');
CALL agregar_libro('La odisea', 'Homero', 'Aventura', 'Disponible');
CALL agregar_libro('El señor de los anillos', 1954, 'Fantasía', 'Disponible');
CALL agregar_libro('Romeo y Julieta', 1597, 'Drama', 'Disponible');
CALL agregar_libro('El silencio de los corderos', 1988, 'Thriller', 'Disponible');
CALL agregar_libro('Los juegos del hambre', 2008, 'Aventura', 'Disponible');
CALL agregar_libro('El gran Gatsby', 1925, 'Drama', 'Disponible');
CALL agregar_libro('Crónica de una muerte anunciada', 1981, 'Misterio', 'Disponible');
CALL agregar_libro('Cien años de soledad', 1967, 'Drama', 'Disponible');
CALL agregar_libro('El principito', 1943, 'Fantasía', 'Disponible');
CALL agregar_libro('Drácula', 1897, 'Terror', 'Disponible');
CALL agregar_libro('El alquimista', 1988, 'Fantasía', 'Disponible');
CALL agregar_libro('El retrato de Dorian Gray', 1890, 'Drama', 'Disponible'); 

/* Proceso de almacenamiento de la tabla detalles_prestamo*/
DELIMITER //
 
CREATE PROCEDURE agregar_detalles_prestamo(nombre_cliente VARCHAR(50), tituloLibro VARCHAR(100))
BEGIN
	DECLARE cliente_id BINARY(36);
	DECLARE prestamo_id BINARY(36);
	DECLARE libros_id BINARY(36);
   SET cliente_id = (SELECT id_cliente FROM tb_clientes WHERE nombre_cliente = nombre_cliente LIMIT 1);
   SET prestamo_id = (SELECT id_prestamo FROM tb_prestamos WHERE id_cliente = cliente_id LIMIT 1);
   SET libros_id = (SELECT id_libro FROM tb_libros WHERE titulo_libro = tituloLibro LIMIT 1);

 
   INSERT INTO tb_detalles_prestamos(id_prestamo, id_libro) VALUES (prestamo_id, libros_id);
 
END //
 
DELIMITER ;

CALL agregar_detalles_prestamo('John Doe', '1984');
CALL agregar_detalles_prestamo('Jane Smith', 'El código Da Vinci');
CALL agregar_detalles_prestamo('Michael Johnson', 'Romeo y Julieta');
CALL agregar_detalles_prestamo('Emily Davis', 'El gran Gatsby');
CALL agregar_detalles_prestamo('David Wilson', 'Cien años de soledad');
CALL agregar_detalles_prestamo('Jessica Thompson', 'El principito');
CALL agregar_detalles_prestamo('Daniel Garcia', 'El alquimista');
CALL agregar_detalles_prestamo('Sophia Rodriguez', 'Drácula');
CALL agregar_detalles_prestamo('Matthew Martinez', 'El retrato de Dorian Gray');
CALL agregar_detalles_prestamo('Olivia Hernandez', 'Orgullo y prejuicio');
CALL agregar_detalles_prestamo('Andrew Lopez', 'La odisea');
CALL agregar_detalles_prestamo('Isabella Gonzalez', 'El silencio de los corderos');
CALL agregar_detalles_prestamo('Ethan Perez', 'Los juegos del hambre');
CALL agregar_detalles_prestamo('Ava Torres', 'Crónica de una muerte anunciada');
CALL agregar_detalles_prestamo('James Flores', 'El retrato de Dorian Gray');

SELECT * FROM tb_clientes;

SELECT * FROM tb_detalles_prestamos;

SELECT * FROM tb_generos_libros;

SELECT * FROM tb_libros;

SELECT * FROM tb_prestamos;
