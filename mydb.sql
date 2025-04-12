-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Apr 12, 2025 alle 13:44
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
  `valore` int(4) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `tipo` varchar(45) NOT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `uso_massimo` int(11) DEFAULT NULL,
  `uso_per_utente` int(11) NOT NULL,
  `minimo_acquisto` int(5) NOT NULL,
  `attivo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `codice_sconto`
--

INSERT INTO `codice_sconto` (`id`, `codice`, `valore`, `descrizione`, `tipo`, `data_inizio`, `data_fine`, `uso_massimo`, `uso_per_utente`, `minimo_acquisto`, `attivo`) VALUES
(15, 'BNS10', 10, 'Sconto del 10% su tutte le Sneakers da Uomo!!', 'percentuale', '2025-04-09', '2025-04-29', 100, 1, 100, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `codice_sconto_has_categoria`
--

CREATE TABLE `codice_sconto_has_categoria` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_codicesconto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `codice_sconto_has_categoria`
--

INSERT INTO `codice_sconto_has_categoria` (`id`, `id_categoria`, `id_codicesconto`) VALUES
(5, 2, 15);

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
(240, 4, 66),
(241, 12, 66),
(242, 11, 67),
(244, 3, 69),
(245, 11, 69),
(247, 4, 68),
(248, 11, 70),
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
(279, 13, 84),
(283, 13, 65),
(284, 4, 72),
(285, 11, 72),
(287, 4, 71),
(288, 4, 86),
(289, 3, 87),
(292, 7, 89),
(293, 4, 89),
(298, 1, 88),
(299, 4, 88),
(300, 4, 91),
(302, 11, 93),
(313, 2, 100),
(314, 4, 100),
(315, 12, 100),
(319, 1, 102),
(320, 4, 102),
(323, 4, 90),
(324, 13, 90),
(325, 10, 101),
(326, 4, 101),
(327, 11, 101),
(330, 6, 103),
(331, 4, 103),
(332, 12, 104),
(333, 11, 104),
(334, 5, 105),
(335, 4, 105),
(336, 12, 105),
(337, 1, 106),
(338, 11, 106),
(348, 4, 107),
(349, 2, 107),
(350, 11, 107);

-- --------------------------------------------------------

--
-- Struttura della tabella `dettagli_ordine`
--

CREATE TABLE `dettagli_ordine` (
  `id` int(11) NOT NULL,
  `id_ordine` int(11) NOT NULL,
  `id_prodotto` int(11) NOT NULL,
  `quantita` int(11) NOT NULL,
  `codice_sconto` varchar(45) NOT NULL
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
(290, 'images/00a83ce4-e272-45c4-9739-2d30df90e17a.jpeg'),
(152, 'images/0223ac22-0bc1-4a23-9d69-29b95964d3e5.png'),
(313, 'images/02756270-b268-48ff-a94d-95b90c8835a7.mp4'),
(159, 'images/0397e6bd-4f33-4ea4-bbeb-7d156baf1ac8.png'),
(167, 'images/06e7e8cd-e263-433d-9b75-e236d39d75d8.png'),
(261, 'images/07f8d607-b183-4e4a-bc20-e224e6bc1154.png'),
(300, 'images/08f74ad5-aea1-4b46-a686-7a4659588ee6.png'),
(206, 'images/0bded708-c8a9-4907-abc7-2ce70ad89c19.jpeg'),
(330, 'images/0e893003-5c8e-4b08-96c2-15a1f2e98a2a.jpg'),
(328, 'images/10a8b1f2-632f-426a-a57d-52f62bd8cd6e.mp4'),
(164, 'images/115d7358-4c5c-4752-acf3-84c52e7512e2.png'),
(170, 'images/12aefe28-20cc-4974-b723-bd1d6e17123b.png'),
(262, 'images/13daea38-474f-47f8-8e67-97af9502273a.png'),
(192, 'images/15d1fd3f-f4fc-4c88-ab6a-325b7e48544c.png'),
(332, 'images/1689dde0-718d-45b8-840c-837784751771.jpg'),
(299, 'images/16a2443d-6bc0-4805-a888-af1c3fad6a94.png'),
(186, 'images/1701e614-6828-4eae-ba23-21321c1b99bf.png'),
(205, 'images/17a36a05-97a8-4649-bc21-e024cd3b913b.jpeg'),
(148, 'images/1caa3950-412c-4cf3-9057-2fc43757a8dc.png'),
(134, 'images/1d829f85-e7d1-4415-a45c-558709219a26.png'),
(329, 'images/1dba9e89-e7c7-48ec-ac2d-6e3e1d778fab.png'),
(139, 'images/1e2319c8-8174-4bcd-881f-eddda222bc28.png'),
(245, 'images/1f07b1cf-e46d-405c-aec0-d89890964a26.jpeg'),
(213, 'images/1f90c784-02ad-4e5a-99fb-836be52a7fd1.png'),
(278, 'images/2006d67f-8eeb-491a-8e86-a989dcba94a1.png'),
(327, 'images/20cdadb0-f873-4a5b-a3ae-6fc45ecd2835.png'),
(335, 'images/22e8f0e6-2829-49eb-a226-e5a4acbcbfbe.jpg'),
(351, 'images/22f026aa-0276-4280-8618-bccd143e642d.jpg'),
(221, 'images/23b9b242-40b0-4969-9d71-521233fd7ba6.png'),
(336, 'images/273d2f57-be23-4f72-ad7e-c2abf8a2a273.jpg'),
(142, 'images/2a097e2f-3ea3-477f-a5fb-ebd246be0439.png'),
(239, 'images/2ce92aa0-a262-48a8-b48d-bfe5fa77e620.jpeg'),
(187, 'images/2dc37496-2850-49f7-96a0-8b20378b6ab0.png'),
(168, 'images/2f8ae4b4-daf1-495c-9909-dadbfb675baa.png'),
(178, 'images/2f93e58f-d858-4be9-a3a2-a29e47b88674.png'),
(321, 'images/31edb188-f29b-4cf1-b77e-01a84062d214.jpg'),
(184, 'images/325babfe-c28c-437d-a2c9-53730371fb94.png'),
(259, 'images/32b2a778-9117-4ec2-b2eb-e767c6fdd1dd.png'),
(135, 'images/354267c0-fa7b-4956-a8b0-e99953157a53.png'),
(279, 'images/37b8d03b-a7ff-4741-ac26-17481532e0a9.png'),
(207, 'images/37fd4704-5cec-4e1f-a16a-9277a97581f7.jpeg'),
(131, 'images/39005b87-170c-4cd2-a3ed-e5b129e1d188.png'),
(181, 'images/3a4447ed-d79d-4ac4-9f78-ac0d193d076b.png'),
(154, 'images/3a7f35b4-9dc8-4760-bb32-bc310423330a.png'),
(160, 'images/3ae753b4-4fed-4293-924d-a0b4a8cdeba0.png'),
(271, 'images/3bcd67c8-11f3-40c3-8eee-3f827ad7ecae.png'),
(177, 'images/3cb29dc3-99f1-4a27-b06b-efafe367409d.png'),
(191, 'images/3cfca509-f0d5-4b87-abb2-6918108ba767.png'),
(227, 'images/3f8258cd-9bfd-41e7-a545-77dd4dac23b7.png'),
(266, 'images/41921036-0423-4e16-9355-c6a399321daa.png'),
(346, 'images/42ea3a26-a6d6-46ad-b335-7a2817ac5b85.jpg'),
(237, 'images/44295637-d29f-4183-a846-84a76b61aae4.png'),
(268, 'images/4523af16-c13c-4698-9406-45d65c5a90b4.png'),
(165, 'images/455dd021-35ea-4a47-8f5a-76999cb69ac6.png'),
(298, 'images/45d733ac-7d1e-44af-9390-377b69db0ccc.png'),
(263, 'images/46e2cc72-66d8-4c0b-89f4-2ca9faabbfbd.png'),
(231, 'images/4a708182-bc80-4448-b095-3a72d3491a40.png'),
(140, 'images/4b971c00-d30c-4f11-99a4-5a1a0a69275d.png'),
(157, 'images/4e1d5f19-2d9f-4cee-b5ba-409f9080ceec.png'),
(276, 'images/4edaacc2-f953-4c8b-a3da-7afe01bf8755.png'),
(163, 'images/516708df-0bfc-44e0-86e0-d69df5f30efa.png'),
(137, 'images/55d69856-d189-41eb-ac6d-4d7c36a99b8f.png'),
(218, 'images/55db4a75-8226-4408-a3bf-28e39f1fd30c.png'),
(265, 'images/56819174-09fa-4dd6-b5ff-e1eedff99ba3.png'),
(338, 'images/577f5e28-2b51-4469-8222-0f471e72349c.jpg'),
(318, 'images/589de189-03b9-493b-b00b-ae0e6f268b7c.jpg'),
(342, 'images/59cda35a-59bc-489b-9328-30b8393ba438.jpg'),
(234, 'images/5e03f8f3-13d6-465a-ac48-73f25759d18c.jpeg'),
(222, 'images/5eff62e8-1f2d-4454-8a22-faa28ed78377.png'),
(267, 'images/5f3e446b-0e1d-4b48-8e2e-c02060cfbeb9.png'),
(248, 'images/600b6229-0366-4ed0-aa34-be2605b0afcf.png'),
(324, 'images/60139a60-9138-4fef-a3bd-26d38cb4078b.png'),
(201, 'images/607b4764-06bb-4c43-84f6-547261340439.png'),
(320, 'images/60f3c5ea-1649-4d41-9b84-606849576c5a.jpg'),
(288, 'images/610d88d3-84cb-4b0b-a9d0-c9222bf67277.png'),
(243, 'images/6243410a-c40b-44ce-9c13-771ab76e63d7.png'),
(350, 'images/635acb5e-4d4b-401e-a619-a69d77798da9.jpg'),
(211, 'images/64dc51bf-caeb-4368-8789-e001a30a63d4.png'),
(190, 'images/6637413d-9313-4dea-966a-597c30ad2576.png'),
(235, 'images/68126a92-cdce-4bd2-8921-144a8f4be170.png'),
(253, 'images/686c4424-2f81-47c9-a6df-efa961aa0554.png'),
(250, 'images/68e1243c-0fa6-433e-bbca-29710361d93b.png'),
(244, 'images/6f20fd1b-3a37-4387-a9ed-a470ed06744a.png'),
(215, 'images/6f6095ca-177b-4ab9-a1ea-a55af08d9cc7.png'),
(258, 'images/7118d595-28a7-476e-a9c5-df4a35670393.png'),
(334, 'images/71813ef7-32f5-406d-8f09-4288c8945f6e.jpg'),
(176, 'images/7254ec03-0c9e-4ef2-a111-d4e5cde1ae7e.png'),
(303, 'images/72ed1a68-ad8d-484d-a0f3-4d6f080fa24d.png'),
(209, 'images/73690ae4-0664-4461-ab8a-374baf547afc.png'),
(325, 'images/74e5ca06-7bfa-494e-af8a-01d71ea270fd.png'),
(146, 'images/74f056e4-c2ad-4325-919f-e909737eb063.png'),
(270, 'images/7536bff4-85bd-433d-8bd2-3ec9b267871b.png'),
(225, 'images/76c62fcc-1eb4-4b9b-aa62-7f617f98a4ab.png'),
(145, 'images/76cdaf0e-867a-4ea2-a19e-3760fa7f4f40.png'),
(316, 'images/77ae73e2-f068-463e-bb8f-644206eb37ed.mp4'),
(272, 'images/787cb423-3967-48cb-b2e5-441e73561cfa.png'),
(354, 'images/7d996c86-f3fe-4e53-ae42-04ebe33abe2a.jpg'),
(174, 'images/7f0c37cb-5fa5-4c1f-a958-c3c28b676a1a.png'),
(274, 'images/7ff63029-7e64-49bd-8dc1-c4a17cbc39d4.png'),
(158, 'images/80081115-e8a0-420b-b65d-4580eaa9a138.png'),
(353, 'images/803cc5f1-d0e6-444a-9402-c9bf73bcd8d4.jpg'),
(302, 'images/804dbdbf-590b-4585-9266-1539a3f35fd7.png'),
(242, 'images/81d9d811-c2c1-4f25-870a-923696cdddb5.jpeg'),
(214, 'images/86113245-090d-499a-baf4-9f6067effc6f.png'),
(180, 'images/86dcdbe6-b2c9-420f-bc18-2502eabf7bb1.png'),
(340, 'images/87eaaeff-f324-4b46-9ec0-1458a8d6b0a3.jpg'),
(188, 'images/8aa7e93a-c329-4d4b-8af4-0ac9cc78b2e0.png'),
(349, 'images/8adba881-d121-4df2-9262-3de3988bab90.jpg'),
(216, 'images/8b8bf355-ff3d-4d88-9a12-96d9654f099c.png'),
(153, 'images/8be809a0-d0cc-417e-af77-64416727baf5.png'),
(202, 'images/8c5e3b9b-5dae-4117-924d-67f58d92fccd.jpeg'),
(150, 'images/8c805ed6-c47c-48b5-b13c-42a52372c9d5.png'),
(198, 'images/8f379d39-ed60-4b39-905f-0fdec821a51e.png'),
(287, 'images/915520a3-28f5-4044-a4a7-36c34446930b.png'),
(141, 'images/92095959-7a86-4080-98ef-b810970c6814.png'),
(217, 'images/92773a65-42d4-43af-bbf0-02873c0f566d.png'),
(173, 'images/940731ea-b9bd-4e04-b4cd-e57a830db453.png'),
(228, 'images/96635af4-fe5b-45b3-8d56-1402d238525b.png'),
(292, 'images/9667b7dc-a403-4e66-bc1b-64126022465f.png'),
(210, 'images/994be2e8-bb06-4bed-bcb3-1fe12d7748d0.png'),
(151, 'images/99dc1977-7c1f-47d0-adff-9baa23909830.png'),
(269, 'images/9a5e0129-96c0-468c-beb2-ddc514dfe833.png'),
(155, 'images/9b02c0ed-9c69-4405-8049-db3cf672d8d2.png'),
(194, 'images/9b687ee9-7237-4d94-9082-2c148e886ee6.png'),
(323, 'images/9d221c45-1b50-469f-88a0-b4a70360811e.png'),
(347, 'images/9ecc9ff1-7f22-4db3-a492-65c2a6cf7a18.jpg'),
(275, 'images/a226fb1d-1810-41f8-8a66-9f7b59266b3e.png'),
(343, 'images/a2d54289-789d-4c6c-b2b5-23407d48ec51.jpg'),
(337, 'images/a317c067-bd6b-4da5-8074-42dac317b4c0.jpg'),
(273, 'images/a36d832e-e579-4b33-ac03-0de655eeda93.png'),
(199, 'images/a512b904-17c0-4102-b402-34313c8610ff.png'),
(147, 'images/a5227972-a389-4ff4-b9ec-15ed5ae08d0e.png'),
(220, 'images/a56ab9b1-d45b-4573-afcf-c3e37992ef6f.png'),
(156, 'images/a6271d29-7275-4598-981b-12be7d57ff3e.png'),
(162, 'images/abdd36ad-42a3-4bea-85d9-55fe67b72935.png'),
(232, 'images/ac388828-bef8-4f87-89f2-3a098185f78e.jpeg'),
(212, 'images/ac3a8b5e-166d-4581-8ccd-aafd97286410.png'),
(291, 'images/acaa8faa-06d0-4eb7-a360-764168ae2136.png'),
(348, 'images/ad71d27e-29b5-4390-b1ac-21fecb4087b4.jpg'),
(169, 'images/adc086b7-779b-4738-9ba7-045a4310da49.png'),
(289, 'images/adfbdcb5-c35c-4f19-beb3-c41954d903b9.png'),
(333, 'images/aeb85a10-f847-42c9-b875-03fc3217aca5.jpg'),
(314, 'images/aed79d66-a50c-47fa-acf4-f9208825949f.mp4'),
(149, 'images/afad54a0-bacf-419f-97ba-cd263506d2e3.png'),
(247, 'images/b14eb96a-6269-48ba-89c5-e20ab7d960ab.png'),
(166, 'images/b156a4b7-9cd2-4163-892b-f9390e70cc60.png'),
(132, 'images/b17d7a98-7095-461e-be2d-d7d75e24d2d8.png'),
(260, 'images/b4e0f947-6999-4255-8e60-49b7cfbe6662.png'),
(223, 'images/b5b6a715-6c6d-40a9-acb4-6907ab41f897.png'),
(256, 'images/b5dd06b6-2c36-4433-a8af-b38292620dab.png'),
(317, 'images/b64076ab-a990-49de-ae10-5bc876df18b9.jpg'),
(193, 'images/b6af99ae-30f2-43d0-8751-b4cbc6e50cb7.png'),
(197, 'images/b85dd5cf-5d23-47c2-9428-95a465a976bc.png'),
(233, 'images/b91e2a44-8ca7-4071-b02f-3cf440c0f44e.jpeg'),
(339, 'images/b9235bea-4d11-4436-b10f-feab47725b50.mp4'),
(277, 'images/b94a68c2-2936-4678-b747-bb7600ba56e2.png'),
(341, 'images/bc5ef6dc-27ca-4ed0-b737-31328c5cbe24.jpg'),
(143, 'images/bc9dbd77-f6f2-4a52-8bd5-835ea24d25e8.png'),
(172, 'images/bffab1d2-a797-4ed4-bcd3-4655a4dded39.png'),
(264, 'images/c09d3d5c-50f6-4c87-b084-a6f8f14b32f6.png'),
(344, 'images/c11fa693-8ad5-446f-83bd-30124319a895.jpg'),
(185, 'images/c3079851-c69d-4816-9929-4a2c3a81561a.png'),
(301, 'images/c349d9d2-5b8f-4cba-b9e3-2da143cddc00.png'),
(133, 'images/c5bc838c-6ff3-4b85-8f3d-475d633dd615.png'),
(144, 'images/c822f382-332d-4fc7-ad82-76d6b64985ca.png'),
(257, 'images/cac283da-ae4d-4bb3-843a-1cb1ac797e22.png'),
(326, 'images/cadd2a7b-2b87-4570-b524-bd227d90806f.png'),
(356, 'images/cbe9cf21-1ec6-4c03-aa08-be8db56d9a50.jpg'),
(219, 'images/cee7216e-8642-4aa5-a657-fecc6f32d398.png'),
(241, 'images/d01c1638-4364-4917-894f-1dc90e17f4bc.jpeg'),
(136, 'images/d17d3dca-0102-4363-b9d4-398fc4f8ccf1.png'),
(254, 'images/d232caec-5b84-497b-818e-716c8c712eb9.png'),
(355, 'images/d4ba26dc-1f6d-4dc4-bb5d-55bc1aec61f8.jpg'),
(175, 'images/d7b25a15-dcaf-488b-95b9-94074c160427.png'),
(240, 'images/d88e2a36-199d-4210-bc21-edb2355839e2.png'),
(315, 'images/d8e64a50-a212-43b1-8f1d-e424d999df36.png'),
(179, 'images/daf9f058-116f-4214-994e-aa7c4da5d298.png'),
(183, 'images/dc7475b2-0e7a-4032-98a2-7747a59b56ac.png'),
(345, 'images/dd9929e6-e6c0-433a-ab7a-d3f0a56a5041.mp4'),
(236, 'images/de545d15-4c22-4988-b4c3-3e2ac0ce4822.jpeg'),
(138, 'images/e0996df4-c13a-4b29-b20e-f011136f556d.png'),
(229, 'images/e49f45bb-519c-4ef9-b4c5-d793466ab4ca.png'),
(246, 'images/e50bdca9-8345-421b-a5ff-26b691cd0185.jpeg'),
(249, 'images/e862a865-513b-42c1-b27d-5858b2497d75.png'),
(322, 'images/eaa8755a-176b-479c-8840-18bfa21e8540.png'),
(204, 'images/ec45a13f-d017-49a5-911f-a061f2ed2a21.jpeg'),
(171, 'images/ed0b7da6-da5e-4260-8e63-42deaa312eb2.png'),
(226, 'images/ed0fed34-6aa5-4c3d-80c9-d4d43ec84c3f.png'),
(208, 'images/ed21cd0a-d226-4a53-b19e-c4720ca72694.png'),
(224, 'images/edc2e848-7bac-4427-be3f-bf1f62a6b051.png'),
(230, 'images/f04db87a-9625-4570-bf3c-a5b225ce0f98.png'),
(189, 'images/f057ff66-8228-45e3-afec-47f7f395ea70.png'),
(312, 'images/f223a329-83ce-4093-a57a-a4ddb343d3c8.png'),
(195, 'images/f452dddc-2ace-4777-b95e-d3b6ef2c6e98.png'),
(196, 'images/f5997997-8302-44ed-8c5d-d8777ceb52fd.png'),
(252, 'images/f6b32138-c91f-444a-b235-56070a852160.png'),
(352, 'images/f726217c-42ff-46d7-8d57-0398ea9c422f.jpg'),
(203, 'images/f7c14e33-5fca-417f-9921-412f19fef369.jpeg'),
(200, 'images/fa9e602c-fb1d-4a8f-b6f8-6e61b151bed8.png'),
(161, 'images/faeb2d95-a5e6-4cdc-9050-32063c5f86f8.png'),
(238, 'images/fb2f6295-7113-402d-b3e8-b7d8b25e48c1.jpeg'),
(255, 'images/fc9a410e-0276-4d24-9851-a26e7c2a16be.png'),
(319, 'images/fe1eded4-1c92-459d-a10c-2a699a4d7180.jpg'),
(331, 'images/fea19a3c-f8ed-4b96-ba14-84390f283bc4.jpg'),
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
(237, 250, 84),
(239, 252, 86),
(240, 253, 86),
(241, 254, 86),
(242, 255, 86),
(243, 256, 86),
(244, 257, 86),
(245, 258, 86),
(246, 259, 87),
(247, 260, 87),
(248, 261, 87),
(249, 262, 87),
(250, 263, 87),
(251, 264, 87),
(252, 265, 87),
(253, 266, 88),
(254, 267, 88),
(255, 268, 88),
(256, 269, 88),
(257, 270, 88),
(258, 271, 88),
(259, 272, 88),
(260, 273, 89),
(261, 274, 89),
(262, 275, 89),
(263, 276, 89),
(264, 277, 89),
(265, 278, 89),
(266, 279, 89),
(274, 287, 91),
(275, 288, 91),
(276, 289, 91),
(277, 290, 91),
(278, 291, 91),
(279, 292, 91),
(285, 298, 93),
(286, 299, 93),
(287, 300, 93),
(288, 301, 93),
(289, 302, 93),
(290, 303, 93),
(299, 312, 100),
(300, 313, 100),
(301, 314, 101),
(302, 315, 101),
(303, 316, 102),
(304, 317, 102),
(305, 318, 102),
(306, 319, 102),
(307, 320, 102),
(308, 321, 102),
(309, 322, 90),
(310, 323, 90),
(311, 324, 90),
(312, 325, 90),
(313, 326, 90),
(314, 327, 90),
(315, 328, 103),
(316, 329, 103),
(317, 330, 103),
(318, 331, 103),
(319, 332, 103),
(320, 333, 103),
(321, 334, 104),
(322, 335, 104),
(323, 336, 104),
(324, 337, 104),
(325, 338, 104),
(326, 339, 104),
(327, 340, 105),
(328, 341, 105),
(329, 342, 105),
(330, 343, 105),
(331, 344, 105),
(332, 345, 105),
(333, 346, 106),
(334, 347, 106),
(335, 348, 106),
(336, 349, 106),
(337, 350, 106),
(338, 351, 107),
(339, 352, 107),
(340, 353, 107),
(341, 354, 107),
(342, 355, 107),
(343, 356, 107);

-- --------------------------------------------------------

--
-- Struttura della tabella `indirizzi`
--

CREATE TABLE `indirizzi` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `citta` varchar(45) NOT NULL,
  `stato` varchar(45) NOT NULL,
  `cap` varchar(5) NOT NULL,
  `indirizzo` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `numero_telefono` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `indirizzi`
--

INSERT INTO `indirizzi` (`id`, `nome`, `cognome`, `citta`, `stato`, `cap`, `indirizzo`, `email`, `numero_telefono`) VALUES
(1, 'Nicola', 'Lacerenza', 'Barletta', 'ITA', '76123', 'Via Ofanto 72', 'nicolace98@gmail.com', '3282018804'),
(2, 'Nicola', 'Lacerenza', 'Barletta', 'ITA', '76121', 'Via Ofanto ', 'nicolace98@gmail.com', '3282018804'),
(3, 'Nicola', 'Lacerenza', 'Barletta', 'ITA', '76121', 'Via Ofanto 72', 'nicolace98@gmail.com', '3282018804'),
(4, 'Nicola', 'Lacerenza', 'Barletta', 'ITA', '76121', 'Via Ofanto 72', 'nicolace98@gmail.com', '3282018804'),
(5, 'Nicola', 'Lacerenza', 'Barletta', 'ITA', '76121', 'Via Ofanto 72', 'nicolace98@gmail.com', '3282018804'),
(6, 'Nicola', 'Lacerenza', 'Barletta', 'ITA', '76121', 'Via Ofanto 72', 'nicolace98@gmail.com', '3282018804'),
(7, 'Nicola', 'Lacerenza', 'Barletta', 'ITA', '76123', 'Via Ofanto 72', 'nicolace98@gmail.com', '3282018804');

-- --------------------------------------------------------

--
-- Struttura della tabella `indirizzi_has_utenti`
--

CREATE TABLE `indirizzi_has_utenti` (
  `id` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_indirizzo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `indirizzi_has_utenti`
--

INSERT INTO `indirizzi_has_utenti` (`id`, `id_utente`, `id_indirizzo`) VALUES
(1, 14, 1),
(2, 14, 3),
(3, 14, 4),
(4, 14, 5),
(5, 14, 6),
(6, 14, 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `modello`
--

CREATE TABLE `modello` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descrizione` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `modello`
--

