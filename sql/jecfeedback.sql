-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2015 at 10:05 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jecfeedback`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentname` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `departmentname`) VALUES
(1, 'Civil Engineering Department');

-- --------------------------------------------------------

--
-- Table structure for table `loginusers`
--

CREATE TABLE IF NOT EXISTS `loginusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('admin','hod','faculty') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginusers_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `loginusers`
--

INSERT INTO `loginusers` (`id`, `name`, `email`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(10, 'sanjay kakoty', 'sbkakoty@gmail.com', '$2y$10$u3miS.Cm8/pxEkTcm3SLnuHu.oJFIKuIBrAPqtJs4kc8pJgif7cLm', '', 'gCojaU5BdYJ9Iw3xXWZIvJbxCajJS5FCrHYH1qI5YsDPqIXpGTFafzGv9EHH', '2015-08-30 13:00:00', '2015-11-30 04:34:31'),
(11, 'Sonjoy Borkakoty', 'pcsassam@gmail.com', '$2y$10$u3miS.Cm8/pxEkTcm3SLnuHu.oJFIKuIBrAPqtJs4kc8pJgif7cLm', '', 'lxZ7urRnTb8TPQ2gFxwUoybhYQSA3lyXbG1Fd4FWKE5TCDooxDrJVUdF5qu2', '2015-08-31 06:07:35', '2015-11-30 04:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_11_29_163454_create_loginusers_table', 1),
('2015_11_29_164019_create_departments_table', 2),
('2015_11_29_164210_create_teachers_table', 3),
('2015_11_30_073745_create_questionnairies_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `questionnairies`
--

CREATE TABLE IF NOT EXISTS `questionnairies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slno` int(11) NOT NULL,
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `marking` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `departmentid` int(10) NOT NULL,
  `semester` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `departmentid` (`departmentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subjectname`, `departmentid`, `semester`, `created_at`, `updated_at`) VALUES
(1, 'CSE', 1, 'I', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `subject_teachers`
--

CREATE TABLE IF NOT EXISTS `subject_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectid` int(10) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `teacherid` int(10) NOT NULL,
  `year` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `semester` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `subjectid` (`subjectid`,`departmentid`,`teacherid`),
  KEY `departmentid` (`departmentid`),
  KEY `teacherid` (`teacherid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phonenumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `departmentid` int(20) NOT NULL,
  `imagepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `departmentid` (`departmentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `designation`, `phonenumber`, `email`, `departmentid`, `imagepath`, `created_at`, `updated_at`) VALUES
(1, 'test', 'Professor', '9954099540', 'sbkakoty@gmail.com', 1, 'bookicon.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`departmentid`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD CONSTRAINT `subject_teachers_ibfk_1` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `subject_teachers_ibfk_2` FOREIGN KEY (`departmentid`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `subject_teachers_ibfk_3` FOREIGN KEY (`teacherid`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`departmentid`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
