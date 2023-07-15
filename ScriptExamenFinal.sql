DROP DATABASE westbank;
CREATE DATABASE westbank;
USE westbank;

-- Crear tabla clientes
CREATE TABLE clientes (
  id INT AUTO_INCREMENT,
  run INT,
  digito_verificador CHAR(1),
  clave VARCHAR(20),
  nombre VARCHAR(50),
  apellido_paterno VARCHAR(50),
  apellido_materno VARCHAR(50),
  domicilio VARCHAR(100),
  comuna VARCHAR(50),
  telefono VARCHAR(20),
  PRIMARY KEY (id)
);

-- Crear tabla cuentas
CREATE TABLE cuentas (
  id INT AUTO_INCREMENT,
  numero INT,
  saldo INT,
  descripcion ENUM('Corriente', 'Ahorro'),
  cliente_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Crear tabla transferencias
CREATE TABLE transferencias (
  id INT AUTO_INCREMENT,
  cuenta_origen_id INT,
  cuenta_destino_id INT,
  monto INT,
  fecha_transferencia TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (cuenta_origen_id) REFERENCES cuentas(id),
  FOREIGN KEY (cuenta_destino_id) REFERENCES cuentas(id)
);


-- Insertar datos tabla clientes
INSERT INTO clientes (run, digito_verificador, clave, nombre, apellido_paterno, apellido_materno, domicilio, comuna, telefono)
VALUES (12345678, 'K', 'Abcdef12345', 'Juan', 'Pérez', 'González', 'Calle 123', 'Santiago', '912345678');

INSERT INTO clientes (run, digito_verificador, clave, nombre, apellido_paterno, apellido_materno, domicilio, comuna, telefono)
VALUES (98765432, 'J', 'Xyz987654', 'María', 'López', 'Fernández', 'Avenida 456', 'Maipú', '987654321');

-- Insertar datos tabla cuentas
INSERT INTO cuentas (numero, saldo, descripcion, cliente_id)
VALUES (123456789, 50000, 'Corriente', 1);

INSERT INTO cuentas (numero, saldo, descripcion, cliente_id)
VALUES (987654321, 100000, 'Ahorro', 2);

-- Insertar datos tabla trasnferencias
INSERT INTO transferencias (cuenta_origen_id, cuenta_destino_id, monto)
VALUES (1, 2, 5000);
INSERT INTO transferencias (cuenta_origen_id, cuenta_destino_id, monto)
VALUES (1, 2, 5000);

commit;