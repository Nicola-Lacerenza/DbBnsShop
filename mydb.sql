-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 15, 2025 alle 16:35
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `brand`
--

INSERT INTO `brand` (`id`, `nome`, `descrizione`) VALUES
(1, 'NIKE', 'NIKE'),
(2, 'NEW BALANCE', NULL),
(3, 'JORDAN', NULL),
(4, 'ADIDAS', NULL),
(5, 'PUMA', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome_categoria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`id`, `nome_categoria`) VALUES
(1, 'STIVALI'),
(2, 'SNEAKERS'),
(3, 'MOCASSINI');

-- --------------------------------------------------------

--
-- Struttura della tabella `codice_sconto`
--

CREATE TABLE `codice_sconto` (
  `id` int(11) NOT NULL,
  `id_prodotti` int(11) NOT NULL,
  `id_ordine` int(11) NOT NULL,
  `codice` varchar(45) NOT NULL,
  `sconto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `colore`
--

CREATE TABLE `colore` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `colore`
--

INSERT INTO `colore` (`id`, `nome`) VALUES
(1, 'VERDE'),
(2, 'BLU'),
(3, 'GIALLO'),
(4, 'BIANCO'),
(5, 'MARRONE'),
(6, 'NERO'),
(7, 'CELESTE'),
(8, 'VIOLA'),
(10, 'ROSSO'),
(11, 'NERO');

-- --------------------------------------------------------

--
-- Struttura della tabella `colore_has_modello`
--

CREATE TABLE `colore_has_modello` (
  `id` int(11) NOT NULL,
  `id_colore` int(11) NOT NULL,
  `id_modello` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `colore_has_modello`
--

INSERT INTO `colore_has_modello` (`id`, `id_colore`, `id_modello`) VALUES
(7, 4, 15),
(8, 4, 15),
(9, 4, 15),
(10, 4, 15),
(11, 4, 15);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `immagini`
--

CREATE TABLE `immagini` (
  `id` int(11) NOT NULL,
  `url` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `immagini_has_prodotti`
--

CREATE TABLE `immagini_has_prodotti` (
  `id` int(11) NOT NULL,
  `id_immagine` int(11) NOT NULL,
  `id_prodotto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `modello`
--

CREATE TABLE `modello` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descrizione` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `modello`
--

INSERT INTO `modello` (`id`, `id_categoria`, `id_brand`, `nome`, `descrizione`) VALUES
(13, 2, 1, 'Nike Air Force 1', 'Scarpe da ginnastica'),
(14, 2, 2, 'Nike Air Force 1', 'PIPPO'),
(15, 2, 3, 'AIr Jordan 3 Black Cat', 'Scarpe'),
(16, 2, 3, 'AIr Jordan 3 Black Cat', 'Scarpe'),
(17, 2, 3, 'AIr Jordan 3 Black Cat', 'Scarpe'),
(18, 2, 3, 'AIr Jordan 3 Black Cat', 'Scarpe'),
(19, 2, 3, 'AIr Jordan 3 Black Cat', 'Scarpe');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `id` int(11) NOT NULL,
  `id_modello` int(11) NOT NULL,
  `prezzo` int(11) NOT NULL,
  `stato_pubblicazione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `taglia`
--

CREATE TABLE `taglia` (
  `id` int(11) NOT NULL,
  `taglia_Eu` varchar(45) NOT NULL,
  `taglia_Uk` varchar(45) NOT NULL,
  `taglia_Us` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `taglia`
--

INSERT INTO `taglia` (`id`, `taglia_Eu`, `taglia_Uk`, `taglia_Us`) VALUES
(1, '35', '', ''),
(2, '35.5', '', ''),
(3, '36', '', ''),
(4, '36.5', '0', ''),
(5, '37', '0', ''),
(6, '37.5', '0', ''),
(7, '38', '0', ''),
(8, '38.5', '0', ''),
(9, '39', '0', ''),
(10, '39.5', '0', ''),
(11, '40', '0', ''),
(12, '40.5', '0', ''),
(13, '41', '0', ''),
(14, '41.5', '0', ''),
(15, '42', '0', ''),
(16, '42.5', '0', ''),
(17, '43', '0', ''),
(18, '43.5', '0', ''),
(19, '44', '0', ''),
(20, '44.5', '0', ''),
(21, '45', '0', ''),
(22, '45.5', '0', ''),
(23, '46', '0', ''),
(24, '46.5', '0', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `taglie_has_prodotti`
--

CREATE TABLE `taglie_has_prodotti` (
  `id` int(11) NOT NULL,
  `id_taglia` int(11) NOT NULL,
  `id_prodotto` int(11) NOT NULL,
  `quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `codice_sconto`
--
ALTER TABLE `codice_sconto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_CODICE SCONTO_DETTAGLI ORDINE1` (`id_prodotti`,`id_ordine`);

--
-- Indici per le tabelle `colore`
--
ALTER TABLE `colore`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `colore_has_modello`
--
ALTER TABLE `colore_has_modello`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_COLORE_has_MODELLO_COLORE` (`id_colore`),
  ADD KEY `fk_COLORE_has_MODELLO_MODELLO` (`id_modello`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `codice_sconto`
--
ALTER TABLE `codice_sconto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `colore`
--
ALTER TABLE `colore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `colore_has_modello`
--
ALTER TABLE `colore_has_modello`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `fornitori_has_prodotti`
--
ALTER TABLE `fornitori_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `immagini`
--
ALTER TABLE `immagini`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT per la tabella `immagini_has_prodotti`
--
ALTER TABLE `immagini_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `modello`
--
ALTER TABLE `modello`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `taglia`
--
ALTER TABLE `taglia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `taglie_has_prodotti`
--
ALTER TABLE `taglie_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `codice_sconto`
--
ALTER TABLE `codice_sconto`
  ADD CONSTRAINT `fk_CODICE SCONTO_DETTAGLI ORDINE1` FOREIGN KEY (`id_prodotti`,`id_ordine`) REFERENCES `dettagli_ordine` (`id_prodotti`, `id_ordine`);

--
-- Limiti per la tabella `colore_has_modello`
--
ALTER TABLE `colore_has_modello`
  ADD CONSTRAINT `fk_COLORE_has_MODELLO_COLORE` FOREIGN KEY (`id_colore`) REFERENCES `colore` (`id`),
  ADD CONSTRAINT `fk_COLORE_has_MODELLO_MODELLO` FOREIGN KEY (`id_modello`) REFERENCES `modello` (`id`);

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
