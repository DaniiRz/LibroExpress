/*Insertar en tabla clientes*/
CALL AgregarCliente('John Doe', 'johndoe@example.com', '1234567890');
CALL AgregarCliente('Jane Smith', 'janesmith@example.com', '9876543210');
CALL AgregarCliente('Michael Johnson', 'michaeljohnson@example.com', '5551234567');
CALL AgregarCliente('Emily Davis', 'emilydavis@example.com', '7894561230');
CALL AgregarCliente('David Wilson', 'davidwilson@example.com', '3216549870');
CALL AgregarCliente('Jessica Thompson', 'jessicathompson@example.com', '9998887776');
CALL AgregarCliente('Daniel Garcia', 'danielgarcia@example.com', '4445556667');
CALL AgregarCliente('Sophia Rodriguez', 'sophiarodriguez@example.com', '2223334445');
CALL AgregarCliente('Matthew Martinez', 'matthewmartinez@example.com', '1112223334');
CALL AgregarCliente('Olivia Hernandez', 'oliviahernandez@example.com', '7778889991');
CALL AgregarCliente('Andrew Lopez', 'andrewlopez@example.com', '6665554442');
CALL AgregarCliente('Isabella Gonzalez', 'isabellagonzalez@example.com', '8889990003');
CALL AgregarCliente('Ethan Perez', 'ethanperez@example.com', '4443332221');
CALL AgregarCliente('Ava Torres', 'avatorres@example.com', '6667778889');
CALL AgregarCliente('James Flores', 'jamesflores@example.com', '1119998887');

/*Insertar en tabla prestamos*/
CALL AgregarPrestamo('John Doe', '2024-02-01', '2024-03-01', 'Activo');
CALL AgregarPrestamo('Jane Smith', '2024-02-15', '2024-03-15', 'Activo');
CALL AgregarPrestamo('Michael Johnson', '2024-03-01', '2024-04-01', 'Activo');
CALL AgregarPrestamo('Emily Davis', '2024-02-10', '2024-03-10', 'Activo');
CALL AgregarPrestamo('David Wilson', '2024-02-20', '2024-03-20', 'Activo');
CALL AgregarPrestamo('Jessica Thompson', '2024-02-05', '2024-03-05', 'Activo');
CALL AgregarPrestamo('Daniel Garcia', '2024-02-25', '2024-03-25', 'Activo');
CALL AgregarPrestamo('Sophia Rodriguez', '2024-02-08', '2024-03-08', 'Activo');
CALL AgregarPrestamo('Matthew Martinez', '2024-02-18', '2024-03-18', 'Activo');
CALL AgregarPrestamo('Olivia Hernandez', '2024-02-03', '2024-03-03', 'Activo');
CALL AgregarPrestamo('Andrew Lopez', '2024-02-28', '2024-03-28', 'Activo');
CALL AgregarPrestamo('Isabella Gonzalez', '2024-02-12', '2024-03-12', 'Activo');
CALL AgregarPrestamo('Ethan Perez', '2024-02-07', '2024-03-07', 'Activo');
CALL AgregarPrestamo('Ava Torres', '2024-02-27', '2024-03-27', 'Activo');
CALL AgregarPrestamo('James Flores', '2024-02-14', '2024-03-14', 'Activo');

/*Insertar en tabla generos_libros*/
CALL AgregarGeneroLibro('Ciencia ficción');
CALL AgregarGeneroLibro('Romance');
CALL AgregarGeneroLibro('Misterio');
CALL AgregarGeneroLibro('Aventura');
CALL AgregarGeneroLibro('Fantasía');
CALL AgregarGeneroLibro('Drama');
CALL AgregarGeneroLibro('Thriller');
CALL AgregarGeneroLibro('Suspenso');
CALL AgregarGeneroLibro('Comedia');
CALL AgregarGeneroLibro('Histórico');
CALL AgregarGeneroLibro('Biografía');
CALL AgregarGeneroLibro('No ficción');
CALL AgregarGeneroLibro('Poesía');
CALL AgregarGeneroLibro('Terror');
CALL AgregarGeneroLibro('Autoayuda');

/*Insertar en tabla libros*/
CALL AgregarLibro('1984', 1949, 'Ciencia ficción', 'Disponible');
CALL AgregarLibro('Orgullo y prejuicio', 1813, 'Romance', 'Disponible');
CALL AgregarLibro('El código Da Vinci', 2003, 'Misterio', 'Disponible');
CALL AgregarLibro('La odisea', 'Homero', 'Aventura', 'Disponible');
CALL AgregarLibro('El señor de los anillos', 1954, 'Fantasía', 'Disponible');
CALL AgregarLibro('Romeo y Julieta', 1597, 'Drama', 'Disponible');
CALL AgregarLibro('El silencio de los corderos', 1988, 'Thriller', 'Disponible');
CALL AgregarLibro('Los juegos del hambre', 2008, 'Aventura', 'Disponible');
CALL AgregarLibro('El gran Gatsby', 1925, 'Drama', 'Disponible');
CALL AgregarLibro('Crónica de una muerte anunciada', 1981, 'Misterio', 'Disponible');
CALL AgregarLibro('Cien años de soledad', 1967, 'Drama', 'Disponible');
CALL AgregarLibro('El principito', 1943, 'Fantasía', 'Disponible');
CALL AgregarLibro('Drácula', 1897, 'Terror', 'Disponible');
CALL AgregarLibro('El alquimista', 1988, 'Fantasía', 'Disponible');
CALL AgregarLibro('El retrato de Dorian Gray', 1890, 'Drama', 'Disponible');

/*Insertar en tabla detalles_prestamos*/
CALL AgregarDetallesPrestamo('John Doe', '1984');
CALL AgregarDetallesPrestamo('Jane Smith', 'El código Da Vinci');
CALL AgregarDetallesPrestamo('Michael Johnson', 'Romeo y Julieta');
CALL AgregarDetallesPrestamo('Emily Davis', 'El gran Gatsby');
CALL AgregarDetallesPrestamo('David Wilson', 'Cien años de soledad');
CALL AgregarDetallesPrestamo('Jessica Thompson', 'El principito');
CALL AgregarDetallesPrestamo('Daniel Garcia', 'El alquimista');
CALL AgregarDetallesPrestamo('Sophia Rodriguez', 'Drácula');
CALL AgregarDetallesPrestamo('Matthew Martinez', 'El retrato de Dorian Gray');
CALL AgregarDetallesPrestamo('Olivia Hernandez', 'Orgullo y prejuicio');
CALL AgregarDetallesPrestamo('Andrew Lopez', 'La odisea');
CALL AgregarDetallesPrestamo('Isabella Gonzalez', 'El silencio de los corderos');
CALL AgregarDetallesPrestamo('Ethan Perez', 'Los juegos del hambre');
CALL AgregarDetallesPrestamo('Ava Torres', 'Crónica de una muerte anunciada');
CALL AgregarDetallesPrestamo('James Flores', 'El retrato de Dorian Gray');
