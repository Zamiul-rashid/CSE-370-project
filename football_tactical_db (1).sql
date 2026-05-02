-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2026 at 09:51 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `football_tactical_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add club', 7, 'add_club'),
(26, 'Can change club', 7, 'change_club'),
(27, 'Can delete club', 7, 'delete_club'),
(28, 'Can view club', 7, 'view_club'),
(29, 'Can add competition', 8, 'add_competition'),
(30, 'Can change competition', 8, 'change_competition'),
(31, 'Can delete competition', 8, 'delete_competition'),
(32, 'Can view competition', 8, 'view_competition'),
(33, 'Can add formation', 9, 'add_formation'),
(34, 'Can change formation', 9, 'change_formation'),
(35, 'Can delete formation', 9, 'delete_formation'),
(36, 'Can view formation', 9, 'view_formation'),
(37, 'Can add person', 10, 'add_person'),
(38, 'Can change person', 10, 'change_person'),
(39, 'Can delete person', 10, 'delete_person'),
(40, 'Can view person', 10, 'view_person'),
(41, 'Can add season', 11, 'add_season'),
(42, 'Can change season', 11, 'change_season'),
(43, 'Can delete season', 11, 'delete_season'),
(44, 'Can view season', 11, 'view_season'),
(45, 'Can add stadium', 12, 'add_stadium'),
(46, 'Can change stadium', 12, 'change_stadium'),
(47, 'Can delete stadium', 12, 'delete_stadium'),
(48, 'Can view stadium', 12, 'view_stadium'),
(49, 'Can add tactic', 13, 'add_tactic'),
(50, 'Can change tactic', 13, 'change_tactic'),
(51, 'Can delete tactic', 13, 'delete_tactic'),
(52, 'Can view tactic', 13, 'view_tactic'),
(53, 'Can add coach', 14, 'add_coach'),
(54, 'Can change coach', 14, 'change_coach'),
(55, 'Can delete coach', 14, 'delete_coach'),
(56, 'Can view coach', 14, 'view_coach'),
(57, 'Can add manager', 15, 'add_manager'),
(58, 'Can change manager', 15, 'change_manager'),
(59, 'Can delete manager', 15, 'delete_manager'),
(60, 'Can view manager', 15, 'view_manager'),
(61, 'Can add player', 16, 'add_player'),
(62, 'Can change player', 16, 'change_player'),
(63, 'Can delete player', 16, 'delete_player'),
(64, 'Can view player', 16, 'view_player'),
(65, 'Can add match', 17, 'add_match'),
(66, 'Can change match', 17, 'change_match'),
(67, 'Can delete match', 17, 'delete_match'),
(68, 'Can view match', 17, 'view_match'),
(69, 'Can add transfer', 18, 'add_transfer'),
(70, 'Can change transfer', 18, 'change_transfer'),
(71, 'Can delete transfer', 18, 'delete_transfer'),
(72, 'Can view transfer', 18, 'view_transfer'),
(73, 'Can add player skills', 19, 'add_playerskills'),
(74, 'Can change player skills', 19, 'change_playerskills'),
(75, 'Can delete player skills', 19, 'delete_playerskills'),
(76, 'Can view player skills', 19, 'view_playerskills'),
(77, 'Can add match event', 20, 'add_matchevent'),
(78, 'Can change match event', 20, 'change_matchevent'),
(79, 'Can delete match event', 20, 'delete_matchevent'),
(80, 'Can view match event', 20, 'view_matchevent'),
(81, 'Can add lineup entry', 21, 'add_lineupentry'),
(82, 'Can change lineup entry', 21, 'change_lineupentry'),
(83, 'Can delete lineup entry', 21, 'delete_lineupentry'),
(84, 'Can view lineup entry', 21, 'view_lineupentry'),
(85, 'Can add competition edition', 22, 'add_competitionedition'),
(86, 'Can change competition edition', 22, 'change_competitionedition'),
(87, 'Can delete competition edition', 22, 'delete_competitionedition'),
(88, 'Can view competition edition', 22, 'view_competitionedition');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `club_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `stadium_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`club_id`, `name`, `stadium_id`) VALUES
(1, 'Barcelona', 1),
(2, 'Liverpool', 2),
(3, 'Manchester City', 3),
(4, 'Manchester United', 4),
(5, 'Chelsea', 5),
(6, 'Borussia Dortmund', 6);

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

CREATE TABLE `coach` (
  `person_id` int(11) NOT NULL,
  `license_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `competition`
