-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2025 at 07:37 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_desc` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `is_active` varchar(10) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `name`, `email`, `role`, `is_active`, `date_joined`, `createdAt`, `updatedAt`) VALUES
(1, 'USER-20251113T03242_3b6k', 'Adriene Amigables', 'admin@gmail.com', 'Employee', '1', '2025-11-12 16:00:00', '2025-11-12 19:24:26', '2025-11-14 02:55:54'),
(2, 'USER-20251114T10405_44xn', 'Dreys Amigable', 'dreys1@gmail.com', 'Employee', '1', '2025-11-13 16:00:00', '2025-11-14 02:40:57', '2025-11-14 02:56:57'),
(3, 'USER-20251119T08350_p7ws', 'Rodel Aspera', 'aspera@gmail.com', 'Employee', '1', '2025-11-18 16:00:00', '2025-11-19 00:35:06', '2025-11-19 00:35:06');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `barcode` varchar(100) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `type_id`, `supplier_id`, `barcode`, `uom_id`, `price`, `created_at`) VALUES
(1, 'Coca-Cola 1L', 1, 2, '480000111001', 4, 45, '2025-11-26 01:45:52'),
(2, 'Nature Spring Water 500ML', 1, 1, '480000222002', 3, 20, '2025-11-26 01:45:52'),
(3, 'Piattos Cheese 40g', 2, 1, '480000333003', 1, 18, '2025-11-26 01:45:52'),
(4, 'Chicken Nuggets 1kg Pack', 3, 3, '480000444004', 2, 220, '2025-11-26 01:45:52'),
(5, 'Century Tuna Hot & Spicy 180g', 4, 3, '480000555005', 1, 35, '2025-11-26 01:45:52'),
(6, 'Milo Powder 24g', 2, 1, '480000666006', 1, 12, '2025-11-26 01:45:52'),
(7, 'Royal Softdrinks 1.5L', 1, 2, '480000777007', 4, 55, '2025-11-26 01:45:52'),
(8, 'Bear Brand 150g', 2, 1, '480000888008', 5, 52, '2025-11-26 01:45:52'),
(9, 'Lucky Me Pancit Canton', 2, 3, '480000999009', 1, 14, '2025-11-26 01:45:52'),
(10, 'Argentina Corned Beef 150g', 4, 3, '480001111010', 1, 42, '2025-11-26 01:45:52'),
(11, 'sfs', 1, 1, '', 1, 124, '2025-11-27 06:22:14'),
(12, 'Sambag', 2, 1, '', 1, 10, '2025-11-27 06:26:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`type_id`, `type_name`, `description`) VALUES
(1, 'Beverages', 'Softdrinks, juices, bottled water'),
(2, 'Snacks', 'Chips, biscuits, chocolates'),
(3, 'Frozen', 'Frozen meats and ice cream'),
(4, 'Canned Goods', 'Sardines, corned beef, tuna');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `sub_total` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_item`
--

CREATE TABLE `sales_item` (
  `si_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `stock_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `action_type` int(11) NOT NULL,
  `reference_no` int(11) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`stock_id`, `product_id`, `qty`, `action_type`, `reference_no`, `created_at`) VALUES
(1, 1, 50, 0, 0, 2147483647),
(2, 2, 100, 0, 0, 2147483647),
(3, 3, 80, 0, 0, 2147483647),
(4, 4, 20, 0, 0, 2147483647),
(5, 5, 60, 0, 0, 2147483647),
(6, 1, 5, 0, 0, 2147483647),
(7, 3, 2, 0, 0, 2147483647),
(8, 5, 1, 0, 0, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `contact_person`, `phone`, `address`, `created_at`) VALUES
(1, 'Cebu Food Trading', 'Mark Santos', '09171234567', 'Mandaue City, Cebu', '2025-11-26 01:35:57'),
(2, 'Golden Drinks Supplier', 'Anna Reyes', '09987654321', 'Lapu-Lapu City', '2025-11-26 01:35:57'),
(3, 'FreshMart Distributor', 'Carlos Dela Cruz', '09223456789', 'Cebu City', '2025-11-26 01:35:57');

-- --------------------------------------------------------

--
-- Table structure for table `uom`
--

CREATE TABLE `uom` (
  `uom_id` int(11) NOT NULL,
  `uom_name` varchar(50) NOT NULL,
  `uom_type` varchar(50) NOT NULL,
  `base_value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uom`
--

INSERT INTO `uom` (`uom_id`, `uom_name`, `uom_type`, `base_value`) VALUES
(1, 'PCS', 'Count', 1),
(2, 'PACK', 'Count', 1),
(3, 'ML', 'Volume', 1),
(4, 'L', 'Volume', 1000),
(5, 'G', 'Weight', 1),
(6, 'KG', 'Weight', 1000),
(7, 'MM', 'Length', 1),
(8, 'CM', 'Length', 10),
(9, 'M', 'Length', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('Admin','Employee','Other','') NOT NULL DEFAULT 'Employee',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `user_type`, `created_at`) VALUES
(1, 'USER-20251113T03242_3b6k', 'admins', '$2b$08$BJSFHNNds7SvV4/v.vdZC.9IRCxwgOM.0P23Z1Upb0MWqWxHsq28S', 'Admin', '2025-11-26 05:17:39'),
(2, 'USER-20251114T10405_44xn', 'test', '$2b$08$kOLqXZqVIT3fKBvYGTg0s.5jgh5/bTw7bwzhaxqRxYe/lZ.PLq9F6', 'Employee', '2025-11-14 02:40:57'),
(3, 'USER-20251119T08350_p7ws', 'aspera', '$2b$08$zHeX5eYiwMNLXOHA.TckKORhzThjydtLg9obWtokotmPiXJs.T7fu', 'Employee', '2025-11-19 00:35:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `sales_item`
--
ALTER TABLE `sales_item`
  ADD PRIMARY KEY (`si_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`uom_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_item`
--
ALTER TABLE `sales_item`
  MODIFY `si_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uom`
--
ALTER TABLE `uom`
  MODIFY `uom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
