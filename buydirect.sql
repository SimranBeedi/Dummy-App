-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2024 at 09:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buydirect`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `shopkeeper_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `shopkeeper_id`) VALUES
(1, 'Tata Sampann', 1),
(2, 'MTR', 1),
(3, 'Ashirvad', 2),
(5, 'Fortune', 3),
(6, 'Tata Tea', 1),
(7, 'Brooke Bond', 2),
(8, 'Red Label', 3),
(9, 'Lipton', 4),
(11, 'Tilda', 1),
(12, 'Daawat', 2),
(14, 'Kohinoor', 4),
(15, 'Patna', 5),
(16, 'Kissan', 1),
(17, 'Maggi', 2),
(18, 'Heinz', 3),
(22, 'Pillsbury', 2),
(23, 'Saffola', 3),
(25, 'Jams & More', 5),
(26, 'Olive Essence', 1),
(27, 'Sunshine Sunflower Oil', 1),
(28, 'Coconut Gold', 1),
(30, 'Refined Sunflower', 1),
(32, 'Turmeric Treasure', 2),
(34, 'Masala Magic', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `customer_id`, `product_id`, `quantity`, `order_id`) VALUES
(55, 107, 30, 1, NULL),
(56, 107, 28, 2, NULL),
(57, 107, 27, 1, NULL),
(58, 107, 1, 1, NULL),
(59, 108, 7, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `address` varchar(255) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_category`
--

CREATE TABLE `core_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_category`
--

INSERT INTO `core_category` (`id`, `name`, `description`, `image`) VALUES
(1, 'Rice Atta Daal', 'Consits of Rice Daal Chaval etc', 'riceaatadal.jpg'),
(2, 'Sause&Spreads', 'Consits of snacks,sause,jam,etc', 'sauseandspreads.jpg'),
(3, 'Cleaning & Essentials', 'Detergents,liquids,soap', 'cleaningessentials.jpg'),
(4, 'Dry fruits', 'Dry fruits like almond,kaju etc', 'Dry-Fruit.jpg'),
(5, 'Oil & Masala\'s', 'Oils,salts,chilly powder etc', 'oil.JPG'),
(6, 'Tea Coffee & Health drinks', 'Tea Powder,Coffee,Boast etc', 'tea.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `groceries`
--

CREATE TABLE `groceries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `cost_price` decimal(10,2) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `core_category_id` int(11) DEFAULT NULL,
  `subcategory` varchar(100) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `shopkeeper_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groceries`
--

INSERT INTO `groceries` (`id`, `name`, `description`, `cost_price`, `selling_price`, `quantity`, `unit`, `core_category_id`, `subcategory`, `brand_id`, `mfg_date`, `expiry_date`, `image`, `shopkeeper_id`, `created_at`) VALUES
(1, 'Tata Sampann Toor Dal', 'Premium quality Toor Dal', 100.00, 120.00, 50, 'kg', 1, '1', 1, '2024-01-01', '2025-01-01', 'Tata_Sampann_Toor_Dal.jpg', 1, '2024-09-03 17:24:16'),
(2, 'Tata Tea Gold', 'Rich and flavorful tea powder', 150.00, 180.00, 30, 'kg', 6, '2', 6, '2024-01-01', '2025-01-01', 'Tata_Tea_Gold.jpg', 1, '2024-09-03 17:24:16'),
(3, 'Daawat Basmati Rice', 'Premium Basmati Rice', 200.00, 220.00, 40, 'kg', 1, '3', 11, '2024-01-01', '2025-01-01', 'Daawat_Basmati_Rice.jpg', 1, '2024-09-03 17:24:16'),
(4, 'Kissan Tomato Ketchup', 'Tasty tomato ketchup', 50.00, 60.00, 20, 'bottle', 2, '4', 16, '2024-01-01', '2025-01-01', 'Kissan_Tomato_Ketchup.jpg', 1, '2024-09-03 17:24:16'),
(6, 'MTR Chana Dal', 'High quality Chana Dal', 110.00, 130.00, 60, 'kg', 1, '1', 2, '2024-01-01', '2025-01-01', 'MTR_Channa_Dal.jpg', 2, '2024-09-03 17:24:16'),
(7, 'Brooke Bond Red Label', 'Rich and flavorful tea', 160.00, 190.00, 35, 'kg', 6, '2', 7, '2024-01-01', '2025-01-01', 'Brooke_Bond_Red_Label.jpg', 2, '2024-09-03 17:24:16'),
(8, 'Daawat Sharbati Rice', 'Delicious Sharbati Rice', 210.00, 230.00, 10, 'kg', 1, '3', 12, '2024-01-01', '2025-01-01', 'Daawat_Sharbati_Rice.jpg', 2, '2024-09-03 17:24:16'),
(9, 'Maggi Soy Sauce', 'Flavorful soy sauce', 55.00, 65.00, 15, 'bottle', 2, '4', 17, '2024-01-01', '2025-01-01', 'Maggi_Soy_Sauce.jpg', 2, '2024-09-03 17:24:16'),
(10, 'Pillsbury Jam', 'Delicious strawberry jam', 80.00, 100.00, 30, 'jar', 2, '5', 22, '2024-01-01', '2025-01-01', 'Pillsbury_Jam.jpg', 2, '2024-09-03 17:24:16'),
(13, 'Kohinoor Basmati Rice', 'Premium quality Basmati Rice', 220.00, 240.00, 50, 'kg', 1, '3', 14, '2024-01-01', '2025-01-01', 'Kohinoor_Basmati_Rice.jpg', 3, '2024-09-03 17:24:16'),
(15, 'Saffola Cream Cheese', 'Smooth cream cheese', 140.00, 170.00, 20, 'jar', 2, '5', 23, '2024-01-01', '2025-01-01', 'Saffola_Cream_Cheese.jpg', 3, '2024-09-03 17:24:16'),
(17, 'Lipton Tea Powder', 'Refreshing tea powder', 165.00, 195.00, 20, 'kg', 6, '2', 9, '2024-01-01', '2025-01-01', 'Lipton_Tea_Powder.jpg', 4, '2024-09-03 17:24:16'),
(23, 'Patna Rice', 'Quality Patna Rice', 190.00, 210.00, 45, 'kg', 1, '3', 15, '2024-01-01', '2025-01-01', 'Patna_Rice.jpg', 5, '2024-09-03 17:24:16'),
(25, 'Jams & More Jam', 'Delicious mango jam', 90.00, 110.00, 30, 'jar', 2, '5', 25, '2024-01-01', '2025-01-01', 'Jams__More_Jam.jpg', 5, '2024-09-03 17:24:16'),
(27, 'Fortune Sunlite Sunflower Oil', 'Refined sunflower oil', 150.00, 180.00, 20, 'liter', 5, '6', 27, '2024-01-01', '2025-01-01', 'Fortune_Sunlite_Sunflower_Oil.jpg', 2, '2024-09-03 17:51:26'),
(28, 'Dhara Mustard Oil', 'Pure mustard oil', 250.00, 270.00, 10, 'liter', 5, '6', 28, '2024-01-01', '2025-01-01', 'dhara_oil_mustard.jpg', 3, '2024-09-03 17:51:26'),
(30, 'Nature Fresh Refined Oil', 'Refined vegetable oil', 180.00, 210.00, 1, 'liter', 5, '6', 30, '2024-01-01', '2025-01-01', 'nature_first_refined_oil.jpg', 5, '2024-09-03 17:51:26');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Paid','Shipped','Delivered','Cancelled') NOT NULL DEFAULT 'Pending',
  `stripe_charge_id` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shopkeeper_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tracking_status` varchar(50) DEFAULT 'Pending',
  `shop_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `amount`, `description`, `status`, `stripe_charge_id`, `customer_id`, `shopkeeper_id`, `created_at`, `updated_at`, `tracking_status`, `shop_name`) VALUES
