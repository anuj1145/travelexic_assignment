-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 09:20 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_multiple_upload`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(7, '2023_04_22_095538_create_product_images_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Dummy Product', 10.00, '2023-04-22 06:53:18', '2023-04-22 06:53:18'),
(2, 'Dummy Product 2', 100.00, '2023-04-22 07:29:51', '2023-04-22 07:29:51'),
(3, 'Dummy Product 22', 99.00, '2023-04-22 07:30:40', '2023-04-22 07:55:12'),
(4, 'Clothes', 555.00, '2023-04-22 12:44:12', '2023-04-22 12:44:12'),
(5, 'Mohit', 10.00, '2023-04-22 12:46:52', '2023-04-22 12:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `name`, `product_id`, `caption`, `created_at`, `updated_at`) VALUES
(21, '21.jpg', 1, NULL, '2023-04-22 11:58:55', '2023-04-22 11:58:55'),
(24, '24.jpg', 4, 'A', '2023-04-22 12:44:12', '2023-04-22 12:44:12'),
(25, '25.jpg', 4, 'B', '2023-04-22 12:44:13', '2023-04-22 12:44:14'),
(26, '26.jpg', 4, 'C', '2023-04-22 12:44:15', '2023-04-22 12:44:16'),
(27, '27.jpg', 4, 'D', '2023-04-22 12:44:17', '2023-04-22 12:44:17'),
(28, '28.jpg', 5, NULL, '2023-04-22 12:46:52', '2023-04-22 12:46:52'),
(29, '29.jpg', 5, NULL, '2023-04-22 12:46:53', '2023-04-22 12:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `temp_images`
--

CREATE TABLE `temp_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_images`
--

INSERT INTO `temp_images` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '1.jpg', '2023-04-22 06:00:29', '2023-04-22 06:00:29'),
(2, '2.jpg', '2023-04-22 06:09:37', '2023-04-22 06:09:37'),
(3, '3.jpg', '2023-04-22 06:10:39', '2023-04-22 06:10:39'),
(4, '4.jpg', '2023-04-22 06:11:04', '2023-04-22 06:11:04'),
(5, '5.jpg', '2023-04-22 06:18:29', '2023-04-22 06:18:29'),
(6, '6.jpg', '2023-04-22 06:18:43', '2023-04-22 06:18:43'),
(7, '7.jpg', '2023-04-22 06:19:38', '2023-04-22 06:19:38'),
(8, '8.jpg', '2023-04-22 06:25:07', '2023-04-22 06:25:07'),
(9, '9.jpg', '2023-04-22 06:25:08', '2023-04-22 06:25:08'),
(10, '10.jpg', '2023-04-22 06:25:09', '2023-04-22 06:25:09'),
(11, '11.jpg', '2023-04-22 06:30:59', '2023-04-22 06:30:59'),
(12, '12.jpg', '2023-04-22 06:30:59', '2023-04-22 06:31:00'),
(13, '13.jpg', '2023-04-22 06:31:00', '2023-04-22 06:31:00'),
(14, '14.jpg', '2023-04-22 06:33:14', '2023-04-22 06:33:14'),
(15, '15.jpg', '2023-04-22 06:33:15', '2023-04-22 06:33:16'),
(16, '16.jpg', '2023-04-22 06:37:42', '2023-04-22 06:37:42'),
(17, '17.jpg', '2023-04-22 06:37:42', '2023-04-22 06:37:43'),
(18, '18.jpg', '2023-04-22 06:38:15', '2023-04-22 06:38:16'),
(19, '19.jpg', '2023-04-22 06:38:16', '2023-04-22 06:38:16'),
(20, '20.jpg', '2023-04-22 06:53:50', '2023-04-22 06:53:51'),
(21, '21.jpg', '2023-04-22 06:53:52', '2023-04-22 06:53:52'),
(22, '22.jpg', '2023-04-22 06:53:52', '2023-04-22 06:53:52'),
(23, '23.jpg', '2023-04-22 07:29:39', '2023-04-22 07:29:39'),
(24, '24.jpg', '2023-04-22 07:29:40', '2023-04-22 07:29:40'),
(25, '25.jpg', '2023-04-22 07:29:41', '2023-04-22 07:29:41'),
(26, '26.jpg', '2023-04-22 07:30:32', '2023-04-22 07:30:32'),
(27, '27.jpg', '2023-04-22 07:30:33', '2023-04-22 07:30:34'),
(28, '28.jpg', '2023-04-22 07:30:34', '2023-04-22 07:30:36'),
(29, '29.jpg', '2023-04-22 12:40:50', '2023-04-22 12:40:50'),
(30, '30.jpg', '2023-04-22 12:40:51', '2023-04-22 12:40:51'),
(31, '31.jpg', '2023-04-22 12:42:46', '2023-04-22 12:42:46'),
(32, '32.jpg', '2023-04-22 12:42:47', '2023-04-22 12:42:47'),
(33, '33.jpg', '2023-04-22 12:43:36', '2023-04-22 12:43:36'),
(34, '34.jpg', '2023-04-22 12:43:37', '2023-04-22 12:43:37'),
(35, '35.jpg', '2023-04-22 12:43:37', '2023-04-22 12:43:38'),
(36, '36.jpg', '2023-04-22 12:43:38', '2023-04-22 12:43:38'),
(37, '37.jpg', '2023-04-22 12:46:46', '2023-04-22 12:46:47'),
(38, '38.jpg', '2023-04-22 12:46:47', '2023-04-22 12:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `temp_images`
--
ALTER TABLE `temp_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
