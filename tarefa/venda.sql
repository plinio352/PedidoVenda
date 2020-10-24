-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 24-Out-2020 às 22:33
-- Versão do servidor: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `venda`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`codigo`, `nome`, `cidade`, `uf`) VALUES
(1, 'Luiz', 'Belo Horizonte', 'MG'),
(2, 'Maria', 'Belo Horizonte', 'MG'),
(3, 'Joao', 'Belo Horizonte', 'MG'),
(4, 'Fabiano', 'Belo Horizonte', 'MG'),
(5, 'Jorge', 'Belo Horizonte', 'MG'),
(6, 'Iasmin', 'Belo Horizonte', 'MG'),
(7, 'Lucas', 'Belo Horizonte', 'MG'),
(8, 'Marcia', 'Belo Horizonte', 'MG'),
(9, 'Joana', 'Belo Horizonte', 'MG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_dados_gerais`
--

CREATE TABLE `pedidos_dados_gerais` (
  `numero_pedido` int(11) NOT NULL,
  `data_emissao` date DEFAULT NULL,
  `codigo_cliente` int(11) DEFAULT NULL,
  `valor_total` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedidos_dados_gerais`
--

INSERT INTO `pedidos_dados_gerais` (`numero_pedido`, `data_emissao`, `codigo_cliente`, `valor_total`) VALUES
(20, '2020-10-24', 7, 46),
(19, '2020-10-24', 3, 42.1),
(18, '2020-10-24', 4, 40.3),
(21, '2020-10-24', 6, 85.3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_produtos`
--

CREATE TABLE `pedidos_produtos` (
  `id` int(11) NOT NULL,
  `numero_pedido` int(11) DEFAULT NULL,
  `codigo_produto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valor_unitario` double DEFAULT NULL,
  `valor_total` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedidos_produtos`
--

INSERT INTO `pedidos_produtos` (`id`, `numero_pedido`, `codigo_produto`, `quantidade`, `valor_unitario`, `valor_total`) VALUES
(18, 20, 13, 5, 3.8, 19),
(17, 20, 20, 6, 4.5, 27),
(16, 20, 13, 5, 3.8, 19),
(15, 19, 19, 7, 1.9, 13.3),
(14, 19, 18, 8, 1.5, 12),
(13, 19, 15, 8, 2.1, 16.8),
(12, 18, 19, 4, 1.9, 7.6),
(11, 18, 19, 9, 1.9, 17.1),
(10, 18, 17, 6, 2.6, 15.6),
(19, 20, 20, 6, 4.5, 27),
(20, 21, 17, 3, 2.6, 7.8),
(21, 21, 20, 7, 4.5, 31.5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `preco_venda` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`codigo`, `descricao`, `preco_venda`) VALUES
(11, 'Bombril', 1.1),
(12, 'Sabao em Po', 8.5),
(13, 'Sabao em Barra', 3.8),
(14, 'Sorvete', 11.5),
(15, 'Picole', 2.1),
(16, 'Tomate', 5.99),
(17, 'Trigo', 2.6),
(18, 'Biscoito', 1.5),
(19, 'Laranja', 1.9),
(20, 'Extato de tomate', 4.5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `pedidos_dados_gerais`
--
ALTER TABLE `pedidos_dados_gerais`
  ADD PRIMARY KEY (`numero_pedido`),
  ADD KEY `id_fk_clientes_pedidos_gerais` (`codigo_cliente`);

--
-- Indexes for table `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero_pedido` (`numero_pedido`),
  ADD KEY `codigo_produto` (`codigo_produto`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `pedidos_dados_gerais`
--
ALTER TABLE `pedidos_dados_gerais`
  MODIFY `numero_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
