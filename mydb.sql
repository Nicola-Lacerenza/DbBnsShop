-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Mar 10, 2025 alle 22:18
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
(5, 'SNEAKERS', 'BAMBINO'),
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
(239, 13, 65),
(240, 4, 66),
(241, 12, 66),
(242, 11, 67),
(244, 3, 69),
(245, 11, 69),
(247, 4, 68),
(248, 11, 70),
(249, 4, 71),
(250, 4, 72),
(251, 11, 72),
(252, 11, 73),
(253, 12, 73),
(254, 4, 73),
(257, 6, 74),
(258, 4, 74),
(259, 2, 75),
(260, 11, 75),
(261, 3, 76),
(262, 12, 76),
(263, 11, 76),
(264, 11, 77),
(265, 4, 78),
(266, 6, 78),
(267, 6, 79),
(268, 11, 80),
(269, 4, 80),
(270, 12, 80),
(271, 1, 81),
(272, 4, 81),
(273, 13, 82),
(274, 4, 82),
(275, 1, 83),
(276, 11, 83),
(277, 4, 83),
(278, 4, 84),
(279, 13, 84);

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
(152, 'images/0223ac22-0bc1-4a23-9d69-29b95964d3e5.png'),
(159, 'images/0397e6bd-4f33-4ea4-bbeb-7d156baf1ac8.png'),
(167, 'images/06e7e8cd-e263-433d-9b75-e236d39d75d8.png'),
(206, 'images/0bded708-c8a9-4907-abc7-2ce70ad89c19.jpeg'),
(164, 'images/115d7358-4c5c-4752-acf3-84c52e7512e2.png'),
(170, 'images/12aefe28-20cc-4974-b723-bd1d6e17123b.png'),
(192, 'images/15d1fd3f-f4fc-4c88-ab6a-325b7e48544c.png'),
(186, 'images/1701e614-6828-4eae-ba23-21321c1b99bf.png'),
(205, 'images/17a36a05-97a8-4649-bc21-e024cd3b913b.jpeg'),
(148, 'images/1caa3950-412c-4cf3-9057-2fc43757a8dc.png'),
(134, 'images/1d829f85-e7d1-4415-a45c-558709219a26.png'),
(139, 'images/1e2319c8-8174-4bcd-881f-eddda222bc28.png'),
(245, 'images/1f07b1cf-e46d-405c-aec0-d89890964a26.jpeg'),
(213, 'images/1f90c784-02ad-4e5a-99fb-836be52a7fd1.png'),
(221, 'images/23b9b242-40b0-4969-9d71-521233fd7ba6.png'),
(142, 'images/2a097e2f-3ea3-477f-a5fb-ebd246be0439.png'),
(239, 'images/2ce92aa0-a262-48a8-b48d-bfe5fa77e620.jpeg'),
(187, 'images/2dc37496-2850-49f7-96a0-8b20378b6ab0.png'),
(168, 'images/2f8ae4b4-daf1-495c-9909-dadbfb675baa.png'),
(178, 'images/2f93e58f-d858-4be9-a3a2-a29e47b88674.png'),
(184, 'images/325babfe-c28c-437d-a2c9-53730371fb94.png'),
(135, 'images/354267c0-fa7b-4956-a8b0-e99953157a53.png'),
(207, 'images/37fd4704-5cec-4e1f-a16a-9277a97581f7.jpeg'),
(131, 'images/39005b87-170c-4cd2-a3ed-e5b129e1d188.png'),
(181, 'images/3a4447ed-d79d-4ac4-9f78-ac0d193d076b.png'),
(154, 'images/3a7f35b4-9dc8-4760-bb32-bc310423330a.png'),
(160, 'images/3ae753b4-4fed-4293-924d-a0b4a8cdeba0.png'),
(177, 'images/3cb29dc3-99f1-4a27-b06b-efafe367409d.png'),
(191, 'images/3cfca509-f0d5-4b87-abb2-6918108ba767.png'),
(227, 'images/3f8258cd-9bfd-41e7-a545-77dd4dac23b7.png'),
(237, 'images/44295637-d29f-4183-a846-84a76b61aae4.png'),
(165, 'images/455dd021-35ea-4a47-8f5a-76999cb69ac6.png'),
(231, 'images/4a708182-bc80-4448-b095-3a72d3491a40.png'),
(140, 'images/4b971c00-d30c-4f11-99a4-5a1a0a69275d.png'),
(157, 'images/4e1d5f19-2d9f-4cee-b5ba-409f9080ceec.png'),
(163, 'images/516708df-0bfc-44e0-86e0-d69df5f30efa.png'),
(137, 'images/55d69856-d189-41eb-ac6d-4d7c36a99b8f.png'),
(218, 'images/55db4a75-8226-4408-a3bf-28e39f1fd30c.png'),
(234, 'images/5e03f8f3-13d6-465a-ac48-73f25759d18c.jpeg'),
(222, 'images/5eff62e8-1f2d-4454-8a22-faa28ed78377.png'),
(248, 'images/600b6229-0366-4ed0-aa34-be2605b0afcf.png'),
(201, 'images/607b4764-06bb-4c43-84f6-547261340439.png'),
(243, 'images/6243410a-c40b-44ce-9c13-771ab76e63d7.png'),
(211, 'images/64dc51bf-caeb-4368-8789-e001a30a63d4.png'),
(190, 'images/6637413d-9313-4dea-966a-597c30ad2576.png'),
(235, 'images/68126a92-cdce-4bd2-8921-144a8f4be170.png'),
(250, 'images/68e1243c-0fa6-433e-bbca-29710361d93b.png'),
(244, 'images/6f20fd1b-3a37-4387-a9ed-a470ed06744a.png'),
(215, 'images/6f6095ca-177b-4ab9-a1ea-a55af08d9cc7.png'),
(176, 'images/7254ec03-0c9e-4ef2-a111-d4e5cde1ae7e.png'),
(209, 'images/73690ae4-0664-4461-ab8a-374baf547afc.png'),
(146, 'images/74f056e4-c2ad-4325-919f-e909737eb063.png'),
(225, 'images/76c62fcc-1eb4-4b9b-aa62-7f617f98a4ab.png'),
(145, 'images/76cdaf0e-867a-4ea2-a19e-3760fa7f4f40.png'),
(174, 'images/7f0c37cb-5fa5-4c1f-a958-c3c28b676a1a.png'),
(158, 'images/80081115-e8a0-420b-b65d-4580eaa9a138.png'),
(242, 'images/81d9d811-c2c1-4f25-870a-923696cdddb5.jpeg'),
(214, 'images/86113245-090d-499a-baf4-9f6067effc6f.png'),
(180, 'images/86dcdbe6-b2c9-420f-bc18-2502eabf7bb1.png'),
(188, 'images/8aa7e93a-c329-4d4b-8af4-0ac9cc78b2e0.png'),
(216, 'images/8b8bf355-ff3d-4d88-9a12-96d9654f099c.png'),
(153, 'images/8be809a0-d0cc-417e-af77-64416727baf5.png'),
(202, 'images/8c5e3b9b-5dae-4117-924d-67f58d92fccd.jpeg'),
(150, 'images/8c805ed6-c47c-48b5-b13c-42a52372c9d5.png'),
(198, 'images/8f379d39-ed60-4b39-905f-0fdec821a51e.png'),
(141, 'images/92095959-7a86-4080-98ef-b810970c6814.png'),
(217, 'images/92773a65-42d4-43af-bbf0-02873c0f566d.png'),
(173, 'images/940731ea-b9bd-4e04-b4cd-e57a830db453.png'),
(228, 'images/96635af4-fe5b-45b3-8d56-1402d238525b.png'),
(210, 'images/994be2e8-bb06-4bed-bcb3-1fe12d7748d0.png'),
(151, 'images/99dc1977-7c1f-47d0-adff-9baa23909830.png'),
(155, 'images/9b02c0ed-9c69-4405-8049-db3cf672d8d2.png'),
(194, 'images/9b687ee9-7237-4d94-9082-2c148e886ee6.png'),
(199, 'images/a512b904-17c0-4102-b402-34313c8610ff.png'),
(147, 'images/a5227972-a389-4ff4-b9ec-15ed5ae08d0e.png'),
(220, 'images/a56ab9b1-d45b-4573-afcf-c3e37992ef6f.png'),
(156, 'images/a6271d29-7275-4598-981b-12be7d57ff3e.png'),
(162, 'images/abdd36ad-42a3-4bea-85d9-55fe67b72935.png'),
(232, 'images/ac388828-bef8-4f87-89f2-3a098185f78e.jpeg'),
(212, 'images/ac3a8b5e-166d-4581-8ccd-aafd97286410.png'),
(169, 'images/adc086b7-779b-4738-9ba7-045a4310da49.png'),
(149, 'images/afad54a0-bacf-419f-97ba-cd263506d2e3.png'),
(247, 'images/b14eb96a-6269-48ba-89c5-e20ab7d960ab.png'),
(166, 'images/b156a4b7-9cd2-4163-892b-f9390e70cc60.png'),
(132, 'images/b17d7a98-7095-461e-be2d-d7d75e24d2d8.png'),
(223, 'images/b5b6a715-6c6d-40a9-acb4-6907ab41f897.png'),
(193, 'images/b6af99ae-30f2-43d0-8751-b4cbc6e50cb7.png'),
(197, 'images/b85dd5cf-5d23-47c2-9428-95a465a976bc.png'),
(233, 'images/b91e2a44-8ca7-4071-b02f-3cf440c0f44e.jpeg'),
(143, 'images/bc9dbd77-f6f2-4a52-8bd5-835ea24d25e8.png'),
(172, 'images/bffab1d2-a797-4ed4-bcd3-4655a4dded39.png'),
(185, 'images/c3079851-c69d-4816-9929-4a2c3a81561a.png'),
(133, 'images/c5bc838c-6ff3-4b85-8f3d-475d633dd615.png'),
(144, 'images/c822f382-332d-4fc7-ad82-76d6b64985ca.png'),
(219, 'images/cee7216e-8642-4aa5-a657-fecc6f32d398.png'),
(241, 'images/d01c1638-4364-4917-894f-1dc90e17f4bc.jpeg'),
(136, 'images/d17d3dca-0102-4363-b9d4-398fc4f8ccf1.png'),
(175, 'images/d7b25a15-dcaf-488b-95b9-94074c160427.png'),
(240, 'images/d88e2a36-199d-4210-bc21-edb2355839e2.png'),
(179, 'images/daf9f058-116f-4214-994e-aa7c4da5d298.png'),
(183, 'images/dc7475b2-0e7a-4032-98a2-7747a59b56ac.png'),
(236, 'images/de545d15-4c22-4988-b4c3-3e2ac0ce4822.jpeg'),
(138, 'images/e0996df4-c13a-4b29-b20e-f011136f556d.png'),
(229, 'images/e49f45bb-519c-4ef9-b4c5-d793466ab4ca.png'),
(246, 'images/e50bdca9-8345-421b-a5ff-26b691cd0185.jpeg'),
(249, 'images/e862a865-513b-42c1-b27d-5858b2497d75.png'),
(204, 'images/ec45a13f-d017-49a5-911f-a061f2ed2a21.jpeg'),
(171, 'images/ed0b7da6-da5e-4260-8e63-42deaa312eb2.png'),
(226, 'images/ed0fed34-6aa5-4c3d-80c9-d4d43ec84c3f.png'),
(208, 'images/ed21cd0a-d226-4a53-b19e-c4720ca72694.png'),
(224, 'images/edc2e848-7bac-4427-be3f-bf1f62a6b051.png'),
(230, 'images/f04db87a-9625-4570-bf3c-a5b225ce0f98.png'),
(189, 'images/f057ff66-8228-45e3-afec-47f7f395ea70.png'),
(195, 'images/f452dddc-2ace-4777-b95e-d3b6ef2c6e98.png'),
(196, 'images/f5997997-8302-44ed-8c5d-d8777ceb52fd.png'),
(203, 'images/f7c14e33-5fca-417f-9921-412f19fef369.jpeg'),
(200, 'images/fa9e602c-fb1d-4a8f-b6f8-6e61b151bed8.png'),
(161, 'images/faeb2d95-a5e6-4cdc-9050-32063c5f86f8.png'),
(238, 'images/fb2f6295-7113-402d-b3e8-b7d8b25e48c1.jpeg'),
(182, 'images/ff63222d-f888-4d0a-b3d6-26f92d401efb.png');

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
(118, 131, 65),
(119, 132, 65),
(120, 133, 65),
(121, 134, 65),
(122, 135, 65),
(123, 136, 65),
(124, 137, 66),
(125, 138, 66),
(126, 139, 66),
(127, 140, 66),
(128, 141, 66),
(129, 142, 66),
(130, 143, 67),
(131, 144, 67),
(132, 145, 67),
(133, 146, 67),
(134, 147, 67),
(135, 148, 67),
(136, 149, 68),
(137, 150, 68),
(138, 151, 68),
(139, 152, 68),
(140, 153, 68),
(141, 154, 68),
(142, 155, 69),
(143, 156, 69),
(144, 157, 69),
(145, 158, 69),
(146, 159, 69),
(147, 160, 69),
(148, 161, 70),
(149, 162, 70),
(150, 163, 70),
(151, 164, 70),
(152, 165, 70),
(153, 166, 70),
(154, 167, 71),
(155, 168, 71),
(156, 169, 71),
(157, 170, 71),
(158, 171, 71),
(159, 172, 71),
(160, 173, 72),
(161, 174, 72),
(162, 175, 72),
(163, 176, 72),
(164, 177, 72),
(165, 178, 72),
(166, 179, 73),
(167, 180, 73),
(168, 181, 73),
(169, 182, 73),
(170, 183, 73),
(171, 184, 73),
(172, 185, 74),
(173, 186, 74),
(174, 187, 74),
(175, 188, 74),
(176, 189, 74),
(177, 190, 74),
(178, 191, 75),
(179, 192, 75),
(180, 193, 75),
(181, 194, 75),
(182, 195, 75),
(183, 196, 75),
(184, 197, 76),
(185, 198, 76),
(186, 199, 76),
(187, 200, 76),
(188, 201, 76),
(189, 202, 77),
(190, 203, 77),
(191, 204, 77),
(192, 205, 77),
(193, 206, 77),
(194, 207, 77),
(195, 208, 78),
(196, 209, 78),
(197, 210, 78),
(198, 211, 78),
(199, 212, 78),
(200, 213, 78),
(201, 214, 79),
(202, 215, 79),
(203, 216, 79),
(204, 217, 79),
(205, 218, 79),
(206, 219, 79),
(207, 220, 80),
(208, 221, 80),
(209, 222, 80),
(210, 223, 80),
(211, 224, 80),
(212, 225, 80),
(213, 226, 81),
(214, 227, 81),
(215, 228, 81),
(216, 229, 81),
(217, 230, 81),
(218, 231, 81),
(219, 232, 82),
(220, 233, 82),
(221, 234, 82),
(222, 235, 82),
(223, 236, 82),
(224, 237, 82),
(225, 238, 83),
(226, 239, 83),
(227, 240, 83),
(228, 241, 83),
(229, 242, 83),
(230, 243, 83),
(231, 244, 84),
(232, 245, 84),
(233, 246, 84),
(234, 247, 84),
(235, 248, 84),
(236, 249, 84),
(237, 250, 84);

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
(104, 2, 1, 'Nike AIR FORCE 1 07', 'Confortevole, resistente e intramontabile: e la numero 1 per una ragione. La classica fattura anni Ottanta si unisce alla morbida pelle e ai dettagli d\'impatto per uno stile che lascia il segno in campo e nel tempo libero.'),
(103, 2, 1, 'NIKE AIR MAX DN', 'DDDSD'),
(71, 2, 1, 'NIKE AIR MAX PLUS', 'Scopri la leggendaria tecnologia Tuned Air con queste scarpe confortevoli. Con l\'iconica gabbia a forma di fiamma e la coda di balena vicino all\'arco plantare, questa Air Max Plus sfoggia vivaci tocchi di colore per un look che non passa inosservato nel tempo libero. '),
(102, 2, 1, 'NIKE DUNK SB LOW PRO', 'Una scarpa da skateboard classica, perfetta sulla tavola e per qualsiasi occasione. Questa versione esclusiva di Dunk Low e realizzata in pelle e presenta un battistrada in gomma per un tocco di fascino in piu a ogni trick. Inoltre, la traspirante linguetta in tessuto e l ammortizzazione Zoom Air sotto il piede regalano leggerezza anche durante le session piu lunghe sullo skate. E poi ce lo Swoosh, per un tocco di contrasto in piu. E uno stile ancora piu d\'impatto.'),
(106, 4, 1, 'AIR JORDAN 1 LOW G', 'Dai il massimo dalla prima all\'ultima buca. Ispirata a una delle sneakers piu\' iconiche di tutti i tempi, Air Jordan 1 G e subito un classico sul green. Dotata di ammortizzazione Air sotto il piede, con il logo Wings sul tallone e una struttura a trazione integrata per offrire il massimo della potenza a ogni swing, la scarpa ha il classico stile da circolo sportivo della AJ1 originale e tutto quel che serve per giocare nel massimo comfort fino alla diciottesima buca.'),
(89, 4, 1, 'NIKE DUNK LOW', 'Creata per il parquet, ma ideale per la citta, torna l icona del basket degli anni Ottanta con strati esterni perfettamente lucidati e colori classici della squadra. Con un iconico design da basket, Nike Dunk Low riporta in strada lo stile vintage degli anni Ottanta, mentre il collare ammortizzato a taglio basso ti fara sentire al meglio ovunque e con il massimo comfort.'),
(90, 4, 1, 'NIKE DUNK LOW NEXT NATURE', 'Puoi sempre contare su un classico. Dunk Low unisce l\'iconico design in blocchi di colore, materiali pregiati e un\'imbottitura morbida per un comfort rivoluzionario che dura nel tempo. Le possibilita di styling sono infinite: come indosserai le tue Dunk?'),
(107, 4, 3, 'AIR JORDAN 4 RM', 'Il modello remixato di cui non sapevi di aver bisogno. Pensata per una vita in movimento, questa sneaker reinterpreta AJ4 per offrirti comfort e resistenza. Max Air ammortizza ogni tuo passo. In piu\', abbiamo fuso alcune parti della tomaia in una gabbia robusta e flessibile, che avvolge la scarpa per donare ancora piu\' resistenza ogni giorno.'),
(108, 5, 3, 'AIR JORDAN 1 LOW', 'Non si puo\' negare che AJ1 sia un classico. Ora torna in auge con pelle, tocchi di colore e classica ammortizzazione Air per uno stile attuale e un comfort costante. Il logo Wings impresso e il Jumpman ricamato aggiungono un tocco di stile ispirato alla leggenda di Jordan che non potrai fare a meno di mettere in mostra.');

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
(65, 89, 130, 1),
(66, 102, 200, 1),
(67, 103, 250, 1),
(68, 103, 150, 1),
(69, 71, 250, 1),
(70, 104, 120, 1),
(71, 104, 120, 1),
(72, 104, 120, 1),
(73, 102, 120, 1),
(74, 89, 120, 1),
(75, 71, 199, 1),
(76, 71, 120, 1),
(77, 71, 120, 1),
(78, 106, 150, 1),
(79, 106, 150, 1),
(80, 106, 150, 1),
(81, 107, 150, 1),
(82, 107, 150, 1),
(83, 108, 70, 1),
(84, 108, 70, 1);

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
(458, 5, 65, 1),
(459, 3, 66, 1),
(460, 5, 67, 1),
(462, 5, 69, 1),
(467, 4, 68, 1),
(468, 7, 68, 2),
(469, 15, 68, 2),
(470, 21, 68, 2),
(471, 3, 70, 1),
(472, 4, 70, 1),
(473, 14, 70, 1),
(474, 3, 71, 1),
(475, 13, 71, 1),
(476, 3, 72, 1),
(477, 5, 72, 1),
(478, 7, 72, 1),
(479, 2, 73, 1),
(480, 3, 73, 1),
(481, 4, 73, 1),
(482, 5, 73, 1),
(483, 6, 73, 1),
(484, 7, 73, 1),
(485, 8, 73, 1),
(486, 9, 73, 1),
(487, 10, 73, 1),
(488, 11, 73, 1),
(489, 12, 73, 1),
(490, 13, 73, 1),
(491, 14, 73, 1),
(492, 15, 73, 1),
(493, 16, 73, 1),
(494, 17, 73, 1),
(495, 18, 73, 1),
(496, 19, 73, 1),
(497, 20, 73, 1),
(498, 21, 73, 2),
(499, 22, 73, 1),
(500, 23, 73, 2),
(503, 3, 74, 1),
(504, 5, 74, 2),
(505, 3, 75, 1),
(506, 5, 75, 1),
(507, 3, 76, 1),
(508, 5, 76, 1),
(509, 5, 77, 1),
(510, 5, 78, 1),
(511, 7, 78, 1),
(512, 5, 79, 1),
(513, 11, 80, 1),
(514, 5, 81, 1),
(515, 7, 81, 1),
(516, 5, 82, 1),
(517, 2, 83, 1),
(518, 3, 83, 1),
(519, 4, 83, 1),
(520, 5, 83, 1),
(521, 6, 83, 1),
(522, 3, 84, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT per la tabella `immagini_has_prodotti`
--
ALTER TABLE `immagini_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT per la tabella `modello`
--
ALTER TABLE `modello`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT per la tabella `taglia`
--
ALTER TABLE `taglia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `taglie_has_prodotti`
--
ALTER TABLE `taglie_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;

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
