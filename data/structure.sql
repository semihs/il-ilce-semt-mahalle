-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 30, 2016 at 07:18 PM
-- Server version: 5.7.11
-- PHP Version: 5.6.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `pttpk`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `slug` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `neighborhood`
--

CREATE TABLE `neighborhood` (
  `id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `part`
--

CREATE TABLE `part` (
  `id` int(11) NOT NULL,
  `neighborhood_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(210) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `neighborhood`
--
ALTER TABLE `neighborhood`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_id` (`district_id`);

--
-- Indexes for table `part`
--
ALTER TABLE `part`
  ADD PRIMARY KEY (`id`),
  ADD KEY `neighborhood_id` (`neighborhood_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `neighborhood`
--
ALTER TABLE `neighborhood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `part`
--
ALTER TABLE `part`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `neighborhood`
--
ALTER TABLE `neighborhood`
  ADD CONSTRAINT `neighborhood_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part`
--
ALTER TABLE `part`
  ADD CONSTRAINT `part_ibfk_1` FOREIGN KEY (`neighborhood_id`) REFERENCES `neighborhood` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
