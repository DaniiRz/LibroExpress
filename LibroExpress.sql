DROP DATABASE IF EXISTS LibroExpress;
CREATE DATABASE LibroExpress;
USE LibroExpress;

CREATE TABLE tb_clientes (
  id_cliente VARCHAR(36) PRIMARY KEY ,
  nombre_cliente VARCHAR(50) NOT NULL,
  email_cliente VARCHAR(100) NOT NULL,
  telefono VARCHAR(10) NOT NULL
);

DELIMITER //

CREATE PROCEDURE InsertarCliente(
  IN p_nombre_cliente VARCHAR(50),
  IN p_email_cliente VARCHAR(100),
  IN p_telefono VARCHAR(10)
)
BEGIN
  INSERT INTO tb_clientes (id_cliente, nombre_cliente, email_cliente, telefono)
  VALUES (UUID(), p_nombre_cliente, p_email_cliente, p_telefono);
END //

DELIMITER ;

CREATE TABLE tb_prestamos (
  id_prestamo VARCHAR(36) PRIMARY KEY ,
  id_cliente VARCHAR(36) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_devolucion DATE NOT NULL,
  estado ENUM('Activo', 'Inactivo') NOT NULL,
  CONSTRAINT fk_prestamo_cliente
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DELIMITER //

CREATE PROCEDURE InsertarPrestamo(
  IN p_id_cliente VARCHAR(36),
  IN p_fecha_inicio DATE,
  IN p_fecha_devolucion DATE,
  IN p_estado ENUM('Activo', 'Inactivo')
)
BEGIN
  INSERT INTO tb_prestamos (id_prestamo, id_cliente, fecha_inicio, fecha_devolucion, estado)
  VALUES (UUID(), p_id_cliente, p_fecha_inicio, p_fecha_devolucion, p_estado);
END //

DELIMITER ;

CREATE TABLE tb_generos_libros (
  id_genero_libro VARCHAR(36) PRIMARY KEY ,
  nombre_genero_libro VARCHAR(50) NOT NULL
);

DELIMITER //

CREATE PROCEDURE InsertarGeneroLibro(
  IN p_nombre_genero_libro VARCHAR(50)
)
BEGIN
  INSERT INTO tb_generos_libros (id_genero_libro, nombre_genero_libro)
  VALUES (UUID(), p_nombre_genero_libro);
END //

DELIMITER ;

CREATE TABLE tb_libros (
  id_libro VARCHAR(36) PRIMARY KEY ,
  titulo_libro VARCHAR(50) NOT NULL,
  anio_publicacion INT NOT NULL,
  id_genero_libro VARCHAR(36) NOT NULL,
  estado ENUM('Disponible', 'Prestado') NOT NULL,
  CONSTRAINT fk_libro_genero
    FOREIGN KEY (id_genero_libro) REFERENCES tb_generos_libros(id_genero_libro)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DELIMITER //

CREATE PROCEDURE InsertarLibro(
  IN p_titulo_libro VARCHAR(50),
  IN p_anio_publicacion INT,
  IN p_id_genero_libro VARCHAR(36),
  IN p_estado ENUM('Disponible', 'Prestado')
)
BEGIN
  INSERT INTO tb_libros (id_libro, titulo_libro, anio_publicacion, id_genero_libro, estado)
  VALUES (UUID(), p_titulo_libro, p_anio_publicacion, p_id_genero_libro, p_estado);
END //

DELIMITER ;

CREATE TABLE tb_detalles_prestamos (
  id_detalle_prestamo VARCHAR(36) PRIMARY KEY ,
  id_prestamo VARCHAR(36) NOT NULL,
  id_libro VARCHAR(36) NOT NULL,
  CONSTRAINT fk_detalle_prestamo
    FOREIGN KEY (id_prestamo) REFERENCES tb_prestamos(id_prestamo)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_detalle_libro
    FOREIGN KEY (id_libro) REFERENCES tb_libros(id_libro)
    ON DELETE CASCADE ON UPDATE CASCADE
);

DELIMITER //

CREATE PROCEDURE InsertarDetallePrestamo(
  IN p_id_prestamo VARCHAR(36),
  IN p_id_libro VARCHAR(36)
)
BEGIN
  INSERT INTO tb_detalles_prestamos (id_detalle_prestamo, id_prestamo, id_libro)
  VALUES (UUID(), p_id_prestamo, p_id_libro);
END //

DELIMITER ;

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