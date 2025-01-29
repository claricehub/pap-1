-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Jan-2025 às 15:21
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pap`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `artistas`
--

CREATE TABLE `artistas` (
  `id_artista` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `descricao` text NOT NULL,
  `genero` varchar(100) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `artistas`
--

INSERT INTO `artistas` (`id_artista`, `nome`, `descricao`, `genero`, `imagem`) VALUES
(1, 'Coldplay', 'Banda britânica de rock alternativo.', 'Rock Alternativo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIjHug-sSN0_OdqJcUqHQcTXZTlQGG-BFISA&s'),
(2, 'Taylor Swift', 'Cantora e compositora americana.', 'Pop', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIjHug-sSN0_OdqJcUqHQcTXZTlQGG-BFISA&s'),
(3, 'BTS', 'Grupo sul-coreano de K-Pop.', 'K-Pop', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIjHug-sSN0_OdqJcUqHQcTXZTlQGG-BFISA&s');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidades`
--

CREATE TABLE `cidades` (
  `id_cidade` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cidades`
--

INSERT INTO `cidades` (`id_cidade`, `nome`, `pais`) VALUES
(1, 'Lisboa', 'Portugal'),
(2, 'Madrid', 'Espanha'),
(3, 'Paris', 'França');

-- --------------------------------------------------------

--
-- Estrutura da tabela `locais`
--

CREATE TABLE `locais` (
  `id_local` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `id_cidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `locais`
--

INSERT INTO `locais` (`id_local`, `nome`, `capacidade`, `id_cidade`) VALUES
(1, 'Pavilhão Atlântico', 20000, 1),
(2, 'Wizink Center', 17000, 2),
(3, 'Accor Arena', 18000, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `id_utilizador` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`id_utilizador`, `nome`, `email`, `senha`) VALUES
(1, 'João Silva', 'joao.silva@example.com', 'senha_hashed_1'),
(2, 'Maria Costa', 'maria.costa@example.com', 'senha_hashed_2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `votacoes`
--

CREATE TABLE `votacoes` (
  `id_votacao` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `id_local` int(11) NOT NULL,
  `data_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `votacoes`
--

INSERT INTO `votacoes` (`id_votacao`, `id_utilizador`, `id_artista`, `id_local`, `data_hora`) VALUES
(1, 1, 1, 1, '2025-01-20 15:00:00'),
(2, 2, 2, 2, '2025-01-21 16:30:00'),
(4, 1, 1, 1, '2025-01-24 17:15:05');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`id_artista`);

--
-- Índices para tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`id_cidade`);

--
-- Índices para tabela `locais`
--
ALTER TABLE `locais`
  ADD PRIMARY KEY (`id_local`),
  ADD KEY `id_cidade` (`id_cidade`);

--
-- Índices para tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`id_utilizador`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `votacoes`
--
ALTER TABLE `votacoes`
  ADD PRIMARY KEY (`id_votacao`),
  ADD KEY `id_utilizador` (`id_utilizador`),
  ADD KEY `id_artista` (`id_artista`),
  ADD KEY `id_local` (`id_local`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `artistas`
--
ALTER TABLE `artistas`
  MODIFY `id_artista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cidades`
--
ALTER TABLE `cidades`
  MODIFY `id_cidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `locais`
--
ALTER TABLE `locais`
  MODIFY `id_local` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `id_utilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `votacoes`
--
ALTER TABLE `votacoes`
  MODIFY `id_votacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `locais`
--
ALTER TABLE `locais`
  ADD CONSTRAINT `locais_ibfk_1` FOREIGN KEY (`id_cidade`) REFERENCES `cidades` (`id_cidade`);

--
-- Limitadores para a tabela `votacoes`
--
ALTER TABLE `votacoes`
  ADD CONSTRAINT `votacoes_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`),
  ADD CONSTRAINT `votacoes_ibfk_2` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id_artista`),
  ADD CONSTRAINT `votacoes_ibfk_3` FOREIGN KEY (`id_local`) REFERENCES `locais` (`id_local`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
