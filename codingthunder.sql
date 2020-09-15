-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2020 at 12:45 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'first post', '1234567890', 'First post', '2020-09-11 14:48:19', 'firstpost@gmail.com'),
(4, 'saveen', '1234568790', 's', NULL, 'vinkalkamboj35@gmail.com'),
(5, 'saveen kamboj', '1234568790', 'This is Date and Time', '2020-09-11 15:24:15', 'saveen.kamboj12@gmail.com'),
(6, 'Saveen Chaudhary', '1234568790', 'This is official account', '2020-09-12 10:12:54', 'saveen.kamboj12@gamil.com'),
(7, 'Saveen Chaudhary', '1234568790', 'This is official account', '2020-09-12 10:14:42', 'saveen.kamboj12@gamil.com'),
(8, 'Saveen Chaudhary', '1234568790', 'This is official account', '2020-09-12 10:14:51', 'saveen.kamboj12@gamil.com'),
(9, 'Saveen Chaudhary', '1234568790', 'This is official account', '2020-09-12 10:16:39', 'saveen.kamboj12@gamil.com'),
(10, 'saveen', '1234568790', 'ye', '2020-09-12 10:17:18', 'saveen.uni12@gmail.com'),
(11, 'saveen', '1234568790', 'er', '2020-09-12 10:20:28', 'saveen.kamboj12@gmail.com'),
(12, 'saveen', '1234568790', 'er', '2020-09-12 10:22:43', 'saveen.kamboj12@gmail.com'),
(13, 'saveen', '1234568790', 'saveen', '2020-09-12 10:24:00', 'wearevery@gmail.com'),
(14, 'saveen', '1234568790', 'saveen', '2020-09-12 10:26:20', 'wearevery@gmail.com'),
(15, 'saveen', '1234568790', 'stg', '2020-09-12 10:29:08', 'saveen.kamboj12@gmail.com'),
(16, 'saveen', '1234568790', 'uuu', '2020-09-12 10:31:53', 'saveen.kamboj12@gmail.com'),
(17, 'saveen', '1234568790', 'r', '2020-09-12 12:10:12', 'saveen.kamboj12@gamil.com'),
(18, 'Saveen Chaudhary', '1234568790', 'v', '2020-09-12 12:11:06', 'vinkalkamboj35@gmail.com'),
(19, 'Saveen Chaudhary', '1234568790', 'saveen', '2020-09-12 12:14:33', 'saveen.kamboj12@gmail.com'),
(20, 'saveen', '1234568790', '3445', '2020-09-12 12:15:31', 'this.this @gmail.com'),
(21, 'saveen', '1234568790', 'df', '2020-09-12 12:16:23', 'd'),
(22, 's', 'df', 'df', '2020-09-12 12:17:31', 'df'),
(23, 'dsf', 'gsd', 'gfggggggggggggggggg', '2020-09-12 12:18:04', 'dg'),
(24, 'saveen', '1234568790', 'er', '2020-09-12 15:14:06', 'saveen.kamboj12@gmail.com'),
(25, 'saveen', '1234568790', 'sa', '2020-09-12 15:16:33', 'saveen.kamboj12@gmail.com'),
(26, 'they', '353', 'we are the same', '2020-09-12 15:19:37', 'they@gmail.com'),
(27, 'asgf', '343', 'fdg', '2020-09-12 15:21:11', 'vinkalkamboj35@gmail.com'),
(28, 'ag', 'd235', '532q', '2020-09-12 15:24:57', 'hiugvj'),
(29, 'This is name', 'ThisisPhone', 'This is message', '2020-09-12 15:30:15', 'thisisemail@gmail.com'),
(30, 'Chaudhary Saveen', '9991257550', 'This is computer generated message', '2020-09-12 15:35:29', 'chaudharysaveen@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(19) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `tagline` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `img_file`, `date`, `tagline`) VALUES
(1, 'Post 1', 'first-post', 'Livestock is commonly defined as domesticated animals raised in an agricultural setting to produce labor and commodities such as meat, eggs, milk, fur, leather, and wool. The term is sometimes used to refer solely to those that are bred for consumption, while other times it refers only to farmed ruminants, such as cattle and goats.[1] Horses are considered livestock in the United States.[2] The USDA classifies pork, veal, beef, and lamb as livestock and all livestock as red meat. Poultry and fish are not included in the category.[3]', 'post-bg.jpg', '2020-09-15 15:43:03', 'about accounting'),
(3, 'Post 2', 'second-post', 'The AMD Ryzen 4000 unveiled to quite a bit of fanfare at CES 2020. And now the company has started to deliver, at least with their mobile lines. They may be revolutionizing the gaming laptop scene with almost the kind of performance that one might expect from their desktop counterparts.\r\n', '', '2020-09-15 15:43:16', 'RYGEN'),
(4, 'Post 3', 'second-post', 'The AMD Ryzen 4000 unveiled to quite a bit of fanfare at CES 2020. And now the company has started to deliver, at least with their mobile lines. They may be revolutionizing the gaming laptop scene with almost the kind of performance that one might expect from their desktop counterparts.\r\n', '', '2020-09-15 15:48:11', 'RYGEN'),
(5, 'Post4', 'second-post', 'The AMD Ryzen 4000 unveiled to quite a bit of fanfare at CES 2020. And now the company has started to deliver, at least with their mobile lines. They may be revolutionizing the gaming laptop scene with almost the kind of performance that one might expect from their desktop counterparts.\r\n', '', '2020-09-15 15:49:26', 'RYGEN'),
(6, 'Post 5', 'second-post', 'The AMD Ryzen 4000 unveiled to quite a bit of fanfare at CES 2020. And now the company has started to deliver, at least with their mobile lines. They may be revolutionizing the gaming laptop scene with almost the kind of performance that one might expect from their desktop counterparts.\r\n', '', '2020-09-15 15:49:56', 'RYGEN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
