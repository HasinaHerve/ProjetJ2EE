-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 14 juil. 2023 à 10:50
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vente`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `nomAdmin` varchar(255) NOT NULL,
  `mdp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`nomAdmin`, `mdp`) VALUES
('Admin', 'hasina');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `cin` varchar(255) NOT NULL,
  `adCli` varchar(255) DEFAULT NULL,
  `nomCli` varchar(255) DEFAULT NULL,
  `pCli` varchar(255) DEFAULT NULL,
  `telCli` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`cin`, `adCli`, `nomCli`, `pCli`, `telCli`) VALUES
('12323', 'SDFDS', 'SDFDF', 'SDF', 'SDFDF'),
('123412342343', 'SDF', 'SDVFSD', 'SDFSD', 'SDFSD'),
('2325435', 'ERTER', 'GEDG', 'ERG', 'ERT'),
('2354', 'ERT', 'ERGE', 'ERT', 'ERT'),
('3423', '234', '2344', '234234', '23423'),
('456457567567', 'HGJ', 'GJ', 'GHJ', 'GHJG');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `idProduit` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `nomProduit` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `prix` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `taille` varchar(255) DEFAULT NULL,
  `cin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idProduit`, `description`, `nomProduit`, `photo`, `prix`, `status`, `taille`, `cin`) VALUES
(36, NULL, NULL, NULL, 324, 'Disponible', NULL, NULL),
(37, 'qwe', 'qwe', 'image/chemise4.jpg', 123, 'Réservée', 'qweqw', '172983236'),
(38, 'ertert', 'zertez', 'image/pantalon2.jpg', 2342, 'Disponible', 'ert', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`nomAdmin`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`cin`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProduit`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `idProduit` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
