-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Nov 2020 um 16:40
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `delivery_john_doe`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adress`
--

CREATE TABLE `adress` (
  `adress_id` int(11) NOT NULL,
  `fk_zip` int(11) DEFAULT NULL,
  `street` varchar(80) DEFAULT NULL,
  `house_nr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `adress`
--

INSERT INTO `adress` (`adress_id`, `fk_zip`, `street`, `house_nr`) VALUES
(1, 6780, 'Hermann-Sander Weg', 8),
(2, 6780, 'Battlogstraße', 2),
(3, 1010, 'Am Graben', 1),
(4, 1100, 'Quellenstraße', 160),
(5, 1200, 'Wallensteinstraße', 20),
(6, 1010, 'Post-Straße', 1),
(7, 1100, 'Station-Staße', 2),
(8, 1200, 'Postler_Straße', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `population` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `city`
--

INSERT INTO `city` (`city_id`, `population`) VALUES
(1, 10000),
(2, 150000),
(3, 25000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `population` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `country`
--

INSERT INTO `country` (`country_id`, `population`) VALUES
(1, 10500000),
(2, 940000),
(3, 49800000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_adress` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `fk_adress`) VALUES
(1, 'Christian', 'Sander', 1),
(2, 'Sebastian', 'Müller', 2),
(3, 'Basti', 'Fantasti', 3),
(4, 'Sigfried', 'Marent', 4),
(5, 'Max', 'Muster', 5),
(6, 'Markus', 'Sander', 1),
(7, 'Fritz', 'Müller', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `fk_sender_id` int(11) DEFAULT NULL,
  `fk_receiver_id` int(11) DEFAULT NULL,
  `fk_processing_station_id` int(11) DEFAULT NULL,
  `fk_responsible_employee_id` int(11) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `receiving_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `fk_sender_id`, `fk_receiver_id`, `fk_processing_station_id`, `fk_responsible_employee_id`, `deposit_date`, `receiving_date`) VALUES
(1, 1, 2, 1, 1, '2020-07-14', '2020-07-15'),
(2, 2, 1, 1, 1, '2020-07-14', '2020-07-16'),
(3, 3, 4, 2, 2, '2020-07-13', '2020-07-15'),
(4, 5, 6, 3, 3, '2020-07-15', '2020-07-18'),
(5, 6, 3, 1, 1, '2020-07-20', '2020-07-25'),
(6, 7, 5, 2, 2, '2020-07-20', '2020-07-25'),
(7, 3, 7, 2, 2, '2020-07-15', '2020-07-20'),
(8, 6, 7, 3, 3, '2020-07-15', '2020-07-16'),
(9, 5, 1, NULL, 4, '2020-07-15', '2020-07-20'),
(10, 6, 2, NULL, 4, '2020-07-16', '2020-07-19');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_works_at_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `fk_customer_id`, `fk_works_at_id`) VALUES
(1, 3, 1),
(2, 4, 2),
(3, 5, 3),
(4, 7, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `post_station`
--

CREATE TABLE `post_station` (
  `station_id` int(11) NOT NULL,
  `fk_adress_id` int(11) DEFAULT NULL,
  `station_name` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `post_station`
--

INSERT INTO `post_station` (`station_id`, `fk_adress_id`, `station_name`) VALUES
(1, 6, 'City Center Station'),
(2, 7, 'Post Favoriten'),
(3, 8, 'Post Brigittenau');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `salaries`
--

CREATE TABLE `salaries` (
  `salary_id` int(11) NOT NULL,
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `population` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `state`
--

INSERT INTO `state` (`state_id`, `population`) VALUES
(1, 1899000),
(2, 1900000),
(3, 455000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zip`
--

CREATE TABLE `zip` (
  `zip` int(11) NOT NULL,
  `city` int(35) DEFAULT NULL,
  `state` int(35) DEFAULT NULL,
  `country` int(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `zip`
--

INSERT INTO `zip` (`zip`, `city`, `state`, `country`) VALUES
(1010, 0, 0, 0),
(1100, 0, 0, 0),
(1200, 0, 0, 0),
(6780, 0, 0, 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`adress_id`),
  ADD KEY `fk_zip` (`fk_zip`);

--
-- Indizes für die Tabelle `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indizes für die Tabelle `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_adress` (`fk_adress`);

--
-- Indizes für die Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_receiver_id` (`fk_receiver_id`),
  ADD KEY `fk_processing_station_id` (`fk_processing_station_id`),
  ADD KEY `fk_responsible_employee_id` (`fk_responsible_employee_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_works_at_id` (`fk_works_at_id`);

--
-- Indizes für die Tabelle `post_station`
--
ALTER TABLE `post_station`
  ADD PRIMARY KEY (`station_id`),
  ADD KEY `fk_adress_id` (`fk_adress_id`);

--
-- Indizes für die Tabelle `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`salary_id`);

--
-- Indizes für die Tabelle `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indizes für die Tabelle `zip`
--
ALTER TABLE `zip`
  ADD PRIMARY KEY (`zip`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `adress`
--
ALTER TABLE `adress`
  MODIFY `adress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `post_station`
--
ALTER TABLE `post_station`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `salaries`
--
ALTER TABLE `salaries`
  MODIFY `salary_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `adress_ibfk_1` FOREIGN KEY (`fk_zip`) REFERENCES `zip` (`zip`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_adress`) REFERENCES `adress` (`adress_id`);

--
-- Constraints der Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`fk_sender_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`fk_receiver_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`fk_processing_station_id`) REFERENCES `post_station` (`station_id`),
  ADD CONSTRAINT `delivery_ibfk_5` FOREIGN KEY (`fk_responsible_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`fk_works_at_id`) REFERENCES `post_station` (`station_id`);

--
-- Constraints der Tabelle `post_station`
--
ALTER TABLE `post_station`
  ADD CONSTRAINT `post_station_ibfk_1` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