--

CREATE TABLE `competition` (
  `comp_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type_flag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competition`
--

INSERT INTO `competition` (`comp_id`, `name`, `type_flag`) VALUES
(1, 'La Liga', 'League'),
(2, 'Premier League', 'League'),
(3, 'UEFA Champions League', 'Cup'),
(4, 'Bundesliga', 'League'),
(5, 'FA Cup', 'Cup');

-- --------------------------------------------------------

--
-- Table structure for table `competition_edition`
--

CREATE TABLE `competition_edition` (
  `comp_id` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competition_edition`
--

INSERT INTO `competition_edition` (`comp_id`, `year`) VALUES
(1, 2008),
(1, 2009),
(1, 2010),
(1, 2011),
(1, 2012),
(1, 2013),
(2, 2010),
(2, 2011),
(2, 2012),
(2, 2013),
(2, 2014),
(2, 2015),
(2, 2016),
(2, 2017),
(2, 2018),
(2, 2019),
(2, 2020),
(2, 2021),
(2, 2022),
(2, 2023),
(3, 2008),
(3, 2009),
(3, 2010),
(3, 2011),
(3, 2012),
(3, 2013),
(3, 2014),
(3, 2015),
(3, 2018),
(3, 2019),
(3, 2021),
(3, 2022),
(4, 2010),
(4, 2011),
(4, 2012),
(4, 2013),
(4, 2014),
(4, 2015),
(4, 2016),
(4, 2017),
(4, 2018),
(4, 2019),
(4, 2020),
(4, 2021),
(4, 2022),
(4, 2023),
(5, 2010),
(5, 2012),
(5, 2014),
(5, 2016),
(5, 2018),
(5, 2020),
(5, 2022);

-- --------------------------------------------------------

--
-- Table structure for table `core_season`
--

CREATE TABLE `core_season` (
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `core_season`
--

INSERT INTO `core_season` (`year`) VALUES
(2008),
(2009),
(2010),
(2011),
(2012),
(2013),
(2014),
(2015),
(2016),
(2017),
(2018),
(2019),
(2020),
(2021),
(2022),
(2023);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'core', 'club'),
(14, 'core', 'coach'),
(8, 'core', 'competition'),
(22, 'core', 'competitionedition'),
(9, 'core', 'formation'),
(21, 'core', 'lineupentry'),
(15, 'core', 'manager'),
(17, 'core', 'match'),
(20, 'core', 'matchevent'),
(10, 'core', 'person'),
(16, 'core', 'player'),
(19, 'core', 'playerskills'),
(11, 'core', 'season'),
(12, 'core', 'stadium'),
(13, 'core', 'tactic'),
(18, 'core', 'transfer'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-04-30 06:17:24.110584'),
(2, 'auth', '0001_initial', '2026-04-30 06:17:24.878350'),
(3, 'admin', '0001_initial', '2026-04-30 06:17:25.030655'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-04-30 06:17:25.041969'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-04-30 06:17:25.055246'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-04-30 06:17:25.120932'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-04-30 06:17:25.190137'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-04-30 06:17:25.213480'),
(9, 'auth', '0004_alter_user_username_opts', '2026-04-30 06:17:25.225258'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-04-30 06:17:25.275989'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-04-30 06:17:25.286110'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-04-30 06:17:25.299919'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-04-30 06:17:25.318506'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-04-30 06:17:25.339555'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-04-30 06:17:25.370761'),
(16, 'auth', '0011_update_proxy_permissions', '2026-04-30 06:17:25.387344'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-04-30 06:17:25.406932'),
(18, 'sessions', '0001_initial', '2026-04-30 06:17:25.463739'),
(19, 'core', '0001_initial', '2026-04-30 06:26:27.345041');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `formation`
--

CREATE TABLE `formation` (
  `formation_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `formation`
--

INSERT INTO `formation` (`formation_id`, `name`, `description`) VALUES
(1, '4-3-3', 'Four defenders, three midfielders, three forwards'),
(2, '4-4-2', 'Four defenders, four midfielders, two forwards'),
(3, '3-4-3', 'Three defenders, four midfielders, three forwards'),
(4, '4-2-3-1', 'Four defenders, two defensive mids, three attackers, one striker'),
(5, '3-5-2', 'Three defenders, five midfielders, two forwards'),
(6, '4-3-2-1', 'Christmas Tree formation'),
(7, '5-3-2', 'Five defenders, three midfielders, two forwards');

-- --------------------------------------------------------

--
-- Table structure for table `lineup_entry`
--

CREATE TABLE `lineup_entry` (
  `match_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `position` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lineup_entry`
--

INSERT INTO `lineup_entry` (`match_id`, `person_id`, `position`) VALUES
(1, 1, 'Forward'),
(1, 3, 'Midfielder'),
(1, 4, 'Midfielder'),
(1, 11, 'Midfielder'),
(2, 1, 'Forward'),
(2, 3, 'Midfielder'),
(2, 4, 'Midfielder'),
(3, 6, 'Forward'),
(3, 7, 'Defender'),
(3, 12, 'Forward'),
(3, 13, 'Forward'),
(3, 14, 'Defender'),
(4, 8, 'Midfielder'),
(5, 6, 'Forward'),
(5, 12, 'Forward'),
(5, 13, 'Forward');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `person_id` int(11) NOT NULL,
  `philosophy` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`person_id`, `philosophy`) VALUES
(9, 'Possession-based football with high pressing and positional play'),
(10, 'Gegenpressing, vertical passing, and high intensity attacking football');

-- --------------------------------------------------------

--
-- Table structure for table `match`
--

CREATE TABLE `match` (
  `match_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `home_club_id` int(11) DEFAULT NULL,
  `away_club_id` int(11) DEFAULT NULL,
  `comp_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `formation_id` int(11) DEFAULT NULL,
  `tactic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `match`
--

INSERT INTO `match` (`match_id`, `date`, `home_club_id`, `away_club_id`, `comp_id`, `year`, `formation_id`, `tactic_id`) VALUES
(1, '2008-05-10', 1, 4, 3, 2008, 1, 1),
(2, '2011-05-28', 1, 4, 3, 2011, 3, 1),
(3, '2019-05-07', 2, 1, 3, 2019, 4, 2),
(4, '2020-09-10', 3, 2, 2, 2020, 1, 2),
(5, '2022-04-10', 2, 3, 2, 2022, 4, 2),
(6, '2023-03-15', 3, 5, 2, 2023, 1, 2),
(7, '2013-04-01', 6, 1, 3, 2013, 5, 4),
(8, '2021-05-29', 3, 5, 3, 2021, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `match_event`
--

CREATE TABLE `match_event` (
  `match_id` int(11) NOT NULL,
  `event_seq` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `minute` int(11) DEFAULT NULL,
  `x` decimal(5,2) DEFAULT NULL,
  `y` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `match_event`
--

INSERT INTO `match_event` (`match_id`, `event_seq`, `person_id`, `type`, `minute`, `x`, `y`) VALUES
(1, 1, 1, 'Goal', 10, '85.50', '34.20'),
(1, 2, 3, 'Assist', 10, '75.00', '30.00'),
(1, 3, 2, 'Yellow Card', 55, '50.00', '50.00'),
(2, 1, 1, 'Goal', 27, '88.00', '36.00'),
(2, 2, 4, 'Assist', 27, '78.00', '32.00'),
(3, 1, 6, 'Goal', 25, '87.00', '35.00'),
(3, 2, 6, 'Goal', 79, '89.00', '33.00'),
(4, 1, 8, 'Goal', 60, '82.00', '38.00'),
(5, 1, 6, 'Goal', 30, '86.00', '34.00'),
(5, 2, 12, 'Goal', 52, '84.00', '36.00');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `first_name`, `last_name`) VALUES
(1, 'Lionel', 'Messi'),
(2, 'Cristiano', 'Ronaldo'),
(3, 'Andres', 'Iniesta'),
(4, 'Xavi', 'Hernandez'),
(5, 'Neymar', 'Jr'),
(6, 'Mohamed', 'Salah'),
(7, 'Virgil', 'Van Dijk'),
(8, 'Kevin', 'De Bruyne'),
(9, 'Pep', 'Guardiola'),
(10, 'Jurgen', 'Klopp'),
(11, 'Sergio', 'Busquets'),
(12, 'Sadio', 'Mane'),
(13, 'Roberto', 'Firmino'),
(14, 'Trent', 'Alexander-Arnold'),
(15, 'Erling', 'Haaland');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `person_id` int(11) NOT NULL,
  `market_value` decimal(15,2) DEFAULT NULL,
  `save_ratio` decimal(5,2) DEFAULT NULL,
  `stamina_rating` int(11) DEFAULT NULL,
  `GK_flag` tinyint(1) DEFAULT NULL,
  `outfield_flag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`person_id`, `market_value`, `save_ratio`, `stamina_rating`, `GK_flag`, `outfield_flag`) VALUES
(1, '150000000.00', NULL, 90, 0, 1),
(2, '120000000.00', NULL, 92, 0, 1),
(3, '80000000.00', NULL, 85, 0, 1),
(4, '75000000.00', NULL, 83, 0, 1),
(5, '180000000.00', NULL, 88, 0, 1),
(6, '130000000.00', NULL, 89, 0, 1),
(7, '85000000.00', NULL, 86, 0, 1),
(8, '140000000.00', NULL, 91, 0, 1),
(11, '60000000.00', NULL, 82, 0, 1),
(12, '100000000.00', NULL, 90, 0, 1),
(13, '70000000.00', NULL, 84, 0, 1),
(14, '90000000.00', NULL, 87, 0, 1),
(15, '200000000.00', NULL, 93, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_skills`
--

CREATE TABLE `player_skills` (
  `person_id` int(11) NOT NULL,
  `skill` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player_skills`
--

INSERT INTO `player_skills` (`person_id`, `skill`) VALUES
(1, 'Dribbling'),
(1, 'Finishing'),
(1, 'Free Kick'),
(2, 'Finishing'),
(2, 'Heading'),
(2, 'Long Shot'),
(3, 'Dribbling'),
(3, 'Passing'),
(3, 'Vision'),
(4, 'Passing'),
(4, 'Positioning'),
(4, 'Vision'),
(6, 'Dribbling'),
(6, 'Finishing'),
(6, 'Pace'),
(7, 'Aerial Duels'),
(7, 'Defending'),
(7, 'Leadership'),
(8, 'Long Shot'),
(8, 'Passing'),
(8, 'Vision'),
(15, 'Finishing'),
(15, 'Heading'),
(15, 'Pace');

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

CREATE TABLE `season` (
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `season`
--

INSERT INTO `season` (`year`) VALUES
(2008),
(2009),
(2010),
(2011),
(2012),
(2013),
(2014),
(2015),
(2016),
(2017),
(2018),
(2019),
(2020),
(2021),
(2022),
(2023);

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

CREATE TABLE `stadium` (
  `stadium_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stadium`
--

INSERT INTO `stadium` (`stadium_id`, `name`, `capacity`) VALUES
(1, 'Camp Nou', 99354),
(2, 'Anfield', 53394),
(3, 'Etihad Stadium', 53400),
(4, 'Old Trafford', 74140),
(5, 'Stamford Bridge', 40343),
(6, 'Signal Iduna Park', 81365);

-- --------------------------------------------------------

--
-- Table structure for table `tactic`
--

CREATE TABLE `tactic` (
  `tactic_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tactic`
--

INSERT INTO `tactic` (`tactic_id`, `name`, `description`) VALUES
(1, 'Tiki-Taka', 'Short passing and movement, high possession'),
(2, 'High Press', 'Aggressive pressing high up the pitch'),
(3, 'Counter Attack', 'Deep defending and fast transitions'),
(4, 'Gegenpressing', 'Immediate press after losing possession'),
(5, 'Park the Bus', 'Extreme defensive shape'),
(6, 'Total Football', 'Fluid positional interchange');

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `transfer_id` int(11) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `from_club` int(11) DEFAULT NULL,
  `to_club` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transfer`
--

INSERT INTO `transfer` (`transfer_id`, `amount`, `date`, `player_id`, `from_club`, `to_club`) VALUES
(1, '222000000.00', '2017-08-03', 5, 1, 5),
(2, '180000000.00', '2018-07-01', 6, 5, 2),
(3, '75000000.00', '2019-06-01', 7, 4, 2),
(4, '200000000.00', '2022-07-01', 15, 6, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`club_id`),
  ADD KEY `stadium_id` (`stadium_id`);

--
-- Indexes for table `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`comp_id`);

--
-- Indexes for table `competition_edition`
--
ALTER TABLE `competition_edition`
  ADD PRIMARY KEY (`comp_id`,`year`),
  ADD KEY `year` (`year`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`formation_id`);

--
-- Indexes for table `lineup_entry`
--
ALTER TABLE `lineup_entry`
  ADD PRIMARY KEY (`match_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `home_club_id` (`home_club_id`),
  ADD KEY `away_club_id` (`away_club_id`),
  ADD KEY `comp_id` (`comp_id`),
  ADD KEY `year` (`year`),
  ADD KEY `formation_id` (`formation_id`),
  ADD KEY `tactic_id` (`tactic_id`);

--
-- Indexes for table `match_event`
--
ALTER TABLE `match_event`
  ADD PRIMARY KEY (`match_id`,`event_seq`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `player_skills`
--
ALTER TABLE `player_skills`
  ADD PRIMARY KEY (`person_id`,`skill`);

--
-- Indexes for table `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`year`);

--
-- Indexes for table `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`stadium_id`);

--
-- Indexes for table `tactic`
--
ALTER TABLE `tactic`
  ADD PRIMARY KEY (`tactic_id`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`transfer_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `from_club` (`from_club`),
  ADD KEY `to_club` (`to_club`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `competition`
--
ALTER TABLE `competition`
  MODIFY `comp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `formation`
--
ALTER TABLE `formation`
  MODIFY `formation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `match`
--
ALTER TABLE `match`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `stadium`
--
ALTER TABLE `stadium`
  MODIFY `stadium_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tactic`
--
ALTER TABLE `tactic`
  MODIFY `tactic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `club_ibfk_1` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`stadium_id`);

--
-- Constraints for table `coach`
--
ALTER TABLE `coach`
  ADD CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `competition_edition`
--
ALTER TABLE `competition_edition`
  ADD CONSTRAINT `competition_edition_ibfk_1` FOREIGN KEY (`comp_id`) REFERENCES `competition` (`comp_id`),
  ADD CONSTRAINT `competition_edition_ibfk_2` FOREIGN KEY (`year`) REFERENCES `season` (`year`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `lineup_entry`
--
ALTER TABLE `lineup_entry`
  ADD CONSTRAINT `lineup_entry_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_id`),
  ADD CONSTRAINT `lineup_entry_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`home_club_id`) REFERENCES `club` (`club_id`),
  ADD CONSTRAINT `match_ibfk_2` FOREIGN KEY (`away_club_id`) REFERENCES `club` (`club_id`),
  ADD CONSTRAINT `match_ibfk_3` FOREIGN KEY (`comp_id`) REFERENCES `competition` (`comp_id`),
  ADD CONSTRAINT `match_ibfk_4` FOREIGN KEY (`year`) REFERENCES `season` (`year`),
  ADD CONSTRAINT `match_ibfk_5` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`formation_id`),
  ADD CONSTRAINT `match_ibfk_6` FOREIGN KEY (`tactic_id`) REFERENCES `tactic` (`tactic_id`);

--
-- Constraints for table `match_event`
--
ALTER TABLE `match_event`
  ADD CONSTRAINT `match_event_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_id`),
  ADD CONSTRAINT `match_event_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`person_id`),
  ADD CONSTRAINT `transfer_ibfk_2` FOREIGN KEY (`from_club`) REFERENCES `club` (`club_id`),
  ADD CONSTRAINT `transfer_ibfk_3` FOREIGN KEY (`to_club`) REFERENCES `club` (`club_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
