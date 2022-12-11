CREATE DATABASE ecomerce;

USE ecomerce;

CREATE TABLE `ecomerce`.`usuarios1` (
  `idUsuarios` BIGINT NOT NULL AUTO_INCREMENT,
  `Nombres` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Correo_Electronico` VARCHAR(45) UNIQUE NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Nickname` VARCHAR(45) UNIQUE NOT NULL,
  `Estado` CHAR(20) NOT NULL,
  `Numero_Celular` INT UNSIGNED NOT NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  `Actualizado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`idUsuarios`)
);

CREATE TABLE `ecomerce`.`pagos` (
  `Serial_Pago` INT NOT NULL AUTO_INCREMENT,
  `Descripción` TEXT(2) NOT NULL,
  `Estado` CHAR(20) NOT NULL,
  `Metodo_Pago` VARCHAR(45) NOT NULL,
  `Valor_Pago` DECIMAL(7,3) NOT NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`Serial_Pago`)
  );

CREATE TABLE `ecomerce`.`Factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `Producto` VARCHAR(45) NOT NULL,
  `Cantidad` INT NOT NULL,
  `Subtotal` DECIMAL(7,3) NOT NULL,
  `Total` DECIMAL(7,3) NOT NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  `Actualizado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`idFactura`)
);

CREATE TABLE `ecomerce`.`productos` (
  `Serial` INT NOT NULL UNIQUE AUTO_INCREMENT,
  `Nombre_Producto` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Descripción` VARCHAR(45) NOT NULL,
  `Atributos` VARCHAR(45) NOT NULL,
  `Precio` DECIMAL(7,3) NOT NULL,
  `Url_Imagen` VARCHAR(255) NOT NULL UNIQUE,
  `Stock` INT NOT NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  `Actualizado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`Serial`)
);

CREATE TABLE `ecomerce`.`categorias` (
  `idCategorias` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Categoria` VARCHAR(45) NOT NULL,
  `Creado` VARCHAR(45) NOT NULL DEFAULT NOW(),
  `Actualizado` VARCHAR(45) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`idCategorias`)
);

CREATE TABLE `ecomerce`.`entregas` (
  `idEntregas` INT NOT NULL AUTO_INCREMENT,
  `Orden` INT NOT NULL UNIQUE,
  `Estado` CHAR(20) NOT NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  `Actualizado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
   PRIMARY KEY (`idEntregas`)
);

CREATE TABLE `ecomerce`.`ciudad` (
  `idCiudad` INT NOT NULL AUTO_INCREMENT,
  `Dirección` POINT NOT NULL,
  `Barrio` VARCHAR(45) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  `Actualizado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`idCiudad`)
);

CREATE TABLE `ecomerce`.`blogposts` (
  `idBlogposts` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(150) NOT NULL,
  `Contenido` TEXT(2) NOT NULL,
  `Estado` CHAR(20) NOT NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  `Actualizado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`idBlogposts`)
);

CREATE TABLE `ecomerce`.`comentarios` (
  `idComentarios` INT NOT NULL,
  `Contenido` TEXT(2) NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  `Actualizado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`idComentarios`)
);

CREATE TABLE `Tabla_Pivot Posts_Etiquetas`(
    `Created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(Blogposts_id INT(20) NOT NULL),
    PRIMARY KEY(Etiqueta_id INT(20) NOT NULL),

    FOREIGN KEY(Blogposts_id INT(20) NOT NULL),
    FOREIGN KEY(Etiqueta_id INT(20) NOT NULL),
),

CREATE TABLE `ecomerce`.`etiquetas` (
  `idEtiquetas` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Etiqueta` VARCHAR(45) NOT NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  `Actualizado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`idEtiquetas`)
);

CREATE TABLE `ecomerce`.`promociones` (
  `idPromociones` INT NOT NULL,
  `Nombre_Promoción` VARCHAR(45) NOT NULL,
  `Fecha_Inicio` DATE NOT NULL,
  `Fecha_Fin` DATE NOT NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  `Actualizado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`idPromociones`)
);

CREATE TABLE `ecomerce`.`proveedor` (
  `idProveedor` INT NOT NULL,
  `Nombres` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Correo_Electronico` VARCHAR(45) NOT NULL UNIQUE,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Nickname` VARCHAR(45) NOT NULL UNIQUE,
  `Estado` CHAR(20) NOT NULL,
  `Numero_Celular` INT UNSIGNED NOT NULL,
  `Marca_Proveedor` VARCHAR(45) NOT NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  `Actualizado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`idProveedor`)
);

CREATE TABLE `ecomerce`.`colaboradores` (
  `idColaboradores` INT NOT NULL AUTO_INCREMENT,
  `Nombres` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Correo_Electronico` VARCHAR(45) NOT NULL UNIQUE,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Nickname` VARCHAR(45) NOT NULL UNIQUE,
  `Estado` CHAR(20) NOT NULL,
  `Numero_Celular` INT UNSIGNED NOT NULL,
  `Area` VARCHAR(45) NOT NULL,
  `Creado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  `Actualizado` TIMESTAMP(2) NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`idColaboradores`)
);