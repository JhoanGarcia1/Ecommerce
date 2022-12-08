CREATE DATABASE Ecomerce;

USE Ecomerce

CREATE TABLE  `Usuarios`(
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `Nombres` VARCHAR(10) NOT NULL,
    `Apellidos` VARCHAR(15) NOT NULL,
    `Correo_Electronico` VARCHAR(30) NOT NULL UNIQUE,
    `Contraseña` VARCHAR(35) NOT NULL,
    `Nickname` VARCHAR(10) NOT NULL,
    `Estado` BOOLEAN NOT NULL DEFAULT ,
    `Numero_Celular` INT(10) NOT NULL UNIQUE,
    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id)
);

CREATE TABLE `Pagos`(
    `Serial_Pago` VARCHAR(30) NOT NULL,
    `Descripción` VARCHAR(30) NOT NULL,
    `Estado` BOOLEAN NOT NULL ,
    `Metodo_Pago` VARCHAR(30) NOT NULL,
    `Valor_Pago` DECIMAL(7,3) NOT NULL,
    `Create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (Serial_Pago)
    FOREIGN KEY(Factura),
),

CREATE TABLE `Factura`(
    `id` INT(20) NOT NULL AUTO_INCREMENT,
    `Cantidad` INT(10) NOT NULL,
    `Sub_Total` DECIMAL(7,3) NOT NULL,
    `Total_Factura` DECIMAL(7,3) NOT NULL,
    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),

    FOREIGN KEY(Usuarios_id BIGINT(20) NOT NULL),
    FOREIGN KEY(Producto_id Serial INT(15) NOT NULL),
),

CREATE TABLE `Productos`(
    `Serial` INT (15) NOT NULL,
    `Nombre_Producto` VARCHAR(50) NOT NULL,
    `Marca` VARCHAR(15) NOT NULL,
    `Descripción` TEXT NOT NULL,
    `Atributos` VARCHAR(150) NOT NULL, 
    `Precio` DECIMAL(7,3) NOT NULL, 
    `Url_Imagen` VARCHAR(250) NOT NULL, 
    `Stock` INT(10) NOT NULL,
    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(Serial),

    FOREIGN KEY(Factura_id INT(20) NOT NULL),  
),

CREATE TABLE `Categorias`(
    `id` INT(20) NOT NULL AUTO_INCREMENT,
    `Nombre_Categoria` VARCHAR(50) NOT NULL,
    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),

    FOREIGN KEY(Serial INT (15) NOT NULL),
),

CREATE TABLE `Entregas`(
    `id` INT(20) NOT NULL AUTO_INCREMENT,
    `Orden` INT(20) NOT NULL,
    `Estado` BOOLEAN NOT NULL DEFAULT ,
    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),

    FOREIGN KEY(Serial INT (15) NOT NULL),
    FOREIGN KEY(Factura_id INT(20) NOT NULL),
    FOREIGN KEY(Usuarios_id BIGINT(20) NOT NULL),
    FOREIGN KEY(Ciudad_id INT(15) NOT NULL),
),

CREATE TABLE `Ciudad`(
    `id` INT(20) NOT NULL AUTO_INCREMENT,
    `Dirección` POINT NOT NULL,
    `Barrio` VARCHAR(10),
    `Ciudad` VARCHAR(10),
    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),

    FOREIGN KEY(Usuarios_id BIGINT(20) NOT NULL),
),

CREATE TABLE `Blogposts`(
    `id` INT(20) NOT NULL AUTO_INCREMENT,
    `Titulo` VARCHAR(150) NOT NULL,
    `Fecha_Publicación` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Contenido` TEXT,
    `Estado` BOOLEAN NOT NULL DEFAULT ,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),

    FOREIGN KEY(Usuarios_id BIGINT(20) NOT NULL),
    FOREIGN KEY(Categorias_id INT(15) NOT NULL),
    FOREIGN KEY(Comentarios_id INT(15) NOT NULL),
),

CREATE TABLE `Comentarios`(
    `id` INT(20) NOT NULL AUTO_INCREMENT,
    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),

    FOREIGN KEY(Usuarios_id BIGINT(20) NOT NULL),
),

CREATE TABLE `Tabla_Pivot Posts_Etiquetas`(
    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(Blogposts_id INT(20) NOT NULL),
    PRIMARY KEY(Etiqueta_id INT(20) NOT NULL),

    FOREIGN KEY(Blogposts_id INT(20) NOT NULL),
    FOREIGN KEY(Etiqueta_id INT(20) NOT NULL),
),

CREATE TABLE `Etiquetas`(   
    `id` INT(20) NOT NULL AUTO_INCREMENT,
    `Nombre_Etiqueta` VARCHAR(50) NOT NULL,

    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
),

CREATE TABLE `Promociones`(
    `id` INT(20) NOT NULL AUTO_INCREMENT,
    `Nombre_Promoción` VARCHAR(50) NOT NULL,
    `Vigencia` DATE NOT NULL, 

    PRIMARY KEY(id), 

    FOREIGN KEY(Serial INT (15) NOT NULL),
),

CREATE TABLE `Proveedor`(
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `Nombres` VARCHAR(10) NOT NULL,
    `Apellidos` VARCHAR(15) NOT NULL,
    `Correo_Electronico` VARCHAR(30) NOT NULL UNIQUE,
    `Contraseña` VARCHAR(35) NOT NULL,
    `Nickname` VARCHAR(10) NOT NULL,
    `Estado` BOOLEAN NOT NULL DEFAULT ,
    `Numero_Celular` INT(10) NOT NULL UNIQUE,
    `Marca_Proveedor` VARCHAR(30) NOT NULL,
    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),

    FOREIGN KEY(Serial INT (15) NOT NULL),
),

CREATE TABLE `Colaborador`(
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `Nombres` VARCHAR(10) NOT NULL,
    `Apellidos` VARCHAR(15) NOT NULL,
    `Correo_Electronico` VARCHAR(30) NOT NULL UNIQUE,
    `Contraseña` VARCHAR(35) NOT NULL,
    `Nickname` VARCHAR(10) NOT NULL,
    `Estado` BOOLEAN NOT NULL DEFAULT ,
    `Numero_Celular` INT(10) NOT NULL UNIQUE,
    `Area` VARCHAR(30) NOT NULL,
    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),
);