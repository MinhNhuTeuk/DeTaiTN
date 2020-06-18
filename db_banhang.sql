-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 18, 2020 lúc 07:42 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `phone`, `created_at`, `updated_at`) VALUES
(2, 'Nguyễn Thiện Minh Như', 'minhnhu.nguyn@gmail.com', '$2y$10$E7N', '0905075819', '2020-06-07 13:59:18', '2020-06-07 13:59:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` tinyint(3) DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ghi chú',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills_detail`
--

CREATE TABLE `bills_detail` (
  `id` int(10) NOT NULL,
  `id_bills` int(10) NOT NULL,
  `id_products` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`) VALUES
(1, 'Áo\r\n'),
(2, 'Quần'),
(3, 'Chân váy'),
(4, 'Đầm'),
(5, 'Set thời trang');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(3) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2020_06_06_192941_create_admin_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_typeproducts` int(10) DEFAULT NULL,
  `id_catalog` int(10) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL COMMENT 'đơn giá',
  `promotion_price` float DEFAULT NULL COMMENT 'giá khuyến mãi',
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_typeproducts`, `id_catalog`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Áo hai dây cầu vòng', 5, 1, NULL, 100000, 80000, 'áo hai dây cầu vòng 1.jpg', 'cái', 1, '2020-05-18 13:49:14', NULL),
(2, 'Croptop Daisy ', 5, 1, NULL, 100000, 0, 'Croptop_hoa(1).jpg', 'cái', 1, '2020-05-18 15:15:47', NULL),
(3, 'Croptop mini', 5, 1, NULL, 60000, 0, 'Minitop slogan (1).jpg', 'cái', 0, '2020-05-18 15:52:23', NULL),
(4, 'Croptop nhún ngực tay phồng', 5, 1, NULL, 60000, 0, 'croptop nhún ngực tay phồng(1).jpg', 'cái', 1, '2020-05-18 15:52:23', NULL),
(5, 'Croptop kẻ', 5, 1, NULL, 70000, 0, 'Croptop_kẻ(3).jpg', 'cái', 1, '2020-05-18 16:01:04', NULL),
(6, 'Áo nỉ chữ ngực dáng rộng 6072', 4, 1, NULL, 200000, 140000, 'áo nỉ chữ ngực dáng rộng 6072(1).jpg', 'cái', 1, '2020-05-18 16:10:54', NULL),
(7, 'Set váy áo Black', 10, 5, NULL, 200000, 180000, 'black 2.jpg', 'set', 1, '2020-05-18 16:10:54', NULL),
(8, 'Áo thun mỏng balengiaga 5 mei 1623', 2, 1, NULL, 150000, 90000, 'áo thun mỏng balengiaga 5 mei 1623(1).jpg', 'cái', 1, '2020-05-18 16:25:42', NULL),
(9, 'Áo thun mỏng bo gấu node 6131', 2, 1, NULL, 150000, 0, 'áo thun mỏng bo gấu node 6131(1).jpg', 'cái', 0, '2020-05-18 16:25:42', NULL),
(10, 'Áo thun mỏng nana nothing whitter 257', 2, 1, NULL, 150000, 95000, 'áo thun mỏng nana nothing whitter 257(1).jpg', 'cái', 1, '2020-05-18 16:35:34', NULL),
(11, 'Áo thun hồng loang đa sắc', 2, 1, NULL, 180000, 150000, 'hông loang đa sắc 1.jpg', 'cái', 1, '2020-05-18 16:35:34', NULL),
(12, 'Áo màu tie dye', 2, 1, NULL, 180000, 150000, 'Màu  tie dye 1.jpg', 'cái', 1, '2020-05-18 16:40:07', NULL),
(13, 'Áo Naruto', 2, 1, NULL, 150000, 0, 'naruto_.jpg', 'cái', 0, '2020-05-18 16:42:28', NULL),
(14, 'Áo Tee shiba ', 2, 1, NULL, 150000, 110000, 'Tee shiba 1.jpg', 'cái', 1, '2020-05-18 16:43:56', NULL),
(15, 'Chân váy caro nâu', 8, 3, NULL, 150000, 0, 'caro chữ A(1).jpg', 'cái', 1, '2020-06-02 10:10:41', NULL),
(16, 'Đầm hoa lá', 9, 4, NULL, 200000, 180000, 'hoa lá(1).jpg', 'cái', 1, '2020-06-02 10:10:41', NULL),
(17, 'Đầm baby trắng', 9, 4, NULL, 150000, 120000, 'white_2.jpg', 'cái', 1, '2020-06-02 10:30:01', NULL),
(18, 'Áo sơ mi caro đỏ', 1, 1, NULL, 150000, 120000, 'somi caro đỏ(1).jpg', NULL, 0, '2020-06-02 10:30:01', NULL),
(19, 'Quần ống suông nâu ', 6, 2, NULL, 150000, 80000, 'ống suông nâu 2.jpg', 'cái', 1, '2020-06-02 10:59:15', NULL),
(20, 'Quần bò baggy 3008', 6, 2, NULL, 180000, 120000, 'quần bò baggy 3008.jpg', 'cái', 1, '2020-06-02 10:59:15', NULL),
(21, 'Quần ống suông sọc trắng', 6, 2, NULL, 120000, 80000, 'Quần sọc 1.jpg', 'cái', 0, '2020-06-02 11:02:02', NULL),
(22, 'Quần bò blue sky', 6, 2, NULL, 150000, 0, 'Quần blue sky 1.jpg', 'cái', 0, '2020-06-02 11:04:45', NULL),
(23, 'Quần daisy hole high ', 7, 2, NULL, 180000, 120000, 'daisy hole high 4.jpg', 'cái', 1, '2020-06-02 11:04:45', NULL),
(24, 'Quần kaki cạp cao đen', 7, 2, NULL, 150000, 0, 'quan kaki cap cao den 2.jpg', 'cái', 1, '2020-06-02 11:24:30', NULL),
(25, 'Quần kaki cạp cao trắng', 7, 2, NULL, 150000, 0, 'quan kaki cap cao trắng 2.jpg', 'cái', 1, '2020-06-02 11:25:30', NULL),
(26, 'Quần kaki đen unisex', 202, 2, NULL, 120000, 80000, 'quanshortkakiden.jpg', 'cái', 0, '2020-06-02 11:25:30', NULL),
(27, 'Quần kaki be unisex', 202, 2, NULL, 120000, 80000, 'quanshortkakibe.jpg', '', 0, '2020-06-02 11:27:39', '0000-00-00 00:00:00'),
(28, 'Short Pant Korean', 202, 2, NULL, 0, 0, 'Short Pant Korean 2.jpg', 'cái', 1, '2020-06-02 11:27:39', NULL),
(31, 'Quần daisy hole high', 202, 2, NULL, 150000, 120000, 'daisy hole high 4.jpg', 'cái', 1, '2020-06-02 13:11:07', NULL),
(32, 'Quần kaki be unisex', 202, 2, NULL, 150000, 70000, 'quanshortkakibe.jpg', 'cái', 0, '2020-06-02 13:13:55', NULL),
(33, 'Quàn kaki đen unisex', 202, 2, NULL, 150000, 70000, 'quanshortkakiden.jpg', 'cái', 0, '2020-06-02 13:13:55', NULL),
(34, 'Quần Short Pant Korean', 202, 2, NULL, 150000, 0, 'Short Pant Korean 3.jpg', NULL, 1, '2020-06-02 13:16:01', NULL),
(35, 'Đầm caro cột nơ', 401, 4, NULL, 180000, 150000, 'Đầm caro cột nơ(1).jpg', 'cái', 1, '2020-06-02 13:21:53', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'slider_1.jpg'),
(2, '', 'slider_2.jpg'),
(3, '', 'slider_3.jpg'),
(4, '', 'slider_4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'ghi chú',
  `id_catalog` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `id_catalog`, `created_at`, `updated_at`) VALUES
