-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Mar 04, 2025 alle 16:45
-- Versione del server: 5.7.24
-- Versione PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `brand`
--

INSERT INTO `brand` (`id`, `nome`, `descrizione`) VALUES
(1, 'NIKE', 'Brand di Scarpe da ginnastica'),
(2, 'NEW BALANCE', 'Scarpe'),
(3, 'JORDAN', NULL),
(4, 'ADIDAS', NULL),
(5, 'PUMA', NULL),
(7, 'NIKE OFF-WHITE', 'Collaborazione tra Nike e Off-White'),
(8, 'NIKE AIR MAX', 'CC');

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome_categoria` varchar(45) NOT NULL,
  `target` enum('UOMO','DONNA','BAMBINO','UNISEX') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`id`, `nome_categoria`, `target`) VALUES
(3, 'MOCASSINI', 'UOMO'),
(2, 'SNEAKERS', 'UOMO'),
(4, 'SNEAKERS', 'DONNA'),
(1, 'STIVALI', 'UOMO');

-- --------------------------------------------------------

--
-- Struttura della tabella `codice_sconto`
--

CREATE TABLE `codice_sconto` (
  `id` int(11) NOT NULL,
  `codice` varchar(45) NOT NULL,
  `valore` decimal(11,0) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `tipo` enum('percentuale','fisso') NOT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `uso_massimo` int(11) NOT NULL,
  `uso_per_utente` int(11) NOT NULL,
  `minimo_acquisto` decimal(10,0) NOT NULL,
  `attivo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `codice_sconto_has_categoria`
--

CREATE TABLE `codice_sconto_has_categoria` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_codicesconto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `colore`
--

CREATE TABLE `colore` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `colore`
--

INSERT INTO `colore` (`id`, `nome`) VALUES
(12, 'ARANCIONE'),
(4, 'BIANCO'),
(2, 'BLU'),
(7, 'CELESTE'),
(3, 'GIALLO'),
(6, 'GRIGIO'),
(5, 'MARRONE'),
(11, 'NERO'),
(10, 'ROSSO'),
(1, 'VERDE'),
(8, 'VIOLA');

-- --------------------------------------------------------

--
-- Struttura della tabella `colore_has_prodotti`
--

