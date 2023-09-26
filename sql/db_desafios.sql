-- User types
CREATE TABLE user_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO user_types (name) VALUES
    ('Propietario'),
    ('Asignado'),
    ('Revisor'),
    ('Colaborador'),
    ('Observador');

-- Users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
    birthdate DATE,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    active BOOLEAN DEFAULT 1,
    user_type_id INT,
    FOREIGN KEY (user_type_id) REFERENCES user_types(id)
);

INSERT INTO users (username, email, password, full_name, birthdate, user_type_id)
VALUES
    ('johndoe', 'john.doe@example.com', 'password1', 'John Doe', '1990-05-15', 1),
    ('janesmith', 'jane.smith@example.com', 'password2', 'Jane Smith', '1985-07-20', 2),
    ('alicejohnson', 'alice.johnson@example.com', 'password3', 'Alice Johnson', '1992-02-10', 3),
    ('robertbrown', 'robert.brown@example.com', 'password4', 'Robert Brown', '1987-12-05', 4),
    ('evadavis', 'eva.davis@example.com', 'password5', 'Eva Davis', '1998-09-25', 5),
    ('michaelwilson', 'michael.wilson@example.com', 'password6', 'Michael Wilson', '1995-06-30', 1),
    ('gracetaylor', 'grace.taylor@example.com', 'password7', 'Grace Taylor', '1993-03-18', 2),
    ('hannahanderson', 'hannah.anderson@example.com', 'password8', 'Hannah Anderson', '1991-10-10', 3),
    ('ianmartin', 'ian.martin@example.com', 'password9', 'Ian Martin', '1986-04-12', 4),
    ('janewhite', 'jane.white@example.com', 'password10', 'Jane White', '1994-08-02', 5),
    ('kevinlee', 'kevin.lee@example.com', 'password11', 'Kevin Lee', '1997-11-28', 1),
    ('lindaharris', 'linda.harris@example.com', 'password12', 'Linda Harris', '1989-01-22', 2),
    ('pamelaadams', 'pamela.adams@example.com', 'password13', 'Pamela Adams', '1988-02-18', 3),
    ('quincyhall', 'quincy.hall@example.com', 'password14', 'Quincy Hall', '1991-06-20', 4),
    ('rachelturner', 'rachel.turner@example.com', 'password15', 'Rachel Turner', '1995-04-15', 5),
    ('stevenparker', 'steven.parker@example.com', 'password16', 'Steven Parker', '1986-11-08', 1),
    ('tinadavis', 'tina.davis@example.com', 'password17', 'Tina Davis', '1998-10-28', 2),
    ('natalieturner', 'natalie.turner@example.com', 'password18', 'Natalie Turner', '1990-09-12', 3),
    ('oliverbrown', 'oliver.brown@example.com', 'password19', 'Oliver Brown', '1993-07-30', 4),
    ('davidwilson', 'david.wilson@example.com', 'password20', 'David Wilson', '1987-09-05', 5);

-- Issue Types
CREATE TABLE issue_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

INSERT INTO issue_types (name, description)
VALUES
    ('Bug', 'Un problema relacionado con errores en el software.'),
    ('Feature Request', 'Una solicitud para agregar una nueva característica al software.'),
    ('Enhancement', 'Una solicitud para mejorar una característica existente.'),
    ('Documentation', 'Un problema relacionado con la documentación del software.'),
    ('Support Request', 'Una solicitud de soporte técnico o ayuda con el software.');

-- Issues
CREATE TABLE issues (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    owner_user_id INT,
    issue_type_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (issue_type_id) REFERENCES issue_types(id)
);

