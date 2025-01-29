-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Jan-2025 às 18:00
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
-- Banco de dados: `votacaomusical`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `artistas`
--

CREATE TABLE `artistas` (
  `id_artista` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `genero_musical` varchar(50) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `artistas`
--

INSERT INTO `artistas` (`id_artista`, `nome`, `genero_musical`, `imagem`) VALUES
(1, 'Luís Figo', 'Rock', 'images/luis_figo.jpg'),
(2, 'Sara Silva', 'Pop', 'images/sara_silva.jpg'),
(3, 'Miguel Sousa', 'Jazz', 'images/miguel_sousa.jpg'),
(4, 'Carla Mendes', 'Eletrónica', 'images/carla_mendes.jpg'),
(5, 'Rui Ferreira', 'Hip-Hop', 'images/rui_ferreira.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `local` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `eventos`
--

INSERT INTO `eventos` (`id_evento`, `pais`, `cidade`, `local`) VALUES
(1, 'Portugal', 'Lisboa', 'Auditório Central'),
(2, 'Portugal', 'Porto', 'Espaço Cultural'),
(3, 'Espanha', 'Madrid', 'Centro de Convenções'),
(4, 'Brasil', 'São Paulo', 'Teatro Municipal'),
(5, 'França', 'Paris', 'Palácio das Artes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gestores`
--

CREATE TABLE `gestores` (
  `id_gestor` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `gestores`
--

INSERT INTO `gestores` (`id_gestor`, `nome`, `email`, `password`) VALUES
(1, 'Administrador Geral', 'admin@cte.com', 'adminPWD123'),
(2, 'Gestor Secundário', 'gestor2@cte.com', 'gestorPWD456');

-- --------------------------------------------------------

--
-- Estrutura da tabela `redes_sociais`
--

CREATE TABLE `redes_sociais` (
  `id_rede_social` int(11) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `redes_sociais`
--

INSERT INTO `redes_sociais` (`id_rede_social`, `id_artista`, `facebook`, `instagram`, `website`) VALUES
(1, 1, 'https://facebook.com/luisfigo', 'https://instagram.com/luisfigo', 'https://luisfigo.com'),
(2, 2, 'https://facebook.com/sarasilva', 'https://instagram.com/sarasilva', 'https://sarasilva.com'),
(3, 3, 'https://facebook.com/miguelsousa', 'https://instagram.com/miguelsousa', 'https://miguelsousa.com'),
(4, 4, 'https://facebook.com/carlamendes', 'https://instagram.com/carlamendes', 'https://carlamendes.com'),
(5, 5, 'https://facebook.com/ruiferrreira', 'https://instagram.com/ruiferrreira', 'https://ruiferrreira.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `id_utilizador` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`id_utilizador`, `nome`, `email`, `password`) VALUES
(1, 'João Silva', 'joao.silva@example.com', 'password123'),
(2, 'Maria Oliveira', 'maria.oliveira@example.com', 'maria2025'),
(3, 'Carlos Pereira', 'carlos.pereira@example.com', 'carlosPWD'),
(4, 'Ana Costa', 'ana.costa@example.com', 'anaPWD456'),
(5, 'Pedro Santos', 'pedro.santos@example.com', 'pedroPWD789');

-- --------------------------------------------------------

--
-- Estrutura da tabela `votos`
--

CREATE TABLE `votos` (
  `id_voto` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `data_voto` date NOT NULL,
  `ano_voto` int(11) GENERATED ALWAYS AS (year(`data_voto`)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `votos`
--

INSERT INTO `votos` (`id_voto`, `id_utilizador`, `id_artista`, `id_evento`, `data_voto`) VALUES
(1, 1, 1, 1, '2025-04-15'),
(2, 2, 2, 2, '2025-04-16'),
(3, 3, 3, 3, '2025-04-17'),
(4, 4, 4, 4, '2025-04-18'),
(5, 5, 5, 5, '2025-04-19');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`id_artista`);

--
-- Índices para tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`);

--
-- Índices para tabela `gestores`
--
ALTER TABLE `gestores`
  ADD PRIMARY KEY (`id_gestor`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `redes_sociais`
--
ALTER TABLE `redes_sociais`
  ADD PRIMARY KEY (`id_rede_social`),
  ADD KEY `id_artista` (`id_artista`);

--
-- Índices para tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`id_utilizador`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id_voto`),
  ADD UNIQUE KEY `unique_voto` (`id_utilizador`,`id_artista`,`id_evento`,`ano_voto`),
  ADD KEY `id_artista` (`id_artista`),
  ADD KEY `id_evento` (`id_evento`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `artistas`
--
ALTER TABLE `artistas`
  MODIFY `id_artista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `gestores`
--
ALTER TABLE `gestores`
  MODIFY `id_gestor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `redes_sociais`
--
ALTER TABLE `redes_sociais`
  MODIFY `id_rede_social` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `id_utilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `votos`
--
ALTER TABLE `votos`
  MODIFY `id_voto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `redes_sociais`
--
ALTER TABLE `redes_sociais`
  ADD CONSTRAINT `redes_sociais_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id_artista`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `votos_ibfk_2` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id_artista`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `votos_ibfk_3` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