CREATE TABLE `colore_has_prodotti` (
  `id` int(11) NOT NULL,
  `id_colore` int(11) NOT NULL,
  `id_prodotto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `colore_has_prodotti`
--

INSERT INTO `colore_has_prodotti` (`id`, `id_colore`, `id_prodotto`) VALUES
(121, 1, 28),
(122, 11, 35),
(125, 5, 31),
(126, 4, 39),
(131, 3, 40),
(132, 11, 40),
(160, 2, 53),
(161, 11, 53),
(162, 6, 36),
(167, 1, 56),
(168, 11, 41),
(169, 12, 41);

-- --------------------------------------------------------

--
-- Struttura della tabella `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `dettagli_ordine`
--

CREATE TABLE `dettagli_ordine` (
  `id_prodotti` int(11) NOT NULL,
  `id_ordine` int(11) NOT NULL,
  `quantita` int(11) NOT NULL,
  `codice_sconto` int(11) NOT NULL,
  `spedizione` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fornitori`
--

CREATE TABLE `fornitori` (
  `id` int(11) NOT NULL,
  `azienda` varchar(45) NOT NULL,
  `partita_iva` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fornitori_has_prodotti`
--

CREATE TABLE `fornitori_has_prodotti` (
  `id` int(11) NOT NULL,
  `id_prodotti` int(11) NOT NULL,
  `id_fornitore` int(11) NOT NULL,
  `data` date NOT NULL,
  `importo` int(11) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `immagini`
--

CREATE TABLE `immagini` (
  `id` int(11) NOT NULL,
  `url` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `immagini`
--

INSERT INTO `immagini` (`id`, `url`) VALUES
(35, 'images/jd_047951_a.jpeg'),
(41, 'images/jd_394104_a.jpeg'),
(77, 'images/JORDAN-4-ABUNDANCE (1).jpg'),
(78, 'images/JORDAN-4-ABUNDANCE (2).jpg'),
(79, 'images/JORDAN-4-ABUNDANCE (3).jpg'),
(80, 'images/JORDAN-4-ABUNDANCE (4).jpg'),
(81, 'images/JORDAN-4-ABUNDANCE (5).jpg'),
(82, 'images/JORDAN-4-ABUNDANCE (6).jpg'),
(64, 'images/NIKE+AIR+MAX+PLUS+ (GS) (1).png'),
(65, 'images/NIKE+AIR+MAX+PLUS+ (GS) (2).png'),
(66, 'images/NIKE+AIR+MAX+PLUS+ (GS) (3).png'),
(67, 'images/NIKE+AIR+MAX+PLUS+ (GS) (4).png'),
(68, 'images/NIKE+AIR+MAX+PLUS+ (GS) (5).png'),
(69, 'images/NIKE+AIR+MAX+PLUS+ (GS) (6).png'),
(48, 'images/NIKE+AIR+MAX+PLUS+(GS) (1).png'),
(49, 'images/NIKE+AIR+MAX+PLUS+(GS) (2).png'),
(50, 'images/NIKE+AIR+MAX+PLUS+(GS) (3).png'),
(51, 'images/NIKE+AIR+MAX+PLUS+(GS) (4).png'),
(52, 'images/NIKE+AIR+MAX+PLUS+(GS) (5).png'),
(42, 'images/NIKE+AIR+MAX+PLUS+GS (1).png'),
(43, 'images/NIKE+AIR+MAX+PLUS+GS (2).png'),
(44, 'images/NIKE+AIR+MAX+PLUS+GS (3).png'),
(45, 'images/NIKE+AIR+MAX+PLUS+GS (4).png'),
(46, 'images/NIKE+AIR+MAX+PLUS+GS (5).png'),
(47, 'images/NIKE+AIR+MAX+PLUS+GS (6).png'),
(30, 'images/nike-air-force-1-mid-chocolate-dm0107-200-lateral.jpeg'),
(27, 'images/Off-White-Nike-Air-Force-1-Low-Brooklyn-DX1419-300-Release-Date.jpg'),
(36, 'images/Screenshot 2024-09-28 214051.png');

-- --------------------------------------------------------

--
-- Struttura della tabella `immagini_has_prodotti`
--

CREATE TABLE `immagini_has_prodotti` (
  `id` int(11) NOT NULL,
  `id_immagine` int(11) NOT NULL,
  `id_prodotto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `immagini_has_prodotti`
--

INSERT INTO `immagini_has_prodotti` (`id`, `id_immagine`, `id_prodotto`) VALUES
(26, 27, 28),
(29, 30, 31),
(34, 35, 35),
(35, 36, 36),
(40, 41, 39),
(41, 42, 40),
(42, 43, 40),
(43, 44, 40),
(44, 45, 40),
(45, 46, 40),
(46, 47, 40),
(47, 48, 41),
(48, 49, 41),
(49, 50, 41),
(50, 51, 41),
(51, 52, 41),
(52, 64, 53),
(53, 65, 53),
(54, 66, 53),
(55, 67, 53),
(56, 68, 53),
(57, 69, 53),
(64, 77, 56),
(65, 78, 56),
(66, 79, 56),
(67, 80, 56),
(68, 81, 56),
(69, 82, 56);

-- --------------------------------------------------------

--
-- Struttura della tabella `indirizzo`
--

CREATE TABLE `indirizzo` (
  `id` int(11) NOT NULL,
  `citta` varchar(45) NOT NULL,
  `stato` varchar(45) NOT NULL,
  `cap` int(11) NOT NULL,
  `indirizzo` varchar(45) NOT NULL,
  `id_customers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `modello`
--

CREATE TABLE `modello` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descrizione` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `modello`
--

INSERT INTO `modello` (`id`, `id_categoria`, `id_brand`, `nome`, `descrizione`) VALUES
(52, 2, 1, 'Nike Air Force 1', 'Scarpe'),
(71, 2, 1, 'NIKE AIR MAX PLUS', 'Scopri la leggendaria tecnologia Tuned Air con queste scarpe confortevoli. Con l\'iconica gabbia a forma di fiamma e la coda di balena vicino all\'arco plantare, questa Air Max Plus sfoggia vivaci tocchi di colore per un look che non passa inosservato nel tempo libero.'),
(82, 2, 3, 'Air Jordan 4 Abundance', 'Sempre guadagnata, mai data. La AJ4 \'Abundance\' e un omaggio all\'atteggiamento e alla determinazione che la prossima generazione di grandi porta in ogni mossa che fa, sia dentro che fuori dal campo. Questa edizione omaggia l\'iconica AJ4 \'Pure Money\' con finiture Metallic Silver per completare il tuo stile moderno e una colorazione Seafoam e Sail per un tocco morbido.'),
(65, 2, 3, 'Nike Air Force 1', 'Scat'),
(51, 2, 7, 'Nike Air Force Off White', 'Scarpe'),
(69, 4, 1, 'Nike Air Force 1 High', 'Scarpe'),
(80, 4, 3, 'Air Jordan 4 Abundance', 'Sempre guadagnata, mai data. La AJ4 \'Abundance\' è un omaggio all\'atteggiamento e alla determinazione che la prossima generazione di grandi porta in ogni mossa che fa, sia dentro che fuori dal campo. Questa edizione omaggia l\'iconica AJ4 \'Pure Money\' con finiture Metallic Silver per completare il tuo stile moderno e una colorazione Seafoam e Sail per un tocco morbido.');

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
--

CREATE TABLE `ordine` (
  `id` int(11) NOT NULL,
  `id_customers` int(11) NOT NULL,
  `id_pagamento` int(11) NOT NULL,
  `id_indirizzo` int(11) NOT NULL,
  `stato_ordine` varchar(45) NOT NULL,
  `data_ordine` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL,
  `nome_titolare` varchar(45) NOT NULL,
  `numero_carta` int(11) NOT NULL,
  `data_scadenza` date NOT NULL,
  `codice_verfica` varchar(45) NOT NULL,
  `id_customers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `id` int(11) NOT NULL,
  `id_modello` int(11) NOT NULL,
  `prezzo` int(11) NOT NULL,
  `stato_pubblicazione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`id`, `id_modello`, `prezzo`, `stato_pubblicazione`) VALUES
(28, 51, 300, 1),
(31, 69, 230, 1),
(35, 65, 230, 1),
(36, 52, 121, 0),
(39, 52, 120, 1),
(40, 71, 180, 1),
(41, 71, 180, 0),
(53, 71, 180, 1),
(56, 82, 400, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `taglia`
--

CREATE TABLE `taglia` (
  `id` int(11) NOT NULL,
  `taglia_Eu` varchar(45) NOT NULL,
  `taglia_Uk` varchar(45) NOT NULL,
  `taglia_Us` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `taglia`
--

INSERT INTO `taglia` (`id`, `taglia_Eu`, `taglia_Uk`, `taglia_Us`) VALUES
(1, '35', '0', '0'),
(2, '35.5', '0', '0'),
(3, '36', '0', '0'),
(4, '36.5', '0', '0'),
(5, '37', '0', '0'),
(6, '37.5', '0', '0'),
(7, '38', '0', '0'),
(8, '38.5', '0', '0'),
(9, '39', '0', '0'),
(10, '39.5', '0', '0'),
(11, '40', '0', '0'),
(12, '40.5', '0', '0'),
(13, '41', '0', '0'),
(14, '41.5', '0', '0'),
(15, '42', '0', '0'),
(16, '42.5', '0', '0'),
(17, '43', '0', '0'),
(18, '43.5', '0', '0'),
(19, '44', '0', '0'),
(20, '44.5', '0', '0'),
(21, '45', '0', '0'),
(22, '45.5', '0', '0'),
(23, '46', '0', '0'),
(24, '46.5', '0', '0');

-- --------------------------------------------------------

--
-- Struttura della tabella `taglie_has_prodotti`
--

CREATE TABLE `taglie_has_prodotti` (
  `id` int(11) NOT NULL,
  `id_taglia` int(11) NOT NULL,
  `id_prodotto` int(11) NOT NULL,
  `quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `taglie_has_prodotti`
--

INSERT INTO `taglie_has_prodotti` (`id`, `id_taglia`, `id_prodotto`, `quantita`) VALUES
(145, 3, 28, 1),
(146, 5, 28, 1),
(147, 7, 28, 1),
(148, 20, 28, 1),
(149, 21, 28, 1),
(150, 22, 28, 1),
(151, 4, 35, 1),
(152, 5, 35, 1),
(153, 7, 35, 1),
(154, 8, 35, 1),
(155, 11, 35, 3),
(156, 13, 35, 5),
(157, 15, 35, 3),
(158, 20, 35, 10),
(160, 3, 31, 1),
(161, 5, 31, 1),
(162, 7, 31, 1),
(163, 5, 39, 1),
(182, 3, 40, 1),
(183, 4, 40, 1),
(184, 5, 40, 1),
(185, 6, 40, 1),
(186, 7, 40, 1),
(187, 8, 40, 1),
(188, 9, 40, 1),
(189, 10, 40, 1),
(190, 11, 40, 1),
(228, 3, 53, 1),
(229, 5, 53, 3),
(230, 7, 53, 2),
(231, 5, 36, 1),
(236, 5, 56, 1),
(237, 3, 41, 1),
(238, 5, 41, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `data_nascita` date NOT NULL,
  `luogo_nascita` varchar(255) NOT NULL,
  `sesso` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ruolo` varchar(255) NOT NULL DEFAULT 'Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `nome`, `cognome`, `data_nascita`, `luogo_nascita`, `sesso`, `email`, `telefono`, `password`, `ruolo`) VALUES
(14, 'Nicola', 'Lacerenza', '1998-04-07', 'Barletta', 'maschio', 'admin@gmail.com', '3282018804', '5a6663d75fb68c8a15ac040b2bd478ece92fdd39f9099df5e7db1f8695366d82ac70d50b73ac74019a6e8e769f65a820b1181d38fe60588b995beb246ab1702f', 'admin'),
(22, 'NIcola', 'Lacerenza', '1998-04-07', 'Barletta', 'maschio', 'nicolace98@gmail.com', '3282018804', '5a6663d75fb68c8a15ac040b2bd478ece92fdd39f9099df5e7db1f8695366d82ac70d50b73ac74019a6e8e769f65a820b1181d38fe60588b995beb246ab1702f', 'cliente');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_nome` (`nome`);

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_nome_categoria_target` (`nome_categoria`,`target`);

--
-- Indici per le tabelle `codice_sconto`
--
ALTER TABLE `codice_sconto`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `codice_sconto_has_categoria`
--
ALTER TABLE `codice_sconto_has_categoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_CODICESCONTO_has_CATEGORIA_CODICESCONTO` (`id_codicesconto`),
  ADD KEY `fk_CODICESCONTO_has_CATEGORIA_CATEGORIA` (`id_categoria`);

--
-- Indici per le tabelle `colore`
--
ALTER TABLE `colore`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_nomeColore` (`nome`);

--
-- Indici per le tabelle `colore_has_prodotti`
--
ALTER TABLE `colore_has_prodotti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_COLORE_has_MODELLO_COLORE` (`id_colore`),
  ADD KEY `fk_COLORE_has_MODELLO_MODELLO` (`id_prodotto`);

--
-- Indici per le tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `dettagli_ordine`
--
ALTER TABLE `dettagli_ordine`
  ADD PRIMARY KEY (`id_prodotti`,`id_ordine`),
  ADD KEY `fk_DETTAGLI ORDINE_ORDINE1` (`id_ordine`);

--
-- Indici per le tabelle `fornitori`
--
ALTER TABLE `fornitori`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `fornitori_has_prodotti`
--
ALTER TABLE `fornitori_has_prodotti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_FORNITORI_has_PRODOTTI_FORNITORI1` (`id_fornitore`),
  ADD KEY `fk_FORNITORI_has_PRODOTTI_PRODOTTI` (`id_prodotti`);

--
-- Indici per le tabelle `immagini`
--
ALTER TABLE `immagini`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_url` (`url`);

--
-- Indici per le tabelle `immagini_has_prodotti`
--
ALTER TABLE `immagini_has_prodotti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_IMMAGINI_has_PRODOTTI_IMMAGINI1` (`id_immagine`),
  ADD KEY `fk_IMMAGINI_has_PRODOTTI_PRODOTTI1` (`id_prodotto`);

--
-- Indici per le tabelle `indirizzo`
--
ALTER TABLE `indirizzo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_INDIRIZZO_CUSTOMERS1` (`id_customers`);

--
-- Indici per le tabelle `modello`
--
ALTER TABLE `modello`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_modello` (`id_categoria`,`id_brand`,`nome`,`descrizione`) USING BTREE,
  ADD KEY `fk_modello_brand1` (`id_brand`),
  ADD KEY `fk_MODELLO_CATEGORIA1` (`id_categoria`);

--
-- Indici per le tabelle `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ORDINE_CUSTOMERS1` (`id_customers`),
  ADD KEY `fk_ORDINE_INDIRIZZO1` (`id_indirizzo`),
  ADD KEY `fk_ORDINE_PAGAMENTO1` (`id_pagamento`);

--
-- Indici per le tabelle `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_PAGAMENTO_CUSTOMERS1` (`id_customers`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_PRODOTTI_MODELLO1` (`id_modello`);

--
-- Indici per le tabelle `taglia`
--
ALTER TABLE `taglia`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `taglie_has_prodotti`
--
ALTER TABLE `taglie_has_prodotti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_TAGLIE_has_PRODOTTI_TAGLIA` (`id_taglia`),
  ADD KEY `fk_TAGLIE_has_PRODOTTI_PRODOTTO` (`id_prodotto`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `codice_sconto`
--
ALTER TABLE `codice_sconto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `codice_sconto_has_categoria`
--
ALTER TABLE `codice_sconto_has_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `colore`
--
ALTER TABLE `colore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `colore_has_prodotti`
--
ALTER TABLE `colore_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT per la tabella `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `dettagli_ordine`
--
ALTER TABLE `dettagli_ordine`
  MODIFY `id_prodotti` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `fornitori`
--
ALTER TABLE `fornitori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `fornitori_has_prodotti`
--
ALTER TABLE `fornitori_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `immagini`
--
ALTER TABLE `immagini`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT per la tabella `immagini_has_prodotti`
--
ALTER TABLE `immagini_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT per la tabella `modello`
--
ALTER TABLE `modello`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT per la tabella `taglia`
--
ALTER TABLE `taglia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `taglie_has_prodotti`
--
ALTER TABLE `taglie_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `codice_sconto_has_categoria`
--
ALTER TABLE `codice_sconto_has_categoria`
  ADD CONSTRAINT `fk_CODICESCONTO_has_CATEGORIA_CATEGORIA` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `fk_CODICESCONTO_has_CATEGORIA_CODICESCONTO` FOREIGN KEY (`id_codicesconto`) REFERENCES `codice_sconto` (`id`);

--
-- Limiti per la tabella `colore_has_prodotti`
--
ALTER TABLE `colore_has_prodotti`
  ADD CONSTRAINT `fk_COLORE_has_PRODOTTI_COLORE` FOREIGN KEY (`id_colore`) REFERENCES `colore` (`id`),
  ADD CONSTRAINT `fk_COLORE_has_PRODOTTI_PRODOTTO` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id`);

--
-- Limiti per la tabella `dettagli_ordine`
--
ALTER TABLE `dettagli_ordine`
  ADD CONSTRAINT `fk_DETTAGLI ORDINE_ORDINE1` FOREIGN KEY (`id_ordine`) REFERENCES `ordine` (`id`),
  ADD CONSTRAINT `fk_DETTAGLI ORDINE_PRODOTTI1` FOREIGN KEY (`id_prodotti`) REFERENCES `prodotti` (`id`);

--
-- Limiti per la tabella `fornitori_has_prodotti`
--
ALTER TABLE `fornitori_has_prodotti`
  ADD CONSTRAINT `fk_FORNITORI_has_PRODOTTI_FORNITORI1` FOREIGN KEY (`id_fornitore`) REFERENCES `fornitori` (`id`),
  ADD CONSTRAINT `fk_FORNITORI_has_PRODOTTI_PRODOTTI` FOREIGN KEY (`id_prodotti`) REFERENCES `prodotti` (`id`),
  ADD CONSTRAINT `fk_FORNITORI_has_PRODOTTI_PRODOTTI1` FOREIGN KEY (`id_prodotti`) REFERENCES `prodotti` (`id`);

--
-- Limiti per la tabella `immagini_has_prodotti`
--
ALTER TABLE `immagini_has_prodotti`
  ADD CONSTRAINT `fk_IMMAGINI_has_PRODOTTI_IMMAGINI1` FOREIGN KEY (`id_immagine`) REFERENCES `immagini` (`id`),
  ADD CONSTRAINT `fk_IMMAGINI_has_PRODOTTI_PRODOTTI1` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id`);

--
-- Limiti per la tabella `indirizzo`
--
ALTER TABLE `indirizzo`
  ADD CONSTRAINT `fk_INDIRIZZO_CUSTOMERS1` FOREIGN KEY (`id_customers`) REFERENCES `customers` (`id`);

--
-- Limiti per la tabella `modello`
--
ALTER TABLE `modello`
  ADD CONSTRAINT `fk_MODELLO_CATEGORIA1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `fk_modello_brand1` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`);

--
-- Limiti per la tabella `ordine`
--
ALTER TABLE `ordine`
  ADD CONSTRAINT `fk_ORDINE_CUSTOMERS1` FOREIGN KEY (`id_customers`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_ORDINE_INDIRIZZO1` FOREIGN KEY (`id_indirizzo`) REFERENCES `indirizzo` (`id`),
  ADD CONSTRAINT `fk_ORDINE_PAGAMENTO1` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento` (`id`);

--
-- Limiti per la tabella `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_PAGAMENTO_CUSTOMERS1` FOREIGN KEY (`id_customers`) REFERENCES `customers` (`id`);

--
-- Limiti per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `fk_PRODOTTI_MODELLO1` FOREIGN KEY (`id_modello`) REFERENCES `modello` (`id`);

--
-- Limiti per la tabella `taglie_has_prodotti`
--
ALTER TABLE `taglie_has_prodotti`
  ADD CONSTRAINT `fk_TAGLIE_has_PRODOTTI_PRODOTTO` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id`),
  ADD CONSTRAINT `fk_TAGLIE_has_PRODOTTI_TAGLIA` FOREIGN KEY (`id_taglia`) REFERENCES `taglia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
