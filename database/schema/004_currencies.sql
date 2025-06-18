-- Inserts para la tabla utilities.currencys

INSERT INTO utilities.currencys (name_currency, short_name_currency, id_country_fk) VALUES
('Colombian Peso', 'COP', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Colombia')),
('United States Dollar', 'USD', (SELECT id_country FROM utilities.countrys WHERE country_name = 'United States of America')),
('Euro', 'EUR', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Germany')), -- El Euro es usado por muchos, se asocia a Alemania como ejemplo. Considerar id_country_fk NULL si es una moneda supranacional.
('British Pound Sterling', 'GBP', (SELECT id_country FROM utilities.countrys WHERE country_name = 'United Kingdom')),
('Japanese Yen', 'JPY', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Japan')),
('Canadian Dollar', 'CAD', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Canada')),
('Australian Dollar', 'AUD', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Australia')),
('Swiss Franc', 'CHF', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Switzerland')),
('Chinese Yuan Renminbi', 'CNY', (SELECT id_country FROM utilities.countrys WHERE country_name = 'China')),
('Indian Rupee', 'INR', (SELECT id_country FROM utilities.countrys WHERE country_name = 'India')),
('Brazilian Real', 'BRL', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Brazil')),
('Russian Ruble', 'RUB', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Russia')),
('South African Rand', 'ZAR', (SELECT id_country FROM utilities.countrys WHERE country_name = 'South Africa')),
('Mexican Peso', 'MXN', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Mexico')),
('Argentine Peso', 'ARS', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Argentina')),
('Chilean Peso', 'CLP', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Chile')),
('Peruvian Sol', 'PEN', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Peru')),
('New Zealand Dollar', 'NZD', (SELECT id_country FROM utilities.countrys WHERE country_name = 'New Zealand')),
('Singapore Dollar', 'SGD', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Singapore')),
('South Korean Won', 'KRW', (SELECT id_country FROM utilities.countrys WHERE country_name = 'South Korea')),
('Turkish Lira', 'TRY', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Turkey')),
('Egyptian Pound', 'EGP', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Egypt')),
('Nigerian Naira', 'NGN', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Nigeria')),
('Saudi Riyal', 'SAR', (SELECT id_country FROM utilities.countrys WHERE country_name = 'Saudi Arabia')),
('United Arab Emirates Dirham', 'AED', (SELECT id_country FROM utilities.countrys WHERE country_name = 'United Arab Emirates'));

-- Nota sobre el Euro:
-- La tabla `currencys` tiene un `id_country_fk`. Para monedas como el Euro, que son usadas por múltiples países,
-- tienes algunas opciones de diseño:
-- 1. Asociarla a un país principal de la Eurozona (como se hizo con Alemania arriba).
-- 2. Permitir que `id_country_fk` sea NULL para monedas supranacionales. Tu DDL actual lo permite (`ON DELETE SET NULL`).
--    Ejemplo: INSERT INTO utilities.currencys (name_currency, short_name_currency, id_country_fk) VALUES ('Euro', 'EUR', NULL);
-- 3. Crear una tabla de enlace muchos-a-muchos entre países y monedas si un país puede tener múltiples monedas oficiales
--    o una moneda puede pertenecer a múltiples países de forma oficial (más complejo y quizás no necesario para tu caso).
-- Para este script, se ha optado por la opción 1 para mantener la simplicidad con la estructura actual.

-- Corrección sugerida para el DDL en 001_dbinit.sql (opcional, pero buena práctica):
-- Los nombres de las restricciones de clave foránea deben ser únicos en la base de datos.
-- En tu archivo 001_dbinit.sql, el nombre 'fk_country' se repite.
-- Deberías renombrarlos para mayor claridad y evitar posibles problemas. Por ejemplo:

-- En utilities.citys:
-- Original: CONSTRAINT fk_country FOREIGN KEY(id_country_fk) REFERENCES utilities.countrys(id_country)
-- Sugerido: CONSTRAINT fk_city_country FOREIGN KEY(id_country_fk) REFERENCES utilities.countrys(id_country)

-- En utilities.currencys:
-- Original: CONSTRAINT fk_country FOREIGN KEY(id_country_fk) REFERENCES utilities.countrys(id_country)
-- Sugerido: CONSTRAINT fk_currency_country FOREIGN KEY(id_country_fk) REFERENCES utilities.countrys(id_country)

-- En merchants.merchant:
-- Original: CONSTRAINT fk_country FOREIGN KEY(id_country_fk) REFERENCES utilities.countrys(id_country)
-- Sugerido: CONSTRAINT fk_merchant_country FOREIGN KEY(id_country_fk) REFERENCES utilities.countrys(id_country)

-- En clients.clients:
-- Original: CONSTRAINT fk_city FOREIGN KEY(id_city_fk) REFERENCES utilities.citys(id_city)
-- Sugerido: CONSTRAINT fk_client_city FOREIGN KEY(id_city_fk) REFERENCES utilities.citys(id_city)

-- En bank_product_credit_cards.credit_card:
-- Original: CONSTRAINT fk_client FOREIGN KEY(id_client_fk) REFERENCES clients.clients(id_client)
-- Sugerido: CONSTRAINT fk_credit_card_client FOREIGN KEY(id_client_fk) REFERENCES clients.clients(id_client)

-- Estos cambios en 001_dbinit.sql mejorarían la mantenibilidad de tu esquema.
-- El script de inserción de monedas anterior funcionará con tu DDL actual,
-- pero se recomienda considerar estos cambios en los nombres de las restricciones.