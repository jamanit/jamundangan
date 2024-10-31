-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2024 at 01:57 PM
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
-- Database: `jamundangan`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('admin|127.0.0.1', 'i:1;', 1730365975),
('admin|127.0.0.1:timer', 'i:1730365975;', 1730365975),
('adminadmin@gmail.com|127.0.0.1', 'i:1;', 1730365985),
('adminadmin@gmail.com|127.0.0.1:timer', 'i:1730365985;', 1730365985);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

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
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8gWIcwteCXiAzZKI66SBWNH0BP9DE9PKpW8uEIVc', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoidVB0enpTTGJTdmhhczhUMUlOblFkOHVYS2ZVaDlIQndJMVpieEdyTiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM1OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvY29udGFjdF9mb3JtcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzMwMzc5MzkyO319', 1730379455),
('lV8NkPUOm36W8ojlz3UgGlzvIOxQZ6cVYJXvjbJW', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoia1R3V3VnMFQ1VHFac1JMWnJoVkZwcW1wam9KOThkbVNYMHBEM0s5VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbnZpdGF0aW9ucyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzMwMzY1OTMzO319', 1730378610),
('YghkILdhLZkrGl9tu3GoGRM8LwOJvVAt5zdZcMBX', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRDk0ZllKYVZkRDg1VlVCcVJESDQ3Mk9URk9lQVFwWkNxVmd2elJSdyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3MzAzNzg2Mzc7fX0=', 1730378649);

-- --------------------------------------------------------

--
-- Table structure for table `tb_audios`
--

CREATE TABLE `tb_audios` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `audio_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_business_profiles`
--

CREATE TABLE `tb_business_profiles` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `business_founding_date` date NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `google_maps` text NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_founding_date` date NOT NULL,
  `brand_email` varchar(255) NOT NULL,
  `brand_website` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_business_profiles`
--

INSERT INTO `tb_business_profiles` (`id`, `created_at`, `updated_at`, `uuid`, `logo`, `business_name`, `address`, `business_founding_date`, `owner_name`, `about`, `google_maps`, `brand_name`, `brand_founding_date`, `brand_email`, `brand_website`) VALUES
(1, '2024-10-18 16:19:50', '2024-10-31 11:25:27', 'uuid1234', 'image/38donqhZ4Uex7XPNz2lnWG1XIOdrAaTVYV7ZWlXL.png', 'Jaman IT', 'Simp. Rimbo Kota Jambi', '2024-10-23', 'Riki Davidtra', '<p><strong>JamUndangan</strong> adalah platform undangan digital yang didirikan oleh Jaman IT pada 23 Oktober 2024. Kami hadir untuk membawa inovasi dalam cara orang merayakan momen spesial mereka. Dengan latar belakang di bidang teknologi dan desain, kami memahami pentingnya memberikan pengalaman yang mulus dan menyenangkan bagi pengguna. Visi kami adalah untuk menciptakan solusi undangan yang praktis, estetis, dan ramah lingkungan. Kami percaya bahwa setiap momen berharga, baik itu pernikahan, ulang tahun, atau acara khusus lainnya, pantas dirayakan dengan cara yang unik dan berarti. Dengan berbagai fitur canggih yang kami tawarkan, termasuk desain kustom, interaktivitas, dan kemudahan pengiriman, kami berkomitmen untuk memberikan pengalaman yang tidak hanya modern tetapi juga sesuai dengan kebutuhan zaman. Kami di Jamundangan percaya bahwa teknologi dapat membantu menyatukan orang-orang, dan kami bersemangat untuk menjadi bagian dari perjalanan spesial Anda.</p>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7976.439948837537!2d103.5518596658181!3d-1.621851021281201!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sid!2sid!4v1730092779448!5m2!1sid!2sid\" width=\"100%\" height=\"100%\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'JamUndangan', '2024-10-23', 'undangan.jamanit@gmail.com', 'http://localhost:8000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_closings`
--

CREATE TABLE `tb_closings` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `closing_text` text DEFAULT NULL,
  `closing_greeting` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_contacts`
--

CREATE TABLE `tb_contacts` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `username_number` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_contacts`
--

INSERT INTO `tb_contacts` (`id`, `created_at`, `updated_at`, `uuid`, `platform`, `username_number`, `icon`, `url`) VALUES
(1, '2024-10-19 09:26:03', '2024-10-25 06:50:08', '21af80bb-2e09-473c-ad00-7c57e4bae89d', 'Telephone', '+62 895-0847-5453', 'fas fa-phone', 'tel:+6289508475453'),
(2, '2024-10-19 07:14:30', '2024-10-25 06:48:56', '40be40d2-8cfb-4bc4-8f12-43f86cfef3e8', 'Whatsapp', '+62 895-0847-5453', 'fab fa-whatsapp', 'https://wa.me/6289508475453'),
(3, '2024-10-25 06:39:09', '2024-10-25 06:48:38', 'ba83117d-7d58-47f9-8152-5b4e10447612', 'Instagram', 'riki_davidtra', 'fab fa-instagram', 'https://www.instagram.com/riki_davidtra/'),
(4, '2024-10-19 09:27:39', '2024-10-25 06:50:16', 'df2d9b90-87dd-4ddc-96b6-51a85b81622d', 'Email', 'rikidavidtra.2310@gmail.com', 'fa fa-envelope', 'mailto:rikidavidtra.2310@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tb_contact_forms`
--

CREATE TABLE `tb_contact_forms` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_covers`
--

CREATE TABLE `tb_covers` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `cover_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_discounts`
--

CREATE TABLE `tb_discounts` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `discount_code` varchar(255) NOT NULL,
  `expired_date` date NOT NULL,
  `percent_discount` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_discounts`
--

INSERT INTO `tb_discounts` (`id`, `created_at`, `updated_at`, `uuid`, `discount_code`, `expired_date`, `percent_discount`) VALUES
(2, '2024-10-28 05:50:30', '2024-10-28 06:49:40', '6ab45e1a-8902-410b-9e21-ed11f2d62f30', 'JAMUNDANGAN', '2024-12-31', '10'),
(3, '2024-10-28 06:40:50', '2024-10-28 06:49:24', '59097885-a67d-4f91-9a19-6591be62116f', 'NEWYEAR', '2025-01-01', '30');

-- --------------------------------------------------------

--
-- Table structure for table `tb_events`
--

CREATE TABLE `tb_events` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `event_type_1` varchar(255) DEFAULT NULL,
  `event_date_1` datetime DEFAULT NULL,
  `location_1` varchar(255) DEFAULT NULL,
  `address_1` varchar(500) DEFAULT NULL,
  `map_url_1` text DEFAULT NULL,
  `event_type_2` varchar(255) DEFAULT NULL,
  `event_date_2` datetime DEFAULT NULL,
  `location_2` varchar(255) DEFAULT NULL,
  `address_2` varchar(500) DEFAULT NULL,
  `map_url_2` text DEFAULT NULL,
  `event_type_3` varchar(255) DEFAULT NULL,
  `event_date_3` datetime DEFAULT NULL,
  `location_3` varchar(255) DEFAULT NULL,
  `address_3` varchar(500) DEFAULT NULL,
  `map_url_3` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_galleries`
--

CREATE TABLE `tb_galleries` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_gifts`
--

CREATE TABLE `tb_gifts` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `gift_type_name` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_holder` varchar(255) DEFAULT NULL,
  `recipient_address` varchar(255) DEFAULT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `recipient_phone_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_gift_types`
--

CREATE TABLE `tb_gift_types` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `gift_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_gift_types`
--

INSERT INTO `tb_gift_types` (`id`, `created_at`, `updated_at`, `uuid`, `gift_type_name`) VALUES
(1, '2024-10-27 05:39:13', '2024-10-27 05:39:15', 'uuid123', 'Rekening Bank'),
(2, '2024-10-27 05:39:31', '2024-10-27 05:39:34', 'uuid124', 'Pengiriman Paket');

-- --------------------------------------------------------

--
-- Table structure for table `tb_guests`
--

CREATE TABLE `tb_guests` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `guest_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_invitations`
--

CREATE TABLE `tb_invitations` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `template_id` int(11) NOT NULL,
  `invitation_code` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invitation_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_love_stories`
--

CREATE TABLE `tb_love_stories` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `story` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu_accesses`
--

CREATE TABLE `tb_menu_accesses` (
  `id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `first_menu_id` int(11) DEFAULT NULL,
  `second_menu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_menu_accesses`
--

INSERT INTO `tb_menu_accesses` (`id`, `created_at`, `updated_at`, `uuid`, `role_id`, `first_menu_id`, `second_menu_id`) VALUES
(410, '2024-10-29 09:21:37', '2024-10-29 09:21:37', '59951417-26fc-45ca-832a-42739b122578', 4, 7, NULL),
(411, '2024-10-29 09:21:37', '2024-10-29 09:21:37', 'aa7f723e-09fc-41de-85be-830b96af38c7', 4, 1, NULL),
(412, '2024-10-29 09:21:37', '2024-10-29 09:21:37', 'cbf4061a-a2fb-448b-a019-02ac0af3f2d9', 4, 25, NULL),
(413, '2024-10-29 09:21:37', '2024-10-29 09:21:37', 'd776874e-c1b5-4de0-97d2-b592874c4262', 4, 4, NULL),
(414, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '8116b1e5-9613-4745-9edf-0f4f22c72418', 1, 2, 1),
(415, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '0db21268-086f-4ec4-bbf6-e866fd3a1633', 1, 2, 2),
(416, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '2c7e3ea9-4f7f-4298-a7a4-a707fde8426d', 1, 24, NULL),
(417, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '68ab215c-1bac-48b9-a93d-18fccd8b5f01', 1, 7, NULL),
(418, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '7bd64f47-7f50-4c7c-8d33-2ec12364ebde', 1, 1, NULL),
(419, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '221d0908-f767-4766-b379-7265de501714', 1, 25, NULL),
(420, '2024-10-29 09:21:48', '2024-10-29 09:21:48', 'd11b5fef-f962-4c08-911e-945019d2b0a5', 1, 3, 4),
(421, '2024-10-29 09:21:48', '2024-10-29 09:21:48', 'bc3a22cf-8ddd-4175-962a-2a7d8d4e6a41', 1, 3, 20),
(422, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '3995ae3f-afff-46b6-9431-0b78fe59b8d7', 1, 3, 24),
(423, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '4675e7a4-6f14-4bf5-b236-536e5aad845f', 1, 3, 21),
(424, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '1faecaae-8f16-4c6c-a7de-96c0fc42255a', 1, 3, 22),
(425, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '1cf9176e-9d9a-4657-82f3-1949206ae684', 1, 3, 23),
(426, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '0ba7ede4-79dc-48c7-b150-b47a0a6a468f', 1, 3, 7),
(427, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '587bd2cc-59da-4c6e-bc0f-5adb694a190f', 1, 3, 3),
(428, '2024-10-29 09:21:48', '2024-10-29 09:21:48', '7d8fbeec-94ff-4c7c-836e-405ec6e34544', 1, 4, NULL),
(429, '2024-10-29 09:22:02', '2024-10-29 09:22:02', '9e8ef5c5-9517-4475-98fa-af111a68bf35', 2, 2, 1),
(430, '2024-10-29 09:22:02', '2024-10-29 09:22:02', '772428bb-bb60-41d4-aeb0-0dde258bb587', 2, 2, 2),
(431, '2024-10-29 09:22:02', '2024-10-29 09:22:02', '0a5089a1-d78b-42db-a1d8-bb2a01021245', 2, 24, NULL),
(432, '2024-10-29 09:22:02', '2024-10-29 09:22:02', '0b1dd6b5-104a-4592-a984-90cfa3aed2b7', 2, 7, NULL),
(433, '2024-10-29 09:22:02', '2024-10-29 09:22:02', 'ac2b692e-9647-465d-a898-07910a1b4733', 2, 1, NULL),
(434, '2024-10-29 09:22:02', '2024-10-29 09:22:02', '9d368a27-5aba-4242-b7b8-06671830660b', 2, 25, NULL),
(435, '2024-10-29 09:22:02', '2024-10-29 09:22:02', 'bf6a0bdd-82ba-4158-8466-7767e00ce4b8', 2, 3, 4),
(436, '2024-10-29 09:22:02', '2024-10-29 09:22:02', '8436a741-8d77-42eb-a1fd-400ec902f0c8', 2, 3, 20),
(437, '2024-10-29 09:22:02', '2024-10-29 09:22:02', '93325be5-aa65-4079-a1d6-5c63ee0c9470', 2, 3, 24),
(438, '2024-10-29 09:22:02', '2024-10-29 09:22:02', '5dd72113-a068-4e5a-80ad-7fcd3e15374c', 2, 3, 21),
(439, '2024-10-29 09:22:02', '2024-10-29 09:22:02', '5d82327d-729d-41e4-a581-c883bb4f3b48', 2, 3, 22),
(440, '2024-10-29 09:22:02', '2024-10-29 09:22:02', '27658294-970c-4806-a2b7-f8ac8222f04c', 2, 3, 23),
(441, '2024-10-29 09:22:02', '2024-10-29 09:22:02', '51b319e6-718d-45a4-9762-a34911ac8125', 2, 3, 7),
(442, '2024-10-29 09:22:02', '2024-10-29 09:22:02', 'fa010f80-dca1-4a2e-9598-d336b918dc10', 2, 3, 3),
(443, '2024-10-29 09:22:02', '2024-10-29 09:22:02', 'c061d8db-beb2-47d1-a6a0-986236945ea6', 2, 4, NULL),
(444, '2024-10-29 09:22:14', '2024-10-29 09:22:14', '90cc16d2-ec45-498b-9d07-c6aad5d3b246', 3, 24, NULL),
(445, '2024-10-29 09:22:14', '2024-10-29 09:22:14', '89fe7a17-c332-4116-81ec-60ee8576f2d8', 3, 7, NULL),
(446, '2024-10-29 09:22:14', '2024-10-29 09:22:14', 'a7337b5b-0760-4378-ac3a-2a2f950d02de', 3, 1, NULL),
(447, '2024-10-29 09:22:14', '2024-10-29 09:22:14', '0ec54f19-8318-4709-bb4c-d26ebc8cc2ad', 3, 25, NULL),
(448, '2024-10-29 09:22:14', '2024-10-29 09:22:14', '950809da-19be-4ca9-9c13-ef0b995a4a68', 3, 3, 4),
(449, '2024-10-29 09:22:14', '2024-10-29 09:22:14', '0f849182-a400-4885-ac7f-02134e8c1a4e', 3, 3, 20),
(450, '2024-10-29 09:22:14', '2024-10-29 09:22:14', 'f2e44172-63aa-48aa-88d1-594f068c5607', 3, 3, 24),
(451, '2024-10-29 09:22:14', '2024-10-29 09:22:14', '6d59c8db-d90f-4226-ae39-8fcbc69d4e4b', 3, 3, 21),
(452, '2024-10-29 09:22:14', '2024-10-29 09:22:14', '762906c4-3b45-413d-9160-177fbb48402a', 3, 3, 22),
(453, '2024-10-29 09:22:14', '2024-10-29 09:22:14', '43f0ce16-5106-4bfb-9976-ac9ff73ab52c', 3, 3, 23),
(454, '2024-10-29 09:22:14', '2024-10-29 09:22:14', 'ba046081-7fcd-4507-a9b6-8c8783fba857', 3, 3, 7),
(455, '2024-10-29 09:22:14', '2024-10-29 09:22:14', 'a658ba9c-ed31-471d-9779-c85814e57386', 3, 3, 3),
(456, '2024-10-29 09:22:14', '2024-10-29 09:22:14', 'af192ecd-3b22-4cdc-891d-4629e5c7621f', 3, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu_firsts`
--

CREATE TABLE `tb_menu_firsts` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `first_menu_name` varchar(255) DEFAULT NULL,
  `first_menu_link` varchar(255) DEFAULT NULL,
  `first_menu_icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_menu_firsts`
--

INSERT INTO `tb_menu_firsts` (`id`, `created_at`, `updated_at`, `uuid`, `first_menu_name`, `first_menu_link`, `first_menu_icon`) VALUES
(1, '2024-07-27 16:12:20', '2024-07-27 16:13:18', '1', 'Dashboard', 'dashboard', 'fas fa-th'),
(2, '2024-07-04 11:07:14', '2024-10-18 16:47:08', '2', 'Application', '#', 'fas fa-cog'),
(3, '2024-07-01 09:32:11', '2024-07-26 02:56:29', '3', 'Master', '#', 'fas fa-layer-group'),
(4, '2024-10-22 06:03:49', '2024-10-27 05:04:46', '6d3ce7cf-1d9b-4e4f-bced-a526c68508d0', 'Profile', 'profiles', 'fas fa-user'),
(7, '2024-10-22 06:07:30', '2024-10-27 04:28:21', 'a7670535-e806-4b70-a229-2c5585301c4a', 'Daftar Undangan', 'invitations', 'fas fa-envelope'),
(24, '2024-10-28 03:59:05', '2024-10-28 04:01:05', 'a153413d-597f-4359-b67e-944b5a026b68', 'Contact Form', 'contact_forms', 'fas fa-address-card'),
(25, '2024-10-29 09:21:14', '2024-10-29 09:24:10', 'fbe52d7d-1c66-4e84-9e2e-2b2681ef4981', 'Hubungi Kami', 'contacts/show_contact_us', 'fas fa-phone');

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu_seconds`
--

CREATE TABLE `tb_menu_seconds` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `second_menu_name` varchar(255) DEFAULT NULL,
  `second_menu_link` varchar(255) DEFAULT NULL,
  `second_menu_icon` varchar(255) DEFAULT NULL,
  `first_menu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_menu_seconds`
--

INSERT INTO `tb_menu_seconds` (`id`, `created_at`, `updated_at`, `uuid`, `second_menu_name`, `second_menu_link`, `second_menu_icon`, `first_menu_id`) VALUES
(1, '2024-07-04 11:07:55', '2024-07-04 11:09:41', '1', 'Menu', 'menus', NULL, 2),
(2, '2024-07-04 11:08:23', '2024-10-18 16:48:15', '2', 'Role', 'roles', NULL, 2),
(3, '2024-07-26 02:56:51', '2024-10-18 16:48:24', '3', 'User', 'users', NULL, 3),
(4, '2024-10-22 06:04:51', '2024-10-22 06:04:51', 'e123a76d-4369-4784-9eb2-1c0072c6dfca', 'Business Profile', 'business_profiles/uuid1234/edit', NULL, 3),
(7, '2024-10-22 05:37:54', '2024-10-22 05:37:54', 'd3770b04-a019-4a60-a3b8-4a12d4f2e8e0', 'Template', 'templates', NULL, 3),
(20, '2024-10-23 05:07:27', '2024-10-23 05:07:27', '9ab37dc7-e358-4d4a-a47c-aa261373828b', 'Contact', 'contacts', NULL, 3),
(21, '2024-10-23 05:09:53', '2024-10-23 05:09:53', 'b26095c0-46c2-461c-b6c6-45a5c1fd4ae4', 'Payment Method', 'payment_methods', NULL, 3),
(22, '2024-10-28 04:50:42', '2024-10-28 04:50:42', '3dbd96be-64bd-41aa-9756-b7525e2bef30', 'Service', 'services', NULL, 3),
(23, '2024-10-28 05:24:38', '2024-10-28 05:24:59', '0895a591-cebf-41f5-bfdb-d6816a9dd9a4', 'Setting', 'settings/uuid1234/edit', NULL, 3),
(24, '2024-10-28 05:38:07', '2024-10-28 05:38:07', 'e92002e6-60bd-46e8-b52c-dae9219c2a25', 'Discount', 'discounts', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_messages`
--

CREATE TABLE `tb_messages` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `presence_confirm` varchar(255) DEFAULT NULL,
  `guest_totals` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_payment_methods`
--

CREATE TABLE `tb_payment_methods` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `account_holder` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_payment_methods`
--

INSERT INTO `tb_payment_methods` (`id`, `created_at`, `updated_at`, `uuid`, `account_name`, `account_number`, `account_holder`) VALUES
(1, '2024-10-22 08:20:25', '2024-10-22 08:20:28', 'uuid123', 'BSI', '09321423', 'Riki David'),
(2, '2024-10-22 08:20:25', '2024-10-22 08:20:28', 'uuid124', 'BRI', '09321423', 'Riki David');

-- --------------------------------------------------------

--
-- Table structure for table `tb_quotes`
--

CREATE TABLE `tb_quotes` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `quote_text` text DEFAULT NULL,
  `background_image_1` varchar(255) DEFAULT NULL,
  `background_image_2` varchar(255) DEFAULT NULL,
  `background_image_3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_roles`
--

CREATE TABLE `tb_roles` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `button_access` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_roles`
--

INSERT INTO `tb_roles` (`id`, `created_at`, `updated_at`, `uuid`, `role_name`, `button_access`) VALUES
(1, '2024-09-24 12:38:00', '2024-10-18 17:16:01', '72bd2d28-9152-46d2-9ef0-7a8524e6ca5e', 'IT', 1),
(2, '2024-09-24 12:38:07', '2024-10-18 17:16:09', '459fb0d8-f5ae-4ace-881a-bea5c6982507', 'Owner', 1),
(3, '2024-10-18 17:16:15', '2024-10-18 17:16:15', 'efb502e8-8678-45c4-a7b9-85ddf63e7961', 'Admin', 1),
(4, '2024-10-23 03:28:45', '2024-10-23 03:28:45', '610d7b5e-eb39-4737-a17e-eadd429590b8', 'User', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_services`
--

CREATE TABLE `tb_services` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_services`
--

INSERT INTO `tb_services` (`id`, `created_at`, `updated_at`, `uuid`, `icon`, `title`, `description`) VALUES
(1, '2024-10-28 05:04:15', '2024-10-28 05:04:15', 'e0fae3d4-0e9b-4be0-b967-5b608df6b2fd', 'fas fa-heart', 'Desain yang Menarik', 'Kustomisasi undangan Anda dengan desain yang indah.'),
(2, '2024-10-28 05:04:35', '2024-10-28 05:04:35', 'de440008-bb55-4c2c-84fa-9a75542aff71', 'fas fa-paper-plane', 'Pengiriman Digital', 'Kirim undangan Anda secara digital dengan mudah.'),
(3, '2024-10-28 05:04:54', '2024-10-28 05:04:54', '912ecb3a-f7ac-4ad8-afb7-78e3b29597d5', 'fas fa-calendar-check', 'Manajemen Acara', 'Kelola acara Anda dengan mudah.'),
(4, '2024-10-28 05:05:21', '2024-10-28 05:05:21', 'bbb41429-8c56-472a-a31a-a2304277eff4', 'fas fa-cog', 'Kustomisasi Fleksibel', 'Sesuaikan setiap detail undangan Anda sesuai keinginan.'),
(5, '2024-10-28 05:05:52', '2024-10-28 05:05:52', 'ecca0e17-5362-4b98-b38a-3791ee9efc44', 'fas fa-mobile-alt', 'Desain Responsif', 'Tampilan undangan akan menyesuaikan dengan berbagai perangkat, dari desktop hingga ponsel.'),
(6, '2024-10-28 05:06:13', '2024-10-28 05:06:13', 'f1b58c65-a875-4692-a2ce-c7ab6136b595', 'fas fa-video', 'Fitur Streaming', 'Lakukan siaran langsung acara Anda untuk tamu yang tidak dapat hadir.'),
(7, '2024-10-28 05:06:36', '2024-10-28 05:06:36', 'c26f82af-68fd-4066-a5fc-d3380be3b632', 'fas fa-comments', 'Pesan Tamu', 'Tamu dapat meninggalkan pesan dan ucapan langsung melalui platform kami.'),
(8, '2024-10-28 05:06:59', '2024-10-28 05:06:59', 'e5310cea-f272-49e0-a45d-1f8522385332', 'fas fa-images', 'Galeri Foto', 'Tampilkan momen-momen indah melalui galeri foto yang dapat diakses oleh tamu.'),
(9, '2024-10-28 05:07:21', '2024-10-28 05:07:21', '25c07cf6-acdc-4776-a405-abf7ec46414e', 'fas fa-gift', 'Hadiah dari Tamu', 'Tamu dapat memberikan hadiah melalui rekening atau pengiriman paket.'),
(10, '2024-10-28 05:07:41', '2024-10-28 05:07:41', '49552ad6-5abd-4cbb-b684-51d95a173aed', 'fas fa-music', 'Fitur Audio', 'Sediakan lagu-lagu favorit untuk menciptakan suasana yang lebih meriah.'),
(11, '2024-10-28 05:08:02', '2024-10-28 05:08:02', 'b0374090-049e-471f-832e-688348a929bd', 'fas fa-thumbs-up', 'Pengalaman Pengguna yang Luar Biasa', 'Kami fokus pada pengalaman pengguna untuk memastikan kepuasan Anda.'),
(12, '2024-10-28 05:08:22', '2024-10-28 05:08:22', '685a7294-39ba-48bb-a704-eca1b8d41faf', 'fas fa-users', 'Dukungan Pelanggan', 'Kami siap membantu Anda setiap hari mulai pukul 09:00 - 20:00 WIB.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_settings`
--

CREATE TABLE `tb_settings` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `auth_background` varchar(255) NOT NULL,
  `home_cover_image` varchar(255) NOT NULL,
  `home_cover_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_settings`
--

INSERT INTO `tb_settings` (`id`, `created_at`, `updated_at`, `uuid`, `auth_background`, `home_cover_image`, `home_cover_text`) VALUES
(1, '2024-10-19 11:59:45', '2024-10-29 07:42:45', 'uuid1234', 'image/HQwNnNeSaSLaXayYfqU2trQSRQNOiZrUxGa5mDpg.png', 'image/spm7SpJ3Jd5c78QFyIqfMtV5lr3pzsZER19WVTHc.svg', '<p>&nbsp;\"Selamat datang di dunia undangan digital kami!</p><p>Bergabunglah dengan kami untuk merayakan momen-momen berharga dengan cara yang lebih modern dan mudah.\"</p>');

-- --------------------------------------------------------

--
-- Table structure for table `tb_streamings`
--

CREATE TABLE `tb_streamings` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `youtube_url_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_templates`
--

CREATE TABLE `tb_templates` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `image` varchar(255) NOT NULL,
  `example_url` text NOT NULL,
  `template_code` varchar(255) NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `percent_discount` varchar(255) NOT NULL,
  `parameter` varchar(255) NOT NULL,
  `template_type_id` int(11) NOT NULL,
  `publication_status` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_templates`
--

INSERT INTO `tb_templates` (`id`, `created_at`, `updated_at`, `uuid`, `image`, `example_url`, `template_code`, `template_name`, `price`, `percent_discount`, `parameter`, `template_type_id`, `publication_status`, `total_amount`) VALUES
(1, '2024-10-22 05:50:57', '2024-10-30 03:05:37', '9e487f36-b2cf-4d0e-9f6b-4affa8c1b8aa', 'template/soOMEP1ALjrRRcfHzyzyg36OUmfDenEKmTc3lrkF.jpg', '/invitation_templates/jm-calm/dist/calm_pink.html', 'calm_pink', 'Calm Pink', '100000', '50', 'calm_template', 1, 'Yes', '50000'),
(2, '2024-10-22 05:52:54', '2024-10-30 03:05:25', '9ab0ea3f-b7ce-4800-91d3-3835b84eb2e6', 'template/ZCczungGOnyPV7fe1JkN329nhjDFJBymUnCcQT5O.jpg', '/invitation_templates/jm-calm/dist/calm_blue.html', 'calm_blue', 'Calm Blue', '100000', '50', 'calm_template', 1, 'Yes', '50000'),
(3, '2024-10-22 05:53:36', '2024-10-30 03:05:11', 'e664fea4-15bf-45a7-b933-c93cffb8e5eb', 'template/DtCJOUO4wjVKED8JPA8lH7bFeFuYyjNjz0FWAQkK.jpg', '/invitation_templates/jm-calm/dist/calm_green.html', 'calm_green', 'Calm Green', '100000', '50', 'calm_template', 1, 'Yes', '50000'),
(4, '2024-10-22 05:55:23', '2024-10-30 03:04:59', 'cc472470-632b-4dea-ada2-79b0b96ea05a', 'template/mReRbSX736zmz2qVVqxoHnDRGHzmhz5lPMdew2Vi.jpg', '/invitation_templates/jm-calm/dist/calm_red.html', 'calm_red', 'Calm Red', '100000', '50', 'calm_template', 1, 'Yes', '50000'),
(5, '2024-10-22 05:56:26', '2024-10-30 03:04:40', 'e76f6fe5-6cb3-4f96-95b0-bfd5edf74f41', 'template/evvTrCdsrCF2Lnv1erizx75EKhwMo3IGP0EndF4o.jpg', '/invitation_templates/jm-sideright/dist/sideright_golden_brown.html', 'sideright_golden_brown', 'Sideright Golden Brown', '100000', '50', 'sideright_template', 1, 'Yes', '50000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_template_types`
--

CREATE TABLE `tb_template_types` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `template_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_template_types`
--

INSERT INTO `tb_template_types` (`id`, `created_at`, `updated_at`, `uuid`, `template_type_name`) VALUES
(1, '2024-10-23 06:42:07', '2024-10-23 06:42:09', 'uuid123', 'UNDANGAN PERNIKAHAN');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transactions`
--

CREATE TABLE `tb_transactions` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `transaction_code` varchar(255) NOT NULL,
  `invitation_id` varchar(255) NOT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `percent_discount` varchar(255) DEFAULT NULL,
  `payment_receipt` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_wedding_couples`
--

CREATE TABLE `tb_wedding_couples` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `bride_photo` varchar(255) DEFAULT NULL,
  `bride_full_name` varchar(255) DEFAULT NULL,
  `bride_nickname` varchar(255) DEFAULT NULL,
  `bride_child_number` varchar(255) DEFAULT NULL,
  `bride_mother_name` varchar(255) DEFAULT NULL,
  `bride_father_name` varchar(255) DEFAULT NULL,
  `groom_photo` varchar(255) DEFAULT NULL,
  `groom_full_name` varchar(255) DEFAULT NULL,
  `groom_nickname` varchar(255) DEFAULT NULL,
  `groom_child_number` varchar(255) DEFAULT NULL,
  `groom_mother_name` varchar(255) DEFAULT NULL,
  `groom_father_name` varchar(255) DEFAULT NULL,
  `opening_greeting` text DEFAULT NULL,
  `text_greeting` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `uuid`, `full_name`, `nick_name`, `role_id`) VALUES
(1, NULL, 'owner@gmail.com', NULL, '$2y$12$k83DHsQnWCT3Guu8aDaV9uDCYhQ0Pt2P/jXGB/SvqpW4cQ5dysHUq', NULL, '2024-09-22 04:51:41', '2024-10-30 02:44:20', 'b78bbf63-2424-4aec-9da7-55537062f5e3', 'Riki David', 'Riki', 2),
(2, NULL, 'it@gmail.com', NULL, '$2y$12$jI2jrqRHuW.Lj5FqgK75U.Fy8dQ/BUhdzagdm93r4Y32DuqyQz6Vu', NULL, '2024-09-22 05:10:02', '2024-10-30 02:44:01', '3a0f5a4a-14ed-426b-9298-3cfa6f475c61', 'Riki David', 'Riki', 1),
(3, NULL, 'admin@gmail.com', NULL, '$2y$12$Hj.o3dni.mofGL3kc5gCZOEyjqlY5.CsL0GXQLxR9Cp5gOWeG.VN6', NULL, '2024-10-23 03:28:12', '2024-10-30 02:43:51', '96b87508-e1d9-4630-8349-db88909a8de7', 'Riki David', 'Riki', 3),
(4, NULL, 'user@gmail.com', NULL, '$2y$12$v.ylbvOGE9ydoqJiTk.iAubF97U.UQG3hPxmhS1Gs6VLJtD0J.yeq', NULL, '2024-10-29 09:18:58', '2024-10-30 02:43:25', '9113733a-efb6-4912-a04f-f63db698076c', 'Riki David', 'Riki', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tb_audios`
--
ALTER TABLE `tb_audios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_business_profiles`
--
ALTER TABLE `tb_business_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_closings`
--
ALTER TABLE `tb_closings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_contacts`
--
ALTER TABLE `tb_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_contact_forms`
--
ALTER TABLE `tb_contact_forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_covers`
--
ALTER TABLE `tb_covers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_discounts`
--
ALTER TABLE `tb_discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_events`
--
ALTER TABLE `tb_events`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_galleries`
--
ALTER TABLE `tb_galleries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_gifts`
--
ALTER TABLE `tb_gifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_gift_types`
--
ALTER TABLE `tb_gift_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_guests`
--
ALTER TABLE `tb_guests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_invitations`
--
ALTER TABLE `tb_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_love_stories`
--
ALTER TABLE `tb_love_stories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_menu_accesses`
--
ALTER TABLE `tb_menu_accesses`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE,
  ADD KEY `tb_menu_accesses_role_id` (`role_id`),
  ADD KEY `tb_menu_accesses_second_menu_id` (`second_menu_id`),
  ADD KEY `tb_menu_accesses_first_menu_id` (`first_menu_id`);

--
-- Indexes for table `tb_menu_firsts`
--
ALTER TABLE `tb_menu_firsts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_menu_seconds`
--
ALTER TABLE `tb_menu_seconds`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE,
  ADD KEY `tb_menu_seconds_first_menu_id` (`first_menu_id`);

--
-- Indexes for table `tb_messages`
--
ALTER TABLE `tb_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_payment_methods`
--
ALTER TABLE `tb_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_quotes`
--
ALTER TABLE `tb_quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_services`
--
ALTER TABLE `tb_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_settings`
--
ALTER TABLE `tb_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_streamings`
--
ALTER TABLE `tb_streamings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_templates`
--
ALTER TABLE `tb_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_template_types`
--
ALTER TABLE `tb_template_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_transactions`
--
ALTER TABLE `tb_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `tb_wedding_couples`
--
ALTER TABLE `tb_wedding_couples`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_audios`
--
ALTER TABLE `tb_audios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tb_business_profiles`
--
ALTER TABLE `tb_business_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_closings`
--
ALTER TABLE `tb_closings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tb_contacts`
--
ALTER TABLE `tb_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_contact_forms`
--
ALTER TABLE `tb_contact_forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_covers`
--
ALTER TABLE `tb_covers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_discounts`
--
ALTER TABLE `tb_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_events`
--
ALTER TABLE `tb_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_galleries`
--
ALTER TABLE `tb_galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tb_gifts`
--
ALTER TABLE `tb_gifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tb_gift_types`
--
ALTER TABLE `tb_gift_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_guests`
--
ALTER TABLE `tb_guests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tb_invitations`
--
ALTER TABLE `tb_invitations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `tb_love_stories`
--
ALTER TABLE `tb_love_stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tb_menu_accesses`
--
ALTER TABLE `tb_menu_accesses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT for table `tb_menu_firsts`
--
ALTER TABLE `tb_menu_firsts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tb_menu_seconds`
--
ALTER TABLE `tb_menu_seconds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_messages`
--
ALTER TABLE `tb_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tb_payment_methods`
--
ALTER TABLE `tb_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_quotes`
--
ALTER TABLE `tb_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_services`
--
ALTER TABLE `tb_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_settings`
--
ALTER TABLE `tb_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_streamings`
--
ALTER TABLE `tb_streamings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tb_templates`
--
ALTER TABLE `tb_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_template_types`
--
ALTER TABLE `tb_template_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_transactions`
--
ALTER TABLE `tb_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tb_wedding_couples`
--
ALTER TABLE `tb_wedding_couples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_menu_accesses`
--
ALTER TABLE `tb_menu_accesses`
  ADD CONSTRAINT `tb_menu_accesses_first_menu_id` FOREIGN KEY (`first_menu_id`) REFERENCES `tb_menu_firsts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_menu_accesses_role_id` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_menu_accesses_second_menu_id` FOREIGN KEY (`second_menu_id`) REFERENCES `tb_menu_seconds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_menu_seconds`
--
ALTER TABLE `tb_menu_seconds`
  ADD CONSTRAINT `tb_menu_seconds_first_menu_id` FOREIGN KEY (`first_menu_id`) REFERENCES `tb_menu_firsts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