INSERT INTO `modello` (`id`, `id_categoria`, `id_brand`, `nome`, `descrizione`) VALUES
(104, 2, 1, 'Nike AIR FORCE 1 07', 'Confortevole, resistente e intramontabile: e la numero 1 per una ragione. La classica fattura anni Ottanta si unisce alla morbida pelle e ai dettagli d\'impatto per uno stile che lascia il segno in campo e nel tempo libero.'),
(121, 2, 1, 'NIKE AIR MAX 270', 'Nike Air Max 270, la prima Nike Air Max di Nike per il tempo libero, offre stile, comfort e carattere. Il design, ispirato alle icone Air Max, rende visibile l\'innovativa tecnologia Nike con un\'ampia finestra e una nuova gamma di colori.'),
(103, 2, 1, 'NIKE AIR MAX DN', 'DDDSD'),
(71, 2, 1, 'NIKE AIR MAX PLUS', 'Scopri la leggendaria tecnologia Tuned Air con queste scarpe confortevoli. Con l\'iconica gabbia a forma di fiamma e la coda di balena vicino all\'arco plantare, questa Air Max Plus sfoggia vivaci tocchi di colore per un look che non passa inosservato nel tempo libero. '),
(102, 2, 1, 'NIKE DUNK SB LOW PRO', 'Una scarpa da skateboard classica, perfetta sulla tavola e per qualsiasi occasione. Questa versione esclusiva di Dunk Low e realizzata in pelle e presenta un battistrada in gomma per un tocco di fascino in piu a ogni trick. Inoltre, la traspirante linguetta in tessuto e l ammortizzazione Zoom Air sotto il piede regalano leggerezza anche durante le session piu lunghe sullo skate. E poi ce lo Swoosh, per un tocco di contrasto in piu. E uno stile ancora piu d\'impatto.'),
(116, 2, 1, 'NOCTA AIR FORCE 1 LOW', 'Qual e\' il tuo libro per bambini preferito? Nate per rendere omaggio all\'amore dei genitori e alla storia che la madre di Drake leggeva a suo figlio, NOCTA Air Force 1 Low arricchisce l\'iconico stile da basket con dettagli tratti dalle classiche storie per bambini. Sull\'intersuola e\' presente la scritta \'Love you forever\' e comprende un set di perline (realizzate in NOCTA blu) con cui puoi scrivere la tua ninna nanna sui lacci.'),
(134, 2, 2, 'NEW BALANCE 9060', 'Le 9060 rappresentano una nuova espressione dello stile raffinato e del design innovativo della classica serie 99X. Il modello 9060 reinterpreta gli elementi familiari del 99X con una sensibilita\' visionaria, ispirata all\'estetica visibilmente tecnologica e orgogliosamente futuristica dell\'era Y2K. '),
(131, 2, 3, 'AIR JORDAN 1 RETRO HIGH', 'Scarpe'),
(137, 2, 3, 'Air Jordan 3 x A Ma Maniere', '\"For The Love\" di A Ma Maniere\" celebra la forza dell\'unita\', dell\'entusiasmo e di una passione condivisa contro tutte le aspettative. Rinnovando il modello AJ3 originale di Jordan e A Ma Maniere, questa edizione punta tutto su emozioni e legami potenti, in un design d\'impatto, che rivisita un classico intramontabile di MJ.\nUna pelle pregiata bianca caratterizza la tomaia, mentre strati esterni in suede antracite testurizzato donano carattere e dimensionalita\' al look. Dettagli in Diffused Blue sottolineano le linee di design. La linguetta, infine, celebra la collaborazione tra i brand, riportando su una scarpa l\'esclusivo logo Jumpman e sull\'altra il logo \"A\" di A Ma Maniere.'),
(122, 2, 3, 'AIR JORDAN 4 ABUNDANCE', 'I risultati non arrivano da soli, bisogna conquistarli. AJ4 \"Abundance\" e\' un omaggio alla grinta e al duro lavoro che la nuova generazione di talenti mette in ogni cosa che fa, dentro e fuori dal campo. Questa edizione richiama l\'iconica AJ4 \'\'Pure Money\'\' attraverso finiture color argento metallizzato, perfette per un look moderno, e una colorway in Seafoam e Sail, che offre un tocco di stile discreto.'),
(123, 2, 3, 'AIR JORDAN 4 NET', 'Questo aggiornamento in grande stile di AJ4 trasforma un classico in un vero e proprio spettacolo. Materiali pregiati come la morbida pelle, donano a questa scarpa un look e una calzata di lusso. I dettagli dorati, come la targhetta staccabile Jumpman, spiccano sulla tomaia Triple White e attirano tutti gli sguardi su di te. Indossala e sfoggia uno stile che non passa inosservato.'),
(130, 2, 3, 'AIR JORDAN 4 RETRO SB BLU NAVY', 'Scarpe'),
(106, 4, 1, 'AIR JORDAN 1 LOW G', 'Dai il massimo dalla prima all\'ultima buca. Ispirata a una delle sneakers piu\' iconiche di tutti i tempi, Air Jordan 1 G e subito un classico sul green. Dotata di ammortizzazione Air sotto il piede, con il logo Wings sul tallone e una struttura a trazione integrata per offrire il massimo della potenza a ogni swing, la scarpa ha il classico stile da circolo sportivo della AJ1 originale e tutto quel che serve per giocare nel massimo comfort fino alla diciottesima buca.'),
(117, 4, 1, 'Nike AIR FORCE 1 07', 'La leggenda continua a risplendere con Nike Air Force 1 \'07. Questo modello originale da basket rivisita tutto cio\' che ami di AF1 con pelle, dettagli d\'impatto e il giusto tocco di visibilita\'. I dettagli lucidi in pelle verniciata e le tonalita\' blu creano un look e una calzata eccezionali, mentre l\'ammortizzazione Air ti dara\' la sensazione di camminare sulle nuvole.'),
(89, 4, 1, 'NIKE DUNK LOW', 'Creata per il parquet, ma ideale per la citta, torna l icona del basket degli anni Ottanta con strati esterni perfettamente lucidati e colori classici della squadra. Con un iconico design da basket, Nike Dunk Low riporta in strada lo stile vintage degli anni Ottanta, mentre il collare ammortizzato a taglio basso ti fara sentire al meglio ovunque e con il massimo comfort.'),
(90, 4, 1, 'NIKE DUNK LOW NEXT NATURE', 'Puoi sempre contare su un classico. Dunk Low unisce l\'iconico design in blocchi di colore, materiali pregiati e un\'imbottitura morbida per un comfort rivoluzionario che dura nel tempo. Le possibilita di styling sono infinite: come indosserai le tue Dunk?'),
(118, 4, 3, 'AIR JORDAN 1 MID', 'Air Jordan 1 Mid combina stile pensato per il campo, comfort eccezionale e look iconico. L\'unita\' Air-Sole ammortizza il passo sul parquet, mentre il collare imbottito assicura il massimo supporto.'),
(107, 4, 3, 'AIR JORDAN 4 RM', 'Il modello remixato di cui non sapevi di aver bisogno. Pensata per una vita in movimento, questa sneaker reinterpreta AJ4 per offrirti comfort e resistenza. Max Air ammortizza ogni tuo passo. In piu\', abbiamo fuso alcune parti della tomaia in una gabbia robusta e flessibile, che avvolge la scarpa per donare ancora piu\' resistenza ogni giorno.'),
(132, 4, 4, 'ADIDAS CAMPUS GS', 'Uno stile old-school piu\' attuale che mai. Queste scarpe junior adidas Campus 00s si basano sulle Campus degli anni \'80 ma presentano un look contemporaneo ispirato alla moda di inizio millennio. La silhouette raffinata e il mix di materiali donano un tocco inedito al modello. Abbinale ai tuoi jeans preferiti e vivi al meglio la tua giornata.'),
(133, 4, 4, 'ADIDAS HANDBALL SPEZIAL', 'Le adidas Spezial sono state create nel 1979 per la pallamano, ma ben presto hanno fatto la loro comparsa anche fuori dal campo. Questa versione celebra il loro ricco passato con elementi originali come la tomaia in suede e la punta a T. Le vivaci combinazioni di colori aggiungono un tocco contemporaneo che non passa inosservato. Allaccia queste sneaker e mostra il tuo stile con un tocco old-school.'),
(108, 5, 3, 'AIR JORDAN 1 LOW', 'Non si puo\' negare che AJ1 sia un classico. Ora torna in auge con pelle, tocchi di colore e classica ammortizzazione Air per uno stile attuale e un comfort costante. Il logo Wings impresso e il Jumpman ricamato aggiungono un tocco di stile ispirato alla leggenda di Jordan che non potrai fare a meno di mettere in mostra.');

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
--

