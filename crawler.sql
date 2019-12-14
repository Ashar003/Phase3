-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2019 at 10:32 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

/*Database Template for Crawler using phpMyAdmin

Potential Issues:
timeToIndex, timeToSearch need to be tracked in seconds, will be stored in tables as INT values
Foreign keys for page_word: pageID and wordID are set.*/

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


--
-- Database: `crawler`
--

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `pageID` int(100) NOT NULL,
  `url` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `lastModified` date NOT NULL,
  `lastIndexed` date NOT NULL,
  `timeToIndex` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_word`
--

CREATE TABLE `page_word` (
  `pageWordID` int(100) NOT NULL,
  `pageID` int(100) NOT NULL,
  `wordID` int(100) NOT NULL,
  `freq` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE `search` (
  `searchID` int(100) NOT NULL,
  `terms` varchar(250) NOT NULL,
  `count` int(100) NOT NULL,
  `searchDate` date NOT NULL,
  `timeToSearch` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `word`
--

CREATE TABLE `word` (
  `wordID` int(100) NOT NULL,
  `wordName` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`pageID`);

--
-- Indexes for table `page_word`
--
ALTER TABLE `page_word`
  ADD PRIMARY KEY (`pageWordID`),
  ADD KEY `pageID` (`pageID`),
  ADD KEY `pageID_2` (`pageID`),
  ADD KEY `wordID` (`wordID`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`searchID`);

--
-- Indexes for table `word`
--
ALTER TABLE `word`
  ADD PRIMARY KEY (`wordID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `pageID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_word`
--
ALTER TABLE `page_word`
  MODIFY `pageWordID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `word`
--
ALTER TABLE `word`
  MODIFY `wordID` int(100) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `page_word`
--
ALTER TABLE `page_word`
  ADD CONSTRAINT `pageID` FOREIGN KEY (`pageID`) REFERENCES `page` (`pageID`),
  ADD CONSTRAINT `wordID` FOREIGN KEY (`wordID`) REFERENCES `word` (`wordID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
