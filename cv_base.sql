-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Lis 2022, 18:23
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cv_base`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `education`
--

CREATE TABLE `education` (
  `education_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `institution_name` varchar(300) COLLATE utf8mb4_polish_ci NOT NULL,
  `begin_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `education`
--

INSERT INTO `education` (`education_id`, `user_id`, `level_id`, `institution_name`, `begin_date`, `end_date`) VALUES
(1, 1, 2, 'LO w warszawie', '2016-11-01', '2019-11-01'),
(2, 1, 3, 'UW - informatyka', '2020-11-02', '2022-11-01'),
(3, 3, 4, 'MGR prawa', '2012-11-01', '2016-11-30'),
(4, 2, 3, 'Licencjat - administracja', '2017-09-01', '2024-09-01');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `job_experience`
--

CREATE TABLE `job_experience` (
  `experience_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `institution_name` varchar(300) COLLATE utf8mb4_polish_ci NOT NULL,
  `begin_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `job_experience`
--

INSERT INTO `job_experience` (`experience_id`, `user_id`, `institution_name`, `begin_date`, `end_date`) VALUES
(1, 1, 'Amazon', '2013-01-09', '2016-11-17'),
(2, 1, 'Webcoders', '2022-11-01', '2022-11-30'),
(3, 2, 'MediaMarkt', '2022-10-01', '2022-10-02'),
(4, 3, 'Google ', '2022-05-03', '2019-03-21');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `level`
--

CREATE TABLE `level` (
  `level_id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `level`
--

INSERT INTO `level` (`level_id`, `name`) VALUES
(1, 'Szkoła podstawowa'),
(2, 'Szkoła średnia'),
(3, 'Studia licencjackie'),
(4, 'Studia magisterskie'),
(5, 'Studia podyplomowe');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_polish_ci NOT NULL,
  `phone_number` int(11) NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `phone_number`, `photo`) VALUES
(1, 'Filip', 'Kąkol', 'filipkakol@wp.pl', 345678934, 'photo1.jpg'),
(2, 'Jan', 'Kowal', 'jankowal@wp.pl', 333444555, 'photo2.jpg'),
(3, 'Piotr', 'Nowak', 'pnowak@wp.pl', 111333555, 'photo3.jpg');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`education_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indeksy dla tabeli `job_experience`
--
ALTER TABLE `job_experience`
  ADD PRIMARY KEY (`experience_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `education`
--
ALTER TABLE `education`
  MODIFY `education_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `job_experience`
--
ALTER TABLE `job_experience`
  MODIFY `experience_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `level` (`level_id`),
  ADD CONSTRAINT `education_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ograniczenia dla tabeli `job_experience`
--
ALTER TABLE `job_experience`
  ADD CONSTRAINT `job_experience_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
