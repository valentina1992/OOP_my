-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Creato il: Nov 06, 2016 alle 18:32
-- Versione del server: 5.5.42
-- Versione PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bibliotecaoop`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `capitolo`
--

CREATE TABLE `capitolo` (
  `id` int(11) NOT NULL,
  `titolo` varchar(256) NOT NULL,
  `paragrafo` text NOT NULL,
  `id_libro` int(11) NOT NULL,
  `accettato` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `capitolo`
--

INSERT INTO `capitolo` (`id`, `titolo`, `paragrafo`, `id_libro`, `accettato`) VALUES
(1, 'kbk', 'hlkjnkj', 1, NULL),
(2, 'ciao', 'ckxmos', 1, NULL),
(3, 'sasa', 'saas', 1, NULL),
(4, 'b', 'mhvj', 1, NULL),
(5, 'fdsfc', 'fekjlwqlef', 1, NULL),
(6, 'ldfsav', 'fdslafnldafnla', 1, NULL),
(7, 'dsjkbfdis', 'fkjdsnhbda', 1, NULL),
(8, 'daa', 'dsasa', 1, NULL),
(9, 'La ragazza del treno', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', 4, NULL),
(10, 'Kafka', 'kjbfòasckdbfks', 5, NULL),
(11, 'kafka', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere', 5, NULL),
(12, 'Il barone Rampante', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', 6, NULL),
(13, 'capitolo 2', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', 6, NULL),
(14, 'capitolo 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', 5, NULL),
(15, 'capitolo 2', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', 5, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `opera`
--

CREATE TABLE `opera` (
  `id` int(11) NOT NULL,
  `titolo` varchar(256) NOT NULL,
  `descrizione` text NOT NULL,
  `autore` varchar(256) NOT NULL,
  `data_aggiunta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email_utente` varchar(256) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `opera`
--

INSERT INTO `opera` (`id`, `titolo`, `descrizione`, `autore`, `data_aggiunta`, `email_utente`) VALUES
(1, 'photo', 'fsnfa', 'ajnd', '2016-11-04 15:15:40', 'master_94@virgilio.it'),
(2, 'eee', 'esva', 'eee', '2016-11-04 15:15:49', 'master_94@virgilio.it'),
(3, 'ciao', 'vkdjaskdja', 'vjsdk', '2016-11-04 15:24:22', NULL),
(4, 'La ragazza del treno', 'La ragazza del treno (The Girl on the Train) è un romanzo del 2015 scritto da Paula Hawkins, pubblicato in Italia da Piemme.', 'Paula Hawkins', '2016-11-05 15:44:59', NULL),
(5, 'Kafka sulla spiaggia', 'fkjabsdkha', 'asjndsajk', '2016-11-05 16:05:53', NULL),
(6, 'Il barone Rampante', '', 'Italo Calvino', '2016-11-06 12:45:14', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `pagina`
--

CREATE TABLE `pagina` (
  `tipo` varchar(100) DEFAULT NULL,
  `url_img` varchar(100) DEFAULT NULL,
  `size` double DEFAULT NULL,
  `id` int(11) NOT NULL,
  `id_opera` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `numero_pag` int(11) NOT NULL,
  `contenuto` text,
  `accettato` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `pagina`
--

INSERT INTO `pagina` (`tipo`, `url_img`, `size`, `id`, `id_opera`, `data`, `numero_pag`, `contenuto`, `accettato`) VALUES
('jpg', '1_616', NULL, 6, 1, '2016-11-03 15:51:37', 333, 'fdsa', NULL),
('png', '1_492', NULL, 7, 1, '2016-11-03 15:51:58', 44, 'dsafa', NULL),
('jpg', '1_273', NULL, 8, 1, '2016-11-04 20:56:52', 111, 'jhhjb', NULL),
('jpg', '1_663', NULL, 9, 4, '2016-11-05 15:51:41', 1, 'Rachel Watson è una donna di 32 anni di Londra con seri problemi di alcolismo. Fatica ancora ad accettare la fine del suo matrimonio, soprattutto perché l''ex marito Tom si è da poco risposato con Anna, la sua amante e causa della fine del matrimonio con Rachel, ed è diventato padre di una bambina. A causa del suo alcolismo è stata da poco licenziata, ciò nonostante continua a prendere il treno ogni mattina, fingendo di andare al lavoro per salvare le apparenze con la sua coinquilina. Durante i suoi quotidiani viaggi in treno, per sfuggire dalla solitudine, osserva la vita delle persone attraverso il finestrino. La sua attenzione si è focalizzata su una coppia, a cui ha dato i nomi di Jess e Jason, che idealizza come la "coppia perfetta". In realtà si chiamano Megan e Scott Hipwell e la loro esistenza non è così perfetta come sembra. Un giorno Rachel vede dal finestrino Megan con un altro uomo e pochi giorni dopo la donna scompare nel nulla. La notte della scomparsa di Megan coincide con la notte in cui Rachel ha alzato troppo il gomito ed è rimasta ferita, di cui non ha più memoria. Pensando di essere responsabile in qualche modo della scomparsa di Megan, Rachel inizia ad indagare per conto suo. Verrà a galla una verità sconcertante.', NULL),
('jpg', '4_102', NULL, 10, 4, '2016-11-05 15:54:12', 12, 'dsadsa', NULL),
('jpg', '5_511', NULL, 11, 5, '2016-11-05 16:06:21', 1455, 'ff', NULL),
('jpg', '6_211', NULL, 12, 6, '2016-11-06 12:47:13', 56, 'Ambientato in un paesino immaginario della riviera ligure, Ombrosa, rappresenta come tema centrale la visione dell''autore, poco incline a giudizi e opinioni ottusi e assoluti. Il comportamento stesso del protagonista si rifÃ  a un''idea di rifiuto delle regole preconcette e di accettazione delle diversitÃ .', NULL),
('jpg', '5_385', NULL, 13, 5, '2016-11-06 15:10:20', 43, '', NULL),
('jpg', '5_782', NULL, 14, 5, '2016-11-06 15:10:39', 45, '', NULL),
('jpg', '6_531', NULL, 15, 6, '2016-11-06 15:13:40', 2, '', NULL),
('jpg', '6_888', NULL, 16, 6, '2016-11-06 15:13:50', 32, '', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `tipo` int(10) NOT NULL DEFAULT '0',
  `indirizzo` varchar(100) DEFAULT NULL,
  `professione` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabella degli utenti';

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`email`, `pwd`, `nome`, `cognome`, `tipo`, `indirizzo`, `professione`) VALUES
('a@a.it', 'dddd', 'matte', 'ricci', 2, 'roma', 'studente'),
('er@hotmail.it', 'va', 'Valentina', 'Di Cristofaro', 1, 'via', 'fsakjfks'),
('vale.dicristofaro92@gmail.com', '', 'Valentina', 'Paolini', 1, 'Via Roma', ''),
('vale@gmail.com', 'vale', 'Valentina', 'Di Cristofaro', 1, 'Via Roma', 'Studente');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `capitolo`
--
ALTER TABLE `capitolo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indici per le tabelle `opera`
--
ALTER TABLE `opera`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `capitolo`
--
ALTER TABLE `capitolo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT per la tabella `opera`
--
ALTER TABLE `opera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT per la tabella `pagina`
--
ALTER TABLE `pagina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
