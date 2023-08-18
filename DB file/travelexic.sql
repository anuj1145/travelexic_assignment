-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2023 at 01:06 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelexic`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `arr_date` varchar(255) NOT NULL,
  `dep_date` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `destination` varchar(100) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `customer_name`, `contact`, `arr_date`, `dep_date`, `created_at`, `updated_at`, `destination`, `duration`, `price`, `description`) VALUES
(4, 'Anuj', '7455002394', '2023-08-20', '2023-08-22', '2023-08-18 17:00:32', '2023-08-18 17:00:32', 'Kashmir', '3D 2N', '34000', 'Its great package');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_22_095458_create_products_table', 1),
(6, '2023_04_22_095523_create_temp_images_table', 1),
(7, '2023_04_22_095538_create_product_images_table', 1),
(8, '2023_04_22_095458_create_packages_table', 2),
(9, '2023_04_22_095538_create_package_images_table', 2),
(10, '2023_08_18_110706_create_bookings_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `destination` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `description` text NOT NULL,
  `duration` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `destination`, `price`, `description`, `duration`, `created_at`, `updated_at`) VALUES
(13, 'Kashmir', 34000.00, 'Its great package', '3D 2N', '2023-08-18 16:55:32', '2023-08-18 16:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `package_images`
--

CREATE TABLE `package_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_images`
--

INSERT INTO `package_images` (`id`, `name`, `package_id`, `caption`, `created_at`, `updated_at`) VALUES
(23, '23.jpg', 13, 'river', '2023-08-18 16:55:32', '2023-08-18 16:55:32'),
(24, '24.jpg', 13, 'river view', '2023-08-18 16:55:32', '2023-08-18 16:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_images`
--

CREATE TABLE `temp_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_images`
--

INSERT INTO `temp_images` (`id`, `name`, `created_at`, `updated_at`) VALUES
(41, '41.jpg', '2023-08-16 04:15:13', '2023-08-16 04:15:13'),
(42, '42.jpg', '2023-08-16 04:15:13', '2023-08-16 04:15:13'),
(43, '43.jpg', '2023-08-16 05:36:37', '2023-08-16 05:36:37'),
(44, '44.jpg', '2023-08-16 05:36:37', '2023-08-16 05:36:37'),
(45, '45.jpg', '2023-08-16 05:44:50', '2023-08-16 05:44:50'),
(46, '46.jpg', '2023-08-16 05:44:50', '2023-08-16 05:44:50'),
(47, '47.jpg', '2023-08-16 05:52:10', '2023-08-16 05:52:10'),
(48, '48.jpg', '2023-08-16 05:52:10', '2023-08-16 05:52:10'),
(49, '49.jpg', '2023-08-16 05:55:04', '2023-08-16 05:55:04'),
(50, '50.jpg', '2023-08-16 05:55:04', '2023-08-16 05:55:04'),
(51, '51.jpg', '2023-08-16 05:56:24', '2023-08-16 05:56:24'),
(52, '52.jpg', '2023-08-16 05:56:24', '2023-08-16 05:56:24'),
(53, '53.jpg', '2023-08-16 05:56:39', '2023-08-16 05:56:39'),
(54, '54.jpg', '2023-08-16 05:56:39', '2023-08-16 05:56:39'),
(55, '55.jpg', '2023-08-16 06:00:53', '2023-08-16 06:00:53'),
(56, '56.jpg', '2023-08-16 06:03:14', '2023-08-16 06:03:14'),
(57, '57.jpg', '2023-08-16 06:03:14', '2023-08-16 06:03:14'),
(58, '58.jpg', '2023-08-16 06:04:57', '2023-08-16 06:04:57'),
(59, '59.jpg', '2023-08-16 06:04:57', '2023-08-16 06:04:57'),
(60, '60.jpg', '2023-08-16 06:06:40', '2023-08-16 06:06:40'),
(61, '61.jpg', '2023-08-16 06:06:40', '2023-08-16 06:06:40'),
(62, '62.jpg', '2023-08-16 06:08:25', '2023-08-16 06:08:25'),
(63, '63.jpg', '2023-08-16 06:08:25', '2023-08-16 06:08:25'),
(64, '64.jpg', '2023-08-16 06:09:29', '2023-08-16 06:09:29'),
(65, '65.jpg', '2023-08-16 06:09:29', '2023-08-16 06:09:29'),
(66, '66.jpg', '2023-08-16 06:12:21', '2023-08-16 06:12:21'),
(67, '67.jpg', '2023-08-16 06:12:21', '2023-08-16 06:12:21'),
(68, '68.jpg', '2023-08-16 06:19:28', '2023-08-16 06:19:28'),
(69, '69.jpg', '2023-08-16 06:19:28', '2023-08-16 06:19:28'),
(70, '70.jpg', '2023-08-16 06:48:02', '2023-08-16 06:48:02'),
(71, '71.jpg', '2023-08-16 09:51:52', '2023-08-16 09:51:52'),
(72, '72.jpg', '2023-08-16 09:51:52', '2023-08-16 09:51:52'),
(73, '73.jpg', '2023-08-16 12:43:24', '2023-08-16 12:43:24'),
(74, '74.jpg', '2023-08-16 12:43:24', '2023-08-16 12:43:24'),
(75, '75.jpg', '2023-08-17 02:58:49', '2023-08-17 02:58:49'),
(76, '76.jpg', '2023-08-17 08:38:25', '2023-08-17 08:38:25'),
(77, '77.jpg', '2023-08-17 08:38:25', '2023-08-17 08:38:25'),
(78, '78.jpg', '2023-08-17 10:49:31', '2023-08-17 10:49:31'),
(79, '79.jpg', '2023-08-18 16:09:53', '2023-08-18 16:09:53'),
(80, '80.jpg', '2023-08-18 16:09:53', '2023-08-18 16:09:53'),
(81, '81.jpg', '2023-08-18 16:21:36', '2023-08-18 16:21:36'),
(82, '82.jpg', '2023-08-18 16:21:36', '2023-08-18 16:21:36'),
(83, '83.jpg', '2023-08-18 16:25:28', '2023-08-18 16:25:28'),
(84, '84.jpg', '2023-08-18 16:25:28', '2023-08-18 16:25:28'),
(85, '85.jpg', '2023-08-18 16:43:10', '2023-08-18 16:43:10'),
(86, '86.jpg', '2023-08-18 16:55:20', '2023-08-18 16:55:20'),
(87, '87.jpg', '2023-08-18 16:55:20', '2023-08-18 16:55:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Test Agent', 'ak_agent@gmail.com', NULL, '$2y$10$iUSem2laJBopXXtmpZTfX.o/zXLPiDh6BgQoWB.j/kSM/Svq9Io6C', 'agent', NULL, '2023-08-18 16:52:36', '2023-08-18 16:52:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_images`
--
ALTER TABLE `package_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_images_package_id_foreign` (`package_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `temp_images`
--
ALTER TABLE `temp_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `package_images`
--
ALTER TABLE `package_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_images`
--
ALTER TABLE `temp_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `package_images`
--
ALTER TABLE `package_images`
  ADD CONSTRAINT `package_images_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
