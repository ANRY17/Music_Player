-- Database: `myspotify`
CREATE DATABASE IF NOT EXISTS `myspotify` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `myspotify`;

-- Table structure for table `groups`
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Table structure for table `singers`
CREATE TABLE `singers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `info` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `image` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Table structure for table `songs`
CREATE TABLE `songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `filePath` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `imgPath` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT current_timestamp(),
  `singerID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `singerID` (`singerID`),
  CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`singerID`) REFERENCES `singers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Table structure for table `users`
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `groupID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupID` (`groupID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`groupID`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- Table structure for table `favourites`
CREATE TABLE `favourites` (
  `uid` int(11) NOT NULL,
  `songID` int(11) NOT NULL,
  KEY `favourites_ibfk_1` (`uid`),
  KEY `favourites_ibfk_2` (`songID`),
  CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`songID`) REFERENCES `songs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

ALTER TABLE favourites ADD COLUMN favourite_id INT AUTO_INCREMENT PRIMARY KEY;


-- Insert data into table `groups`
INSERT INTO `groups` (`id`, `groupName`) VALUES
(1, 'admin'),
(2, 'user');

COMMIT; 
