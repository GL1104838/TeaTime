-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mer 04 Avril 2018 à 19:59
-- Version du serveur :  10.1.21-MariaDB
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `teatime`
--

-- --------------------------------------------------------

--
-- Structure de la table `extras`
--

CREATE TABLE `extras` (
  `ID` int(11) NOT NULL,
  `NameFR` varchar(255) NOT NULL,
  `NameEN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `extras`
--

INSERT INTO `extras` (`ID`, `NameFR`, `NameEN`) VALUES
(1, 'NameFR', 'NameEN');

-- --------------------------------------------------------

--
-- Structure de la table `properties`
--

CREATE TABLE `properties` (
  `ID` int(11) NOT NULL,
  `PropertyFR` varchar(255) NOT NULL,
  `PropertyEN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `properties`
--

INSERT INTO `properties` (`ID`, `PropertyFR`, `PropertyEN`) VALUES
(1, 'PropertyFR', 'PropertyEN');

-- --------------------------------------------------------

--
-- Structure de la table `teaextras`
--

CREATE TABLE `teaextras` (
  `TeaExtraID` int(11) NOT NULL,
  `TeaID` int(11) NOT NULL,
  `ExtraID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `teaextras`
--

INSERT INTO `teaextras` (`TeaExtraID`, `TeaID`, `ExtraID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `teaproperties`
--

CREATE TABLE `teaproperties` (
  `TeaPropertyID` int(11) NOT NULL,
  `TeaID` int(11) NOT NULL,
  `PropertyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `teaproperties`
--

INSERT INTO `teaproperties` (`TeaPropertyID`, `TeaID`, `PropertyID`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `teas`
--

CREATE TABLE `teas` (
  `ID` int(11) NOT NULL,
  `TeaNameFR` varchar(255) NOT NULL,
  `TeaNameEN` varchar(255) NOT NULL,
  `TypeFR` varchar(60) NOT NULL,
  `TypeEN` varchar(60) NOT NULL,
  `HexColor` varchar(6) NOT NULL,
  `Favorite` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `teas`
--

INSERT INTO `teas` (`ID`, `TeaNameFR`, `TeaNameEN`, `TypeFR`, `TypeEN`, `HexColor`, `Favorite`) VALUES
(1, 'Earl Gray FR', 'Earl Gray EN', 'Type FR', 'Type EN', 'ffd700', 1),
(2, 'Thé vert', 'Green Tea', 'vert', 'green', '00ff00', 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `teaextras`
--
ALTER TABLE `teaextras`
  ADD PRIMARY KEY (`TeaExtraID`);

--
-- Index pour la table `teaproperties`
--
ALTER TABLE `teaproperties`
  ADD PRIMARY KEY (`TeaPropertyID`),
  ADD KEY `teaID_teas_fk` (`TeaID`),
  ADD KEY `propertyID_properties_fk` (`PropertyID`);

--
-- Index pour la table `teas`
--
ALTER TABLE `teas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `extras`
--
ALTER TABLE `extras`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `properties`
--
ALTER TABLE `properties`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `teaextras`
--
ALTER TABLE `teaextras`
  MODIFY `TeaExtraID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `teaproperties`
--
ALTER TABLE `teaproperties`
  MODIFY `TeaPropertyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `teas`
--
ALTER TABLE `teas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `teaproperties`
--
ALTER TABLE `teaproperties`
  ADD CONSTRAINT `propertyID_properties_fk` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`ID`),
  ADD CONSTRAINT `teaID_teas_fk` FOREIGN KEY (`TeaID`) REFERENCES `teas` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
