-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2022 a las 23:11:52
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecomerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blogposts`
--

CREATE TABLE `blogposts` (
  `idBlogposts` int(11) NOT NULL,
  `Titulo` varchar(150) NOT NULL,
  `Contenido` tinytext NOT NULL,
  `Estado` char(20) NOT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  `Actualizado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategorias` int(11) NOT NULL,
  `Nombre_Categoria` varchar(45) NOT NULL,
  `Creado` varchar(45) NOT NULL DEFAULT current_timestamp(),
  `Actualizado` varchar(45) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL,
  `Dirección` point NOT NULL,
  `Barrio` varchar(45) NOT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  `Actualizado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboradores`
--

CREATE TABLE `colaboradores` (
  `idColaboradores` int(11) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Correo_Electronico` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL,
  `Nickname` varchar(45) NOT NULL,
  `Estado` char(20) NOT NULL,
  `Numero_Celular` int(10) UNSIGNED NOT NULL,
  `Area` varchar(45) NOT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  `Actualizado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `idComentarios` int(11) NOT NULL,
  `Contenido` tinytext DEFAULT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  `Actualizado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregas`
--

CREATE TABLE `entregas` (
  `idEntregas` int(11) NOT NULL,
  `Orden` int(11) NOT NULL,
  `Estado` char(20) NOT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  `Actualizado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas`
--

CREATE TABLE `etiquetas` (
  `idEtiquetas` int(11) NOT NULL,
  `Nombre_Etiqueta` varchar(45) NOT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  `Actualizado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `Producto` varchar(45) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Subtotal` decimal(7,3) NOT NULL,
  `Total` decimal(7,3) NOT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  `Actualizado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `Serial_Pago` int(11) NOT NULL,
  `Descripción` tinytext NOT NULL,
  `Estado` char(15) NOT NULL,
  `Metodo_Pago` varchar(45) NOT NULL,
  `Valor_Pago` decimal(7,3) NOT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts_etiquetas`
--

CREATE TABLE `posts_etiquetas` (
  `idPosts_Etiquetas` int(11) NOT NULL,
  `Posts_Etiquetascol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Serial` int(11) NOT NULL,
  `Nombre_Producto` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `Descripción` varchar(45) NOT NULL,
  `Atributos` varchar(45) NOT NULL,
  `Precio` decimal(7,3) NOT NULL,
  `Url_Imagen` varchar(255) NOT NULL,
  `Stock` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  `Actualizado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `idPromociones` int(11) NOT NULL,
  `Nombre_Promoción` varchar(45) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Fin` date NOT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  `Actualizado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Correo_Electronico` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL,
  `Nickname` varchar(45) NOT NULL,
  `Estado` char(20) NOT NULL,
  `Numero_Celular` int(10) UNSIGNED NOT NULL,
  `Marca_Proveedor` varchar(45) NOT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  `Actualizado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios1`
--

CREATE TABLE `usuarios1` (
  `idUsuarios` bigint(20) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Correo_Electronico` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL,
  `Nickname` varchar(45) NOT NULL,
  `Estado` char(20) NOT NULL,
  `Numero_Celular` int(10) UNSIGNED NOT NULL,
  `Creado` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  `Actualizado` timestamp(2) NOT NULL DEFAULT current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios1`
--

INSERT INTO `usuarios1` (`idUsuarios`, `Nombres`, `Apellidos`, `Correo_Electronico`, `Contraseña`, `Nickname`, `Estado`, `Numero_Celular`, `Creado`, `Actualizado`) VALUES
(2, 'felipe', 'garcia', 'felipe1@gmail.com', '123456', 'felipe1', 'activo', 3215464698, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00'),
(6, 'andre', 'garcia', 'andres1@gmail.com', '123456', 'andres', 'activo', 3215464698, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00'),
(7, 'juancarlos', 'martinez', 'juan1@gmail.com', '456789', 'Juan', 'activo', 3215464786, '0000-00-00 00:00:00.00', '0000-00-00 00:00:00.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blogposts`
--
ALTER TABLE `blogposts`
  ADD PRIMARY KEY (`idBlogposts`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategorias`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`idColaboradores`),
  ADD UNIQUE KEY `Correo_Electronico` (`Correo_Electronico`),
  ADD UNIQUE KEY `Nickname` (`Nickname`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idComentarios`);

--
-- Indices de la tabla `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`idEntregas`),
  ADD UNIQUE KEY `Orden` (`Orden`);

--
-- Indices de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`idEtiquetas`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`Serial_Pago`);

--
-- Indices de la tabla `posts_etiquetas`
--
ALTER TABLE `posts_etiquetas`
  ADD PRIMARY KEY (`idPosts_Etiquetas`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Serial`),
  ADD UNIQUE KEY `Serial` (`Serial`),
  ADD UNIQUE KEY `Url_Imagen` (`Url_Imagen`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`idPromociones`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`),
  ADD UNIQUE KEY `Correo_Electronico` (`Correo_Electronico`),
  ADD UNIQUE KEY `Nickname` (`Nickname`);

--
-- Indices de la tabla `usuarios1`
--
ALTER TABLE `usuarios1`
  ADD PRIMARY KEY (`idUsuarios`),
  ADD UNIQUE KEY `Correo_Electronico` (`Correo_Electronico`),
  ADD UNIQUE KEY `Nickname` (`Nickname`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blogposts`
--
ALTER TABLE `blogposts`
  MODIFY `idBlogposts` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategorias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `idCiudad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `idColaboradores` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entregas`
--
ALTER TABLE `entregas`
  MODIFY `idEntregas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  MODIFY `idEtiquetas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `Serial_Pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Serial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios1`
--
ALTER TABLE `usuarios1`
  MODIFY `idUsuarios` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
