-- Inserts para la tabla utilities.citys
-- Nota: Este es un ejemplo limitado. Para una lista completa de ciudades,
-- considera importar datos de fuentes externas.

-- Ciudades para Argentina (Ejemplo)
INSERT INTO utilities.citys (city_name, id_country_fk) VALUES
('Buenos Aires', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Argentina')),
('Córdoba', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Argentina')),
('Rosario', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Argentina'));

-- Ciudades para Colombia (Ejemplo)
INSERT INTO utilities.citys (city_name, id_country_fk) VALUES
('Bogotá', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')),
('Medellín', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')),
('Cali', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia'));

-- Ciudades para España (Ejemplo)
INSERT INTO utilities.citys (city_name, id_country_fk) VALUES
('Madrid', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Spain')),
('Barcelona', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Spain')),
('Valencia', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Spain'));

-- Ciudades para Estados Unidos (Ejemplo)
INSERT INTO utilities.citys (city_name, id_country_fk) VALUES
('New York', (SELECT id_country FROM utilities.countrys WHERE country_name = 'United States of America')),
('Los Angeles', (SELECT id_country FROM utilities.countrys WHERE country_name = 'United States of America')),
('Chicago', (SELECT id_country FROM utilities.countrys WHERE country_name = 'United States of America'));

-- Ciudades para México (Ejemplo)
INSERT INTO utilities.citys (city_name, id_country_fk) VALUES
('Mexico City', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Mexico')),
('Guadalajara', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Mexico')),
('Monterrey', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Mexico'));

-- Puedes continuar añadiendo más ciudades y países de esta manera.
-- Ejemplo para Canadá:
INSERT INTO utilities.citys (city_name, id_country_fk) VALUES
('Toronto', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Canada')),
('Montreal', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Canada')),
('Vancouver', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Canada'));

-- Ejemplo para Alemania:
INSERT INTO utilities.citys (city_name, id_country_fk) VALUES
('Berlin', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Germany')),
('Hamburg', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Germany')),
('Munich', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Germany'));

