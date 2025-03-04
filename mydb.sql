-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Mar 04, 2025 alle 22:39
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
(2, 'NEW BALANCE', 'Brand di Scarpe da ginnastica'),
(3, 'JORDAN', 'Brand di Scarpe da ginnastica'),
(4, 'ADIDAS', 'Brand di Scarpe da ginnastica'),
(5, 'PUMA', 'Brand di Scarpe da ginnastica');

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
(13, 'ROSA'),
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
(131, 3, 40),
(132, 11, 40),
(160, 2, 53),
(161, 11, 53),
(168, 11, 41),
(169, 12, 41),
(171, 11, 57),
(172, 4, 58),
(173, 4, 59),
(175, 1, 56),
(176, 4, 60),
(177, 11, 60),
(178, 13, 61),
(179, 11, 62),
(180, 4, 62);

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
(89, 'images/AIR+MAX+DN (1).png'),
(90, 'images/AIR+MAX+DN (2).png'),
(91, 'images/AIR+MAX+DN (3).png'),
(92, 'images/AIR+MAX+DN (4).png'),
(93, 'images/AIR+MAX+DN (5).png'),
(94, 'images/AIR+MAX+DN (6).png'),
(95, 'images/AIR+MAX+DN W (1).png'),
(96, 'images/AIR+MAX+DN W (2).png'),
(97, 'images/AIR+MAX+DN W (3).png'),
(98, 'images/AIR+MAX+DN W (4).png'),
(99, 'images/AIR+MAX+DN W (5).png'),
(100, 'images/AIR+MAX+DN W (6).png'),
(83, 'images/AIR+MAX+PLUS (1).jpeg'),
(84, 'images/AIR+MAX+PLUS (2).jpeg'),
(85, 'images/AIR+MAX+PLUS (3).jpeg'),
(86, 'images/AIR+MAX+PLUS (4).jpeg'),
(87, 'images/AIR+MAX+PLUS (5).jpeg'),
(88, 'images/AIR+MAX+PLUS (6).jpeg'),
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
(101, 'images/NIKE+SB+DUNK+LOW+PRO (1).png'),
(102, 'images/NIKE+SB+DUNK+LOW+PRO (2).png'),
(103, 'images/NIKE+SB+DUNK+LOW+PRO (3).png'),
(104, 'images/NIKE+SB+DUNK+LOW+PRO (4).png'),
(105, 'images/NIKE+SB+DUNK+LOW+PRO (5).png'),
(106, 'images/NIKE+SB+DUNK+LOW+PRO (6).png'),
(107, 'images/W+NIKE+DUNK+LOW (1).png'),
(108, 'images/W+NIKE+DUNK+LOW (2).png'),
(109, 'images/W+NIKE+DUNK+LOW (3).png'),
(110, 'images/W+NIKE+DUNK+LOW (4).png'),
(111, 'images/W+NIKE+DUNK+LOW (5).png'),
(112, 'images/W+NIKE+DUNK+LOW (6).png'),
(113, 'images/W+NIKE+DUNK+LOW+NEXT+NATURE (1).png'),
(114, 'images/W+NIKE+DUNK+LOW+NEXT+NATURE (2).png'),
(115, 'images/W+NIKE+DUNK+LOW+NEXT+NATURE (3).png'),
(116, 'images/W+NIKE+DUNK+LOW+NEXT+NATURE (4).png'),
(117, 'images/W+NIKE+DUNK+LOW+NEXT+NATURE (5).png'),
(118, 'images/W+NIKE+DUNK+LOW+NEXT+NATURE (6).png');

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
(69, 82, 56),
(70, 83, 57),
(71, 84, 57),
(72, 85, 57),
(73, 86, 57),
(74, 87, 57),
(75, 88, 57),
(76, 89, 58),
(77, 90, 58),
(78, 91, 58),
(79, 92, 58),
(80, 93, 58),
(81, 94, 58),
(82, 95, 59),
(83, 96, 59),
(84, 97, 59),
(85, 98, 59),
(86, 99, 59),
(87, 100, 59),
(88, 101, 60),
(89, 102, 60),
(90, 103, 60),
(91, 104, 60),
(92, 105, 60),
(93, 106, 60),
(94, 107, 61),
(95, 108, 61),
(96, 109, 61),
(97, 110, 61),
(98, 111, 61),
(99, 112, 61),
(100, 113, 62),
(101, 114, 62),
(102, 115, 62),
(103, 116, 62),
(104, 117, 62),
(105, 118, 62);

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
(85, 2, 1, 'NIKE AIR MAX DN', 'Dai il benvenuto alla nuova generazione della tecnologia Air. Air Max Dn integra la nostra unita Dynamic Air con sistema di tubi a doppia pressione, per offrire reattivita a ogni passo. Il risultato e un design futuristico, abbastanza comodo da essere indossato tutto il giorno. Feel the Unreal.'),
(71, 2, 1, 'NIKE AIR MAX PLUS', 'Scopri la leggendaria tecnologia Tuned Air con queste scarpe confortevoli. Con l\'iconica gabbia a forma di fiamma e la coda di balena vicino all\'arco plantare, questa Air Max Plus sfoggia vivaci tocchi di colore per un look che non passa inosservato nel tempo libero. '),
(89, 4, 1, 'NIKE DUNK LOW', 'Creata per il parquet, ma ideale per la citta, torna l icona del basket degli anni Ottanta con strati esterni perfettamente lucidati e colori classici della squadra. Con un iconico design da basket, Nike Dunk Low riporta in strada lo stile vintage degli anni Ottanta, mentre il collare ammortizzato a taglio basso ti fara sentire al meglio ovunque e con il massimo comfort.'),
(90, 4, 1, 'NIKE DUNK LOW NEXT NATURE', 'Puoi sempre contare su un classico. Dunk Low unisce l\'iconico design in blocchi di colore, materiali pregiati e un\'imbottitura morbida per un comfort rivoluzionario che dura nel tempo. Le possibilita di styling sono infinite: come indosserai le tue Dunk?'),
(88, 4, 1, 'NIKE SB DUNK LOW PRO', 'Una scarpa da skateboard classica, perfetta sulla tavola e per qualsiasi occasione. Questa versione esclusiva di Dunk Low e realizzata in pelle e presenta un battistrada in gomma per un tocco di fascino in piu a ogni trick. Inoltre, la traspirante linguetta in tessuto e l ammortizzazione Zoom Air sotto il piede regalano leggerezza anche durante le session piu lunghe sullo skate. E poi ce lo Swoosh, per un tocco di contrasto in piu. E uno stile ancora piu d\'impatto.'),
(86, 4, 3, 'AIR JORDAN 4 ABUNDANCE', 'Sempre guadagnata, mai data. La AJ4 \'Abundance\' e un omaggio all\'atteggiamento e alla determinazione che la prossima generazione di grandi porta in ogni mossa che fa, sia dentro che fuori dal campo. Questa edizione omaggia l\'iconica AJ4 \'Pure Money\' con finiture Metallic Silver per completare il tuo stile moderno e una colorazione Seafoam e Sail per un tocco morbido.');

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
(40, 71, 180, 1),
(41, 71, 180, 0),
(53, 71, 180, 1),
(56, 86, 400, 1),
(57, 71, 180, 1),
(58, 85, 200, 1),
(59, 85, 180, 1),
(60, 88, 150, 1),
(61, 89, 120, 1),
(62, 90, 130, 1);

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
(237, 3, 41, 1),
(238, 5, 41, 1),
(240, 11, 57, 1),
(241, 13, 57, 1),
(242, 3, 58, 1),
(243, 5, 58, 1),
(244, 7, 58, 2),
(245, 5, 59, 1),
(246, 7, 59, 1),
(248, 5, 56, 1),
(249, 3, 60, 1),
(250, 5, 60, 1),
(251, 5, 61, 1),
(252, 5, 62, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `colore_has_prodotti`
--
ALTER TABLE `colore_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT per la tabella `immagini_has_prodotti`
--
ALTER TABLE `immagini_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT per la tabella `modello`
--
ALTER TABLE `modello`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT per la tabella `taglia`
--
ALTER TABLE `taglia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `taglie_has_prodotti`
--
ALTER TABLE `taglie_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

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