(1, 'Áo sơ mi', '', 1, '2020-05-18 13:09:49', '2020-05-18 13:09:49'),
(2, 'Áo thun', '', 1, '2020-05-18 13:10:19', '2020-05-18 13:10:19'),
(3, 'Áo len', '', 1, '2020-05-18 13:10:35', '2020-05-18 13:10:35'),
(4, 'Áo khoác', '', 1, '2020-05-18 13:10:51', '2020-05-18 13:10:51'),
(5, 'Áo kiểu', '', 1, '2020-05-18 13:11:05', '2020-05-18 13:11:05'),
(6, 'Quần dài', '', 2, '2020-05-18 13:11:31', '2020-05-18 13:11:31'),
(7, 'Quần short', '', 2, '2020-05-18 13:11:31', '2020-05-18 13:11:31'),
(8, 'Chân váy', '', 3, '2020-05-18 13:30:18', '2020-05-18 13:30:18'),
(9, 'Đầm', '', 4, '2020-05-18 13:30:18', '2020-05-18 13:30:18'),
(10, 'Set thời trang', '', 5, '2020-05-18 13:30:18', '2020-05-18 13:30:18'),
(20, 'Quần baggy', 'Quần baggy', 4, '2020-06-09 14:02:31', '2020-06-09 14:02:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Phùng Thị Bích Thoa', 'thoaptb@gmail.com', '$2y$10$R0LKyg8j4HS3ljKlBN.6TOYMoSBjrnhxeZm.MFeU6npaVZeFm2zYa', '0934567891', 'Đại học Nha Trang', NULL, '2020-06-06 12:55:27', '2020-06-06 12:55:27');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Chỉ mục cho bảng `bills_detail`
--
ALTER TABLE `bills_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_products` (`id_products`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_typeproducts` (`id_typeproducts`) USING BTREE,
  ADD KEY `id_catalog` (`id_catalog`) USING BTREE;

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_catalog` (`id_catalog`) USING BTREE;

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bills_detail`
--
ALTER TABLE `bills_detail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_catalog`) REFERENCES `catalog` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
