DROP DATABASE IF EXISTS LibroExpress;

CREATE DATABASE LibroExpress;
USE LibroExpress;

CREATE TABLE tb_clientes (
  id_cliente VARCHAR(36) PRIMARY KEY ,
  nombre_cliente VARCHAR(50) NOT NULL,
  email_cliente VARCHAR(100) NOT NULL,
  telefono VARCHAR(10) NOT NULL
);

---- procedimiento para insertar clientes junto con la funcion UUID
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


---- procedimiento para insertar prestamo junto con la funcion UUID

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



---- procedimiento para insertar u  nuevo genero junto con la funcion UUID
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


---- procedimiento para insertar un nuevo libro junto con la funcion UUID

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



---- procedimiento para insertar un detalle de pedido junto con la funcion UUID

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



-- trigger de cambio de estado al prestar un libro

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



--- inserciones con prodceimiento en la tabla clientes 

CALL InsertarCliente('Daniela Ramirez', 'dani@email.com', '12345678'); 
CALL InsertarCliente('Francisco Ramos', 'frank@email.com', '8563214');
CALL InsertarCliente('Carlos Quintanilla', 'carlos@email.com', '852369');  
CALL InsertarCliente('Ana García', 'ana.garcia@example.com', '123456789');

CALL InsertarCliente('Juan Rodríguez', 'juan.rodriguez@example.com', '987654321');
CALL InsertarCliente('María López', 'maria.lopez@example.com', '555555555');
CALL InsertarCliente('Antonio Martínez', 'antonio.martinez@example.com', '111111111');
CALL InsertarCliente('Laura Fernández', 'laura.fernandez@example.com', '999999999');

CALL InsertarCliente('Carlos Sánchez', 'carlos.sanchez@example.com', '777777777');
CALL InsertarCliente('Sara Ramírez', 'sara.ramirez@example.com', '444444444');
CALL InsertarCliente('Pedro Torres', 'pedro.torres@example.com', '888888888');
CALL InsertarCliente('Isabel Gómez', 'isabel.gomez@example.com', '222222222');

CALL InsertarCliente('Luis Morales', 'luis.morales@example.com', '666666666');
CALL InsertarCliente('Marta Jiménez', 'marta.jimenez@example.com', '333333333');
CALL InsertarCliente('Javier Ruiz', 'javier.ruiz@example.com', '555555555');



SELECT * FROM tb_clientes





--- inserciones con prodcimiento en la tabla prestamos 

CALL InsertarPrestamo('aba40574-d659-11ee-bb52-b04f1304b695','2024-01-01', '2024-01-15', 'activo');
CALL InsertarPrestamo('ce2d87e4-d65a-11ee-bb52-b04f1304b695','2024-02-01', '2024-02-15', 'inactivo');
CALL InsertarPrestamo('ce2e61d3-d65a-11ee-bb52-b04f1304b695','2024-03-01', '2024-03-15', 'activo');
CALL InsertarPrestamo('ce2f1fbd-d65a-11ee-bb52-b04f1304b695','2024-04-01', '2024-04-15', 'inactivo');

CALL InsertarPrestamo('ce2febdc-d65a-11ee-bb52-b04f1304b695','2024-05-01', '2024-05-15', 'activo');
CALL InsertarPrestamo('ce30928f-d65a-11ee-bb52-b04f1304b695','2024-06-01', '2024-06-15', 'inactivo');
CALL InsertarPrestamo('ce31c7a9-d65a-11ee-bb52-b04f1304b695','2024-09-07', '2024-10-15', 'activo');
CALL InsertarPrestamo('ce3384f8-d65a-11ee-bb52-b04f1304b695','2024-03-07', '2024-3-15', 'activo');

CALL InsertarPrestamo('ce340ac7-d65a-11ee-bb52-b04f1304b695','2024-12-07', '2024-03-15', 'activo');
CALL InsertarPrestamo('ce349418-d65a-11ee-bb52-b04f1304b695','2024-23-07', '2024-6-15', 'activo');
CALL InsertarPrestamo('ce351264-d65a-11ee-bb52-b04f1304b695','2024-12-07', '2024-6-15', 'inactivo');
CALL InsertarPrestamo('ce358f28-d65a-11ee-bb52-b04f1304b695','2024-05-07', '2024-03-15', 'inactivo');

CALL InsertarPrestamo('ce3609d4-d65a-11ee-bb52-b04f1304b695','2024-12-01', '2024-12-15', 'inactivo');
CALL InsertarPrestamo('e6f7ee12-d659-11ee-bb52-b04f1304b695','2025-03-01', '2025-03-15', 'inactivo');
CALL InsertarPrestamo('e6f8cdc4-d659-11ee-bb52-b04f1304b695','2024-08-01', '2024-08-15', 'activo');


SELECT * FROM tb_prestamos


/*tb Generos Libro*/
CALL InsertarGeneroLibro('Ficción');
CALL InsertarGeneroLibro('Romance');
CALL InsertarGeneroLibro('Misterio');
CALL InsertarGeneroLibro('Fantasía');
CALL InsertarGeneroLibro('Ciencia ficción');
CALL InsertarGeneroLibro('Histórico');
CALL InsertarGeneroLibro('Biografía');
CALL InsertarGeneroLibro('Autoayuda');
CALL InsertarGeneroLibro('Negocios');
CALL InsertarGeneroLibro('Arte');
CALL InsertarGeneroLibro('Cocina');
CALL InsertarGeneroLibro('Viajes');
CALL InsertarGeneroLibro('Infantil');
CALL InsertarGeneroLibro('Poesía');
CALL InsertarGeneroLibro('Teatro');


/*tb Libros*/
CALL InsertarLibro('1984', 1949, '98c695b8-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('Orgullo y prejuicio', 1813, '98c71ddd-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('Cien años de soledad', 1967, '98c7ace3-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('El gran Gatsby', 1925, '98c888a9-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('Matar a un ruiseñor', 1960, '98c99bac-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('Don Quijote de la Mancha', 1605, '98c888a9-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('Ulises', 1922, '98c99bac-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('En busca del tiempo perdido', 1913, '98c5cf3a-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('1984', 1949, '98c888a9-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('Orgullo y prejuicio', 1813, '98c9e40e-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('Cien años de soledad', 1967, '98c888a9-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('El gran Gatsby', 1925, '98ca73ab-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('Matar a un ruiseñor', 1960, '98ca73ab-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('Don Quijote de la Mancha', 1605, '98c9105a-d65c-11ee-b99f-b04f13083500', 'Disponible');
CALL InsertarLibro('Ulises', 1922, '98c9105a-d65c-11ee-b99f-b04f13083500', 'Disponible');


/*tb Detalle Prestamos*/
CALL InsertarDetallePrestamo('98c9105a-d65c-11ee-b99f-b04f13083500', '98c9105a-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');
CALL InsertarDetallePrestamo('98c9e40e-d65c-11ee-b99f-b04f13083500', '98c99bac-d65c-11ee-b99f-b04f13083500');





