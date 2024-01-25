-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 25, 2024 at 09:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doga`
--
CREATE DATABASE IF NOT EXISTS `doga` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `doga`;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `pet_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`pet_id`, `doc_id`, `Time`) VALUES
(1, 1, '2024-01-25 10:00:00'),
(2, 2, '2024-01-26 15:30:00'),
(3, 3, '2024-01-27 12:45:00'),
(4, 4, '2024-01-28 11:15:00'),
(5, 5, '2024-01-29 14:00:00'),
(6, 6, '2024-01-30 09:30:00'),
(7, 7, '2024-01-31 16:45:00'),
(8, 8, '2024-02-01 13:30:00'),
(9, 9, '2024-02-02 10:45:00'),
(10, 10, '2024-02-03 14:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `id` int(11) NOT NULL,
  `Clinic_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`id`, `Clinic_name`) VALUES
(1, 'General Pet Clinic'),
(2, 'Specialty Animal Hospital'),
(3, 'City Veterinary Care'),
(4, 'Happy Paws Vet Clinic'),
(5, 'Sunset Veterinary Center'),
(6, 'Elite Pet Hospital'),
(7, 'Green Hills Animal Clinic'),
(8, 'Paws and Claws Vet Center'),
(9, 'Pet Wellness Clinic'),
(10, 'Blue Sky Veterinary Services');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `doc_name` varchar(255) NOT NULL,
  `clinic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `doc_name`, `clinic_id`) VALUES
(1, 'Dr. Smith', 1),
(2, 'Dr. Johnson', 2),
(3, 'Dr. Davis', 3),
(4, 'Dr. Wilson', 4),
(5, 'Dr. Taylor', 5),
(6, 'Dr. Turner', 6),
(7, 'Dr. Miller', 7),
(8, 'Dr. Brown', 8),
(9, 'Dr. Anderson', 9),
(10, 'Dr. Taylor', 10);

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `pet_name` varchar(255) NOT NULL,
  `us_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `pet_name`, `us_id`, `doc_id`) VALUES
(1, 'Buddy', 1, 1),
(2, 'Fluffy', 2, 2),
(3, 'Max', 3, 3),
(4, 'Luna', 4, 4),
(5, 'Oscar', 5, 5),
(6, 'Milo', 6, 6),
(7, 'Coco', 7, 7),
(8, 'Charlie', 8, 8),
(9, 'Sadie', 9, 9),
(10, 'Rocky', 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `money`, `age`) VALUES
(1, 'John Doe', 1000.50, 25),
(2, 'Jane Smith', 2000.75, 30),
(3, 'Alice Johnson', 1500.20, 28),
(4, 'Bob Anderson', 1200.00, 27),
(5, 'Emily Brown', 1800.25, 32),
(6, 'Charlie Davis', 1350.75, 29),
(7, 'Eva Miller', 900.50, 24),
(8, 'Daniel Wilson', 1600.80, 31),
(9, 'Grace Taylor', 1100.40, 26),
(10, 'Henry Turner', 1400.60, 28);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD KEY `pet_id` (`pet_id`),
  ADD KEY `doc_id` (`doc_id`);

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clinic_id` (`clinic_id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `us_id` (`us_id`),
  ADD KEY `doc_id` (`doc_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`id`);

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`us_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pets_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
