-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Mar 24 Avril 2012 à 21:06
-- Version du serveur: 5.1.61
-- Version de PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `baptiste_obiztest`
--

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

CREATE TABLE IF NOT EXISTS `personnes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PRENOM` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATENAISSANCE` date NOT NULL,
  `VILLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEXE` tinyint(1) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Structure de la table `promos`
--

CREATE TABLE IF NOT EXISTS `promos` (
  `ID_PROMOS` int(11) NOT NULL AUTO_INCREMENT,
  `PROMOS` text COLLATE utf8_unicode_ci NOT NULL,
  `VILLES` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AGE` int(11) NOT NULL,
  `SEXE` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_PROMOS`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Contenu de la table `promos`
--

INSERT INTO `promos` (`ID_PROMOS`, `PROMOS`, `VILLES`, `AGE`, `SEXE`) VALUES
(1, 'Golf à Lyon pour Messieurs', 'Lyon', 2, 1),
(2, 'Golf à Saint-Etienne pour Messieurs', 'Saint-Etienne', 2, 1),
(5, 'Yoga pour Mesdames : Paris', 'Paris', 2, 0),
(6, 'Yoga pour Mesdames : Lyon', 'Lyon', 2, 0),
(7, 'Steps pour Mesdames : Paris', 'Paris', 1, 0),
(8, 'Steps pour Mesdames : Lyon', 'Saint-Etienne', 1, 0),
(9, 'Football pour Messieurs : Paris', 'Paris', 1, 1),
(10, 'Football pour Messieurs : Lyon', 'Saint-Etienne', 1, 1),
(11, 'Badminton mixte : Lyon', 'Lyon', 1, 3),
(12, 'Badminton mixte : Paris', 'Paris', 1, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
