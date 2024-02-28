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
