-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 06, 2017 at 04:31 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forsit`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `handle` varchar(100) NOT NULL,
  `pid` varchar(100) NOT NULL,
  `attempt_count` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `difficulty` double NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `created_at` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `activity_concept`
--

CREATE TABLE `activity_concept` (
  `handle` varchar(100) NOT NULL,
  `pid` varchar(100) NOT NULL,
  `attempt_count` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `difficulty` double NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `created_at` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `problem`
--

CREATE TABLE `problem` (
  `pid` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `contestId` varchar(50) NOT NULL,
  `points` int(11) NOT NULL,
  `correct_count` int(11) NOT NULL,
  `attempt_count` int(11) NOT NULL DEFAULT '-1',
  `time` int(11) NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `problem_reco`
--

CREATE TABLE `problem_reco` (
  `uid` varchar(100) NOT NULL,
  `base_pid` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `reco_pid` varchar(100) NOT NULL,
  `score` double NOT NULL,
  `time_created` int(11) NOT NULL,
  `time_updated` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ptag`
--

CREATE TABLE `ptag` (
  `pid` varchar(50) NOT NULL,
  `tag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `similar_users`
--

CREATE TABLE `similar_users` (
  `uid` int(11) NOT NULL,
  `similar_user` varchar(300) NOT NULL,
  `similarity` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tag` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `time` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `bkdr_handle` varchar(50) NOT NULL,
  `erd_handle` varchar(50) NOT NULL,
  `cfs_handle` varchar(50) NOT NULL,
  `bkdr_score` double NOT NULL,
  `erd_score` double NOT NULL,
  `cfs_score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_reco`
--

CREATE TABLE `user_reco` (
  `uid` varchar(100) NOT NULL,
  `pid` varchar(100) NOT NULL,
  `score` double NOT NULL,
  `time_created` int(11) NOT NULL,
  `time_updated` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_tag_score`
--

CREATE TABLE `user_tag_score` (
  `handle` varchar(100) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `problem`
--
ALTER TABLE `problem`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `name` (`name`),
  ADD KEY `pid` (`pid`),
  ADD KEY `contestId` (`contestId`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `ptag`
--
ALTER TABLE `ptag`
  ADD PRIMARY KEY (`pid`,`tag`),
  ADD KEY `tag` (`tag`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag`),
  ADD UNIQUE KEY `tag` (`tag`,`description`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9059;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ptag`
--
ALTER TABLE `ptag`
  ADD CONSTRAINT `ptag_ibfk_2` FOREIGN KEY (`tag`) REFERENCES `tag` (`tag`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
