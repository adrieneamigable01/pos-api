-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2025 at 03:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `role` varchar(50) DEFAULT 'Employee',
  `is_active` tinyint(1) DEFAULT 1,
  `date_joined` datetime DEFAULT current_timestamp(),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `name`, `email`, `role`, `is_active`, `date_joined`, `createdAt`, `updatedAt`) VALUES
(1, 'USER-20251113T03242_3b6k', 'Adriene Amigables', 'admin@gmail.com', 'Employee', 1, '2025-11-13 00:00:00', '2025-11-13 03:24:26', '2025-11-14 10:55:54'),
(2, 'USER-20251114T10405_44xn', 'Dreys Amigable', 'dreys1@gmail.com', 'Employee', 1, '2025-11-14 00:00:00', '2025-11-14 10:40:57', '2025-11-14 10:56:57'),
(3, 'USER-20251115T01584_4qk9', 'kahoy', 'kahoy@gmail.com', 'Employee', 1, '2025-11-15 00:00:00', '2025-11-15 01:58:49', '2025-11-15 01:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0,
  `publisher` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resttutorials`
--

CREATE TABLE `resttutorials` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('Admin','Employee','Other') DEFAULT 'Employee',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `user_id`, `username`, `password`, `user_type`, `created_at`) VALUES
(1, 'USER-20251113T03242_3b6k', 'admins', '$2b$08$BJSFHNNds7SvV4/v.vdZC.9IRCxwgOM.0P23Z1Upb0MWqWxHsq28S', 'Admin', '2025-11-13 03:24:26'),
(2, 'USER-20251114T10405_44xn', 'test', '$2b$08$kOLqXZqVIT3fKBvYGTg0s.5jgh5/bTw7bwzhaxqRxYe/lZ.PLq9F6', 'Employee', '2025-11-14 10:40:57'),
(4, 'USER-20251115T01584_4qk9', 'kahoy kahoy', '$2b$08$5afvyGnLnaorlFmKzphUv.IeZNV97gvM.ifoX.TcapX/tsJQTvT.a', 'Employee', '2025-11-15 01:58:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resttutorials`
--
ALTER TABLE `resttutorials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resttutorials`
--
ALTER TABLE `resttutorials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
