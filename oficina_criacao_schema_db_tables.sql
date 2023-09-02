USE oficina;

/*
Funcionários da empresa (oficina)
*/
CREATE TABLE employees (
	id_employee INT AUTO_INCREMENT,
    f_name VARCHAR(20) NOT NULL,
    l_name VARCHAR(60) NOT NULL,
    cpf CHAR(11) NOT NULL,
    phone CHAR(11) NOT NULL,
    b_date DATE,
    is_active BOOLEAN DEFAULT FALSE,
    
    PRIMARY KEY (id_employee),
    CONSTRAINT unique_cpf UNIQUE (cpf)
);

/*
Clientes registrados da oficina
*/
CREATE TABLE clients (
	id_client INT AUTO_INCREMENT,
    c_name VARCHAR(255) NOT NULL,
    cpf CHAR(11) NOT NULL,
    phone CHAR(11) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(100),
    
    PRIMARY KEY (id_client),
    CONSTRAINT unique_cpf UNIQUE (cpf),
    CONSTRAINT unique_email UNIQUE (email)
);

/*
Carro em manutenção
*/
CREATE TABLE automobile (
	id_automobile INT AUTO_INCREMENT,
    id_employee_manager INT,
    car_model VARCHAR(30),
    car_status ENUM('Na fila de espera', 'Em manutenção', 'Concluído') DEFAULT 'Em manutenção',
    
    PRIMARY KEY (id_automobile, id_employee_manager),
    CONSTRAINT fk_employee_automobile FOREIGN KEY (id_employee_manager) REFERENCES employees(id_employee)
);

-- DROP TABLE automobile;

/*
Nota de serviço feito
*/
CREATE TABLE service (
	id_automobile_on_service INT AUTO_INCREMENT,
    id_client_owner INT,
    id_employee_manager INT,
    price FLOAT NOT NULL,
    start_date DATETIME,
    finish_date DATETIME,
    note VARCHAR(255),
    
    
    CONSTRAINT fk_id_client_owner FOREIGN KEY (id_client_owner) REFERENCES clients(id_client),
    CONSTRAINT fk_id_employee_manager FOREIGN KEY (id_employee_manager) REFERENCES employees(id_employee),
    CONSTRAINT fk_id_automobile_on_service FOREIGN KEY (id_automobile_on_service) REFERENCES automobile(id_automobile)
);

SHOW TABLES;