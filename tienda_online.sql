-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2024 at 10:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tienda_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cusref` int(11) NOT NULL,
  `cusidenti` varchar(20) NOT NULL,
  `cusnombre` varchar(100) DEFAULT NULL,
  `cusactivo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cusref`, `cusidenti`, `cusnombre`, `cusactivo`) VALUES
(1, '10001', 'Pepito Pérez', 1),
(2, '20002', 'Juanito Camacho', 1);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `discod` int(11) NOT NULL,
  `discobs` varchar(1000) DEFAULT NULL COMMENT 'Observación de la razón por la cual se aplicó el descuento',
  `discactivo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`discod`, `discobs`, `discactivo`) VALUES
(0, '0', 1),
(10, '10%', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `procodigo` int(11) NOT NULL,
  `pronombre` varchar(50) NOT NULL,
  `proactivo` int(1) NOT NULL,
  `prodescrip` varchar(100) NOT NULL,
  `proprecio` double NOT NULL COMMENT 'Precio nominal del producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`procodigo`, `pronombre`, `proactivo`, `prodescrip`, `proprecio`) VALUES
(1000001, 'PK_INT_30_GB', 1, 'Paquete de Internet de 30 Gigas', 1200000),
(1000002, 'CD_INT_SIM_300_GB', 1, 'Canal de Internet Simétrico de 300 Gigas', 15000000),
(1000003, 'LIC_MWIN_11_PRO', 1, 'Licencia individual Microsoft Windows 11 PRO', 350000),
(1000004, 'LIC_AD_ADAE_PRO', 1, 'Licencia individual Adobe After Effects 2024 PRO', 480000);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `salecod` int(11) NOT NULL,
  `saleobser` varchar(500) DEFAULT NULL COMMENT 'Observación de la venta',
  `saledescaplicado` int(3) NOT NULL DEFAULT 0 COMMENT 'Flag que identifica si en esta venta se aplicó o no un descuento al cliente',
  `salefechor` datetime DEFAULT current_timestamp() COMMENT 'Log de Fecha y hora de la ocurrencia de la venta',
  `cusref` int(11) NOT NULL COMMENT 'referencia del cliente FK',
  `descod` int(11) NOT NULL COMMENT 'Código para recuperar el porcentaje del descuento que se aplicó en la venta FK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`salecod`, `saleobser`, `saledescaplicado`, `salefechor`, `cusref`, `descod`) VALUES
(1, '1', 0, '2024-07-14 13:39:35', 1, 0),
(2, '2da compra cliente 1', 0, '2024-07-14 13:39:35', 1, 0),
(3, 'primera compra cliente 2', 0, '2024-07-14 13:43:54', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sale_detail`
--

CREATE TABLE `sale_detail` (
  `salecod` int(11) NOT NULL,
  `procodigo` int(11) NOT NULL,
  `saleitemactivo` int(1) NOT NULL COMMENT 'Campo para activar o inactivar el ítem de la compra en caso de una corrección solicitada por el cliente',
  `procantidadcomprada` int(11) NOT NULL COMMENT 'cantidad del producto que se compró en el registro del item'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sale_detail`
--

INSERT INTO `sale_detail` (`salecod`, `procodigo`, `saleitemactivo`, `procantidadcomprada`) VALUES
(1, 1000004, 1, 2),
(1, 1000001, 1, 1),
(3, 1000002, 1, 1),
(3, 1000004, 1, 1),
(3, 1000004, 1, 2),
(3, 1000003, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `procodigo` int(11) NOT NULL,
  `procantidad` int(10) UNSIGNED NOT NULL,
  `stkfechor` datetime NOT NULL,
  `stkobserv` varchar(1000) NOT NULL COMMENT 'Observación del registro de stock del producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`procodigo`, `procantidad`, `stkfechor`, `stkobserv`) VALUES
(1000001, 10, '2024-07-14 18:49:30', 'ingresan 10 al stock'),
(1000002, 10, '2024-07-14 18:49:30', 'ingresan 10 al stock'),
(1000003, 10, '2024-07-14 18:50:49', 'ingresan 10 al stock'),
(1000004, 10, '2024-07-14 18:50:49', 'ingresan 10 al stock');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cusref`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discod`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`procodigo`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`salecod`),
  ADD KEY `cusref` (`cusref`),
  ADD KEY `descod` (`descod`) USING BTREE;

--
-- Indexes for table `sale_detail`
--
ALTER TABLE `sale_detail`
  ADD KEY `salecod` (`salecod`),
  ADD KEY `procodigo` (`procodigo`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD UNIQUE KEY `procodigo` (`procodigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cusref` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `procodigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000005;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `salecod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`cusref`) REFERENCES `customer` (`cusref`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`descod`) REFERENCES `discounts` (`discod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sale_detail`
--
ALTER TABLE `sale_detail`
  ADD CONSTRAINT `sale_detail_ibfk_1` FOREIGN KEY (`salecod`) REFERENCES `sale` (`salecod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sale_detail_ibfk_2` FOREIGN KEY (`procodigo`) REFERENCES `product` (`procodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`procodigo`) REFERENCES `product` (`procodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
