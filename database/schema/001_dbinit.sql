-- Creando la base de datos necesaria para este ejercicio
-- Nota: La creación de la base de datos y el cambio a ella ('USE')
-- generalmente se manejan fuera del script de definición de tablas si usas psql.
-- 1. CREATE DATABASE banckinc; (en psql, conectado a 'postgres' u otra BD)
-- 2. \c banckinc (en psql, para cambiar a la base de datos recién creada)
-- Luego puedes ejecutar el siguiente DDL:
CREATE DATABASE banckinc;
-- USE banckinc; -- Este comando no es estándar en psql para scripts.
CREATE SCHEMA IF NOT EXISTS clients;
CREATE SCHEMA IF NOT EXISTS merchants;
CREATE SCHEMA IF NOT EXISTS bank_product_debit_cards; -- Más específico para el producto tarjeta de débito
CREATE SCHEMA IF NOT EXISTS bank_product_credit_cards;
CREATE SCHEMA IF NOT EXISTS bank_product_loans; -- Más específico para productos de préstamo
CREATE SCHEMA IF NOT EXISTS bank_product_accounts;

CREATE SCHEMA IF NOT EXISTS utilities;


CREATE TABLE IF NOT EXISTS utilities.countrys(
    id_country SERIAL PRIMARY KEY,
    country_name  VARCHAR(60) NOT NULL UNIQUE -- Aumentado ligeramente el tamaño y quitada coma extra
);

CREATE TABLE IF NOT EXISTS utilities.citys(
    id_city SERIAL PRIMARY KEY,
    city_name  VARCHAR(60) NOT NULL, -- Aumentado ligeramente el tamaño
    id_country_fk INTEGER,
    CONSTRAINT fk_country
    FOREIGN KEY(id_country_fk)
    REFERENCES utilities.countrys(id_country)
    ON DELETE SET NULL -- La sintaxis correcta es SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS utilities.currencys(
    id_currency SERIAL PRIMARY KEY,
    name_currency VARCHAR(40) NOT NULL,
    short_name_currency VARCHAR(3) NOT NULL,
    id_country_fk INTEGER,
    CONSTRAINT fk_country
    FOREIGN KEY(id_country_fk)
    REFERENCES utilities.countrys(id_country)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TYPE clients.status_list AS ENUM ('ACTIVE', 'INACTIVE', 'BLOCKED');

CREATE TABLE IF NOT EXISTS clients.clients(
    id_client SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    personal_id VARCHAR(50) NOT NULL UNIQUE, -- Aumentado ligeramente el tamaño
    email VARCHAR(100) NOT NULL UNIQUE, -- Los emails pueden ser más largos
    phone VARCHAR(30) NOT NULL, -- Ajustado para números de teléfono
    address VARCHAR(150) NOT NULL, -- "address" es la ortografía común, y las direcciones pueden ser largas
    id_city_fk INTEGER,
    status clients.status_list NOT NULL,
    CONSTRAINT fk_city
    FOREIGN KEY(id_city_fk)
    REFERENCES utilities.citys(id_city)
    ON DELETE SET NULL -- La sintaxis correcta es SET NULL
    ON UPDATE CASCADE
);

--En la logica del negocio se debe plantear la opcion de que antes de que se genere la compra, el sistema busque si ya el negocio esta registrado, o si no, si no que
-- se haga un registro nuevo asignandole un id_merchant automatico que 
CREATE TABLE IF NOT EXISTS merchants.merchant(
    id_merchant_register SERIAL PRIMARY KEY,
    number_id_merchant VARCHAR(40),
    merchant_name VARCHAR(60) NOT NULL,
    address VARCHAR(150) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    id_country_fk INTEGER,
    CONSTRAINT fk_country
    FOREIGN KEY(id_country_fk)
    REFERENCES utilities.countrys(id_country)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS bank_product_credit_cards.credit_card( -- Movida al schema correcto
    id_credit_card SERIAL PRIMARY KEY,
    card_number VARCHAR(25) NOT NULL UNIQUE,
    id_client_fk INTEGER REFERENCES clients.clients(id_client) -- Ejemplo de relación
    expiration_date DATE NOT NULL,
    cvv VARCHAR(4) NOT NULL,
    CONSTRAINT fk_client
    FOREIGN KEY(id_client_fk)
    REFERENCES clients.clients(id_client)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);
