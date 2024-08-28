-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-08-2024 a las 23:03:58
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajeros`
--

CREATE TABLE `cajeros` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaInicio` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fechaFin` timestamp NULL DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Viveres', 'asdfaf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprasdetalles`
--

CREATE TABLE `comprasdetalles` (
  `id` int(11) NOT NULL,
  `idCompra` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprasencabezados`
--

CREATE TABLE `comprasencabezados` (
  `id` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `formaPago` int(2) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Hp', ''),
(2, 'Marca prueba', 'descripcion de la marca prueba'),
(3, 'Huawei', ''),
(4, 'Samsung', 'ssd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosdetalles`
--

CREATE TABLE `pedidosdetalles` (
  `id` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosencabezados`
--

CREATE TABLE `pedidosencabezados` (
  `id` int(11) NOT NULL,
  `idUsuarioCliente` int(11) NOT NULL,
  `idCajero` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `formaPago` int(2) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `idMarca` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `stock` int(11) NOT NULL,
  `vrUnitarioVenta` float NOT NULL,
  `vrUnitarioCompra` float NOT NULL,
  `urlimagen` varchar(500) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `idMarca`, `idCategoria`, `codigo`, `nombre`, `stock`, `vrUnitarioVenta`, `vrUnitarioCompra`, `urlimagen`, `descripcion`) VALUES
(13, 3, 1, 'abc123', 'arroz', 25, 2600, 3200, '08082024-030819.jpeg', 'descripcion del kilo de arroz'),
(14, 4, 1, 'pruebe', 'prueba', 52, 22222, 33333, '08082024-050839.jpg', 'leche prueba '),
(15, 4, 1, 'xyz', 'prueba2', 25, 66666, 88888, NULL, 'preuba sin imagen'),
(16, 3, 1, 'codigoabc', 'leche prueba json', 250, 2666, 2999, NULL, 'descripcion dcodigo abc'),
(18, 3, 1, 'pop1234', 'prueba json actualiz', 66, 6666, 9999, '', 'editarjson sin imagen 1'),
(19, 3, 1, '2codigoabc', '2leche prueba json', 250, 2666, 2999, '', 'json sin imagen'),
(20, 3, 1, 'pop123', 'prueba json', 55, 888, 9000, '', 'json sin imagen 1'),
(21, 3, 1, 'pop1234', 'prueba json', 55, 888, 9000, '', 'json sin imagen 1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosunidadesmedidas`
--

CREATE TABLE `productosunidadesmedidas` (
  `idProducto` int(11) NOT NULL,
  `idUnidadMedida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `nombreContacto` varchar(45) DEFAULT NULL,
  `telefonoContacto` varchar(45) DEFAULT NULL,
  `correoContacto` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposunidadesmedidas`
--

CREATE TABLE `tiposunidadesmedidas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposusuarios`
--

CREATE TABLE `tiposusuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tiposusuarios`
--

INSERT INTO `tiposusuarios` (`id`, `nombre`, `descripcion`) VALUES
(13, 'Admin', 'administra la aplicacion'),
(14, 'Cliente', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadesmedidas`
--

CREATE TABLE `unidadesmedidas` (
  `id` int(11) NOT NULL,
  `idTipoUnidadMedida` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `sigla` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `numIdentificacion` int(15) NOT NULL,
  `tipoIdentificacion` int(2) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `clave` varchar(250) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `numIdentificacion`, `tipoIdentificacion`, `correo`, `usuario`, `clave`, `telefono`, `direccion`, `fechaRegistro`) VALUES
(17, 'Jhonny', 'Guerrero', 85025424, 1, 'joguerrero@sena.edu.co', 'Admin', '$2y$10$gNeBuTb3uluwrEGf3am3v.Ar9HF2J80kFYLiZUb0GMp/4b.aS0lvO', '3163601029', 'Calle 5 No 5-5', '2024-08-07 02:02:41'),
(18, 'Juan', 'Valdez', 1070780389, 1, 'juan@gmail.com', 'juan', '$2y$10$KAoWKZM/x7dSBMBilnS5MuODRI8NuP4JmtYcFo4/6V8bfYi7ERfiW', '3229377192', 'Sasaima', '2024-08-07 02:06:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariostiposusuarios`
--

CREATE TABLE `usuariostiposusuarios` (
  `idTipoUsuario` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuariostiposusuarios`
--

INSERT INTO `usuariostiposusuarios` (`idTipoUsuario`, `idUsuario`, `estado`) VALUES
(13, 17, 1),
(14, 18, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajeros`
--
ALTER TABLE `cajeros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cajeros_usuarios1_idx` (`idUsuario`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comprasdetalles`
--
ALTER TABLE `comprasdetalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comprasDetalles_comprasEncabezados1_idx` (`idCompra`),
  ADD KEY `fk_comprasDetalles_productos1_idx` (`idProducto`);

--
-- Indices de la tabla `comprasencabezados`
--
ALTER TABLE `comprasencabezados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comprasEncabezados_proveedores1_idx` (`idProveedor`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidosdetalles`
--
ALTER TABLE `pedidosdetalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedidosDetalles_pedidosEncabezados1_idx` (`idPedido`),
  ADD KEY `fk_pedidosDetalles_productos1_idx` (`idProducto`);

--
-- Indices de la tabla `pedidosencabezados`
--
ALTER TABLE `pedidosencabezados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedidosEncabezados_cajeros1_idx` (`idCajero`),
  ADD KEY `fk_pedidosEncabezados_usuarios1_idx` (`idUsuarioCliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productos_marcas1_idx` (`idMarca`),
  ADD KEY `fk_productos_categorias1_idx` (`idCategoria`);

--
-- Indices de la tabla `productosunidadesmedidas`
--
ALTER TABLE `productosunidadesmedidas`
  ADD PRIMARY KEY (`idProducto`,`idUnidadMedida`),
  ADD KEY `fk_productos_has_unidadesMedidas_unidadesMedidas1_idx` (`idUnidadMedida`),
  ADD KEY `fk_productos_has_unidadesMedidas_productos1_idx` (`idProducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proveedores_usuarios1_idx` (`idUsuario`);

--
-- Indices de la tabla `tiposunidadesmedidas`
--
ALTER TABLE `tiposunidadesmedidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tiposusuarios`
--
ALTER TABLE `tiposusuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidadesmedidas`
--
ALTER TABLE `unidadesmedidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_unidadesMedidas_tiposUnidadesMedidas1_idx` (`idTipoUnidadMedida`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numIdentificacion_UNIQUE` (`numIdentificacion`);

--
-- Indices de la tabla `usuariostiposusuarios`
--
ALTER TABLE `usuariostiposusuarios`
  ADD PRIMARY KEY (`idTipoUsuario`,`idUsuario`),
  ADD KEY `fk_tiposUsuarios_has_usuarios_usuarios1_idx` (`idUsuario`),
  ADD KEY `fk_tiposUsuarios_has_usuarios_tiposUsuarios1_idx` (`idTipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cajeros`
--
ALTER TABLE `cajeros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comprasdetalles`
--
ALTER TABLE `comprasdetalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprasencabezados`
--
ALTER TABLE `comprasencabezados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidosdetalles`
--
ALTER TABLE `pedidosdetalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposunidadesmedidas`
--
ALTER TABLE `tiposunidadesmedidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposusuarios`
--
ALTER TABLE `tiposusuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `unidadesmedidas`
--
ALTER TABLE `unidadesmedidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajeros`
--
ALTER TABLE `cajeros`
  ADD CONSTRAINT `fk_cajeros_usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comprasdetalles`
--
ALTER TABLE `comprasdetalles`
  ADD CONSTRAINT `fk_comprasDetalles_comprasEncabezados1` FOREIGN KEY (`idCompra`) REFERENCES `comprasencabezados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comprasDetalles_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comprasencabezados`
--
ALTER TABLE `comprasencabezados`
  ADD CONSTRAINT `fk_comprasEncabezados_proveedores1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidosdetalles`
--
ALTER TABLE `pedidosdetalles`
  ADD CONSTRAINT `fk_pedidosDetalles_pedidosEncabezados1` FOREIGN KEY (`idPedido`) REFERENCES `pedidosencabezados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidosDetalles_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidosencabezados`
--
ALTER TABLE `pedidosencabezados`
  ADD CONSTRAINT `fk_pedidosEncabezados_cajeros1` FOREIGN KEY (`idCajero`) REFERENCES `cajeros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidosEncabezados_usuarios1` FOREIGN KEY (`idUsuarioCliente`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_marcas1` FOREIGN KEY (`idMarca`) REFERENCES `marcas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productosunidadesmedidas`
--
ALTER TABLE `productosunidadesmedidas`
  ADD CONSTRAINT `fk_productos_has_unidadesMedidas_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_has_unidadesMedidas_unidadesMedidas1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadesmedidas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `fk_proveedores_usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `unidadesmedidas`
--
ALTER TABLE `unidadesmedidas`
  ADD CONSTRAINT `fk_unidadesMedidas_tiposUnidadesMedidas1` FOREIGN KEY (`idTipoUnidadMedida`) REFERENCES `tiposunidadesmedidas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuariostiposusuarios`
--
ALTER TABLE `usuariostiposusuarios`
  ADD CONSTRAINT `fk_tiposUsuarios_has_usuarios_tiposUsuarios1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tiposusuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tiposUsuarios_has_usuarios_usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
