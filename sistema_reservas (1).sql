-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13/11/2025 às 19:51
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_reservas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `local` varchar(200) NOT NULL,
  `endereco_completo` varchar(300) DEFAULT NULL,
  `data_evento` date NOT NULL,
  `hora` time NOT NULL,
  `capacidade` int(11) NOT NULL,
  `imagem` varchar(355) DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `eventos`
--

INSERT INTO `eventos` (`id_evento`, `nome`, `descricao`, `local`, `endereco_completo`, `data_evento`, `hora`, `capacidade`, `imagem`, `data_criacao`) VALUES
(1, 'Festival de Verão', 'Grande festival com diversas atrações musicais', 'Parque da Cidade', 'Av. das Flores, 1000 - São Paulo', '2025-11-20', '16:00:00', 5000, NULL, '2025-10-29 17:13:13'),
(2, 'Exposição de Arte Moderna', 'Obras de artistas contemporâneos', 'Museu de Arte', 'Rua das Artes, 250 - Rio de Janeiro', '2025-11-25', '10:00:00', 200, NULL, '2025-10-29 17:13:13'),
(3, 'Peça: Romeu e Julieta', 'Clássico de Shakespeare', 'Teatro Municipal', 'Praça Central, 150 - Belo Horizonte', '2025-11-30', '20:00:00', 300, NULL, '2025-10-29 17:13:13'),
(4, 'Show da Taylor Swift ', 'show da taylor do estadio do palmeiras ', 'Alianz parque ', ' Avenida Francisco Matarazzo, 1705, R. Palestra Itália, 200 - Água Branca, São Paulo - SP, 05001-200', '2025-11-28', '17:50:00', 300, NULL, '2025-11-13 17:51:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `data_reserva` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('confirmada','cancelada','pendente') DEFAULT 'confirmada',
  `quantidade_pessoas` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `id_usuario`, `id_evento`, `data_reserva`, `status`, `quantidade_pessoas`) VALUES
(1, 5, 2, '2025-11-13 17:13:38', 'cancelada', 8),
(2, 5, 4, '2025-11-13 17:52:16', 'cancelada', 3),
(3, 5, 3, '2025-11-13 17:54:46', 'cancelada', 10),
(4, 5, 4, '2025-11-13 18:24:25', 'cancelada', 4),
(5, 5, 2, '2025-11-13 18:40:35', 'cancelada', 7),
(6, 5, 2, '2025-11-13 18:47:24', 'confirmada', 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('usuario','admin') DEFAULT 'usuario',
  `bloqueado` tinyint(1) DEFAULT 0,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `senha`, `tipo`, `bloqueado`, `data_criacao`) VALUES
(1, 'Administrador', 'admin@sistema.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 0, '2025-10-29 17:13:13'),
(2, 'Giovana Rosa Greco', 'giovanargreco@gmail.com', '$2y$10$Yygq3LZeRMh4WjgeYclmEOVZl6ij7x/GDWKHBR7kUERKELEihe0vq', 'usuario', 0, '2025-10-29 17:25:00'),
(3, 'lara lima ', 'lara@123', '$2y$10$w2bKeILpN7f6NeWOcB6kKedAhJ2Y0w7asOg2gxlnHefNQzMrkhMmS', 'usuario', 0, '2025-11-03 16:49:06'),
(4, 'jamilly ramos de brito', 'jamilly.ramos@gmail.com', '$2y$10$b6H.ysL.GTsoCtd.Sz.xtuiXKAT53Cr/oI1FKxfhtU.SlyLbgT4Za', 'usuario', 0, '2025-11-03 16:59:26'),
(5, 'Alaine Carla Rosa ', 'alaine@gmail.com', '$2y$10$ulZ6mxYr86died6V3Dqh..J0iYZpzUT2swjzwPjYdfO0hEktx6rxm', 'usuario', 0, '2025-11-13 17:00:43');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`);

--
-- Índices de tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_evento` (`id_evento`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