(54, 405.00, 'Your Order Description', 'Paid', 'ch_3PwOwtBQaGAcoXBg0wbg9123', 8, 0, '2024-09-07 13:45:17', '2024-09-07 13:45:17', 'Pending', NULL),
(55, 330.00, 'Your Order Description', 'Paid', 'ch_3PwPC2BQaGAcoXBg08VoNPLt', 8, 0, '2024-09-07 14:00:56', '2024-09-07 14:00:56', 'Pending', NULL),
(56, 640.00, 'Your Order Description', 'Paid', 'ch_3PwgDcBQaGAcoXBg1mkNWUDM', 8, 0, '2024-09-08 08:11:44', '2024-09-08 08:11:44', 'Pending', NULL),
(57, 880.00, 'Your Order Description', 'Paid', 'ch_3Pxl6QBQaGAcoXBg1XQaICzN', 108, 0, '2024-09-11 07:36:39', '2024-09-11 07:36:39', 'Pending', NULL),
(58, 420.00, 'Your Order Description', 'Paid', 'ch_3PxlA7BQaGAcoXBg21KzpgBE', 108, 0, '2024-09-11 07:40:30', '2024-09-11 07:40:30', 'Pending', NULL),
(59, 379000.00, NULL, 'Pending', 'ch_3Pye5NBQaGAcoXBg1WrXRFx7', 8, 0, '2024-09-13 18:19:20', '2024-09-13 18:19:20', 'Pending', NULL),
(60, 3790.00, 'Your Order Description', 'Paid', 'ch_3Pye5qBQaGAcoXBg2jEOf9wG', 8, 0, '2024-09-13 18:19:48', '2024-09-13 18:19:48', 'Pending', NULL),
(61, 730.00, 'Your Order Description', 'Paid', 'ch_3PzFzhBQaGAcoXBg1Jjxrgkg', 8, 0, '2024-09-15 10:48:03', '2024-09-15 10:48:03', 'Pending', NULL),
(62, 270.00, 'Your Order Description', 'Paid', 'ch_3Q0LBsBQaGAcoXBg0FuOqdfM', 8, 0, '2024-09-18 10:33:12', '2024-09-18 10:33:12', 'Pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `shopkeeper_id` int(11) NOT NULL,
  `delivery_status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `shopkeeper_id`, `delivery_status`) VALUES
(32, 54, 9, 1, 2, 'Delivered'),
(33, 54, 25, 1, 5, 'Delivered'),
(34, 54, 7, 1, 2, 'Delivered'),
(35, 55, 8, 1, 2, 'Delivered'),
(36, 55, 4, 1, 1, 'Delivered'),
(37, 56, 1, 1, 1, 'Delivered'),
(38, 56, 30, 1, 5, 'Pending'),
(39, 56, 28, 1, 3, 'Pending'),
(40, 57, 7, 2, 2, 'Delivered'),
(41, 57, 4, 1, 1, 'Delivered'),
(42, 57, 15, 1, 3, 'Pending'),
(43, 57, 8, 1, 2, 'Delivered'),
(47, 58, 7, 2, 2, 'Pending'),
(48, 60, 27, 1, 2, 'Pending'),
(49, 60, 3, 3, 1, 'Pending'),
(50, 60, 1, 1, 1, 'Pending'),
(51, 60, 2, 4, 1, 'Pending'),
(52, 60, 7, 5, 2, 'Pending'),
(53, 60, 6, 5, 2, 'Pending'),
(54, 60, 10, 2, 2, 'Pending'),
(55, 60, 28, 1, 3, 'Pending'),
(56, 61, 28, 1, 3, 'Pending'),
(57, 61, 7, 1, 2, 'Pending'),
(58, 61, 8, 1, 2, 'Pending'),
(59, 62, 8, 1, 2, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `otp_records`
--

CREATE TABLE `otp_records` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp_records`
--

INSERT INTO `otp_records` (`id`, `email`, `otp`, `created_at`, `expiry`) VALUES
(66, 'test@example.com', 123456, '2024-09-06 10:57:25', '2024-09-06 16:32:25'),
(67, 'test@example.com', 565929, '2024-09-06 10:57:46', NULL),
(78, 'simranbeedi@gmail.com', 566164, '2024-09-06 15:05:48', '2024-09-06 20:40:43'),
(79, 'simranbeedi@gmail.com', 621719, '2024-09-06 15:06:46', '2024-09-06 20:41:41'),
(80, 'simranbeedi@gmail.com', 709905, '2024-09-06 15:13:55', '2024-09-06 20:48:49'),
(81, 'simranbeedi@gmail.com', 189358, '2024-09-06 15:41:28', '2024-09-06 21:16:24'),
(82, 'yunusb22@gmail.com', 755058, '2024-09-08 07:53:26', '2024-09-08 13:28:23'),
(83, 'simranbeedi@gmail.com', 192139, '2024-09-08 07:58:52', '2024-09-08 13:33:49'),
(84, 'simranbeedi@gmail.com', 230245, '2024-09-09 17:40:05', '2024-09-09 23:15:02'),
(85, 'simranbeedi@gmail.com', 214313, '2024-09-09 17:45:54', '2024-09-09 23:20:50'),
(86, 'simranbeedi@gmail.com', 994615, '2024-09-09 17:53:49', '2024-09-09 23:28:46'),
(87, 'simranbeedi@gmail.com', 816396, '2024-09-09 18:08:14', '2024-09-09 23:43:11'),
(88, 'simranbeedi@gmail.com', 103553, '2024-09-09 18:10:45', '2024-09-09 23:45:41'),
(89, 'simranbeedi@gmail.com', 698066, '2024-09-10 03:48:01', '2024-09-10 09:22:58'),
(90, 'simranbeedi@gmail.com', 640046, '2024-09-10 03:48:02', '2024-09-10 09:22:58'),
(91, 'simranbeedi@gmail.com', 170816, '2024-09-10 05:21:36', '2024-09-10 10:56:33'),
(92, 'simranbeedi@gmail.com', 428161, '2024-09-10 05:21:36', '2024-09-10 10:56:33'),
(93, 'simranbeedi@gmail.com', 832043, '2024-09-10 05:22:01', '2024-09-10 10:56:58'),
(94, 'simranbeedi@gmail.com', 954860, '2024-09-10 05:22:01', '2024-09-10 10:56:58'),
(95, 'simranbeedi@gmail.com', 994529, '2024-09-10 05:22:42', '2024-09-10 10:57:39'),
(96, 'simranbeedi@gmail.com', 841757, '2024-09-10 05:44:01', '2024-09-10 11:18:58'),
(97, 'simranbeedi@gmail.com', 950252, '2024-09-10 05:57:30', '2024-09-10 11:32:27'),
(98, 'simranbeedi@gmail.com', 444381, '2024-09-10 06:10:47', '2024-09-10 11:45:44'),
(99, 'simranbeedi@gmail.com', 860227, '2024-09-10 07:36:50', '2024-09-10 13:11:47'),
(100, 'simranbeedi@gmail.com', 349265, '2024-09-10 07:36:51', '2024-09-10 13:11:47'),
(101, 'simranbeedi@gmail.com', 138593, '2024-09-10 07:36:51', '2024-09-10 13:11:48'),
(102, 'simranbeedi@gmail.com', 537841, '2024-09-10 07:36:51', '2024-09-10 13:11:48'),
(103, 'simranbeedi@gmail.com', 820788, '2024-09-10 07:37:47', '2024-09-10 13:12:44'),
(104, 'simranbeedi@gmail.com', 271350, '2024-09-10 07:37:47', '2024-09-10 13:12:44'),
(105, 'simranbeedi@gmail.com', 595329, '2024-09-10 07:38:40', '2024-09-10 13:13:37'),
(106, 'simranbeedi@gmail.com', 391096, '2024-09-10 07:38:40', '2024-09-10 13:13:37'),
(107, 'simranbeedi@gmail.com', 843982, '2024-09-10 07:38:41', '2024-09-10 13:13:38'),
(108, 'simranbeedi@gmail.com', 565417, '2024-09-10 07:38:41', '2024-09-10 13:13:38'),
(109, 'simranbeedi@gmail.com', 950956, '2024-09-10 07:38:41', '2024-09-10 13:13:38'),
(110, 'simranbeedi@gmail.com', 404310, '2024-09-10 07:38:42', '2024-09-10 13:13:38'),
(111, 'simranbeedi@gmail.com', 461428, '2024-09-10 07:38:59', '2024-09-10 13:13:56'),
(112, 'simranbeedi@gmail.com', 568326, '2024-09-10 07:38:59', '2024-09-10 13:13:56'),
(113, 'simranbeedi@gmail.com', 228247, '2024-09-10 07:39:19', '2024-09-10 13:14:16'),
(114, 'simranbeedi@gmail.com', 953618, '2024-09-10 07:39:20', '2024-09-10 13:14:16'),
(115, 'simranbeedi@gmail.com', 959763, '2024-09-10 07:39:56', '2024-09-10 13:14:53'),
(116, 'simranbeedi@gmail.com', 889411, '2024-09-10 07:39:57', '2024-09-10 13:14:53'),
(117, 'simranbeedi@gmail.com', 263609, '2024-09-10 07:39:58', '2024-09-10 13:14:55'),
(118, 'simranbeedi@gmail.com', 766792, '2024-09-10 07:39:58', '2024-09-10 13:14:55'),
(119, 'simranbeedi@gmail.com', 683653, '2024-09-10 07:39:59', '2024-09-10 13:14:56'),
(120, 'simranbeedi@gmail.com', 554683, '2024-09-10 07:39:59', '2024-09-10 13:14:56'),
(121, 'simranbeedi@gmail.com', 943228, '2024-09-10 07:40:08', '2024-09-10 13:15:05'),
(122, 'simranbeedi@gmail.com', 752929, '2024-09-10 07:40:08', '2024-09-10 13:15:05'),
(123, 'Simran@123', 715136, '2024-09-10 07:48:06', '2024-09-10 13:23:03'),
(124, 'Simran@123', 788027, '2024-09-10 07:48:07', '2024-09-10 13:23:03'),
(125, 'Simran@123', 912194, '2024-09-10 07:48:49', '2024-09-10 13:23:46'),
(126, 'Simran@123', 144504, '2024-09-10 07:48:49', '2024-09-10 13:23:46'),
(127, 'simranbeedi@gmail.comx', 217624, '2024-09-10 07:50:12', '2024-09-10 13:25:09'),
(128, 'simranbeedi@gmail.com', 514610, '2024-09-10 07:50:35', '2024-09-10 13:25:32'),
(129, 'simranbeedi@gmail.com', 207976, '2024-09-10 07:53:20', '2024-09-10 13:28:17'),
(130, 'simranbeedi@gmail.com', 420966, '2024-09-10 07:59:51', '2024-09-10 13:34:47'),
(131, 'simranbeedi@gmail.com', 335226, '2024-09-10 08:01:14', '2024-09-10 13:36:10'),
(132, 'simranbeedi@gmail.com', 554259, '2024-09-10 08:03:32', '2024-09-10 13:38:29'),
(133, 'simranbeedi@gmail.com', 899379, '2024-09-10 08:22:12', '2024-09-10 13:57:09'),
(134, 'simranbeedi@gmail.com', 144330, '2024-09-10 08:22:13', '2024-09-10 13:57:09'),
(135, 'simranbeedi@gmail.com', 974702, '2024-09-10 08:36:48', '2024-09-10 14:11:45'),
(136, 'simranbeedi@gmail.com', 637702, '2024-09-10 08:36:48', '2024-09-10 14:11:45'),
(137, 'simranbeedi@gmail.com', 102043, '2024-09-10 08:38:41', '2024-09-10 14:13:37'),
(138, 'simranbeedi@gmail.com', 296645, '2024-09-10 08:38:41', '2024-09-10 14:13:37'),
(139, 'simranbeedi@gmail.com', 566062, '2024-09-10 08:42:43', '2024-09-10 14:17:40'),
(140, 'simranbeedi@gmail.com', 368306, '2024-09-10 08:42:43', '2024-09-10 14:17:40'),
(141, 'simranbeedi@gmail.com', 657544, '2024-09-10 08:47:05', '2024-09-10 14:22:02'),
(142, 'simranbeedi@gmail.com', 132074, '2024-09-10 08:47:05', '2024-09-10 14:22:02'),
(143, 'simranbeedi@gmail.com', 193618, '2024-09-10 08:51:09', '2024-09-10 14:26:06'),
(144, 'simranbeedi@gmail.com', 539864, '2024-09-10 08:51:10', '2024-09-10 14:26:06'),
(145, 'simranbeedi@gmail.com', 971389, '2024-09-10 08:56:27', '2024-09-10 14:31:24'),
(146, 'simranbeedi@gmail.com', 903178, '2024-09-10 08:56:28', '2024-09-10 14:31:24'),
(147, 'simranbeedi@gmail.com', 261506, '2024-09-10 08:58:42', '2024-09-10 14:33:39'),
(148, 'simranbeedi@gmail.com', 958251, '2024-09-10 08:59:42', '2024-09-10 14:34:39'),
(149, 'simranbeedi@gmail.com', 498316, '2024-09-10 09:23:37', '2024-09-10 14:58:32'),
(150, 'simranbeedi@gmail.com', 998592, '2024-09-10 09:25:02', '2024-09-10 14:59:58'),
(151, 'simranbeedi@gmail.com', 503224, '2024-09-10 09:31:49', '2024-09-10 15:06:46'),
(152, 'simranbeedi@gmail.com', 799693, '2024-09-10 09:35:08', '2024-09-10 15:10:05'),
(153, 'simranbeedi@gmail.com', 624239, '2024-09-10 09:41:01', '2024-09-10 15:15:58'),
(154, 'simranbeedi@gmail.com', 143845, '2024-09-10 10:04:00', '2024-09-10 15:38:56'),
(155, 'simranbeedi@gmail.com', 281999, '2024-09-10 10:12:18', '2024-09-10 15:47:15'),
(156, 'simranbeedi@gmail.com', 579219, '2024-09-10 10:36:29', '2024-09-10 16:11:26'),
(157, 'simranbeedi@gmail.com', 347444, '2024-09-10 10:41:33', '2024-09-10 16:16:30'),
(158, 'simranbeedi@gmail.com', 673119, '2024-09-10 10:54:52', '2024-09-10 16:29:48'),
(159, 'simranbeedi@gmail.com', 685112, '2024-09-10 10:57:48', '2024-09-10 16:32:44'),
(160, 'simranbeedi@gmail.com', 728507, '2024-09-10 16:17:11', '2024-09-10 21:52:08'),
(161, 'gurudattgoudar090@gmail.com', 421439, '2024-09-11 07:30:55', '2024-09-11 13:05:43'),
(162, 'gurudattgoudar090@gmail.com', 186745, '2024-09-11 07:31:11', '2024-09-11 13:05:53'),
(163, 'gurudattgoudar090@gmail.com', 983930, '2024-09-11 07:31:24', '2024-09-11 13:05:53'),
(164, 'poojaramanagoudra19@gmail.com', 342303, '2024-09-11 07:32:38', '2024-09-11 13:07:29'),
(165, 'simranbeedi@gmail.com', 494865, '2024-09-15 10:36:19', '2024-09-15 16:11:15'),
(166, 'dwdsanjana@gmail.com', 413712, '2024-09-18 10:30:37', '2024-09-18 16:05:32'),
(167, 'simranbeedi@gmail.com', 611555, '2024-09-19 06:31:26', '2024-09-19 12:06:23'),
(168, 'simranbeedi@gmail.com', 943030, '2024-09-19 06:34:38', '2024-09-19 12:09:34'),
(169, 'simranbeedi@gmail.com', 315942, '2024-09-19 06:41:37', '2024-09-19 12:16:34'),
(170, 'simranbeedi@gmail.com', 220688, '2024-09-19 06:51:27', '2024-09-19 12:26:24'),
(171, 'simranbeedi@gmail.com', 373248, '2024-09-19 06:51:32', '2024-09-19 12:26:29'),
(172, 'simranbeedi@gmail.com', 752690, '2024-09-19 06:51:58', '2024-09-19 12:26:55'),
(173, 'simranbeedi@gmail.com', 254232, '2024-09-19 06:52:45', '2024-09-19 12:27:41'),
(174, 'simranbeedi@gmail.com', 774342, '2024-09-19 06:53:20', '2024-09-19 12:28:17'),
(175, 'simranbeedi@gmail.com', 847434, '2024-09-19 06:53:48', '2024-09-19 12:28:45'),
(176, 'simranbeedi@gmail.com', 824160, '2024-09-19 06:55:05', '2024-09-19 12:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `shopkeepers`
--

CREATE TABLE `shopkeepers` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `locality` varchar(255) NOT NULL,
  `image_filename` varchar(255) DEFAULT NULL,
  `document_filename` varchar(255) DEFAULT NULL,
  `is_approved` tinyint(4) DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopkeepers`
--

INSERT INTO `shopkeepers` (`id`, `username`, `password`, `email`, `shop_name`, `address`, `district`, `locality`, `image_filename`, `document_filename`, `is_approved`, `registration_date`) VALUES
(1, 'Varun', '$2b$12$uduCyo8uBlyItaf/8jS2be8ZmegjNPmTCdvbe30KHg6AX14Lkybke', 'durga@gmail.com', 'Durga Grocery Mart', '123 Kamlapur Road', 'Dharwad', 'Kamlapur', 'alok.jpg', 'doc1.pdf', 1, '2024-09-03 16:37:19'),
(2, 'vikas', '$2b$12$zNLIRaj1eZooqFgPgL8u0.it/R8IwWJ2vKpL56SGdOwaXq1445N/q', 'vikas@gmail.com', 'Vikas Grocery Mart', '456 Malapur Lane', 'Dharwad', 'Malapur', 'vikas.jpg', 'doc1.pdf', 1, '2024-09-03 16:40:17'),
(3, 'amit', '$2b$12$Ft.ppJUMdoKHvzf02vPaT.txYr4hYwl3BtseuJr/obzwwe0UQkzJ.', 'amit@gmail.com', 'Amit Grocery Mart', '789 Gandhi Chowk', 'Dharwad', 'Gandhi Chowk', 'amit.jpg', 'doc1.pdf', 1, '2024-09-03 16:41:48'),
(4, 'karan', '$2b$12$SLjidKrB3.7TpORLGsB5P.RdSG8zLB9Eos276czwOJshnXDa2i.YC', 'karan@gmail.com', 'Karan Grocery Mart', '101 Kalyan Nagar Street', 'Dharwad', 'Kalyan Nagar', 'karan.jpg', 'doc1.pdf', 1, '2024-09-03 16:43:21'),
(5, 'sanjay', '$2b$12$PzT.xS6WaHzmT94IqadpRe0ZOePbK18MAnmGZG5vFKiWtdqBQjIUG', 'sanjay@gmail.com', 'Sanjay Grocery Mart', '202 Maratha Colony', 'Dharwad', 'Maratha Colony', 'sanjay.jpg', 'doc1.pdf', 1, '2024-09-03 16:45:57');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `core_category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `name`, `description`, `core_category_id`, `image`) VALUES
(1, 'Daal', 'Toor Dal,Chana Daal etc', 1, 'Daals.jpg'),
(2, 'Tea Powder', 'Tea Powder', 6, 'tea-powder.jpg'),
(3, 'Rice', 'Rice: Basmati Rice, Long Grain Rice, Jasmine Rice', 1, 'rice.jpg'),
(4, 'Sause', 'Sauces: Tomato Ketchup, Soy Sauce, Barbecue Sauce', 2, 'sause.jpg'),
(5, 'Spreads', 'Spreads: Peanut Butter, Jam (Strawberry, Mango), Cream Cheese', 2, 'spreads.jpg'),
(6, 'Oils', 'Oils: Olive Oil, Sunflower Oil, Coconut Oil', 5, 'oils.jpg'),
(7, 'Masala', 'Masalas: Garam Masala, Turmeric Powder, Red Chili Powder', 5, 'masalas.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `is_verified`) VALUES
(8, 'SimranBeedi', 'simranbeedi@gmail.com', '$2b$12$Mpu.MeC5dq4Avh/8E/Q1sOcnFe9nyXj8924Izhg.Pff8au3Wi6HEG', 1),
(9, 'Yunus', 'yunusb22@gmail.com', '$2b$12$eK1Iroa/ZkjEAyZxxIRTuOJoQ61hRO0cbwgoOnHLgyqSiXe6cf2l.', 1),
(107, 'Seema', 'simranbeedi@gmail.com', '$2b$12$r77UUHtKav3Fa8KTdaCmcOCNUIrBbMYfoCRoO9.a5Qx8L6FJ2B25O', 1),
(108, 'Gurudatt', 'poojaramanagoudra19@gmail.com', '$2b$12$uEM38UzPbMfzIZ.X7ULNOOON2rxloyU5bmQDe0jchUIbE8slJJnkO', 1),
(109, 'simb', 'dwdsanjana@gmail.com', '$2b$12$ZJgQXin.yYGLdN4jA7MN3up.5FLadFbsizgYEcltoD73vnbVGJUQm', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `product_id`, `customer_id`) VALUES
(6, 2, 8),
(15, 3, 8),
(11, 7, 8),
(10, 8, 108);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shopkeeper_id` (`shopkeeper_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `core_category`
--
ALTER TABLE `core_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groceries`
--
ALTER TABLE `groceries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_category_id` (`core_category_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `shopkeeper_id` (`shopkeeper_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stripe_charge_id` (`stripe_charge_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `shopkeeper_id` (`shopkeeper_id`);

--
-- Indexes for table `otp_records`
--
ALTER TABLE `otp_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopkeepers`
--
ALTER TABLE `shopkeepers`
  ADD PRIMARY KEY (`id`,`username`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_core_category_id` (`core_category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`customer_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_category`
--
ALTER TABLE `core_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `groceries`
--
ALTER TABLE `groceries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `otp_records`
--
ALTER TABLE `otp_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `shopkeepers`
--
ALTER TABLE `shopkeepers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`shopkeeper_id`) REFERENCES `shopkeepers` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `groceries`
--
ALTER TABLE `groceries`
  ADD CONSTRAINT `groceries_ibfk_1` FOREIGN KEY (`core_category_id`) REFERENCES `core_category` (`id`),
  ADD CONSTRAINT `groceries_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `groceries_ibfk_3` FOREIGN KEY (`shopkeeper_id`) REFERENCES `shopkeepers` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `groceries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`shopkeeper_id`) REFERENCES `shopkeepers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `fk_core_category_id` FOREIGN KEY (`core_category_id`) REFERENCES `core_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `groceries` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
