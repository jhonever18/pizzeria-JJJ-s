-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2025 a las 17:34:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `categoria_nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `categoria_nombre`) VALUES
(1, 'Entradas'),
(2, 'Pastas'),
(3, 'Bebidas'),
(4, 'Postres'),
(5, 'Pizzas populares'),
(6, 'Pizzas clásicas'),
(7, 'Pizzas especiales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` bigint(20) NOT NULL,
  `cli_nombre` varchar(50) NOT NULL,
  `cli_documento` varchar(20) NOT NULL,
  `cli_apellido` varchar(50) DEFAULT NULL,
  `cli_correo` varchar(100) NOT NULL,
  `cli_contrasena` varchar(255) DEFAULT NULL,
  `cli_telefono` varchar(15) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `cli_nombre`, `cli_documento`, `cli_apellido`, `cli_correo`, `cli_contrasena`, `cli_telefono`, `fecha_registro`) VALUES
(46, 'j', '', 'c', 'co@gmail.com', '$2y$10$1MArhkwKYaDb/rFLoEQrx.S9MqmIgI9caUFuZJRl.Jt0KKi5NGRW2', '', '2025-07-08 18:35:04'),
(50, 'jhon', '', '', '', '$2y$10$fLD3dABfQHe7yFYIC9tLr.OLh4wRSaH54VQA9SchdZfXvLbn/5i6u', NULL, '2025-07-09 09:36:22'),
(51, 'lina', '', '', '', '$2y$10$5RVosFjhENAwhWpv6QRwLeGQzt8EjIIJAsLZcJfFs5HOaXbik8h92', NULL, '2025-07-09 09:38:02'),
(52, 'lina marchela', '', '', '', '$2y$10$WY./Wi/jpeOFrTrj1Uzl8OAGLIxUj4oaRz4PqPFyItA5S/YDbYmIG', NULL, '2025-07-09 10:02:11'),
(53, 'lina', '', '', '', '$2y$10$FeRgeVtxBoYeRDyykNVYnuIcXt2OK.IoZtLH.HP5dNwKfOn0pnMjq', NULL, '2025-07-09 10:05:17'),
(54, 'lian', '', '', 'cajero_77777@local.com', '$2y$10$5j3CYzZkDfBSMKbYsEsdGeZTxw5SgsFzScndP72seTzGlJHBvQl6a', NULL, '2025-07-09 10:21:58'),
(55, 'jcd', '', NULL, 'jhon@gmail.com', NULL, NULL, '2025-07-09 10:48:21'),
(56, 'hjon', '', NULL, 'd@gmail.com', NULL, NULL, '2025-07-09 10:48:45'),
(57, 'hjon', '4', NULL, 'd@gmail.com', NULL, NULL, '2025-07-09 10:53:24'),
(58, 'jhn', '2', NULL, 'j@gmail.com', NULL, NULL, '2025-07-09 10:53:48'),
(59, 'w', '3', NULL, 'hb@gmail.com', NULL, NULL, '2025-07-09 11:03:15'),
(60, 'palacios', '2344', NULL, 'paalcios@gmail.com', NULL, NULL, '2025-07-09 11:18:21'),
(61, 'jhon', '1111667388', NULL, 'ever@gmail.com', NULL, NULL, '2025-07-11 11:42:12'),
(62, 'lina', '111111111111', NULL, 'lina@gmail.com', NULL, '3152628', '2025-07-11 11:48:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `detalle_id` int(11) NOT NULL,
  `factura_id` int(11) DEFAULT NULL,
  `plato_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `esta_id` int(11) NOT NULL,
  `esta_desc` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`esta_id`, `esta_desc`) VALUES
(1, 'activo'),
(2, 'inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

CREATE TABLE `estado_pedido` (
  `estped_id` int(11) NOT NULL,
  `estped_desc` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_pedido`
--

INSERT INTO `estado_pedido` (`estped_id`, `estped_desc`) VALUES
(4, 'cancelado'),
(2, 'en proceso'),
(3, 'entregado'),
(1, 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `factura_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `factura_desc` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `ing_id` int(11) NOT NULL,
  `esta_id` int(11) DEFAULT NULL,
  `ing_nombre` varchar(30) DEFAULT NULL,
  `ing_desc` varchar(100) DEFAULT NULL,
  `ing_cantidad` decimal(10,2) DEFAULT NULL,
  `unidad_id` int(11) DEFAULT NULL,
  `ing_precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`ing_id`, `esta_id`, `ing_nombre`, `ing_desc`, `ing_cantidad`, `unidad_id`, `ing_precio`) VALUES
(1, 1, 'Queso Mozzarella', 'dcd', 10.00, 2, 50000.00),
(2, NULL, 'Jamón', NULL, NULL, NULL, NULL),
(3, NULL, 'Pepperoni', NULL, NULL, NULL, NULL),
(7, 1, 'pastas', 'ineioniv', 10.00, 1, 9.00),
(12, 1, 'tomate', 'ef', 77.00, 1, 12.00),
(16, 1, 'masa', 'ccddc', 19.00, 2, 90.00),
(18, 1, 'lechuga', 'uieujk', 21.00, 5, 100000.00),
(19, 1, 'champiñon', 'widionqi', 2.00, 2, 9000.00),
(20, 2, 'j', 'h', 8.00, 1, 8.00),
(21, NULL, 'Queso Mozzarella', NULL, NULL, NULL, NULL),
(22, NULL, 'Jamón', NULL, NULL, NULL, NULL),
(23, NULL, 'Pepperoni', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `ing_id` int(11) DEFAULT NULL,
  `plato_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `metopago_id` int(11) NOT NULL,
  `metopago_desc` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`metopago_id`, `metopago_desc`) VALUES
(3, 'Daviplata'),
(1, 'Efectivo'),
(2, 'Nequi'),
(4, 'Tarjeta débito/crédito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL,
  `metopago_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `pedido_fecha` varchar(20) DEFAULT NULL,
  `pedido_valor_pagar` varchar(20) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `estped_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `metopago_id`, `user_id`, `pedido_fecha`, `pedido_valor_pagar`, `cliente_id`, `estped_id`) VALUES
(91, 3, NULL, '2025-07-09 11:15:22', '2', NULL, 3),
(92, 2, NULL, '2025-07-09 11:24:30', '37800', NULL, NULL),
(93, 4, NULL, '2025-07-09 11:29:59', '12900', NULL, NULL),
(94, 3, NULL, '2025-07-09 11:36:21', '12900', 50, NULL),
(95, 1, NULL, '2025-07-09 11:38:02', '898', 51, NULL),
(96, 1, NULL, '2025-07-09 12:02:11', '898', 52, NULL),
(97, 3, NULL, '2025-07-09 12:05:17', '900', 53, 4),
(98, 3, NULL, '2025-07-09 12:21:57', '898', 54, 3),
(108, 3, NULL, '2025-07-09 13:18:21', '2', 60, 3),
(109, 3, NULL, '2025-07-11 13:42:12', '165013.03', 61, 3),
(110, 1, NULL, '2025-07-11 13:48:06', '165009.03', 62, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalles`
--

CREATE TABLE `pedido_detalles` (
  `detalle_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `plato_nombre` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido_detalles`
--

INSERT INTO `pedido_detalles` (`detalle_id`, `pedido_id`, `plato_nombre`, `cantidad`, `precio_unitario`) VALUES
(43, 91, 'hj', 1, 2),
(44, 92, 'kjn', 2, 898),
(45, 92, 'hj', 2, 2),
(46, 92, 'pastas', 3, 12000),
(47, 93, 'kjn', 1, 898),
(48, 93, 'hj', 1, 2),
(49, 93, 'pastas', 1, 12000),
(50, 94, 'kjn', 1, 898),
(51, 94, 'hj', 1, 2),
(52, 94, 'pastas', 1, 12000),
(53, 95, 'kjn', 1, 898),
(54, 96, 'kjn', 1, 898),
(55, 97, 'kjn', 1, 898),
(56, 97, 'hj', 1, 2),
(57, 98, 'kjn', 1, 898),
(58, 108, 'hj', 1, 2),
(59, 109, 'pizza jamon y queso', 1, 15000),
(60, 109, 'h', 1, 9),
(61, 109, 'pizzas', 1, 150000),
(62, 109, 'r', 1, 4),
(63, 110, 'pizza jamon y queso', 1, 15000),
(64, 110, 'h', 1, 9),
(65, 110, 'pizzas', 1, 150000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_platos`
--

CREATE TABLE `pedido_platos` (
  `pedido_id` int(11) NOT NULL,
  `plato_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `plato_id` int(11) NOT NULL,
  `plato_nombre` varchar(100) DEFAULT NULL,
  `plato_desc` varchar(445) DEFAULT NULL,
  `plato_precio` decimal(10,2) DEFAULT NULL,
  `plato_imagen_url` varchar(255) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `es_popular` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `platos`
--

INSERT INTO `platos` (`plato_id`, `plato_nombre`, `plato_desc`, `plato_precio`, `plato_imagen_url`, `categoria_id`, `es_popular`) VALUES
(205, 'pizzza champiñones extra queso', 'jk', 3500.00, '../uploads/platos/plato_6870536f603a6.jpg', NULL, 0),
(206, 'pizzza champiñones', 'cdwjces', 3500.00, 'https://s1.abcstatics.com/abc/sevilla/media/gurmesevilla/2009/09/AdobeStock_278043990-Espaguetis-bolo%C3%B1esa.jpeg', NULL, 0),
(214, 'd', 'd', 33.00, '../uploads/platos/plato_686f2d652f96c.png', NULL, 0),
(215, 'r', 'r', 4.00, '../uploads/platos/plato_686f348fd8d4d.png', NULL, 0),
(216, 'pizzas', 'ddne', 150000.03, '../uploads/platos/plato_68701659f1a94.png', NULL, 0),
(217, 'h', 'nj', 9.00, 'https://i.pinimg.com/736x/d1/cd/01/d1cd0192d3f4fcc20f454a4143f157d7.jpg', NULL, 0),
(219, 'pizza jamon y queso', 'deliciosa pizza para dos personas', 15000.00, '../uploads/platos/plato_6870a242abeb5.png', NULL, 0),
(221, 'plato 1.1', 'lallala', 900000.00, '../uploads/platos/plato_68712bc56aae7.jpg', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato_ingredientes`
--

CREATE TABLE `plato_ingredientes` (
  `plato_id` int(11) NOT NULL,
  `ing_id` int(11) NOT NULL,
  `cantidad` float NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plato_ingredientes`
--

INSERT INTO `plato_ingredientes` (`plato_id`, `ing_id`, `cantidad`) VALUES
(221, 1, 1),
(221, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rol_id` int(11) NOT NULL,
  `rol_desc` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rol_id`, `rol_desc`) VALUES
(1, 'administrador'),
(2, 'cajero'),
(3, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_id`
--

CREATE TABLE `tipo_id` (
  `ti_id` int(11) NOT NULL,
  `ti_desc` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_id`
--

INSERT INTO `tipo_id` (`ti_id`, `ti_desc`) VALUES
(1, 'cedula ciudadana'),
(3, 'cedula ciudadana dig'),
(5, 'cedula extranjera'),
(4, 'pasaporte'),
(2, 'tarjeta de identidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medida`
--

CREATE TABLE `unidades_medida` (
  `unidad_id` int(11) NOT NULL,
  `unidad_nombre` varchar(20) NOT NULL,
  `unidad_abreviacion` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidades_medida`
--

INSERT INTO `unidades_medida` (`unidad_id`, `unidad_nombre`, `unidad_abreviacion`) VALUES
(1, 'Kilogramos', 'kg'),
(2, 'Gramos', 'g'),
(3, 'Litros', 'L'),
(4, 'Mililitros', 'ml'),
(5, 'Unidades', 'und');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `user_id` bigint(20) NOT NULL,
  `ti_desc` varchar(20) DEFAULT NULL,
  `user_nombre` varchar(20) DEFAULT NULL,
  `user_apellido` varchar(20) DEFAULT NULL,
  `user_correo` varchar(30) DEFAULT NULL,
  `user_contrasena` varchar(255) DEFAULT NULL,
  `user_telefono` varchar(10) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `user_foto` varchar(255) DEFAULT NULL,
  `esta_id` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`user_id`, `ti_desc`, `user_nombre`, `user_apellido`, `user_correo`, `user_contrasena`, `user_telefono`, `rol_id`, `user_foto`, `esta_id`, `fecha_registro`) VALUES
(1, 'cedula ciudadana', 'adminss', 'locos', 'casco@gmail.com', '123', '1221313', 1, NULL, 1, '2025-07-08 04:28:48'),
(99, 'cedula ciudadana', 'malo', 'malo', 'malo@gmail.com', '123', '999999', 1, NULL, 1, '2025-07-08 04:34:23'),
(2112, 'cedula ciudadana', 'loco', 'loco', 'loco@gmail.com', '123', '010101010', 2, NULL, 1, '2025-07-08 04:20:30'),
(9992, 'cedula ciudadana', 'malote', 'malote', 'malot1@gmail.com', '123', '99912', 2, NULL, 1, '2025-07-08 04:41:30'),
(99999, 'cedula ciudadana', 'maloe', 'maloe', 'malo1@gmail.com', '123', '9999999', 2, NULL, 1, '2025-07-08 04:40:34'),
(783447, 'cedula ciudadana', 'palacioss', 'Ever', 'jhon@gmail.com', 'jhon123', '324286', 2, '1752061556_JJJ_s_Pizzas-removebg-preview__2_.png', 1, '2025-07-08 03:37:52'),
(999211, 'cedula ciudadana', 'malotek', 'malotek', 'malotq1@gmail.com', '123', '999122', 2, NULL, 1, '2025-07-08 04:46:15'),
(3333333, 'cedula ciudadana', 'jhonx', 'jhonx', 'jesus@gmail.com', '33333', '43344332', 1, NULL, 1, '2025-07-08 03:37:52'),
(8954451, 'cedula ciudadana', 'Administrador', 'jjj\'s', 'admin@gmail.com', '123', '895523', 1, '1752094381_e74ecc3271fa1791f0e4d9067fc85d3f.jpg', 1, '2025-07-08 03:37:52'),
(8999999, 'cedula ciudadana', 'jknkjnj', 'nuni', 'gordo@gmail.com', '877i', '000099', 1, NULL, 1, '2025-07-08 03:37:52'),
(85757575, 'cedula ciudadana', 'jhon', 'jhon', 'edwin@gmail.com', 'jhon123', '43344', 2, NULL, 1, '2025-07-08 03:37:52');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `factura_id` (`factura_id`),
  ADD KEY `plato_id` (`plato_id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`esta_id`),
  ADD UNIQUE KEY `esta_desc` (`esta_desc`);

--
-- Indices de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`estped_id`),
  ADD UNIQUE KEY `estped_desc` (`estped_desc`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`factura_id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`ing_id`),
  ADD KEY `esta_id` (`esta_id`),
  ADD KEY `fk_unidad_id` (`unidad_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `ing_id` (`ing_id`),
  ADD KEY `plato_id` (`plato_id`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`metopago_id`),
  ADD UNIQUE KEY `metopago_desc` (`metopago_desc`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `metopago_id` (`metopago_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_pedidos_cliente` (`cliente_id`),
  ADD KEY `fk_estado_pedido` (`estped_id`);

--
-- Indices de la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `pedido_platos`
--
ALTER TABLE `pedido_platos`
  ADD PRIMARY KEY (`pedido_id`,`plato_id`),
  ADD KEY `plato_id` (`plato_id`);

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`plato_id`),
  ADD KEY `fk_categoria_id` (`categoria_id`);

--
-- Indices de la tabla `plato_ingredientes`
--
ALTER TABLE `plato_ingredientes`
  ADD PRIMARY KEY (`plato_id`,`ing_id`),
  ADD KEY `fk_ingrediente` (`ing_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rol_id`),
  ADD UNIQUE KEY `rol_desc` (`rol_desc`);

--
-- Indices de la tabla `tipo_id`
--
ALTER TABLE `tipo_id`
  ADD PRIMARY KEY (`ti_id`),
  ADD UNIQUE KEY `ti_desc` (`ti_desc`);

--
-- Indices de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  ADD PRIMARY KEY (`unidad_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_correo` (`user_correo`),
  ADD UNIQUE KEY `user_telefono` (`user_telefono`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `esta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  MODIFY `estped_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `factura_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `ing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `metopago_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `plato_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_id`
--
ALTER TABLE `tipo_id`
  MODIFY `ti_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  MODIFY `unidad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`factura_id`),
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`plato_id`) REFERENCES `platos` (`plato_id`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`);

--
-- Filtros para la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD CONSTRAINT `fk_unidad_id` FOREIGN KEY (`unidad_id`) REFERENCES `unidades_medida` (`unidad_id`),
  ADD CONSTRAINT `ingredientes_ibfk_1` FOREIGN KEY (`esta_id`) REFERENCES `estado` (`esta_id`),
  ADD CONSTRAINT `ingredientes_ibfk_2` FOREIGN KEY (`unidad_id`) REFERENCES `unidades_medida` (`unidad_id`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`ing_id`) REFERENCES `ingredientes` (`ing_id`),
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`plato_id`) REFERENCES `platos` (`plato_id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_estado_pedido` FOREIGN KEY (`estped_id`) REFERENCES `estado_pedido` (`estped_id`),
  ADD CONSTRAINT `fk_pedidos_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedidos_metodopago` FOREIGN KEY (`metopago_id`) REFERENCES `metodo_pago` (`metopago_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedidos_usuario` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido_detalles`
--
ALTER TABLE `pedido_detalles`
  ADD CONSTRAINT `pedido_detalles_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido_platos`
--
ALTER TABLE `pedido_platos`
  ADD CONSTRAINT `pedido_platos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`),
  ADD CONSTRAINT `pedido_platos_ibfk_2` FOREIGN KEY (`plato_id`) REFERENCES `platos` (`plato_id`);

--
-- Filtros para la tabla `platos`
--
ALTER TABLE `platos`
  ADD CONSTRAINT `fk_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `plato_ingredientes`
--
ALTER TABLE `plato_ingredientes`
  ADD CONSTRAINT `fk_ingrediente` FOREIGN KEY (`ing_id`) REFERENCES `ingredientes` (`ing_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_plato` FOREIGN KEY (`plato_id`) REFERENCES `platos` (`plato_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
