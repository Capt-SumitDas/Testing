-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 11:16 AM
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
-- Database: `chatapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(11) NOT NULL,
  `outgoing_msg_id` int(11) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_msg_id`, `outgoing_msg_id`, `msg`) VALUES
(1, 1331837097, 1043203171, 'hello'),
(2, 1043203171, 1331837097, 'hai'),
(3, 1043203171, 1331837097, 'ana rasa nga s kancang'),
(4, 1331837097, 1043203171, 'iyo am'),
(5, 1331837097, 1043203171, 'oke?'),
(6, 1043203171, 1331837097, 'oke le'),
(7, 1331837097, 1043203171, 'ey'),
(8, 1043203171, 1331837097, 'oke'),
(9, 1043203171, 1331837097, 'asdasdsadsaddaasdasdadasdasdasda');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `unique_id` int(200) NOT NULL,
  `fname` varchar(80) NOT NULL,
  `lname` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `img` varchar(80) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `unique_id`, `fname`, `lname`, `email`, `password`, `img`, `status`) VALUES
(0, 696657049, 'Admin', 'User', 'admin.user@sysware.in', 'Admin@123', '1705473619Images-23.png', 'Active now'),
(0, 800987943, 'Amit', 'User', 'amit@sysware.in', 'Amit@2525', '1705473697Images-03.png', 'Active now'),
(0, 719347537, 'Divik', 'User', 'divik@sysware.in', 'Divik@5252', '1705474013Images-02.png', 'Active now'),
(0, 271267418, 'vivek', 'user', 'vivek@sysware.in', 'Vivek@0101', '1705483179Images-07.png', 'Active now'),
(0, 1554410689, 'Rahul', 'User', 'Rahul@sysware.in', 'Rahul@1010', '1705483215Images-15.png', 'Active now'),
(0, 1533196192, 'Vikas', 'User', 'Vikas@sysware.in', 'Vikas@2020', '1705483369Images-01.png', 'Active now'),
(0, 1188897331, 'Rishi', 'User', 'Rishi@sysware.in', 'Rishi@0202', '1705483414Images-23.png', 'Active now'),
(0, 1113819895, 'Abhishek', 'User', 'Abhishek@sysware.in', 'Abhi@1111', '1705483456Images-20.png', 'Active now');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