INSERT INTO issues (title, description, owner_user_id, issue_type_id, created_at, updated_at)
VALUES
    ('Solucionar problema de inicio de sesión', 'Descripción del error de inicio de sesión', 1, 1, '2023-08-15 10:00:00', '2023-08-15 10:00:00'),
    ('Optimizar el rendimiento de la aplicación', 'Descripción de la optimización', 2, 2, '2023-08-16 11:15:00', '2023-08-16 11:15:00'),
    ('Implementar nueva funcionalidad de búsqueda', 'Descripción de la nueva funcionalidad', 3, 3, '2023-08-17 12:30:00', '2023-08-17 12:30:00'),
    ('Brindar soporte técnico a los usuarios', 'Descripción del soporte técnico', 4, 4, '2023-08-18 14:45:00', '2023-08-18 14:45:00'),
    ('Investigar problemas de seguridad', 'Descripción de la investigación de seguridad', 5, 5, '2023-08-19 16:00:00', '2023-08-19 16:00:00'),
    ('Corregir error de carga lenta', 'Descripción del error de carga lenta', 1, 1, '2023-08-20 17:15:00', '2023-08-20 17:15:00'),
    ('Mejorar la experiencia del usuario', 'Descripción de la mejora de UX', 2, 2, '2023-08-21 18:30:00', '2023-08-21 18:30:00'),
    ('Agregar funcionalidad de exportación de datos', 'Descripción de la exportación de datos', 3, 3, '2023-08-22 19:45:00', '2023-08-22 19:45:00'),
    ('Resolver problemas de conexión', 'Descripción de los problemas de conexión', 4, 4, '2023-09-01 21:00:00', '2023-09-01 21:00:00'),
    ('Investigar posibles vulnerabilidades', 'Descripción de la investigación de vulnerabilidades', 5, 5, '2023-09-02 22:15:00', '2023-09-02 22:15:00'),
    ('Solucionar problema de carga de imágenes', 'Descripción del error de carga de imágenes', 1, 1, '2023-09-03 09:00:00', '2023-09-03 09:00:00'),
    ('Optimizar el rendimiento de la base de datos', 'Descripción de la optimización de la base de datos', 2, 2, '2023-09-04 10:15:00', '2023-09-04 10:15:00'),
    ('Agregar funcionalidad de notificaciones', 'Descripción de las notificaciones', 3, 3, '2023-09-05 11:30:00', '2023-09-05 11:30:00'),
    ('Brindar soporte a usuarios premium', 'Descripción del soporte a usuarios premium', 4, 4, '2023-09-06 12:45:00', '2023-09-06 12:45:00'),
    ('Analizar y prevenir ataques cibernéticos', 'Descripción de la prevención de ataques', 5, 5, '2023-09-07 14:00:00', '2023-09-07 14:00:00'),
    ('Corregir error de visualización en móviles', 'Descripción del error en dispositivos móviles', 1, 1, '2023-09-08 15:15:00', '2023-09-08 15:15:00'),
    ('Mejorar la interfaz de usuario', 'Descripción de la mejora de UI', 2, 2, '2023-09-09 16:30:00', '2023-09-09 16:30:00'),
    ('Agregar funcionalidad de importación de datos', 'Descripción de la importación de datos', 3, 3, '2023-09-10 17:45:00', '2023-09-10 17:45:00'),
    ('Brindar soporte a usuarios gratuitos', 'Descripción del soporte a usuarios gratuitos', 4, 4, '2023-09-11 19:00:00', '2023-09-11 19:00:00'),
    ('Investigar problemas de rendimiento', 'Descripción de la investigación de rendimiento', 5, 5, '2023-09-12 20:15:00', '2023-09-12 20:15:00'),
    ('Solucionar problema de inicio de sesión', 'Descripción del error de inicio de sesión', 1, 1, '2023-09-13 21:30:00', '2023-09-13 21:30:00'),
    ('Optimizar el rendimiento de la aplicación', 'Descripción de la optimización', 2, 2, '2023-09-14 22:45:00', '2023-09-14 22:45:00'),
    ('Implementar nueva funcionalidad de búsqueda', 'Descripción de la nueva funcionalidad', 3, 3, '2023-09-15 08:00:00', '2023-09-15 08:00:00'),
    ('Brindar soporte técnico a los usuarios', 'Descripción del soporte técnico', 4, 4, '2023-09-16 09:15:00', '2023-09-16 09:15:00'),
    ('Investigar problemas de seguridad', 'Descripción de la investigación de seguridad', 5, 5, '2023-09-17 10:30:00', '2023-09-17 10:30:00'),
    ('Corregir error de carga lenta', 'Descripción del error de carga lenta', 1, 1, '2023-09-18 11:45:00', '2023-09-18 11:45:00'),
    ('Mejorar la experiencia del usuario', 'Descripción de la mejora de UX', 2, 2, '2023-09-19 13:00:00', '2023-09-19 13:00:00'),
    ('Agregar funcionalidad de exportación de datos', 'Descripción de la exportación de datos', 3, 3, '2023-09-20 14:15:00', '2023-09-20 14:15:00'),
    ('Resolver problemas de conexión', 'Descripción de los problemas de conexión', 4, 4, '2023-09-21 15:30:00', '2023-09-21 15:30:00'),
    ('Investigar posibles vulnerabilidades', 'Descripción de la investigación de vulnerabilidades', 5, 5, '2023-09-22 16:45:00', '2023-09-22 16:45:00');