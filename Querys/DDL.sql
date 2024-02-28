/*Tablas*/
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
 
CREATE PROCEDURE AgregarCliente(nombre_cliente VARCHAR(50), email_cliente VARCHAR(100), telefono VARCHAR(10))
BEGIN
 
    INSERT INTO tb_clientes(nombre_cliente, email_cliente, telefono) VALUES (nombre_cliente, email_cliente, telefono);
 
END //
 
DELIMITER ;

/* Proceso de almacenamiento de la tabla prestamos*/
DELIMITER //
 
CREATE PROCEDURE AgregarPrestamo(nombreCliente VARCHAR(50), fecha_inicio DATE, fecha_devolucion DATE, estado ENUM('Activo','Inactivo'))
BEGIN
    DECLARE cliente_id BINARY(36);
    -- Encierra la consulta SELECT entre paréntesis
    SET cliente_id = (SELECT id_cliente FROM tb_clientes WHERE nombre_cliente = nombreCliente);
    INSERT INTO tb_prestamos(id_cliente, fecha_inicio, fecha_devolucion, estado) VALUES (cliente_id, fecha_inicio, fecha_devolucion, estado);
END //
 
DELIMITER ;

/* Proceso de almacenamiento de la tabla generos_libros*/
DELIMITER //

CREATE PROCEDURE AgregarGeneroLibro(nombre_genero_libro VARCHAR(50))
BEGIN
    INSERT INTO tb_generos_libros(nombre_genero_libro) VALUES (nombre_genero_libro);
END //

DELIMITER ;

/* Proceso de almacenamiento de la tabla Libro*/
DELIMITER //
 
CREATE PROCEDURE AgregarLibro(titulo_libro VARCHAR(50), anio_publicacion INT, NombreGenero VARCHAR(50), estado ENUM('Disponible','Prestado'))
BEGIN
	DECLARE generoLibro_id BINARY(36);
    -- Encierra la consulta SELECT entre paréntesis
   SET generoLibro_id = (SELECT id_genero_libro FROM tb_generos_libros WHERE nombre_genero_libro = NombreGenero);
 
   INSERT INTO tb_libros(titulo_libro, anio_publicacion, id_genero_libro, estado) VALUES (titulo_libro, anio_publicacion, generoLibro_id, estado);
 
END //
 
DELIMITER ;

/* Proceso de almacenamiento de la tabla detalles_prestamo*/
DELIMITER //
 
CREATE PROCEDURE AgregarDetallesPrestamo(nombre_cliente VARCHAR(50), tituloLibro VARCHAR(100))
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
