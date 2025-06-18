
-- Inserts para la tabla clients.clients (Clientes de Colombia)

-- Asegúrate de que las ciudades Bogotá, Medellín y Cali para Colombia existan en utilities.citys
-- y que el país Colombia exista en utilities.countrys.

-- Clientes de Bogotá
INSERT INTO clients.clients (first_name, last_name, personal_id, email, phone, address, id_city_fk, status) VALUES
('Carlos', 'Gomez', '101010101', 'carlos.gomez@email.com', '3101234567', 'Calle 100 # 20-30, Bogotá', (SELECT id_city FROM utilities.citys WHERE city_name = 'Bogotá' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Ana', 'Perez', '102020202', 'ana.perez@email.com', '3112345678', 'Avenida Caracas # 50-15, Bogotá', (SELECT id_city FROM utilities.citys WHERE city_name = 'Bogotá' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Luis', 'Rodriguez', '103030303', 'luis.rodriguez@email.com', '3123456789', 'Carrera 7 # 12-45, Bogotá', (SELECT id_city FROM utilities.citys WHERE city_name = 'Bogotá' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'INACTIVE'),
('Sofia', 'Martinez', '104040404', 'sofia.martinez@email.com', '3134567890', 'Transversal 5 # 60-05, Bogotá', (SELECT id_city FROM utilities.citys WHERE city_name = 'Bogotá' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Jorge', 'Hernandez', '105050505', 'jorge.hernandez@email.com', '3145678901', 'Diagonal 80 # 10-10, Bogotá', (SELECT id_city FROM utilities.citys WHERE city_name = 'Bogotá' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'BLOCKED'),
('Laura', 'Diaz', '106060606', 'laura.diaz@email.com', '3156789012', 'Calle 26 # 30-20, Bogotá', (SELECT id_city FROM utilities.citys WHERE city_name = 'Bogotá' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Andres', 'Silva', '107070707', 'andres.silva@email.com', '3167890123', 'Avenida Boyacá # 70-50, Bogotá', (SELECT id_city FROM utilities.citys WHERE city_name = 'Bogotá' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE');

-- Clientes de Medellín
INSERT INTO clients.clients (first_name, last_name, personal_id, email, phone, address, id_city_fk, status) VALUES
('Maria', 'Lopez', '201010101', 'maria.lopez@email.com', '3201234567', 'Carrera 43A # 10-50, El Poblado, Medellín', (SELECT id_city FROM utilities.citys WHERE city_name = 'Medellín' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Juan', 'Ramirez', '202020202', 'juan.ramirez@email.com', '3212345678', 'Calle 33 # 70-12, Laureles, Medellín', (SELECT id_city FROM utilities.citys WHERE city_name = 'Medellín' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Valentina', 'Torres', '203030303', 'valentina.torres@email.com', '3223456789', 'Avenida Oriental # 55-25, Centro, Medellín', (SELECT id_city FROM utilities.citys WHERE city_name = 'Medellín' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'INACTIVE'),
('David', 'Sanchez', '204040404', 'david.sanchez@email.com', '3234567890', 'Circular 4 # 72-18, Estadio, Medellín', (SELECT id_city FROM utilities.citys WHERE city_name = 'Medellín' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Camila', 'Vargas', '205050505', 'camila.vargas@email.com', '3001234567', 'Calle 10 # 30-100, Envigado (cercano a Medellín)', (SELECT id_city FROM utilities.citys WHERE city_name = 'Medellín' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Santiago', 'Mora', '206060606', 'santiago.mora@email.com', '3012345678', 'Carrera 80 # 45G-05, La América, Medellín', (SELECT id_city FROM utilities.citys WHERE city_name = 'Medellín' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'BLOCKED');

-- Clientes de Cali
INSERT INTO clients.clients (first_name, last_name, personal_id, email, phone, address, id_city_fk, status) VALUES
('Isabella', 'Castro', '301010101', 'isabella.castro@email.com', '3501234567', 'Avenida Roosevelt # 25-10, Cali', (SELECT id_city FROM utilities.citys WHERE city_name = 'Cali' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Mateo', 'Ortiz', '302020202', 'mateo.ortiz@email.com', '3512345678', 'Calle 5 # 66-80, Caney, Cali', (SELECT id_city FROM utilities.citys WHERE city_name = 'Cali' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Gabriela', 'Rojas', '303030303', 'gabriela.rojas@email.com', '3523456789', 'Carrera 1 # 15-05, San Antonio, Cali', (SELECT id_city FROM utilities.citys WHERE city_name = 'Cali' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Daniel', 'Jimenez', '304040404', 'daniel.jimenez@email.com', '3534567890', 'Avenida Sexta # 1N-40, Granada, Cali', (SELECT id_city FROM utilities.citys WHERE city_name = 'Cali' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'INACTIVE'),
('Luciana', 'Pineda', '305050505', 'luciana.pineda@email.com', '3021234567', 'Calle 70 # 2AN-30, La Flora, Cali', (SELECT id_city FROM utilities.citys WHERE city_name = 'Cali' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Nicolas', 'Guerrero', '306060606', 'nicolas.guerrero@email.com', '3032345678', 'Carrera 100 # 5-169, Ciudad Jardín, Cali', (SELECT id_city FROM utilities.citys WHERE city_name = 'Cali' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'ACTIVE'),
('Mariana', 'Leon', '307070707', 'mariana.leon@email.com', '3043456789', 'Avenida Pasoancho # 80-10, Cali', (SELECT id_city FROM utilities.citys WHERE city_name = 'Cali' AND id_country_fk = (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')), 'BLOCKED');