CREATE TABLE `ordine` (
  `id` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_ordine_paypal` varchar(255) NOT NULL,
  `id_pagamento` int(11) NOT NULL,
  `id_indirizzo` int(11) NOT NULL,
  `stato_ordine` varchar(45) NOT NULL,
  `data_creazione_ordine` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento_stato_ordine` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `importo` double NOT NULL,
  `valuta` varchar(255) NOT NULL,
  `locale_utente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamenti`
--

CREATE TABLE `pagamenti` (
  `id` int(11) NOT NULL,
  `id_utente` int(11) DEFAULT NULL,
  `nome_titolare` varchar(45) NOT NULL,
  `numero_carta` int(11) NOT NULL,
  `data_scadenza` date NOT NULL,
  `codice_verfica` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `pagamenti`
--

INSERT INTO `pagamenti` (`id`, `id_utente`, `nome_titolare`, `numero_carta`, `data_scadenza`, `codice_verfica`) VALUES
(1, NULL, 'Nicola Lacerenza', 0, '2025-03-18', '100');

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamenti_has_utenti`
--

CREATE TABLE `pagamenti_has_utenti` (
  `id` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_pagamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `paypal_pagamento_creato`
--

CREATE TABLE `paypal_pagamento_creato` (
  `id` int(11) NOT NULL,
  `id_ordine_paypal` varchar(255) NOT NULL,
  `payer_id` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `paypal_fee` decimal(10,2) NOT NULL,
  `gross_amount` decimal(10,2) NOT NULL,
  `net_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `paypal_token`
--

CREATE TABLE `paypal_token` (
  `id` int(11) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `scope` varchar(20000) NOT NULL,
  `token_type` varchar(255) NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `expires_in` int(11) NOT NULL,
  `nonce` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `paypal_token`
--

INSERT INTO `paypal_token` (`id`, `access_token`, `scope`, `token_type`, `app_id`, `expires_in`, `nonce`) VALUES
(1, 'A21AAIXnWC9kQ8nJfvv6xZmvCaAgwoOvLmE2XoD-9zMqfPU9u8d4ygTDLA8AkKvRq_PcSYeKcJh3hlRCA9F3GcqTZ8llsSoWw', 'https://uri.paypal.com/services/payments/futurepayments https://uri.paypal.com/services/invoicing https://uri.paypal.com/services/vault/payment-tokens/read https://uri.paypal.com/services/disputes/read-buyer https://uri.paypal.com/services/payments/realtimepayment https://uri.paypal.com/services/disputes/update-seller https://uri.paypal.com/services/payments/payment/authcapture openid https://uri.paypal.com/services/disputes/read-seller Braintree:Vault https://uri.paypal.com/services/payments/refund https://api.paypal.com/v1/vault/credit-card https://api.paypal.com/v1/payments/.* https://uri.paypal.com/services/wallet/mandates/write https://uri.paypal.com/services/wallet/mandates/read https://uri.paypal.com/payments/payouts https://uri.paypal.com/services/vault/payment-tokens/readwrite https://api.paypal.com/v1/vault/credit-card/.* https://uri.paypal.com/services/subscriptions https://uri.paypal.com/services/applications/webhooks', 'Bearer', 'APP-80W284485P519543T', 32311, '2025-03-29T16:05:08Z5_AjNAqTb8Olso-qTcQQcXOCdMh4k_4YQIKCTh7nfb4'),
(2, 'A21AAIXnWC9kQ8nJfvv6xZmvCaAgwoOvLmE2XoD-9zMqfPU9u8d4ygTDLA8AkKvRq_PcSYeKcJh3hlRCA9F3GcqTZ8llsSoWw', 'https://uri.paypal.com/services/payments/futurepayments https://uri.paypal.com/services/invoicing https://uri.paypal.com/services/vault/payment-tokens/read https://uri.paypal.com/services/disputes/read-buyer https://uri.paypal.com/services/payments/realtimepayment https://uri.paypal.com/services/disputes/update-seller https://uri.paypal.com/services/payments/payment/authcapture openid https://uri.paypal.com/services/disputes/read-seller Braintree:Vault https://uri.paypal.com/services/payments/refund https://api.paypal.com/v1/vault/credit-card https://api.paypal.com/v1/payments/.* https://uri.paypal.com/services/wallet/mandates/write https://uri.paypal.com/services/wallet/mandates/read https://uri.paypal.com/payments/payouts https://uri.paypal.com/services/vault/payment-tokens/readwrite https://api.paypal.com/v1/vault/credit-card/.* https://uri.paypal.com/services/subscriptions https://uri.paypal.com/services/applications/webhooks', 'Bearer', 'APP-80W284485P519543T', 31942, '2025-03-29T16:05:08Z5_AjNAqTb8Olso-qTcQQcXOCdMh4k_4YQIKCTh7nfb4'),
(3, 'A21AAIXnWC9kQ8nJfvv6xZmvCaAgwoOvLmE2XoD-9zMqfPU9u8d4ygTDLA8AkKvRq_PcSYeKcJh3hlRCA9F3GcqTZ8llsSoWw', 'https://uri.paypal.com/services/payments/futurepayments https://uri.paypal.com/services/invoicing https://uri.paypal.com/services/vault/payment-tokens/read https://uri.paypal.com/services/disputes/read-buyer https://uri.paypal.com/services/payments/realtimepayment https://uri.paypal.com/services/disputes/update-seller https://uri.paypal.com/services/payments/payment/authcapture openid https://uri.paypal.com/services/disputes/read-seller Braintree:Vault https://uri.paypal.com/services/payments/refund https://api.paypal.com/v1/vault/credit-card https://api.paypal.com/v1/payments/.* https://uri.paypal.com/services/wallet/mandates/write https://uri.paypal.com/services/wallet/mandates/read https://uri.paypal.com/payments/payouts https://uri.paypal.com/services/vault/payment-tokens/readwrite https://api.paypal.com/v1/vault/credit-card/.* https://uri.paypal.com/services/subscriptions https://uri.paypal.com/services/applications/webhooks', 'Bearer', 'APP-80W284485P519543T', 31924, '2025-03-29T16:05:08Z5_AjNAqTb8Olso-qTcQQcXOCdMh4k_4YQIKCTh7nfb4'),
(4, 'A21AAIXnWC9kQ8nJfvv6xZmvCaAgwoOvLmE2XoD-9zMqfPU9u8d4ygTDLA8AkKvRq_PcSYeKcJh3hlRCA9F3GcqTZ8llsSoWw', 'https://uri.paypal.com/services/payments/futurepayments https://uri.paypal.com/services/invoicing https://uri.paypal.com/services/vault/payment-tokens/read https://uri.paypal.com/services/disputes/read-buyer https://uri.paypal.com/services/payments/realtimepayment https://uri.paypal.com/services/disputes/update-seller https://uri.paypal.com/services/payments/payment/authcapture openid https://uri.paypal.com/services/disputes/read-seller Braintree:Vault https://uri.paypal.com/services/payments/refund https://api.paypal.com/v1/vault/credit-card https://api.paypal.com/v1/payments/.* https://uri.paypal.com/services/wallet/mandates/write https://uri.paypal.com/services/wallet/mandates/read https://uri.paypal.com/payments/payouts https://uri.paypal.com/services/vault/payment-tokens/readwrite https://api.paypal.com/v1/vault/credit-card/.* https://uri.paypal.com/services/subscriptions https://uri.paypal.com/services/applications/webhooks', 'Bearer', 'APP-80W284485P519543T', 31465, '2025-03-29T16:05:08Z5_AjNAqTb8Olso-qTcQQcXOCdMh4k_4YQIKCTh7nfb4'),
(5, 'A21AAJYChoShUDXTPkguxSmA3KAJd40GQe-J4HQ50DLJGHW9_QOthDNSvZbLGsSfOprI-qPPs8xcLIyNtN2TXWuToxgtu6xBw', 'https://uri.paypal.com/services/payments/futurepayments https://uri.paypal.com/services/invoicing https://uri.paypal.com/services/vault/payment-tokens/read https://uri.paypal.com/services/disputes/read-buyer https://uri.paypal.com/services/payments/realtimepayment https://uri.paypal.com/services/disputes/update-seller https://uri.paypal.com/services/payments/payment/authcapture openid https://uri.paypal.com/services/disputes/read-seller Braintree:Vault https://uri.paypal.com/services/payments/refund https://api.paypal.com/v1/vault/credit-card https://api.paypal.com/v1/payments/.* https://uri.paypal.com/services/wallet/mandates/write https://uri.paypal.com/services/wallet/mandates/read https://uri.paypal.com/payments/payouts https://uri.paypal.com/services/vault/payment-tokens/readwrite https://api.paypal.com/v1/vault/credit-card/.* https://uri.paypal.com/services/subscriptions https://uri.paypal.com/services/applications/webhooks', 'Bearer', 'APP-80W284485P519543T', 32399, '2025-03-30T17:05:37Zdjw9NSqu8lWFybczz0QyppGKFDmvWJ9kTIKyabywNyc');

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
(84, 108, 70, 1),
(86, 116, 150, 1),
(87, 116, 150, 1),
(88, 117, 120, 1),
(89, 118, 130, 1),
(90, 118, 120, 0),
(91, 121, 150, 1),
(93, 123, 250, 1),
(100, 130, 150, 1),
(101, 131, 350, 0),
(102, 122, 210, 1),
(103, 132, 90, 1),
(104, 133, 120, 1),
(105, 133, 120, 1),
(106, 134, 190, 1),
(107, 137, 230, 1);

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
(522, 3, 84, 1),
(528, 5, 65, 1),
(529, 7, 65, 1),
(530, 3, 72, 1),
(531, 5, 72, 1),
(532, 7, 72, 1),
(535, 3, 71, 1),
(536, 13, 71, 1),
(537, 13, 86, 2),
(538, 15, 86, 1),
(539, 19, 87, 2),
(543, 3, 89, 1),
(549, 5, 88, 1),
(550, 7, 88, 1),
(551, 9, 88, 1),
(552, 5, 91, 1),
(555, 3, 93, 1),
(556, 5, 93, 1),
(563, 5, 100, 1),
(566, 5, 102, 1),
(569, 3, 90, 1),
(570, 5, 90, 1),
(571, 11, 101, 1),
(572, 13, 101, 1),
(574, 3, 103, 1),
(575, 5, 104, 1),
(576, 3, 105, 1),
(577, 4, 105, 1),
(578, 5, 105, 1),
(579, 6, 105, 1),
(580, 7, 105, 1),
(581, 17, 106, 1),
(582, 18, 106, 1),
(583, 19, 106, 1),
(584, 20, 106, 1),
(585, 21, 106, 1),
(586, 22, 106, 1),
(587, 23, 106, 1),
(594, 13, 107, 1),
(595, 15, 107, 1);

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
  `id_taglia_preferita` int(11) DEFAULT NULL,
  `id_colore_preferito` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `ruolo` varchar(255) NOT NULL DEFAULT 'Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `nome`, `cognome`, `data_nascita`, `luogo_nascita`, `sesso`, `email`, `telefono`, `id_taglia_preferita`, `id_colore_preferito`, `password`, `ruolo`) VALUES
(14, 'Nicola', 'Lacerenza', '1998-04-07', 'Barletta', 'maschio', 'admin@gmail.com', '3282018804', NULL, NULL, '5a6663d75fb68c8a15ac040b2bd478ece92fdd39f9099df5e7db1f8695366d82ac70d50b73ac74019a6e8e769f65a820b1181d38fe60588b995beb246ab1702f', 'admin'),
(22, 'NIcola', 'Lacerenza', '1998-04-07', 'Barletta', 'maschio', 'nicolace98@gmail.com', '3282018804', NULL, NULL, '5a6663d75fb68c8a15ac040b2bd478ece92fdd39f9099df5e7db1f8695366d82ac70d50b73ac74019a6e8e769f65a820b1181d38fe60588b995beb246ab1702f', 'cliente');

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_codice` (`codice`);

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
-- Indici per le tabelle `dettagli_ordine`
--
ALTER TABLE `dettagli_ordine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_DETTAGLI ORDINE_PRODOTTI` (`id_prodotto`),
  ADD KEY `fk_DETTAGLI ORDINE_ORDINE` (`id_ordine`);

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
-- Indici per le tabelle `indirizzi`
--
ALTER TABLE `indirizzi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `indirizzi_has_utenti`
--
ALTER TABLE `indirizzi_has_utenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_INDIRIZZI_has_UTENTI_UTENTE` (`id_utente`),
  ADD KEY `fk_INDIRIZZI_has_UTENTI_INDIRIZZO` (`id_indirizzo`);

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
  ADD UNIQUE KEY `ChiaveEsternaIdOrdinePayPal` (`id_ordine_paypal`),
  ADD KEY `fk_ORDINE_UTENTE` (`id_utente`),
  ADD KEY `fk_ORDINE_PAGAMENTO` (`id_pagamento`),
  ADD KEY `fk_ORDINE_INDIRIZZO` (`id_indirizzo`);

--
-- Indici per le tabelle `pagamenti`
--
ALTER TABLE `pagamenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_PAGAMENTO_CUSTOMERS1` (`id_utente`);

--
-- Indici per le tabelle `pagamenti_has_utenti`
--
ALTER TABLE `pagamenti_has_utenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_PAGAMENTI_has_UTENTI_PAGAMENTO` (`id_pagamento`),
  ADD KEY `fk_PAGAMENTI_has_UTENTI_UTENTE` (`id_utente`);

--
-- Indici per le tabelle `paypal_pagamento_creato`
--
ALTER TABLE `paypal_pagamento_creato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ORDINE_has_PAGAMENTOPAYPAL_ORIDNEPAYPAL` (`id_ordine_paypal`);

--
-- Indici per le tabelle `paypal_token`
--
ALTER TABLE `paypal_token`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD KEY `id_taglia_preferita` (`id_taglia_preferita`),
  ADD KEY `id_colore_preferito` (`id_colore_preferito`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `codice_sconto_has_categoria`
--
ALTER TABLE `codice_sconto_has_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `colore`
--
ALTER TABLE `colore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `colore_has_prodotti`
--
ALTER TABLE `colore_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT per la tabella `dettagli_ordine`
--
ALTER TABLE `dettagli_ordine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT per la tabella `immagini_has_prodotti`
--
ALTER TABLE `immagini_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT per la tabella `indirizzi`
--
ALTER TABLE `indirizzi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `indirizzi_has_utenti`
--
ALTER TABLE `indirizzi_has_utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `modello`
--
ALTER TABLE `modello`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `pagamenti_has_utenti`
--
ALTER TABLE `pagamenti_has_utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `paypal_pagamento_creato`
--
ALTER TABLE `paypal_pagamento_creato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `paypal_token`
--
ALTER TABLE `paypal_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT per la tabella `taglia`
--
ALTER TABLE `taglia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `taglie_has_prodotti`
--
ALTER TABLE `taglie_has_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=596;

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
  ADD CONSTRAINT `fk_DETTAGLI ORDINE_ORDINE` FOREIGN KEY (`id_ordine`) REFERENCES `ordine` (`id`),
  ADD CONSTRAINT `fk_DETTAGLI ORDINE_PRODOTTI` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id`);

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
-- Limiti per la tabella `indirizzi_has_utenti`
--
ALTER TABLE `indirizzi_has_utenti`
  ADD CONSTRAINT `fk_INDIRIZZI_has_UTENTI_INDIRIZZO` FOREIGN KEY (`id_indirizzo`) REFERENCES `indirizzi` (`id`),
  ADD CONSTRAINT `fk_INDIRIZZI_has_UTENTI_UTENTE` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id`);

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
  ADD CONSTRAINT `fk_ORDINE_INDIRIZZO` FOREIGN KEY (`id_indirizzo`) REFERENCES `indirizzi` (`id`),
  ADD CONSTRAINT `fk_ORDINE_PAGAMENTO` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamenti` (`id`),
  ADD CONSTRAINT `fk_ORDINE_UTENTE` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id`);

--
-- Limiti per la tabella `pagamenti`
--
ALTER TABLE `pagamenti`
  ADD CONSTRAINT `fk_PAGAMENTO_CUSTOMERS1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id`);

--
-- Limiti per la tabella `pagamenti_has_utenti`
--
ALTER TABLE `pagamenti_has_utenti`
  ADD CONSTRAINT `fk_PAGAMENTI_has_UTENTI_PAGAMENTO` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamenti` (`id`),
  ADD CONSTRAINT `fk_PAGAMENTI_has_UTENTI_UTENTE` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id`);

--
-- Limiti per la tabella `paypal_pagamento_creato`
--
ALTER TABLE `paypal_pagamento_creato`
  ADD CONSTRAINT `fk_ORDINE_has_PAGAMENTOPAYPAL_ORIDNEPAYPAL` FOREIGN KEY (`id_ordine_paypal`) REFERENCES `ordine` (`id_ordine_paypal`);

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

--
-- Limiti per la tabella `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`id_taglia_preferita`) REFERENCES `taglia` (`id`),
  ADD CONSTRAINT `utenti_ibfk_2` FOREIGN KEY (`id_colore_preferito`) REFERENCES `colore` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
