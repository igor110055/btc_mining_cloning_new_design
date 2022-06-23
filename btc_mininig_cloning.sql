-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2022 at 09:13 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `btc_mininig_cloning`
--

-- --------------------------------------------------------

--
-- Table structure for table `f_admins`
--

CREATE TABLE `f_admins` (
  `uid` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_admins`
--

INSERT INTO `f_admins` (`uid`, `username`, `fullname`, `email`, `phone_number`, `password`, `avatar`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Itodo Gabriel Ejeh', 'itodogabriel59@gmail.com', '09129079450', '$2a$09$yn1AkZl8gQk57NxUpbTElesjWwzZTWRI/1NwKdON1HQkNpJ6y7Z7W', '/img/avatar/avatar-21032257387.jpg', 1, '2021-11-05 20:11:38', '2022-02-03 09:01:00'),
(4, 'super', 'super', 'testing@gmail.com', '0912907219450', '$2a$09$OczLcHx7lZQd1cgbLLmTrewUUx.nwEoZAuDembLxXI00mVEobyQZ6', '/img/avatar/avatar-21032257387.jpg', 1, '2021-11-05 20:11:38', '2021-11-12 17:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `f_bonus`
--

CREATE TABLE `f_bonus` (
  `b_id` bigint(20) UNSIGNED NOT NULL,
  `b_register_bonus` decimal(25,19) NOT NULL DEFAULT 0.0000000000000000000,
  `b_share_bonus` decimal(25,19) NOT NULL DEFAULT 0.0000000000000000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_bonus`
--

INSERT INTO `f_bonus` (`b_id`, `b_register_bonus`, `b_share_bonus`) VALUES
(1, '2000.0000000000000000000', '250.0000000000000000000');

-- --------------------------------------------------------

--
-- Table structure for table `f_coupons`
--

CREATE TABLE `f_coupons` (
  `c_id` bigint(20) UNSIGNED NOT NULL,
  `c_code` varchar(255) NOT NULL,
  `c_amount` decimal(25,19) NOT NULL,
  `c_author` bigint(20) NOT NULL,
  `c_usedby` bigint(20) DEFAULT NULL,
  `c_status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_coupons`
--

INSERT INTO `f_coupons` (`c_id`, `c_code`, `c_amount`, `c_author`, `c_usedby`, `c_status`) VALUES
(2, 'CP38af16c07e61', '15.0000000000000000000', 2507, NULL, 0),
(3, 'CP90f649c574d9', '15.0000000000000000000', 2507, NULL, 0),
(4, 'CPb22da99fd20a', '15.0000000000000000000', 2507, 12221, 1),
(7, 'CPe1ea2850c498', '10.0000000000000000000', 2, NULL, 0),
(8, 'CPf49195357450', '10.0000000000000000000', 2, NULL, 0),
(9, 'CPba6c77d3c2be', '10.0000000000000000000', 2, NULL, 0),
(10, 'CP5af9bd45f646', '10.0000000000000000000', 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `f_earning_history`
--

CREATE TABLE `f_earning_history` (
  `h_id` bigint(20) UNSIGNED NOT NULL,
  `h_user_id` bigint(20) NOT NULL,
  `h_amount` decimal(25,19) NOT NULL,
  `h_text` varchar(255) NOT NULL,
  `h_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_earning_history`
--

INSERT INTO `f_earning_history` (`h_id`, `h_user_id`, `h_amount`, `h_text`, `h_created_at`) VALUES
(1, 1, '2000.0000000000000000000', 'Registration Bonus', '2022-03-23 10:37:07'),
(2, 2, '2000.0000000000000000000', 'Registration Bonus', '2022-06-22 11:02:01'),
(3, 2, '2000.0000000000000000000', 'Registration Bonus', '2022-06-22 12:34:58'),
(4, 2, '1.0000000000000000000', 'Airdrop Bonus', '2022-06-22 13:39:20'),
(5, 3, '2000.0000000000000000000', 'Registration Bonus', '2022-06-22 14:01:05'),
(6, 2, '3.5000000000000000000', 'Referral Bonus', '2022-06-22 14:01:05'),
(7, 2, '250.0000000000000000000', 'Share Bonus', '2022-06-23 03:06:57'),
(8, 2, '250.0000000000000000000', 'Share Bonus', '2022-06-23 03:13:59'),
(9, 2, '250.0000000000000000000', 'Share Bonus', '2022-06-23 03:14:43'),
(10, 2, '1.0000000000000000000', 'Airdrop Bonus', '2022-06-23 05:42:27'),
(11, 2, '1.0000000000000000000', 'Airdrop Bonus', '2022-06-23 05:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `f_mining_history`
--

CREATE TABLE `f_mining_history` (
  `m_id` bigint(20) UNSIGNED NOT NULL,
  `m_user_id` bigint(20) NOT NULL,
  `m_start_time` varchar(255) NOT NULL,
  `m_end_time` varchar(255) NOT NULL,
  `m_amount` decimal(25,19) NOT NULL DEFAULT 0.0000000000000000000,
  `m_seconds` bigint(20) NOT NULL DEFAULT 0,
  `m_text` varchar(20) NOT NULL,
  `m_balance` decimal(25,19) NOT NULL DEFAULT 0.0000000000000000000,
  `m_status` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_mining_history`
--

INSERT INTO `f_mining_history` (`m_id`, `m_user_id`, `m_start_time`, `m_end_time`, `m_amount`, `m_seconds`, `m_text`, `m_balance`, `m_status`) VALUES
(4, 2, '2022-06-22 20:54:15.317', '2022-06-22 20:55:15.317', '200.0000000000000000000', 60, 'Mining Reward', '200.0000000000000000000', 1),
(5, 2, '2022-06-22 20:55:32.335', '2022-06-22 20:56:32.335', '200.0000000000000000000', 60, 'Mining Reward', '400.0000000000000000000', 1),
(6, 2, '2022-06-23 06:12:45.108', '2022-06-23 06:13:45.108', '200.0000000000000000000', 60, 'Mining Reward', '600.0000000000000000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `f_notice`
--

CREATE TABLE `f_notice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notice_title` varchar(255) DEFAULT NULL,
  `notice_body` text DEFAULT NULL,
  `notice_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_notice`
--

INSERT INTO `f_notice` (`id`, `notice_title`, `notice_body`, `notice_status`, `created_at`, `updated_at`) VALUES
(1, 'Announcement!!!', '<p>Dear Investors,</p><p>&nbsp;Good day all, we really appreciate you all for been trust us for this great platform. Bartanetwork is a simple system and well understanding.</p><p>&nbsp;We using this media to tell all users to join our official Telegram group all updates about Bartanetwork we be drop in the group.<font color=\"#0000ff\"> <a href=\"https://t.me/bartanetwork\" target=\"_blank\"><b>Click Here</b></a></font> to our official group.</p><p>Signed and approved by CEO</p><p>Bartanetwork management.</p>', 1, '2021-11-09 06:14:34', '2022-02-08 02:08:46');

-- --------------------------------------------------------

--
-- Table structure for table `f_pages`
--

CREATE TABLE `f_pages` (
  `page_id` bigint(20) NOT NULL,
  `page_title` text NOT NULL,
  `page_slug` text NOT NULL,
  `page_author` bigint(20) NOT NULL,
  `page_status` tinyint(4) DEFAULT 1,
  `page_description` longtext NOT NULL,
  `page_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `page_updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_pages`
--

INSERT INTO `f_pages` (`page_id`, `page_title`, `page_slug`, `page_author`, `page_status`, `page_description`, `page_created_at`, `page_updated_at`) VALUES
(3, 'How-it-works', 'how-it-works', 1, 1, '<p>Barta Network&nbsp;is a digital currency project that aims to keep cryptocurrency mining accessible as the centralisation of first generation currencies like bitcoin has put them beyond the reach of everyday users. The Barta Network, developed by Emmanuel and Bartacoin developer team, enables users to mine coins using its web/mobile phone website, validating transactions on a distributed record.<b><span class=\"gL9Hy\"><i><br>Premium</i></span> Featured in Barta-network are:<br>1.</b> Spillover<br><b>2</b>. Mining of Barta coin<br><b>3</b>. Referring of your friends<br><b>4.</b> Indirect Earning, 1-4 generation<br><b>5.</b> Spread the news of bartanetwork<br><b>6.</b> Welcome bonus<br>Bartanetwork is Decentralized and build on <b>Binance Smart Chain (BSC)</b> bartanetwork is fully unable to control by individuals.<br><br><b>How to subscribe and earn on Bartanetwork:<br></b><br>1. Mask package: <b>$10</b> one time payment<br>&nbsp;&nbsp;&nbsp; Mine <b>$----</b>&nbsp;every 10 hours<br>&nbsp;&nbsp;&nbsp; You earn <b>$----</b>&nbsp;daily or more depends on how you active daily. <br><br>2. Mask Mini package: <b>$15</b> one time payment<br>&nbsp;&nbsp;&nbsp;&nbsp; Mine <b>$----</b>&nbsp;every 10 hours<br>&nbsp;&nbsp;&nbsp;&nbsp; You earn <b>$----</b>&nbsp;daily or more depends on how you active daily. <br><br>3. Barta Mini package: <b>$---</b>&nbsp;one time payment<br>&nbsp;&nbsp;&nbsp; Mine <b>$-----</b>&nbsp;every 24 hours<br>&nbsp;&nbsp;&nbsp; You earn <b>$---</b>&nbsp;daily or more depends on how you active daily <br><br>4. Bart King package: <b>$25</b> one time payment<br>&nbsp;&nbsp;&nbsp;&nbsp; Mine <b>$----</b>&nbsp;every 24 hours<br>&nbsp; &nbsp; &nbsp;Auto Mining Activated<br>&nbsp;&nbsp;&nbsp;&nbsp; You earn <b>$----</b>&nbsp;daily or more depends on how you active daily.<br><br><b>Referring/Other activities on Bartanetwork.<br></b><br>1. You earn from direct referral when you refer anyone to Bartanetwork you get <b>60%</b> of the referral bonus instantly. <br><br>2. You earn from indirect referral, is when your downline peter refer John you as upline get <b>10%</b> instantly in 1st generation. When John refer Kate you as upline again get <b>10%</b> instantly in 2nd generation. When Kate refer Cecilia you as upline again get <b>7%</b> instantly in 3rd generation <br><br>3. You earn from spillover on the Bartanetwork, Bartanetwork give users spillover all the time subscribe enjoy the Spillover, So join Bartanetwork Today. <br><br>4. You earn from share Bartanetwork content on social or any place. Bartanetwork give you chance for sharing their blogs and make money from it. <br><br>5. Bartanetwork give you welcome bonus when you first became subscriber\'s on Bartanetwork. <br><br>Bartanetwork make the system easy for users to make more money.<br><br><b>How to get paid from Bartanetwork.</b> <br><br>Don\'t be panic, Bartanetwork offer multiple ways to withdraw your money. You can make use of our available withdrawal method to withdraw your fund you can use <b>bank account transfer</b>, <b>MTN Momo</b> or crypto wallet like <b>USTD</b> and <b>BNB</b>. <br><br>You can participate on Bartanetwork from any country in this world, if you are in Africa and you don\'t want to use you local bank to withdraw from Bartanetwork you can make use of your <b>MTN mobile money account</b> to place withdraw on Bartanetwork and you get your account credited. <br><br>Minimum withdrawal for none referral is <b>$30</b>&nbsp;on Bartanetwork, withdraw portal is open every 30th of the months.<br>Mininmum Withdrawal for Affiliate is <b>$20 </b>on bartanetwork and withdrawal of everyday.<br><br><b>Bartanetwork Wallet Setup:<br><br>1. Bank transfer setup<br>2. </b><span><b>Cryptocurrency wallet Setup<br>3. MTN MOMO wallet Setup</b></span><br><br><b>Currency Rate are:</b>&nbsp;<br><b>1. Nigeria: 500/$<br>2. Cameroon: 650/$</b></p><p><b>Thank You for Your Understanding.</b></p><p><span><br></span></p>', '2021-11-13 11:44:04', '2022-02-04 07:33:53'),
(4, 'About Us', 'about-us', 1, 1, '<p>Bartanetwork is a digital mining application designed to be a highly secure platform design for future miners. Start mining and achieve the highest level of Hashrate. Bartanetwork is a dual-purpose platform made up of subsidiaries that provide an opportunity to utilize bartanetwork Virtual mining technique, which is intended for evaluating mining revenue and as well as conversion of bartanetwork units to real word money and cash out as at when due. It is one of the leading cryptocurrency mining platforms, offering cryptocurrency mining capacities in every range - for newcomers. Our mission is to make acquiring cryptocurrencies easy and fast for everyone. Bartanetwork  Decentralized mining platform based on smart contracts that&nbsp;connects people&nbsp;from all over the world and&nbsp;opens the limitless possibilities of the&nbsp;new economic financial system</p><p><br></p><p><br></p>', '2021-11-13 11:46:16', '2021-11-14 10:28:37'),
(5, 'Privacy Policy', 'privacy-policy', 1, 1, '<div class=\"content\">\n                            \n                            <div class=\"row\">\n                                <div class=\"col-12 col-lg-9 mx-auto\">\n                                    <div class=\"translations-content-container\">\n<div class=\"container\">\n<div class=\"tab-content translations-content-item en visible\" id=\"en\">\n<h1>Privacy Policy</h1>\n<p>This Privacy Policy describes Our policies and procedures on the \ncollection, use and disclosure of Your information when You use the \nService and tells You about Your privacy rights and how the law protects\n You.\n</p><p>We use Your Personal data to provide and improve the Service. By \nusing the Service, You agree to the collection and use of information in\n accordance with this Privacy Policy. This Privacy Policy has been \ncreated with the help of the <a href=\"https://www.termsfeed.com/privacy-policy-generator/\" target=\"_blank\">Privacy Policy Generator</a>.</p>\n<h1>Interpretation and Definitions</h1>\n<h2>Interpretation</h2>\n<p>The words of which the initial letter is capitalized have meanings \ndefined under the following conditions. The following definitions shall \nhave the same meaning regardless of whether they appear in singular or \nin plural.</p>\n<h2>Definitions</h2>\n<p>For the purposes of this Privacy Policy:</p>\n<ul><li>\n<p><strong>Account</strong> means a unique account created for You to access our Service or parts of our Service.</p>\n</li><li>\n<p><strong>Company</strong> (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Bartanetwork.</p>\n</li><li>\n<p><strong>Cookies</strong> are small files that are placed on Your \ncomputer, mobile device or any other device by a website, containing the\n details of Your browsing history on that website among its many uses.</p>\n</li><li>\n<p><strong>Country</strong> refers to: Nigeria</p>\n</li><li>\n<p><strong>Device</strong> means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>\n</li><li>\n<p><strong>Personal Data</strong> is any information that relates to an identified or identifiable individual.</p>\n</li><li>\n<p><strong>Service</strong> refers to the Website.</p>\n</li><li>\n<p><strong>Service Provider</strong> means any natural or legal person \nwho processes the data on behalf of the Company. It refers to \nthird-party companies or individuals employed by the Company to \nfacilitate the Service, to provide the Service on behalf of the Company,\n to perform services related to the Service or to assist the Company in \nanalyzing how the Service is used.</p>\n</li><li>\n<p><strong>Third-party Social Media Service</strong> refers to any website or any social network website through which a User can log in or create an account to use the Service.</p>\n</li><li>\n<p><strong>Usage Data</strong> refers to data collected automatically, \neither generated by the use of the Service or from the Service \ninfrastructure itself (for example, the duration of a page visit).</p>\n</li><li>\n<p><strong>Website</strong> refers to bartanetwork.com, accessible from https://www.bartanetwork.com</p>\n</li><li>\n<p><strong>You</strong> means the individual accessing or using the \nService, or the company, or other legal entity on behalf of which such \nindividual is accessing or using the Service, as applicable.</p>\n</li></ul>\n<h2>Collecting and Using Your Personal Data</h2>\n<h2>Types of Data Collected</h2>\n<h3>Personal Data</h3>\n<p>While using Our Service, We may ask You to provide Us with certain \npersonally identifiable information that can be used to contact or \nidentify You. Personally identifiable information may include, but is \nnot limited to:</p>\n<ul><li>\n<p>Email address</p>\n</li><li>\n<p>First name and last name</p>\n</li><li>\n<p>Phone number</p>\n</li><li>\n<p>Address, State, Province, ZIP/Postal code, City</p>\n</li><li>\n<p>Usage Data</p>\n</li></ul>\n<h3>Usage Data</h3>\n<p>Usage Data is collected automatically when using the Service.</p>\n<p>Usage Data may include information such as Your Device\'s Internet \nProtocol address (e.g. IP address), browser type, browser version, the \npages of our Service that You visit, the time and date of Your visit, \nthe time spent on those pages, unique device identifiers and other \ndiagnostic data.</p>\n<p>When You access the Service by or through a mobile device, We may \ncollect certain information automatically, including, but not limited \nto, the type of mobile device You use, Your mobile device unique ID, the\n IP address of Your mobile device, Your mobile operating system, the \ntype of mobile Internet browser You use, unique device identifiers and \nother diagnostic data.</p>\n<p>We may also collect information that Your browser sends whenever You \nvisit our Service or when You access the Service by or through a mobile \ndevice.</p>\n<h3>Information from Third-Party Social Media Services</h3>\n<p>The Company allows You to create an account and log in to use the \nService through the following Third-party Social Media Services:</p>\n<ul><li>Google</li><li>Facebook</li><li>Twitter</li></ul>\n<p>If You decide to register through or otherwise grant us access to a \nThird-Party Social Media Service, We may collect Personal data that is \nalready associated with Your Third-Party Social Media Service\'s account,\n such as Your name, Your email address, Your activities or Your contact \nlist associated with that account.</p>\n<p>You may also have the option of sharing additional information with \nthe Company through Your Third-Party Social Media Service\'s account. If \nYou choose to provide such information and Personal Data, during \nregistration or otherwise, You are giving the Company permission to use,\n share, and store it in a manner consistent with this Privacy Policy.</p>\n<h3>Tracking Technologies and Cookies</h3>\n<p>We use Cookies and similar tracking technologies to track the \nactivity on Our Service and store certain information. Tracking \ntechnologies used are beacons, tags, and scripts to collect and track \ninformation and to improve and analyze Our Service. The technologies We \nuse may include:</p>\n<ul><li><strong>Cookies or Browser Cookies.</strong> A cookie is a small \nfile placed on Your Device. You can instruct Your browser to refuse all \nCookies or to indicate when a Cookie is being sent. However, if You do \nnot accept Cookies, You may not be able to use some parts of our \nService. Unless you have adjusted Your browser setting so that it will \nrefuse Cookies, our Service may use Cookies.</li><li><strong>Flash Cookies.</strong> Certain features of our Service may \nuse local stored objects (or Flash Cookies) to collect and store \ninformation about Your preferences or Your activity on our Service. \nFlash Cookies are not managed by the same browser settings as those used\n for Browser Cookies. For more information on how You can delete Flash \nCookies, please read \"Where can I change the settings for disabling, or \ndeleting local shared objects?\" available at <a href=\"https://helpx.adobe.com/flash-player/kb/disable-local-shared-objects-flash.html#main_Where_can_I_change_the_settings_for_disabling__or_deleting_local_shared_objects_\" rel=\"external nofollow noopener\" target=\"_blank\">https://helpx.adobe.com/flash-player/kb/disable-local-shared-objects-flash.html#main_Where_can_I_change_the_settings_for_disabling__or_deleting_local_shared_objects_</a></li><li><strong>Web Beacons.</strong> Certain sections of our Service and \nour emails may contain small electronic files known as web beacons (also\n referred to as clear gifs, pixel tags, and single-pixel gifs) that \npermit the Company, for example, to count users who have visited those \npages or opened an email and for other related website statistics (for \nexample, recording the popularity of a certain section and verifying \nsystem and server integrity).</li></ul>\n<p>Cookies can be \"Persistent\" or \"Session\" Cookies. Persistent Cookies \nremain on Your personal computer or mobile device when You go offline, \nwhile Session Cookies are deleted as soon as You close Your web browser.\n You can learn more about cookies here: <a href=\"https://www.termsfeed.com/privacy-policy-generator/#faq-8\" target=\"_blank\">Cookies by TermsFeed Generator</a>.</p>\n<p>We use both Session and Persistent Cookies for the purposes set out below:</p>\n<ul><li>\n<p><strong>Necessary / Essential Cookies</strong></p>\n<p>Type: Session Cookies</p>\n<p>Administered by: Us</p>\n<p>Purpose: These Cookies are essential to provide You with services \navailable through the Website and to enable You to use some of its \nfeatures. They help to authenticate users and prevent fraudulent use of \nuser accounts. Without these Cookies, the services that You have asked \nfor cannot be provided, and We only use these Cookies to provide You \nwith those services.</p>\n</li><li>\n<p><strong>Cookies Policy / Notice Acceptance Cookies</strong></p>\n<p>Type: Persistent Cookies</p>\n<p>Administered by: Us</p>\n<p>Purpose: These Cookies identify if users have accepted the use of cookies on the Website.</p>\n</li><li>\n<p><strong>Functionality Cookies</strong></p>\n<p>Type: Persistent Cookies</p>\n<p>Administered by: Us</p>\n<p>Purpose: These Cookies allow us to remember choices You make when You\n use the Website, such as remembering your login details or language \npreference. The purpose of these Cookies is to provide You with a more \npersonal experience and to avoid You having to re-enter your preferences\n every time You use the Website.</p>\n</li></ul>\n<p>For more information about the cookies we use and your choices \nregarding cookies, please visit our Cookies Policy or the Cookies \nsection of our Privacy Policy.</p>\n<h2>Use of Your Personal Data</h2>\n<p>The Company may use Personal Data for the following purposes:</p>\n<ul><li>\n<p><strong>To provide and maintain our Service</strong>, including to monitor the usage of our Service.</p>\n</li><li>\n<p><strong>To manage Your Account:</strong> to manage Your registration \nas a user of the Service. The Personal Data You provide can give You \naccess to different functionalities of the Service that are available to\n You as a registered user.</p>\n</li><li>\n<p><strong>For the performance of a contract:</strong> the development, \ncompliance and undertaking of the purchase contract for the products, \nitems or services You have purchased or of any other contract with Us \nthrough the Service.</p>\n</li><li>\n<p><strong>To contact You:</strong> To contact You by email, telephone \ncalls, SMS, or other equivalent forms of electronic communication, such \nas a mobile application\'s push notifications regarding updates or \ninformative communications related to the functionalities, products or \ncontracted services, including the security updates, when necessary or \nreasonable for their implementation.</p>\n</li><li>\n<p><strong>To provide You</strong> with news, special offers and general\n information about other goods, services and events which we offer that \nare similar to those that you have already purchased or enquired about \nunless You have opted not to receive such information.</p>\n</li><li>\n<p><strong>To manage Your requests:</strong> To attend and manage Your requests to Us.</p>\n</li><li>\n<p><strong>For business transfers:</strong> We may use Your information \nto evaluate or conduct a merger, divestiture, restructuring, \nreorganization, dissolution, or other sale or transfer of some or all of\n Our assets, whether as a going concern or as part of bankruptcy, \nliquidation, or similar proceeding, in which Personal Data held by Us \nabout our Service users is among the assets transferred.</p>\n</li><li>\n<p><strong>For other purposes</strong>: We may use Your information for \nother purposes, such as data analysis, identifying usage trends, \ndetermining the effectiveness of our promotional campaigns and to \nevaluate and improve our Service, products, services, marketing and your\n experience.</p>\n</li></ul>\n<p>We may share Your personal information in the following situations:</p>\n<ul><li><strong>With Service Providers:</strong> We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.</li><li><strong>For business transfers:</strong> We may share or transfer \nYour personal information in connection with, or during negotiations of,\n any merger, sale of Company assets, financing, or acquisition of all or\n a portion of Our business to another company.</li><li><strong>With Affiliates:</strong> We may share Your information with\n Our affiliates, in which case we will require those affiliates to honor\n this Privacy Policy. Affiliates include Our parent company and any \nother subsidiaries, joint venture partners or other companies that We \ncontrol or that are under common control with Us.</li><li><strong>With business partners:</strong> We may share Your information with Our business partners to offer You certain products, services or promotions.</li><li><strong>With other users:</strong> when You share personal \ninformation or otherwise interact in the public areas with other users, \nsuch information may be viewed by all users and may be publicly \ndistributed outside. If You interact with other users or register \nthrough a Third-Party Social Media Service, Your contacts on the \nThird-Party Social Media Service may see Your name, profile, pictures \nand description of Your activity. Similarly, other users will be able to\n view descriptions of Your activity, communicate with You and view Your \nprofile.</li><li><strong>With Your consent</strong>: We may disclose Your personal information for any other purpose with Your consent.</li></ul>\n<h2>Retention of Your Personal Data</h2>\n<p>The Company will retain Your Personal Data only for as long as is \nnecessary for the purposes set out in this Privacy Policy. We will \nretain and use Your Personal Data to the extent necessary to comply with\n our legal obligations (for example, if we are required to retain your \ndata to comply with applicable laws), resolve disputes, and enforce our \nlegal agreements and policies.</p>\n<p>The Company will also retain Usage Data for internal analysis \npurposes. Usage Data is generally retained for a shorter period of time,\n except when this data is used to strengthen the security or to improve \nthe functionality of Our Service, or We are legally obligated to retain \nthis data for longer time periods.</p>\n<h2>Transfer of Your Personal Data</h2>\n<p>Your information, including Personal Data, is processed at the \nCompany\'s operating offices and in any other places where the parties \ninvolved in the processing are located. It means that this information \nmay be transferred to — and maintained on — computers located outside of\n Your state, province, country or other governmental jurisdiction where \nthe data protection laws may differ than those from Your jurisdiction.</p>\n<p>Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.</p>\n<p>The Company will take all steps reasonably necessary to ensure that \nYour data is treated securely and in accordance with this Privacy Policy\n and no transfer of Your Personal Data will take place to an \norganization or a country unless there are adequate controls in place \nincluding the security of Your data and other personal information.</p>\n<h2>Disclosure of Your Personal Data</h2>\n<h3>Business Transactions</h3>\n<p>If the Company is involved in a merger, acquisition or asset sale, \nYour Personal Data may be transferred. We will provide notice before \nYour Personal Data is transferred and becomes subject to a different \nPrivacy Policy.</p>\n<h3>Law enforcement</h3>\n<p>Under certain circumstances, the Company may be required to disclose \nYour Personal Data if required to do so by law or in response to valid \nrequests by public authorities (e.g. a court or a government agency).</p>\n<h3>Other legal requirements</h3>\n<p>The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:</p>\n<ul><li>Comply with a legal obligation</li><li>Protect and defend the rights or property of the Company</li><li>Prevent or investigate possible wrongdoing in connection with the Service</li><li>Protect the personal safety of Users of the Service or the public</li><li>Protect against legal liability</li></ul>\n<h2>Security of Your Personal Data</h2>\n<p>The security of Your Personal Data is important to Us, but remember \nthat no method of transmission over the Internet, or method of \nelectronic storage is 100% secure. While We strive to use commercially \nacceptable means to protect Your Personal Data, We cannot guarantee its \nabsolute security.</p>\n<h1>Children\'s Privacy</h1>\n<p>Our Service does not address anyone under the age of 13. We do not \nknowingly collect personally identifiable information from anyone under \nthe age of 13. If You are a parent or guardian and You are aware that \nYour child has provided Us with Personal Data, please contact Us. If We \nbecome aware that We have collected Personal Data from anyone under the \nage of 13 without verification of parental consent, We take steps to \nremove that information from Our servers.</p>\n<p>If We need to rely on consent as a legal basis for processing Your \ninformation and Your country requires consent from a parent, We may \nrequire Your parent\'s consent before We collect and use that \ninformation.</p>\n<h1>Links to Other Websites</h1>\n<p>Our Service may contain links to other websites that are not operated\n by Us. If You click on a third party link, You will be directed to that\n third party\'s site. We strongly advise You to review the Privacy Policy\n of every site You visit.</p>\n<p>We have no control over and assume no responsibility for the content,\n privacy policies or practices of any third party sites or services.</p>\n<h1>Changes to this Privacy Policy</h1>\n<p>We may update Our Privacy Policy from time to time. We will notify \nYou of any changes by posting the new Privacy Policy on this page.</p>\n<p>We will let You know via email and/or a prominent notice on Our \nService, prior to the change becoming effective and update the \"Last \nupdated\" date at the top of this Privacy Policy.</p>\n<p>You are advised to review this Privacy Policy periodically for any \nchanges. Changes to this Privacy Policy are effective when they are \nposted on this page.</p>\n<h1>Contact Us</h1>\n<p>If you have any questions about this Privacy Policy, You can contact us:</p>\n<ul><li>By email: support@bartanetwork.com</li><li>Office Address:667,South Ervay Street, Downtown PID, Dallas, Dallas Country, Texas, 75215, United State.<br></li><li>Web Livechat<br></li></ul>\n</div>\n</div>\n</div>\n                                </div>\n                            </div>\n                        </div>', '2021-11-13 11:47:38', '2021-11-14 10:09:04'),
(6, 'Terms of services', 'terms-of-services', 1, 1, '<h3 style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; color: rgb(51, 51, 51); margin-bottom: 18px; font-size: 24px;\"><span style=\"color: inherit; font-family: inherit; font-size: 20px;\">Website Terms and Conditions of Use</span></h3><h2 style=\"font-family: inherit; line-height: 1.1; color: inherit; margin-bottom: 18px; font-size: 16px;\">1. Terms</h2><h1 style=\"font-size: 36px; margin-bottom: 18px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; color: rgb(102, 102, 102);\"><div class=\"preview\" style=\"font-size: 14px;\"><p style=\"margin-bottom: 20px;\">By accessing this Website, accessible from https://www.bartanetwork.com/, you are agreeing to be bound by these Website Terms and Conditions of Use and agree that you are responsible for the agreement with any applicable local laws. If you disagree with any of these terms, you are prohibited from accessing this site. The materials contained in this Website are protected by copyright and trade mark law.</p></div></h1><h2 style=\"font-family: inherit; line-height: 1.1; color: inherit; margin-bottom: 18px; font-size: 16px;\">2. Use License</h2><h1 style=\"font-size: 36px; margin-bottom: 18px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; color: rgb(102, 102, 102);\"><div class=\"preview\" style=\"font-size: 14px;\"><p>Permission is granted to temporarily download one copy of the materials on Bartanetwork Technologies\'s Website for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:</p><ul style=\"margin-bottom: 10px;\"><li>modify or copy the materials;</li><li>use the materials for any commercial purpose or for any public display;</li><li>attempt to reverse engineer any software contained on Bartanetwork Technologies\'s Website;</li><li>remove any copyright or other proprietary notations from the materials; or</li><li>transferring the materials to another person or \"mirror\" the materials on any other server.</li></ul><p style=\"margin-bottom: 20px;\">This will let Bartanetwork Technologies to terminate upon violations of any of these restrictions. Upon termination, your viewing right will also be terminated and you should destroy any downloaded materials in your possession whether it is printed or electronic format. These Terms of Service has been created with the help of the&nbsp;<a href=\"https://www.termsofservicegenerator.net/\" style=\"color: rgb(102, 102, 102); text-decoration: none;\">Terms Of Service Generator</a>.</p></div></h1><h2 style=\"font-family: inherit; line-height: 1.1; color: inherit; margin-bottom: 18px; font-size: 16px;\">3. Disclaimer</h2><h1 style=\"font-size: 36px; margin-bottom: 18px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; color: rgb(102, 102, 102);\"><div class=\"preview\" style=\"font-size: 14px;\"><p style=\"margin-bottom: 20px;\">All the materials on Bartanetwork Technologies’s Website are provided \"as is\". Bartanetwork Technologies makes no warranties, may it be expressed or implied, therefore negates all other warranties. Furthermore, Bartanetwork Technologies does not make any representations concerning the accuracy or reliability of the use of the materials on its Website or otherwise relating to such materials or any sites linked to this Website.</p></div></h1><h2 style=\"font-family: inherit; line-height: 1.1; color: inherit; margin-bottom: 18px; font-size: 16px;\">4. Limitations</h2><h1 style=\"font-size: 36px; margin-bottom: 18px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; color: rgb(102, 102, 102);\"><div class=\"preview\" style=\"font-size: 14px;\"><p style=\"margin-bottom: 20px;\">Bartanetwork Technologies or its suppliers will not be hold accountable for any damages that will arise with the use or inability to use the materials on Bartanetwork Technologies’s Website, even if Bartanetwork Technologies or an authorize representative of this Website has been notified, orally or written, of the possibility of such damage. Some jurisdiction does not allow limitations on implied warranties or limitations of liability for incidental damages, these limitations may not apply to you.</p></div></h1><h2 style=\"font-family: inherit; line-height: 1.1; color: inherit; margin-bottom: 18px; font-size: 16px;\">5. Revisions and Errata</h2><h1 style=\"font-size: 36px; margin-bottom: 18px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; color: rgb(102, 102, 102);\"><div class=\"preview\" style=\"font-size: 14px;\"><p style=\"margin-bottom: 20px;\">The materials appearing on Bartanetwork Technologies’s Website may include technical, typographical, or photographic errors. Bartanetwork Technologies will not promise that any of the materials in this Website are accurate, complete, or current. Bartanetwork Technologies may change the materials contained on its Website at any time without notice. Bartanetwork Technologies does not make any commitment to update the materials.</p></div></h1><h2 style=\"font-family: inherit; line-height: 1.1; color: inherit; margin-bottom: 18px; font-size: 16px;\">6. Links</h2><h1 style=\"font-size: 36px; margin-bottom: 18px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; color: rgb(102, 102, 102);\"><div class=\"preview\" style=\"font-size: 14px;\"><p style=\"margin-bottom: 20px;\">Bartanetwork Technologies has not reviewed all of the sites linked to its Website and is not responsible for the contents of any such linked site. The presence of any link does not imply endorsement by Bartanetwork Technologies of the site. The use of any linked website is at the user’s own risk.</p></div></h1><h2 style=\"font-family: inherit; line-height: 1.1; color: inherit; margin-bottom: 18px; font-size: 16px;\">7. Site Terms of Use Modifications</h2><h1 style=\"font-size: 36px; margin-bottom: 18px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; color: rgb(102, 102, 102);\"><div class=\"preview\" style=\"font-size: 14px;\"><p style=\"margin-bottom: 20px;\">Bartanetwork Technologies may revise these Terms of Use for its Website at any time without prior notice. By using this Website, you are agreeing to be bound by the current version of these Terms and Conditions of Use.</p></div></h1><h2 style=\"font-family: inherit; line-height: 1.1; color: inherit; margin-bottom: 18px; font-size: 16px;\">8. Your Privacy</h2><h1 style=\"font-size: 36px; margin-bottom: 18px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; color: rgb(102, 102, 102);\"><div class=\"preview\" style=\"font-size: 14px;\"><p style=\"margin-bottom: 20px;\">Please read our Privacy Policy.</p></div></h1><h2 style=\"font-family: inherit; line-height: 1.1; color: inherit; margin-bottom: 18px; font-size: 16px;\">9. Governing Law</h2><h1 style=\"font-size: 36px; margin-bottom: 18px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.1; color: rgb(102, 102, 102);\"><div class=\"preview\" style=\"font-size: 14px;\"><p style=\"margin-bottom: 20px;\">Any claim related to Bartanetwork Technologies\'s Website shall be governed by the laws of ng without regards to its conflict of law provisions.</p></div></h1>', '2021-11-13 11:48:14', '2022-01-20 18:51:41'),
(7, 'Disclaimer', 'disclaimer', 1, 1, '<h2 style=\"margin-bottom: 18px; font-family: inherit; line-height: 1.1; color: inherit; font-size: 16px;\"><span style=\"font-size: 14px; color: rgb(102, 102, 102); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">All the materials on Bartanetwork Technologies’s Website are provided \"as is\". Bartanetwork Technologies makes no warranties, may it be expressed or implied, therefore negates all other warranties. Furthermore, Bartanetwork Technologies does not make any representations concerning the accuracy or reliability of the use of the materials on its Website or otherwise relating to such materials or any sites linked to this Website.</span></h2><p class=\"MsoNormal\">member expressly agrees that use of the service is at members sole risk. the service is provided on to the maximum extent allowed by applicable american law, Bartacoin expressly disclaims all warranties of any kind, express or implied by law, custom or otherwise, including without limitation any warranty of merchantability, satisfactory quality, fitness for a particular purpose or non-infringement. Bartacoin makes no warranty regarding any goods or services purchased or obtained through the program or any transactions entered into through the program.<br>To the maximum extent allowed by applicable american law, neither Bartacoin nor any of its members, subsidiaries, publishers, service providers, licensors, officers, directors or employees shall be liable for any direct, indirect, incidental, special or consequential damages arising out of or relating to this agreement, resulting from the use or the inability to use the service or for the cost of procurement of substitute goods and services or resulting from any goods or services purchased or obtained or messages received or transactions entered into through the program or resulting from unauthorized access to or alteration of users transmissions or data, including but not limited to, damages for loss of profits, use, data or other intangible, even if such party has been advised of the possibility of such damages.<br>To prevent unauthorized access, maintain data accuracy, and\nensure the correct use of information, BARTACOIN uses appropriate industry\nstandard procedures to safeguard the confidentiality of Members personal\ninformation, such as SSL, firewall, encryption, token authentication,\napplication proxies, monitoring technology, and adaptive analysis of the Websites\ntraffic to track abuse of the BARTANETWORK Website and its data. However, no data\ntransmitted over the Internet can be 100% secure. As a result, while bartacoin\nstrives to protect its members personal information, bartanetwork cannot guarantee\nthe security of any information that Members transmit to or from the\nparticipating advertisers/merchants and Member does so at his/her own risk.<br>This Agreement constitutes the entire Agreement between\nMember and bartanetwork in connection with general membership in bartanetwork and\nsupersedes all prior agreements between the parties regarding the subject\nmatter contained herein. If any provision of this AGREEMENT is found invalid or\nunenforceable, that provision will be enforced to the maximum extent\npermissible, and the other provisions of this AGREEMENT will remain in force.\nFailure of either party to exercise or enforce any of its rights under this\nAGREEMENT, within two (2) months the cause arose, will act as a waiver of such\nrights. In the event of any dispute or need for interpretation or enforcement\nof terms, arising out of this agreement, parties shall refer to arbitration\nbefore litigation.</p>', '2021-11-14 06:48:22', '2022-01-20 18:54:50'),
(8, 'Bartacoin Exchanger\'s/Bartapay-pin dispatchers', 'exchanger', 1, 1, '<blockquote><table class=\"table table-bordered\" style=\"background-color: rgb(255, 255, 255);\"><tbody><tr><td>1</td><td>BLESSED CHILD👑👑</td><td><a href=\"https://wa.link/6ynyll\" target=\"_blank\" style=\"color: rgb(35, 82, 124); text-decoration: underline; background-color: rgb(255, 255, 255); outline: 0px; font-family: sans-serif; font-weight: 400;\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>2</td><td>Bartnetwork Admin 2</td><td><a href=\"https://wa.link/re3lmx\" target=\"_blank\">Chat On Whatsapp</a></td><td>&nbsp;All Countries/Cameroon</td></tr><tr><td>3</td><td>Dave Media</td><td><a href=\"https://wa.link/d67if1\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>4</td><td>Africa Tv Admin 3</td><td><a href=\"https://wa.link/hr412m\" target=\"_blank\">Chat On Whatsapp</a></td><td>All Countries/Nigeria</td></tr><tr><td>5</td><td>Tabby Barta&nbsp;</td><td><a href=\"https://wa.link/5bjdl6\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>6</td><td>Brandon&nbsp;</td><td><a href=\"https://wa.link/7upjlw\" target=\"_blank\">Chat On Whatsapp</a></td><td>Cameroon</td></tr><tr><td>7</td><td>Davert</td><td><a href=\"https://wa.link/ifxhkg\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>8</td><td>Sir P. Media</td><td><p><a href=\"https://wa.link/gs9997\" target=\"_blank\">Chat On Whatsapp</a></p></td><td>Nigeria</td></tr><tr><td>9</td><td>Mr Caleb</td><td><a href=\"https://wa.link/xszil5\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>10</td><td>Timzy Media</td><td><a href=\"https://wa.link/on7cy9\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>11</td><td>Siedamson</td><td><p><a href=\"https://wa.link/1oszpd\" target=\"_blank\">Chat On Whatsapp</a></p></td><td>Nigeria</td></tr><tr><td>12</td><td>Boluwatife</td><td><a href=\"https://wa.link/klw8w7\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>13</td><td>Damoche</td><td><a href=\"https://wa.link/wsqked\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>14</td><td>Mr Happy</td><td><a href=\"https://wa.link/o9byed\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>15</td><td>GRACECHILD</td><td><a href=\"https://wa.link/oyxn8b\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>16</td><td>Darlington Nnamdi</td><td><a href=\"https://wa.link/s1j34z\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>17</td><td>Odogwu</td><td><a href=\"https://wa.link/2p5urw\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>18</td><td>Mrs Chinonso</td><td><a href=\"https://wa.link/lix93g\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>19</td><td>Joshua</td><td><a href=\"https://wa.link/uinnbo\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>20</td><td>Mirabel vaaseh</td><td><a href=\"https://wa.link/hqxgs9\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>21</td><td>Mrs Adaezejesus</td><td><a href=\"https://wa.link/17yoaf\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr><tr><td>22</td><td>Olayiwola</td><td><a href=\"https://wa.link/5y7tj2\" target=\"_blank\">Chat On Whatsapp</a></td><td>Nigeria</td></tr></tbody></table></blockquote><blockquote><h2><br></h2></blockquote>', '2021-11-17 08:04:47', '2022-02-08 01:49:33'),
(9, 'NFT', 'nft', 1, 1, '<p class=\"Text__H2-sc-1fwf07x-1 Hero__Title-sc-1va9ktm-1 kPRcAz dYTdWY\" align=\"left\">Bartanetwork.com NFT<b><br><br>Buy, Sell, and Store NFTs.<br>Right Inside Your Wallet/Dashboard.<br></b><br>NFTs are coming to Bartanetwork. Join the Bartanetwork to get first access.</p>', '2022-01-08 10:07:20', '2022-01-08 10:10:05'),
(10, 'How To Register', 'how-to-register', 1, 1, '<b>How To Register on Bartanetwork with Bartapay-Pin method<br><br></b><b>Step 1.</b> You purchase a <b>Bartapay-Pin</b> from any of the verified agents/promoters on the site.<b><br>Step 2.</b> Navigate to register page and click on register fill up your details correctly and hit the register bottom<b><br>Step 3.</b> You will receive a confirmation email from Bartanetwork, use the link in your and confirm your account.<b><br>Step 4.</b> Navigate to login page&gt;&gt; use your username and password login to the account.<b><br>Step 5.</b> After logging successful, you will need to choose a subscription plan.<b><br>Step 6.</b> Choose any package and make use of <b>Bartapay-Pin</b> that you purchase at the beginning of the registration copy and paste the PIN then click on okay or procced bottom.<b><br>Step 7</b>. Your account we be successful activated instantly and keep enjoying your earning activities.<br><b>Step 8</b>. You can start mine immediately<b><br><br>How To Register on Bartanetwork with Crypto payment method<br><br></b><b>Step 1</b>. Navigate to register page and click on register fill up your details correctly and hit the register bottom<br><b>Step 2.</b> You will receive a confirmation email from Bartanetwork, use the link in your inbox and confirm your account.<br><b>Step 3.</b> Navigate to login page&gt;&gt; use your username and password to login to your account.<br><b>Step 4.</b> After logging successful, you will need to choose a subscription plan.<br><b>Step 5</b>. Choose any package and make use of the <b>Crypto payment</b> method.<br><b>Step 6.</b> Then choose any of accepted coin from system and you get a unique instant wallet address send the coin into the wallet address generated for you.<br><b>Step 7.</b> After sending coin, the system we automatical check your transaction and confirm your payment immediately.<br><b>Step 8.</b> Your account we be successful activated instantly and keep enjoying your earning activities.<br><b>Step 9.</b> You can start mine immediately<b><br><br>How To Register on Bartanetwork with Online payment method<br></b><br><b>Step 1.</b> Navigate to register page and click on register fill up your details correctly and hit the register bottom<br><b>Step 2.</b> You will receive a confirmation email from Bartanetwork, use the link in your inbox and confirm your account.<br><b>Step 3</b>. Navigate to login page&gt;&gt; use your username and password to login to your account.<br><b>Step 4.</b> After logging successful, you will need to choose a subscription plan.<br><b>Step 5.</b> Choose any package and make use of the <b>Opay/Flutterwave/Paystack</b> payment method.<br><b>Step 6.</b> Make use of your <b>ATM card/USSD</b> or any other method available on it and input correct details and the money will deducted from your account immediately and confirmed your transaction.<br><b>Step 7</b>. After complete transaction the system we automatical check your transaction and confirm your payment immediately.<br><b>Step 8.</b> Your account we be successful activated instantly and keep enjoying your earning activities.<br><b>Step 9.</b> You can start mine immediately <br><br>That\'s the process for the registration.<br><br>', '2022-01-10 16:26:54', '2022-01-10 23:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `f_plans`
--

CREATE TABLE `f_plans` (
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `plan_price` decimal(25,19) NOT NULL,
  `plan_mining_amount` decimal(25,19) NOT NULL,
  `plan_mining_minute` decimal(25,19) NOT NULL,
  `plan_auto_mining` tinyint(4) NOT NULL DEFAULT 0,
  `plan_min_withdrawal` decimal(25,19) NOT NULL DEFAULT 0.0000000000000000000,
  `plan_max_withdrawal` decimal(25,19) NOT NULL DEFAULT 0.0000000000000000000,
  `plan_vendor_coupon_commission` decimal(25,19) NOT NULL DEFAULT 0.0000000000000000000,
  `plan_daily_airdrop` decimal(65,30) NOT NULL DEFAULT 0.000000000000000000000000000000,
  `plan_status` tinyint(4) NOT NULL DEFAULT 1,
  `plan_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `plan_updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_plans`
--

INSERT INTO `f_plans` (`plan_id`, `plan_name`, `plan_price`, `plan_mining_amount`, `plan_mining_minute`, `plan_auto_mining`, `plan_min_withdrawal`, `plan_max_withdrawal`, `plan_vendor_coupon_commission`, `plan_daily_airdrop`, `plan_status`, `plan_created_at`, `plan_updated_at`) VALUES
(1, 'Mask', '10.0000000000000000000', '200.0000000000000000000', '600.0000000000000000000', 0, '10.0000000000000000000', '20.0000000000000000000', '0.0000000000000000000', '5.000000000000000000000000000000', 1, '2021-11-09 05:09:26', '2022-06-23 05:56:24'),
(2, 'Mask Mini', '15.0000000000000000000', '400.0000000000000000000', '600.0000000000000000000', 0, '15.0000000000000000000', '25.0000000000000000000', '0.0000000000000000000', '0.000000000000000000000000000000', 1, '2021-11-09 05:09:26', '2022-02-09 06:30:45'),
(4, 'Barta Mini', '20.0000000000000000000', '2750.0000000000000000000', '1440.0000000000000000000', 0, '20.0000000000000000000', '35.0000000000000000000', '0.0000000000000000000', '0.000000000000000000000000000000', 1, '2021-11-10 23:29:14', '2022-02-09 06:29:39'),
(5, 'Barta king', '25.0000000000000000000', '3500.0000000000000000000', '1440.0000000000000000000', 0, '30.0000000000000000000', '50.0000000000000000000', '0.0000000000000000000', '0.000000000000000000000000000000', 1, '2021-11-10 23:45:27', '2022-02-12 19:46:39'),
(8, 'Master', '5.0000000000000000000', '0.0000000000000000000', '0.0000000000000000000', 0, '0.0000000000000000000', '0.0000000000000000000', '0.0000000000000000000', '0.000000000000000000000000000000', 0, '2022-02-10 10:30:45', '2022-02-10 15:45:05');

-- --------------------------------------------------------

--
-- Table structure for table `f_posts`
--

CREATE TABLE `f_posts` (
  `post_id` bigint(20) NOT NULL,
  `post_title` text NOT NULL,
  `post_image` varchar(255) DEFAULT NULL,
  `post_slug` text NOT NULL,
  `post_author` bigint(20) NOT NULL,
  `post_status` tinyint(4) DEFAULT 1,
  `post_description` longtext NOT NULL,
  `post_views` bigint(20) DEFAULT 0,
  `post_earnable` tinyint(4) NOT NULL DEFAULT 0,
  `post_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `post_updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_posts`
--

INSERT INTO `f_posts` (`post_id`, `post_title`, `post_image`, `post_slug`, `post_author`, `post_status`, `post_description`, `post_views`, `post_earnable`, `post_created_at`, `post_updated_at`) VALUES
(1, 'What Makes Droit Addons for Elementor A Good Choice', NULL, 'post-1', 4, 1, 'WordPress itself is a great platform for both novice and advanced users', 1, 0, '2022-06-22 20:32:02', '2022-06-22 21:36:18'),
(2, 'Switch on Dark Mode on any Website with Droit Dark To Autism', 'https://saaslandwp.com/demo/masonry/wp-content/uploads/sites/16/2022/02/Droit-Dark-Mode-370x300.jpg', 'post-2', 1, 1, 'Looking to drastically reduce the concern of eye strain and eye-related issues\r\nLooking to drastically reduce the concern of eye strain and eye-related issues\r\nLooking to drastically reduce the concern of eye strain and eye-related issues', 29, 0, '2022-06-22 20:32:02', '2022-06-23 03:09:46'),
(3, 'sponsored', NULL, 'post-4', 4, 1, 'WordPress itself is a great platform for both novice and advanced users', 2, 1, '2022-06-22 20:32:02', '2022-06-23 03:13:42'),
(4, 'Switch on Dark Mode on any Website with Droit Dark To Autism', 'https://saaslandwp.com/demo/masonry/wp-content/uploads/sites/16/2022/02/Droit-Dark-Mode-370x300.jpg', 'post-2', 1, 1, 'Looking to drastically reduce the concern of eye strain and eye-related issues\r\nLooking to drastically reduce the concern of eye strain and eye-related issues\r\nLooking to drastically reduce the concern of eye strain and eye-related issues', 0, 0, '2022-06-22 20:32:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `f_posts_track`
--

CREATE TABLE `f_posts_track` (
  `t_id` bigint(20) UNSIGNED NOT NULL,
  `t_post_id` bigint(20) NOT NULL,
  `t_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_posts_track`
--

INSERT INTO `f_posts_track` (`t_id`, `t_post_id`, `t_user_id`) VALUES
(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `f_referrals`
--

CREATE TABLE `f_referrals` (
  `r_id` bigint(20) UNSIGNED NOT NULL,
  `r1_id` bigint(20) NOT NULL,
  `r2_id` bigint(20) NOT NULL,
  `r_amount` decimal(25,19) DEFAULT 0.0000000000000000000,
  `r_status` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_referrals`
--

INSERT INTO `f_referrals` (`r_id`, `r1_id`, `r2_id`, `r_amount`, `r_status`) VALUES
(1, 2, 3, '3.5000000000000000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `f_upline_generation`
--

CREATE TABLE `f_upline_generation` (
  `g_id` bigint(20) NOT NULL,
  `g_name` varchar(255) NOT NULL,
  `g_percent` bigint(20) NOT NULL,
  `g_plan_percent` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_upline_generation`
--

INSERT INTO `f_upline_generation` (`g_id`, `g_name`, `g_percent`, `g_plan_percent`) VALUES
(4, 'Direct referral', 35, 50),
(5, '2nd generation', 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `f_users`
--

CREATE TABLE `f_users` (
  `uid` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `is_vendor` tinyint(4) DEFAULT 0,
  `mining_balance` decimal(25,19) DEFAULT 0.0000000000000000000,
  `activities_balance` decimal(25,19) DEFAULT 0.0000000000000000000,
  `referral_balance` decimal(25,19) DEFAULT 0.0000000000000000000,
  `vendor_balance` decimal(25,19) DEFAULT 0.0000000000000000000,
  `is_verify` tinyint(4) DEFAULT 0,
  `is_paid` tinyint(4) DEFAULT 0,
  `plan_id` bigint(20) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_mining_amount` bigint(20) DEFAULT 0,
  `plan_mining_minute` bigint(20) DEFAULT 0,
  `plan_daily_airdrop` decimal(65,30) NOT NULL DEFAULT 0.000000000000000000000000000000,
  `can_claim_airdrop` tinyint(4) NOT NULL DEFAULT 0,
  `notice` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `f_users`
--

INSERT INTO `f_users` (`uid`, `username`, `fullname`, `email`, `phone_number`, `password`, `country`, `avatar`, `is_vendor`, `mining_balance`, `activities_balance`, `referral_balance`, `vendor_balance`, `is_verify`, `is_paid`, `plan_id`, `plan_name`, `plan_mining_amount`, `plan_mining_minute`, `plan_daily_airdrop`, `can_claim_airdrop`, `notice`, `created_at`, `updated_at`) VALUES
(1, 'demo', 'olasmat', 'fajif40531@flowminer.com', '152661121', '$2a$09$3hHW5b1yJR6gTHtNC5JnBOG3w63PRH/9/ppGyfAqUKZTvsM1nNtlG', 'Aruba', NULL, 1, '0.0000000000000000000', '2000.0000000000000000000', '0.0000000000000000000', '690000.0000000000000000000', 1, 1, 1, 'Mask', 200, 600, '0.000000000000000000000000000000', 1, 0, '2022-03-23 10:36:26', '2022-06-23 05:42:00'),
(2, 'demo1', 'demolity', 'demolity@gmail.com', '12345', '$2a$09$BbpUXG1V.kvkzFjUA2fMaOo7XjxuozXKAChsw/qlHqjACWuUZ0IXC', 'Antigua and Barbuda', NULL, 1, '600.0000000000000000000', '3503.5000000000000000000', '9.5000000000000000000', '45.0000000000000000000', 1, 1, 1, 'Mask', 200, 1, '1.000000000000000000000000000000', 0, 0, '2022-06-22 10:18:42', '2022-06-23 05:45:03'),
(3, 'demo2', 'demo2@gmail.com', 'demo2@gmail.com', '211', '$2a$09$CWaasuj5B4TWlgn3n8bs6ufyHftUufJKflsjHDykUqtr7JhIN8N0G', 'Armenia', NULL, 0, '0.0000000000000000000', '2000.0000000000000000000', '0.0000000000000000000', '100.0000000000000000000', 1, 1, 1, 'Mask', 200, 600, '0.000000000000000000000000000000', 1, 0, '2022-06-22 11:36:50', '2022-06-23 05:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `f_wallet`
--

CREATE TABLE `f_wallet` (
  `w_id` bigint(20) UNSIGNED NOT NULL,
  `w_user_id` bigint(20) NOT NULL,
  `w_type` varchar(255) NOT NULL,
  `w_fullname` varchar(255) DEFAULT NULL,
  `w_phone_number` varchar(255) DEFAULT NULL,
  `w_coin_name` varchar(255) DEFAULT NULL,
  `w_coin_address` varchar(255) DEFAULT NULL,
  `w_coin_network` varchar(255) DEFAULT NULL,
  `w_coin_memo` varchar(255) DEFAULT NULL,
  `w_account_name` varchar(255) DEFAULT NULL,
  `w_account_number` varchar(255) DEFAULT NULL,
  `w_account_bank_name` varchar(255) DEFAULT NULL,
  `w_account_bank_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_wallet`
--

INSERT INTO `f_wallet` (`w_id`, `w_user_id`, `w_type`, `w_fullname`, `w_phone_number`, `w_coin_name`, `w_coin_address`, `w_coin_network`, `w_coin_memo`, `w_account_name`, `w_account_number`, `w_account_bank_name`, `w_account_bank_type`) VALUES
(14, 48, 'crypto', NULL, NULL, 'Usdt', '0x4B182BA43a23d391296904Df721bAd3ACC34CB40', 'BEP20', '', NULL, NULL, NULL, NULL),
(15, 42, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ridwan Bukola Rabiu', '0023146414', 'Stanbic bank', 'Savings'),
(16, 203, 'mobile', 'Kehinde Elias Ogunmayin', '+237679347090', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 81, 'crypto', NULL, NULL, 'USDT ', 'TKRgrriEcjMd9voqyvfaQYEJDta1uzS7SU', 'TRC20', '', NULL, NULL, NULL, NULL),
(18, 211, 'mobile', 'Nwachan Terence Ajeck', '670702033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 35, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Azeez Olalekan Damilare', '0115503822', 'UNION BANK', 'Savings'),
(20, 225, 'crypto', NULL, NULL, 'USDT', 'TE5RoAExpv1vbrXew62yxTM8JB3REbD4ve', 'TRC 20', '', NULL, NULL, NULL, NULL),
(21, 121, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olasoju Oluwaseun Taofeek', '2005131545', 'Kuda microfinance bank', 'Savings'),
(23, 206, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Rabiu Ridwan Bukola', '0023146414', 'Stanbic IBTC Bank', 'Savings '),
(27, 224, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Umar Saud', '3152585889', 'First Bank Plc', 'Savings'),
(28, 248, 'crypto', NULL, NULL, 'BTC', '1BPCYVbfuhT6sPxZoS4Bpj8bxxpwuKAv9s', 'Bitcoin', '', NULL, NULL, NULL, NULL),
(29, 261, 'mobile', 'Brandon Nji Chimalang ', '+237673970839', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 272, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwodo Sheriff Pascal', '0124766180', 'GT Bank', 'Savings'),
(33, 334, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ELUYODE BOLUWATIFE', '7494539373', 'WEMA BANK', 'Savings'),
(34, 543, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Endurance Avwerosuo Otobrise ', '3017879759', 'First bank ', 'Saving '),
(35, 550, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Egbunonwo Michael Ike', '2000232894', 'Kuda Microfinance Bank', 'Savings'),
(36, 469, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Marvellous Ukoh ', '1447653017', 'Access Bank ', 'Saving '),
(37, 552, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Michael Olagunju', '0081373575', 'Access Bank', 'Savings account'),
(38, 551, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adeyemo Adeboye tunde', '2061335613', 'Uba bank', 'Saving'),
(39, 395, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Atuzor Efe Destiny', '0022651258', 'Diamond/Access', 'Savings'),
(40, 437, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Omamuli pira', '0103043525', 'Union bank', 'Savings'),
(41, 422, 'mobile', 'Mohammed Bello Bagudo', '07063015155', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 426, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Andrew Longret Gumir', '2059095945', 'United Bank for Africa (UBA)', 'Savings'),
(43, 421, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aghomishe marian otegbikun', '0161949180', 'Guaranty trust bank', 'Savings'),
(44, 518, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oluwatoyin Halimah', '1426170117', 'Access', 'Savings'),
(45, 423, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwaeke Blessed Kelechi', '6554395613', 'Fidelity', 'Savings'),
(46, 646, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Law Eseine Ofure Eden', '2051453905', 'Zenith Bank', 'Savings'),
(47, 399, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sodje harmony emohwo ', '3009092922', 'First bank ', 'Savings'),
(48, 600, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mamah Precious Soromtochukwu', '6023031326', 'Keystone bank', 'Savings'),
(49, 508, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sanusi Aderinbola Racheal', '0718972640', 'Access Bank', 'Current'),
(50, 472, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onyenoneke Stanley Kelechi', '2390566360', 'Zenith bank', 'savings account'),
(51, 659, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyarekhua Mercy Okhenomoh', '3019679661', 'First Bank', 'Savings'),
(52, 461, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sabit Abdulrahmon', '2415128225', 'Zenith Bank ', 'Savings'),
(53, 546, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Gumir Sendi Andrew', '2076142873', 'United Bank for Africa (UBA)', 'Savings'),
(54, 531, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogonna HeroAsukwo Emmanuel', '3122634676', 'First Bank', 'Savings'),
(55, 769, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Eigbedion Omokhuwele Rekhiatu', '2211278676', 'Zenith Bank', 'Savings'),
(56, 744, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Idowu TAIWO AYODEJI ', '0469769286', 'Guaranty Trust Bank', 'CURRENT'),
(57, 527, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezeamaka Favour Oby', '2260048952', 'Zenith Bank', 'Savings'),
(58, 814, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Jeffery Akpevwe Etadafe ', '2285979891', 'Zenith Bank ', 'Savings '),
(59, 820, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'EMMANUEL NSIMA AKPAN', '2256194579', 'ZENITH BANK', 'SAVINGS'),
(60, 535, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, ' Boluwatife Adegun Grace', '2266256300', 'Zenith bank plc', 'savings'),
(61, 290, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Lawrence Adekunle Alfred', ' 3040072291', 'First Bank of Nigeria ', 'Saving '),
(62, 837, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zenith ', '2052214912', 'Ashore Grace ', 'Savings'),
(63, 856, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Etetor Joseph willie', '0111264824', 'Union bank', 'Savings'),
(64, 626, 'mobile', 'dayon wambai', '08136036682', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 874, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayodele Folorunso Cornelius', '2260810045', 'Zennith', 'Savings'),
(66, 411, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Eze Hope Omojevwe', '0270813792', 'Guaranty trust bank', 'Savings'),
(67, 388, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Itamah Isibhakhomwen Onose Praise', '0226647493', 'GTB', 'Savings'),
(68, 851, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Michael kehinde seyi', '0077932801', 'Sterling Bank', 'Saving'),
(69, 903, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezika chukwuemeka', '1445561556', 'Access bank ', 'Savings '),
(70, 862, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ugboma chidera ', '0177418887', 'Guarantee trust bank (GTB)', 'Savings'),
(71, 529, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akpan Favour Jeremiah', '0017029058', 'Access bank', 'Savings'),
(72, 901, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Moshood funke gift ', '2260652395', 'Zenith  bank ', 'Savings '),
(73, 563, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Perpetual Enwerem', '3091493870', 'First bank', 'Savings'),
(74, 588, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Peter Bekewei. E', '2187419695', 'UBA', 'Savings'),
(75, 936, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwofe maryann', '2260484150', 'Zenith bank', 'Savings'),
(76, 925, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Helen Obodozie', '0052994606', 'Guaranty Trust Bank', 'Savings Account'),
(77, 582, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Osian David Chukwuemeke', '0478430898', 'GTBank', 'Savings'),
(79, 899, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Stephen Ukabhose', '2099460781', 'United Bank For Africa ', 'Savings '),
(80, 911, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Rasheed Adeniran Lawal', '3048908974', 'First Bank', 'Saving'),
(82, 601, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'obadara sarafdeen ojo', '0615457760', 'Gtb', 'Savings'),
(83, 464, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'FRANCIS ANGBULU', '3067064631', 'First Bank', 'Saving account'),
(84, 649, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Osaigbovo Rebecca Omokuwa ', '6121687011', 'FCMB', 'Savings Account '),
(85, 292, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ONAH OBIDAH ', '0223740410 ', 'GTBANK ', 'Savings '),
(86, 267, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ufoegbubam Chukwudubem David', '0079929924', 'Sterling bank', 'Savings'),
(87, 739, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emmanuel Oluwagbogo Onayemi ', '8101780068', 'PAYCOM/OPAY', 'Saving '),
(88, 616, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyeniyi Olalekan', '2008328506', 'Kuda Microfinance Bank', 'Saving'),
(89, 652, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Access (Diamond) BANK', '0004218013', 'IHEDORO JOY AMARACHI', 'SAVINGS'),
(90, 990, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Christy Ogwezi Oghenebloorhien', '0165485413', 'GTB', 'Current'),
(91, 391, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Obigwe Matthew Ikechukwu', '0344885104', 'GT Bank', 'Savings '),
(92, 656, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Marvellous ebigide', '0108897460', 'GT Bank', 'Savings account'),
(93, 285, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Vaaseh Terdoo Mirabel', '3034954567', 'First Bank', 'Saving'),
(94, 574, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ashore Omowunmi Titilayo ', '8068479154', 'Opay', 'Savings'),
(95, 323, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinonso esther enyinnaya', '0081564942', 'Access bank', 'Savings'),
(96, 414, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adamu Abubakar Jibril', '2175192926', 'Zenith Bank', 'Savings'),
(97, 442, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Enic Victor Ogbonna', '6232407689', 'Fidelity Bank', 'Savings'),
(98, 408, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyeniyan Esther Toluwalope', '0464327476', 'Guarantee Trust Bank', 'Savings'),
(99, 800, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ONUMINYA JEREMIAH ', '3052404402 ', 'FIRST BANK', 'Saving'),
(100, 515, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Michael oghenekome Gift', '0252736660', 'GTbank', 'Savings'),
(101, 707, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ashamkonye Merit', '2265364763', 'Zenith', 'Saving'),
(102, 835, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Odo Anthony chinedu ', '3140234296 ', 'Firstbank', 'Savings '),
(103, 1068, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezeh Chinedu silas', '3125501720', 'First bank', 'Savings'),
(104, 789, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ndidi Obiageriaku Efole ', '3063106652', 'First Bank', 'Savings'),
(105, 480, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okugbe Okeoghene Celia', '2106892859', 'United Bank for Africa', 'Savings'),
(106, 930, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'John Omagba ', '3023502940', 'First Bank of Nigeria ', 'Savings '),
(107, 886, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Imudje Joseph Gentle', '2074554597', 'United Bank of Africa', 'Savings'),
(108, 1081, 'mobile', 'MBONJO RANDY SANDA', '+237672714660', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 1146, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Iheme Kelechi Victor', '2060995843', 'UBA', 'Savings'),
(110, 880, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olasunkanmi Aremu', '6021895247', 'Keystone Bank', 'Savings'),
(112, 894, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Moses ishmael', '2189661948', 'Uba', 'Savice'),
(113, 866, 'mobile', 'Dominion Jeremiah Anthony', '08117617879', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 1115, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Maigana musa', '2121726690', 'Zineth bank', 'Saving account'),
(115, 1213, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emmanuel jennifer iheoma ', '0679768694', 'Gt bank ', 'Saving '),
(116, 1226, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Godspower Believe Daewii ', '1235573121', 'Access ', 'Savings'),
(117, 1273, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Access bank', '0024682645', 'Onyenwe Amauche D. ', 'Savings'),
(118, 1354, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aremu Emmanuel', '0254361269', 'Wema Bank', 'Savings'),
(119, 1360, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayorinde Dayo Samuel', '2222680260', 'UBA', 'Savings'),
(120, 900, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Uchenna Daniel Nwosu', '3017033009 ', 'First bank', 'Saves account'),
(121, 1024, 'crypto', NULL, NULL, 'BNB', 'bnb1e3yk2n2m5mnssa3f7um0g6p8frmwzfvw94qdte', 'BEP2', '', NULL, NULL, NULL, NULL),
(122, 988, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'TYOKENDE FANYAM SIMEON', '0050705654', 'ACCESS BANK', 'SAVING'),
(123, 887, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ononiwu Victoria Ezinne', '3049054191', 'First Bank', 'Savings'),
(124, 1470, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Robson Emmanuel ', '0038372275', 'Guaranty Trust Bank', 'Saving'),
(125, 1473, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Josephine Chinyere Okoronta', '1229044738', 'Access bank', 'Savings account'),
(126, 683, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Justina Ndukwe', '1015827886', 'United Bank for Africa', 'Current'),
(127, 653, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nfuta Monday', '7365015207', 'Wema bank', 'Fairmoney '),
(128, 1479, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwafejoku Juliet Ozuluonye', '0614436700', 'Guaranty Trust Bank', 'Savings'),
(129, 1393, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Osondu-Aneke Chimeremeze Dennis', '0035423112', 'Access Bank', 'Savings account'),
(130, 1370, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayuba Kefas', '3220341017', 'Fcmb', 'Savings'),
(131, 1394, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ojelede Jennifer Eseleoselumen ', '3095391857', 'First bank ', 'Savings'),
(132, 1013, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Unum Msuwega Simeon', '7692060969', 'Wema Bank', 'Saving'),
(133, 1447, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'FELIX JONATHAN RINGNAN', '0161966695', 'GUARANTEE TRUST BANK', 'SAVINGS'),
(134, 1480, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Michael Dele Moses', '1101698345', 'Kuda mfb', 'Saving'),
(135, 1321, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Jacob Amasu Jalon', '2000620156', 'Kuda Microfinance Bank', 'Savings'),
(136, 1296, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'STEPHEN UZOMA OFOR', '0065057134', 'ACCESS BANK', 'SAVINGS'),
(137, 270, 'mobile', ' CLAIR-PIO YIINYUY BELLO', '670325528', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 416, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinedum Nzubechukwu Godseed', '2229554782', 'UBA', 'Savings'),
(139, 1400, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abosede Rachael Obalugemoh', '0137086837', 'GTB', 'Savings'),
(140, 1372, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mebawondun oke Joseph ', '3069139481', 'First bank plc', 'Savings '),
(141, 1409, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sadiku Hamzat', '3017357622', 'First Bank', 'Savings'),
(142, 1553, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emmanuel Umoh', '2452455063', 'Zenith Bank', 'Savings'),
(143, 1513, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ahmad Abubakar Adamu', '0008153711', 'Jaiz bank', 'Savings'),
(144, 1566, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Hajara Jibrin Abdullahi', '0003876468', 'Jaiz bank', 'Savings'),
(145, 1544, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Amina Abubakar Adamu', '0008133755', 'Jaiz bank', 'Savings'),
(146, 1574, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Jibrin Adamu Abubakar', '1018346762', 'UBA plc', 'Current Account'),
(147, 1592, 'mobile', 'Aliu Victor Oluwadunsin', '07060678354', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 349, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ibeh darlington Bright', '0155707556', 'Union bank', 'Savings'),
(149, 534, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Happy Onotanemere', '1007180330', 'VFD Microfinance Bank', 'Savings'),
(150, 1571, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Blessing Ogbuehi Onyinye', '0006119006', 'Guaranty Trust Bank', 'Savings'),
(151, 1590, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Lanbe Fisayo', '2177582268', 'United Bank of Africa', 'Saving'),
(152, 1178, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Titilayomi Funmilayo Durodola', '1386878728', 'Access Bank', 'Saving'),
(153, 1503, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwose Edwin John', '0154330559', 'Union Bank', 'Current account'),
(154, 1358, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwobi Matilda Obumjekwu', '0254070652 ', 'Guarantee Trust bank', 'Savings'),
(155, 1587, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Joshua Chidubem okoh', '2009291964', 'Kuda micro finance bank', 'Savings'),
(156, 458, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Cornelius Ikuenobe ', '1460613825', 'Access Bank ', 'Current Account '),
(157, 1388, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Angela Ikuenobe ', '3013534089', 'First Bank ', 'Savings Account '),
(158, 801, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Feyisetan kolawole Felix', '6839601017', 'FCMB', 'Saving'),
(159, 1603, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Daniel Joseph Rebecca', '2130304926', 'United Bank for Africa', 'Savings'),
(161, 1512, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'First bank', '2014398227', 'Okagbare Ediri-ogbaivere Solomon', 'Current'),
(162, 931, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Enivweru Uvie Dominic', '3109906336', 'First bank', 'Savings account'),
(163, 1407, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Saviour Prince Isreal', '2377390959', 'Zenith bank', 'Saving'),
(164, 1719, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Simeon Cletus Ndubuisi ', '1470630492', 'Access Bank ', 'Savings '),
(165, 721, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Friday ibaamaa', '0057871180', 'Sterling bank', 'Saving'),
(166, 795, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'QUEEN ESUMEI', '3118463538', 'FIRST BANK', 'SAVINGS'),
(167, 1092, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'NWOSU GLAD UKAOMA', '3120582450', 'FIRST BANK ', 'SAVINGS'),
(168, 964, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Edeh Kelvin kasiemobi', '1477119165', 'Access bank', 'Savings   '),
(170, 797, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Eze Jennifer Chisom ', '2051542007', 'Zenith bank ', 'Savings '),
(172, 460, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Paul Irem', '2121949378', 'Zenith Bank', 'Savings account'),
(173, 1457, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'EFOBI FAVOUR UCHENNA ', '0734594044', 'ACCESS BANK PLC', 'Savings Account'),
(174, 1112, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kamilu Abdu Ibrahim', '2180475528', 'United Bank for Africa', 'Saving'),
(175, 1535, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezike Emmanuel Mathew', '2097051235', 'UBA', 'SAVINGS'),
(176, 1681, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okorie Chibuzor Faith', '2217321567', 'Zenith Bank', 'Saving '),
(177, 1022, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ecobank ', '4293073649', 'Alatake Damilola Joseph ', 'Savings'),
(178, 1445, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Egwuatu Ruth Ogochukwu ', '2080330499', 'Zenith bank ', 'Savings '),
(179, 445, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Obosherinor Ignatius', '0084396706', 'Sterling bank', 'Saving '),
(180, 434, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aisha Lawal Muhammad', '2229235391', 'United Bank for Africa', 'Savings'),
(181, 1089, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ibrahim Aliyu Ahmad', '1400751150', 'Access Bank', 'Current'),
(182, 1550, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'AKACHUKWU SAMUEL', '0045575625', 'Guaranty Trust Bank', 'Saving Account'),
(183, 729, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'DARLINGTON ANYANWU N', '0153082701', 'GTBank', 'Savings'),
(184, 1286, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sulaiman yakubu sule', '0006918299', 'JAIZ bank', 'Current'),
(185, 430, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezeh Rita Kanayo ', '2102829459', 'UBA', 'Savings'),
(186, 1505, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chukwude chukwuebuka Samuel ', '0640167331', 'GTBank', 'Current account '),
(187, 781, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kamah Rosemary Ogechi', '3039742345', 'First Bank', 'Saving'),
(188, 1375, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Paul Adejo', '2023058167', 'Kuda micro finance bank ', 'Savings '),
(189, 1742, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Eze Godswill Nduka', '2179770429', 'Zenith Bank ', 'Savings'),
(190, 420, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Imran Musa', '3180195245', 'First bank', 'Saving'),
(191, 1074, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Fave Joshua', '736 492 1048', 'Wema bank', 'Savings'),
(192, 1350, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adeyemo praise Eniola', '2177818703', 'United Bank for African', 'Savings'),
(193, 1703, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Dalhatu Yusuf', '2019936671', 'FirstBank', 'Current'),
(195, 655, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oluwaseyi Damilare Gboyega ', '2014559853 ', 'Kuda bank', 'Mobile banking app '),
(196, 1955, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emitomo temitope ridwan', '6232127220', 'Fidelity bank ', 'Saving '),
(197, 1310, 'crypto', NULL, NULL, 'Solana ', '0xb519985263aa0309747331eb7571f782f092aabd', 'BEP20 ', '', NULL, NULL, NULL, NULL),
(198, 1105, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Enweonwu Edna Mgbodo', '0806583455', 'Access Bank', 'Savings Account'),
(199, 1844, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akpan Ebenezer', '2136250290', 'Uba', 'Savings'),
(200, 2022, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Victoria Nwachukwu', '3176465970', 'First bank', 'SAVINGS'),
(201, 1526, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olofinlusi Patrick Olubowale', '3052270933', 'First Bank', 'Savings'),
(202, 1995, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Victory Chidera mbanefo', '2107257350', 'United Bank for Africa ', 'Savings'),
(203, 910, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Deborah Otobrise ', '3094796228', 'First bank', 'Savings'),
(204, 2031, 'mobile', 'Belangeley Etane Balikey', '654773970', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 2048, 'mobile', 'Cynthia Joso Motumba', '676885228', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, 2061, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Uloma happiness ebere', '0059935427', 'Access bank', 'Savings'),
(207, 792, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Glory okoloko-ideh', '0071076073', 'Sterling Bank', 'Savings'),
(208, 2064, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Igbinedion Solomon', '3581095648', 'Ecobank Plc', 'Savings'),
(209, 2103, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ABDULHAMID SALEH ABDULHAMID', '2005571370', 'Kuda microfinance Bank', 'Saving account'),
(210, 1572, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emmanuel Aghoghovbia', '0017218941', 'Gtbank', 'Savings'),
(211, 1855, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UGOCHUKWU JUDE ODOH', '2015590965', 'Kuda Bank', 'Premier savings'),
(212, 1850, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'KOROLE JOEL AREMU', '3079061198', 'First bank', 'Savings'),
(213, 1077, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ODOGBO ISRAEL MAMUZO', '6033677864', 'KEYSTONE BANK', 'SAVINGS'),
(214, 822, 'mobile', 'Eno Etim Inyang', '+2348184434157', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 2166, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ONUZULIKE OSSY PEACE ', '3028311066', 'FIRST BANK', 'SAVINGS'),
(216, 577, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olatunde Isaac Olamilekan', '2006362405', 'Kuda Microfinance Bank', 'Savings '),
(217, 1925, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'FCMB', '0446564019 ', 'Adamu Daniel', 'Current'),
(218, 2182, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OSSY NOBLE BIZ NIG ENTERPRISES', '0039074252', 'ACCESS BANK ', 'CURRENT '),
(219, 294, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Imodu Matthew Augustine', '6324006642', 'Fidelity Bank', 'Savings'),
(220, 2165, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ibrahim Adeyemi Adewale', '0055136271', 'Access bank', 'Savings'),
(221, 1353, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abdulrahim Idris', '3073715224', 'First bank', 'Savings '),
(222, 2223, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Gabriel peter', '0008354847', 'STANBIC BANK', 'Current'),
(223, 2171, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Excellence Umaojo peter', '0012320458', 'STANBIC BANK', 'Savings'),
(224, 2106, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kingsley Ebenge Akpan', '0059403189', 'Access Bank', 'Saving'),
(225, 1624, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Benjamin Emmanuel Agbo', '0262976317', 'Guaranty Trust Bank', 'Savings'),
(228, 967, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'LAWRENCE MARO TITUS', '0063854793', 'ACCESS BANK', 'SAVINGS'),
(229, 1951, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zahraddeen junaidu', '2176899215', 'Zenith Bank', 'Savings'),
(230, 2238, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'GAFAR OLUWAKEMI ABODUNRIN', '0241643473', 'WEMA', 'SAVINGS ACCOUNT'),
(231, 1973, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'GAFAR TESLIM ODESOLA', '0122537691', 'WEMA', 'CURRENT ACCOUNT'),
(232, 1012, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Promise Daniel Akpan', '2118194077', 'Zenith Bank', 'Savings'),
(233, 2268, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mary Divine Ijoma', '1363073035', 'Ecobank', 'Current'),
(236, 2267, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogundaini Adetola Oluwaseun', '0814563492', 'Access Bank', 'Savings'),
(237, 2284, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olushola Oluwatoyin Priscilla', '0121043815', 'Guarantee Trust Bank', 'Savings'),
(238, 2255, 'crypto', NULL, NULL, 'FX royale', '6V4nM9Q3tRdj83uqHftsi456y933', 'Ticket', 'Trade', NULL, NULL, NULL, NULL),
(239, 2254, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Uchechukwu Uzoma', '3097499331', 'First bank of Nigeria.', 'Savings'),
(241, 1860, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oluchi Precious Eze', '0026384171', 'Access Bank', 'Savings'),
(242, 2282, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Yarima Ladan Chris', '0022832479', 'Guaranty Trust Bank', 'Savings'),
(243, 2337, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ridwan Olaniyan Kazeem', '2009174470', 'Kuda Microfinance Bank', 'Savings'),
(245, 1727, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogunniyi Ademola Joseph', '0213270464', 'Gtbank', 'Savings'),
(246, 2214, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nathaniel Ikpeamaeze', '0005246291', 'GTB', 'Current'),
(248, 1540, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Obasi Ikechukwu Modestus', '3150402366', 'First Bank', 'Savings'),
(249, 2033, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Osigbesan Deborah Oreoluwa', '1522617482', 'Access Bank ', 'Savings'),
(250, 1259, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Alajuba Juliet Chiamaka', '0149342408', 'GTB bank', 'Savings account'),
(251, 1984, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OKEDARA SAMUEL OLALEKAN', '2006746061', 'KUDA', 'SAVINGS'),
(252, 2427, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Access bank ', '0705766362 ', 'Wordu patience ', 'Saving '),
(254, 2494, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chibike David Paul', '2288754718', 'Zenith bank', 'Saving Account'),
(255, 2292, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oluwadamilola Ruth Ajayi', '3158012288', 'Firstbank', 'Savings'),
(256, 1337, 'mobile', 'Nonso Stephen', '08164768267', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, 2506, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Shedrack Michael', '2088832854', 'UBA', 'savings '),
(258, 2529, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Idota Roseline Alice ', '3054905161', 'First Bank ', 'Savings'),
(259, 1431, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'orazulume Peter onyedika ', '2454705449', 'zenith ', 'saves account '),
(260, 2537, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'John Olugbenga', '0810099179', 'Access Bank', 'Savings'),
(261, 2526, 'mobile', 'Ngwa Irene Manka', '678220736', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(262, 745, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Matthew Boluwatife Sesinu', '3182792394', 'First Bank', 'Savings '),
(263, 966, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogunfeyimi Temidayo', '6035664523', 'Keystone bank ', 'Savings'),
(264, 2555, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Fcmb', '8288354018', 'Busari Yusuff Olaitan', 'Savings'),
(265, 2554, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'David ikpeme udom', '2017960616', 'Kuda', 'Saving'),
(266, 2568, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Danjuma Benjamin ', '2261764475', 'Zenith bank ', 'Saving '),
(267, 2473, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Isaac Abigail Nwachukwu ', '0020655113', 'GTBANK', 'Savings'),
(268, 1747, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Hassan Ibrahim', '3181221798', 'First bank', 'Savings'),
(269, 2189, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okereke Nwamaka Precious', '0553805568', 'GT bank', 'Savings'),
(270, 2050, 'mobile', 'Edith Afam', '07082194244', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(272, 2600, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Louis Ayo Bello', '1412268554', 'Access Bank', 'Current'),
(273, 2460, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Muobuikwu Eunice', '2080677048', 'Zenith Bank', 'Saving account'),
(274, 2597, 'mobile', 'PRUDENCIA GOGO AJAH', '675182539', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(275, 2504, 'mobile', 'Winkar Biachi Tanyu', '+237680607873 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(276, 2511, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kenneth O. Ugwoke', '2083917747', 'Zenith Bank', 'Savings'),
(277, 1085, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Precious Chisom Nwachukwu', '0092792578', 'Access Diamond bank', 'Savings'),
(278, 782, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyebamide Azeez', '0122481103', 'Wema Bank', 'Saving'),
(279, 2692, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Samuel Aondoakaa Orayima', '0810397174', 'Access Bank', 'Saving'),
(280, 2700, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ODOGBO HELEN UKPEGHAROVWE', '4503066546', 'ECOBANK', 'SAVINGS'),
(281, 2686, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ernest Nnamdi Egeonu', '2404364698', 'zenith bank', 'Savings'),
(282, 2711, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ebunu Oke Sophia', '1229583167', 'Access', 'Saving'),
(283, 1562, 'mobile', 'Aisha Idris', '08167891667', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(284, 2715, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'James okogbe', '2190604110', 'Zenith Bank', 'Savings'),
(285, 2210, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogbodo Shedrach Ifeanyi', '2681041287', 'Eco bank', 'Savings'),
(286, 2684, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'KAMAL BELLO OWOLOLA', '0691605276', 'ACCESS BANK', 'SAVING ACCOUNT'),
(287, 2194, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Yila Lami', '2025178142', 'UBA', 'Savings'),
(288, 2317, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Tiamiyu Saheed Olalekan', '5054771017', 'F C M B', 'Savings'),
(289, 2698, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayobami Ayodele Aderemi ', '3029397274', 'First Bank', 'Saving'),
(290, 2056, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Deborah Peter', '1463701158', 'ACCESS BANK', 'Saving'),
(291, 342, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Miracle Ebube Ejike', '6320555795', 'Fidelity', 'Savings'),
(292, 1813, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Omini Emmanuel Okoi ', '1495670097', 'Access Bank ', 'Savings'),
(294, 2771, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Maju Emmanuel Eneojo', '0125364341', 'Union Bank', 'Savings'),
(295, 1898, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abdullahi Bashirat Omobolaji', '0114879713', 'Guarantee Trust Bank', 'Savings'),
(296, 775, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sanusi Abiodun', '1527198784', 'Access Bank', 'Saving '),
(297, 475, 'mobile', 'Bayo okunfolami', '07037136060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(298, 394, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Precious Chizoba Chukwura', '2466514224', 'Zenith bank', 'Savings'),
(299, 1733, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olofinlusi Patrick Olubowale', '2021053120', 'Kuda Microfinance Bank', 'Savings'),
(300, 2739, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Timothy Oluwatosin Olaleye', '3110978711', 'First Bank of Nigeria ', 'Savings'),
(301, 1113, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mohammed Aliyu Maito', '2110599218', 'U.B.A', 'Saving'),
(302, 2588, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Odunayo David Oyedeji', '1391396361', 'Access Bank', 'Saving'),
(304, 2080, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emmanuel Effiong Bassey', '0036626666', 'Access Bank', 'Saving Account '),
(306, 2848, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Biobaku Noah ', '2226232519', 'UBA bank ', 'Savings '),
(307, 2681, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'AKINTOLA JOSEPH A', '0115720340', 'UNION BANK', 'SAVINGS'),
(308, 1962, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akinwole Adebowale Abiola', '0694154500', 'Access Bank', 'Savings'),
(309, 2834, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abdulfatah Sunusi Idris', '0458595681', 'Guaranty trust Bank (GT bank)', 'Savings'),
(310, 1330, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinenye okoro joel', '4263067780', 'Ecobank', 'Saveces '),
(311, 2705, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Charles Imeh Ifum', '0015549847', 'Stanbic Ibtc', 'Current'),
(312, 1887, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'BISIRIYU FUNMILOLA', '3074645810', 'Firstbank ', 'Savings'),
(313, 404, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ode Elisha Eworo', '2011863612', 'Kuda Bank', 'saving'),
(314, 1192, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OTIRORO ESEROGHENE KELLY', '2031437822', 'UNITED BANK FOR AFRICA(UBA)', 'SAVINGS'),
(315, 1295, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Yamusa Aliyu Abdulkadir', '1676254017', 'First City Monument Bank', 'Saving account'),
(316, 2175, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oshinyemi Olorunjuwon Odunayo', '0126222406', 'Guaranty Trust Bank', 'Savings'),
(317, 368, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ugochi Emenalo', '2253482284', 'Zenith', 'Savings'),
(318, 2476, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'QUEEN ESUMEI', '3118463538', 'FIRST BANK', 'SAVINGS'),
(319, 478, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Cyril Nnoruka', '2365003490', 'Zenith bank', 'Savings'),
(320, 1718, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OSIOMWAURI ANDREW', '2080826062', 'UNITED BANK FOR AFRICA', 'SAVING'),
(322, 1516, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ilona Amaka ogochukwu', '6052503644', 'Fidelity bank ', 'Savings account '),
(323, 1021, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Wema bank', '0253803001', 'Levi ogosu', 'Savings'),
(326, 366, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Thank God chukwudi nweke', '0095101849', 'Access bank', 'Saving account'),
(328, 867, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aku Nathaniel Namo ', '3065303046', 'First Bank ', 'Saving'),
(329, 1180, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Iwuchukwu gift nwabueze', '2185923110', 'UBA', 'saving'),
(330, 1701, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'QUEEN ESUMEI', '3118463538', 'FIRST BANK', 'SAVINGS'),
(331, 1938, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Stephen Goddy James', '3045154512', 'First Bank of Nigeria', 'SAVINGS'),
(333, 904, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onwumere Cyriacus', '0042323445', 'Access Bank', 'Savings'),
(334, 1680, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ERIC CHUKS', '0073361366', 'STERLING BANK', 'SAVINGS'),
(335, 2237, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chidimma  lessing Obi ', '2200753241 ', 'UBA', 'Saving '),
(337, 2616, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'CHUKWUKA ERIC', '3081722838', 'FIRST BANK', 'SAVINGS'),
(338, 1646, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Odey Jeremiah owokonu', '0093188352', 'Diamond access', 'Savings'),
(339, 974, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Maureen okundaye', '0053441005', 'Unity Bank', 'Savings '),
(340, 2690, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akachukwu ezeani Bartholomew', '2003300314', 'Zenith Bank', 'Savings'),
(341, 2818, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Odey Jeremiah owokonu', '0093188352', 'Diamond access', 'Savings'),
(343, 2929, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Jude Ojonugwa Ocheni', '2012611456', 'Kuda Microfinance Bank', 'Savings'),
(344, 1271, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'John chukwujekwu Nweke', '2171349285', 'United Bank for Africans', 'Savings'),
(346, 2938, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'David mukaila peter', '2022648446', 'Kuda mfb', 'Savings'),
(347, 2780, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ofili chinedu victory', '2286260471', 'Zenith bank', 'Savings'),
(348, 2587, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kokori Godfree Omamuye', '0620231791', 'GTB', 'Savings'),
(349, 1897, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ugwulor John Sunday', '6552437494', 'Fedlity bank', 'Savings'),
(351, 2414, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayodele Samuel Tunde ', '0019642063', 'Guaranty Trust Bank ', 'Savings'),
(352, 2438, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwabueze Nwanneka Destiny', '2121966467', 'ZENITH', 'Savings'),
(353, 2636, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Udom Emmanuel', '2014592003', 'Kuda', 'Savings'),
(354, 2777, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olubowale Olofinlusi', '2411016656', 'Zenith Bank', 'Savings'),
(355, 2972, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Patrick Munachi Jessica', '1404761351', 'access bank', 'Savings'),
(356, 2769, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ahmad Ismail', '7047145948', 'Opay', 'Wallet app'),
(357, 2825, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ALIYU ABDULKADIR', '0430538491', 'GT Bank', 'Current'),
(358, 2248, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ashiru tunde Jamiu', '0212011435', 'Gtbank', 'Savings'),
(359, 2629, 'mobile', 'Jean baptist', '675719734', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(360, 2430, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Udechukwu basil chikeluba', '3188418702', 'First bank', 'Savings'),
(361, 2987, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Monron destiny', '0124807487', 'GT Bank ', 'savings '),
(362, 3009, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Amuba ifeanyichukwu chrysogonus', '7487275025', 'Fcmb', 'Current'),
(363, 2422, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'JUSTICE DC GLOBAL RESOURCES', '1474318125', 'Access bank', '  Business accounts'),
(364, 2915, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Cletus Emeh Mmaduabuchi', '2261808522', 'Zenith Bank', 'Savings Account'),
(365, 2669, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Otti precious uju', '3143014895', 'First Bank', 'Saving'),
(366, 2799, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Maryam Dauda Lawan', '2264001733', 'Zenith Bank', 'Saving'),
(367, 3067, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Odunze Bethel Emeka', '3047577166', 'Firstbank', 'Savings'),
(368, 1119, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Joseph Onome Jennifer ', '3075687448 ', 'First bank ', 'Savings '),
(369, 2379, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okafor Ikechukwu prosper', '3134659346', 'First bank of Nigeria', 'Savings account '),
(370, 2913, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Estate of yila yankoli', '2162528778', 'UNITED BANK FOR AFRICA PLC', 'savings'),
(371, 3048, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'SAMINU MUHAMMAD', '2161281397', 'UNITED BANK FOR AFRICA plc (UBA BANK)', 'SAVINGS ACCOUNT'),
(373, 3030, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Evans Wisdom Obafemi', '2215752033', 'UBA', 'Savings'),
(375, 3066, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'HEZEKIAH JOSIAH', '0000194933', 'Titian trust bank', 'Savings'),
(376, 3055, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olaniran Olaide Kafayat ', '3060824841 ', 'First bank', 'Savings '),
(377, 2311, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nkemelu Chinedu Christian ', '0109968567', 'Diamond(access)bank ', 'Savings accounts '),
(378, 3021, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Afolabi Eritosin olayemi', '8216183013', 'Fcmb', 'Current'),
(379, 2992, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, '2138641595', 'Akinuli Olanrewaju Wilson', 'UBA', 'Savings'),
(382, 3113, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OBISANYA OLUREMI', '6122690016', 'FCMB', 'SAVINGS'),
(383, 3131, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Faith Igwe  ', '2041333536 ', 'UBA', 'Saving '),
(384, 954, 'mobile', 'Numfor Louis Ngwa', '673196611', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(385, 2585, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Lohnap Benjamin Johnson', '4682011012', 'Ecobank', 'Current'),
(386, 1382, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okoye Cyprian', '1528435488', 'Access Bank', 'Saving account'),
(387, 1028, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Muhammad Garba Ahmad ', '0569462188', 'Guaranty trust bank ', 'Saving '),
(388, 516, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ademukolu A. Adetoye', '2283979880', 'Zenith Bank', 'Savings account'),
(389, 260, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kpateng David Dusu ', '0818413935', 'ACCESS BANK', 'SERVINGS '),
(390, 3146, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adesugba Adebisi Isaiah', '0640674370', 'GT BANK', 'Saving'),
(391, 2067, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'NWANGWU-IKE PATRICK CHUKWUEMEKA', '3029345835', 'FIRST BANK OF NIGERIA', 'Savings'),
(392, 2444, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Urheri Avwerosuoghene Loveth', '2104336849', 'UBA', 'Savings'),
(393, 3171, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Obosherinor Avwerosuo', '3051711338', 'First bank', 'Saving account'),
(395, 1482, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'SALIM SALISU', '1502104856', 'Access Bank', 'Seving'),
(396, 3199, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akintola Saka Busari Muyiwa', '2005174487', 'First bank', 'Savings'),
(398, 2397, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kareem Ridwan Opeyemi', '0229540818', 'GT Bank', 'Savings'),
(399, 1184, 'crypto', NULL, NULL, 'USDT', 'TYvdpBBTAmgj4rhRKXqtaJFPqKVie2rhqs', 'TRC20', '', NULL, NULL, NULL, NULL),
(401, 3192, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Tumbami Raphael Jalon', '3048773154', 'FirstBank', 'Savings'),
(402, 3211, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Lami Yusuf iliya ', '9200552787', 'Stanbic IBTCbank ', 'Current '),
(403, 1805, 'mobile', 'KABIR SANI', '09062046597', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(405, 1433, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Peter James', '2166947081', 'United Bank of Africa', 'Saving'),
(406, 3181, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'IYIRIARO PIUS', '3094374053', 'First Bank', 'Savings'),
(407, 3224, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Yusuf m. Iliya ', '0936654013', 'FCMB ', 'Current '),
(408, 2239, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ADEJO WILLIAMS', '0021059621', 'ACCESS BANK', 'COMMERCIAL'),
(409, 3229, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Amaefule Jonathan', '2018829778', 'U.B.A', 'Savings'),
(410, 3246, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Lateef Olalekan Ganiyu ', '2203100815', 'United Bank for Africa ', 'Savings '),
(411, 2674, 'mobile', 'ADEWALE OLUWAFEMI', '08031509490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(412, 882, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogbonna Chinonyerem Henry', '0005582061', 'Access bank', 'Savings '),
(413, 3037, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ismail Sani', '0061884099', 'Access Bank', 'Saving'),
(414, 573, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okpanobo Emmanuel ', '0234485456 ', 'Guarantee trust bank ', 'Saving account '),
(415, 3070, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Udaya Jane Ndidi1amaka', '1006922314', 'Zenith Bank', 'Current'),
(416, 3262, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aloysius chukwuebuka Godsplan', '2379410541', 'Zenith Bank', 'Savings'),
(418, 2491, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Iniobong Effiong Oboho', '0042976897', 'Access bank', 'Savings account'),
(419, 3287, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nuruddeen Mohammed Shehu', '3105386587', 'FirstBank', 'Savings'),
(420, 3175, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Muhammad shafiu said', '0630379836', 'Guaranty trust Bank', 'Saving'),
(421, 3285, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Access Bank', '0052626631', 'Chukwudinma Anayo Hope', 'Savings'),
(422, 3266, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Blessing Ocheinehi Aboh', '0152522697', 'Gtbank', 'Savings'),
(423, 3250, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Meshack shezamoi bawa', '1452743211', 'Access bank', 'Saving'),
(424, 3298, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezeanyika Somtochukwu Precious', '0801244890', 'Access bank', 'Savings'),
(425, 1322, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Tamunotonye peterside', '1237808704', 'Access Bank', 'Service'),
(426, 1147, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Yahaya Shuwaki', '2391887549', 'Zenith Bank', 'Saving'),
(427, 3236, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Benson Idoreyin Udo ', '6233410440 ', 'Fidelity bank ', 'Saving '),
(428, 3306, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Stanbic bank', '0037947551', 'Stanbic bank', 'Savings'),
(429, 3141, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okon  Comfort  Nseabasi', '3020765773', 'First Bank Plc', 'Saving Account'),
(430, 2879, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Stanbic bank', '0037947551', 'Stanbic bank ', 'Savings'),
(431, 196, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwefuru oforbuike mishack', '0597380845', 'Guaranty trust Bank', 'Saving'),
(432, 3293, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adeyemi Roland', '2083991174', 'Zenith Bank', 'Savings'),
(433, 2021, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ikechukwu Somtochukwu Camillus', '3188729310', 'First Bank', 'Savings'),
(434, 3090, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Irinoye Oluwafemi Abosede ', '0168517364 ', 'Guarantee Trust Bank ', 'Savings'),
(435, 3322, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onumajuru Ngozika Chinedum', '1684498012', 'FCMB ', 'Savings'),
(436, 3286, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Uthman Opeyemi yakeen', '2229171288', 'UBA', 'Savings'),
(437, 477, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Atiegoba Jack ', '0229090564', 'GTBANK ', 'Savings'),
(438, 3325, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Esuku Besidone Destiny', '3082702501', 'First bank', 'Savings'),
(439, 3254, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'David Ayodeji Olorunleke', '3077188396', 'First Bank Plc', 'Savings'),
(440, 3338, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Orianwo kate', '0171643571', 'Guarantee trust bank', 'savings'),
(441, 3337, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'AYANGBILE MATTHEW ABAYOMI', '0049706160', 'GTB', 'Savings'),
(442, 2808, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Etakpobunor E Godspower', '0093142644', 'Access', 'Savings'),
(443, 2571, 'mobile', 'Majorie Mande Lobe', '675229005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(444, 3368, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinedum Chinwe Thecla', '2228696890', 'U.B.A', 'Savings'),
(445, 1344, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chiamaka loveth uwazie', '0252034008', 'Wema bank', 'savings'),
(446, 2943, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abubakar Naseer Ibrahim ', '2174898674', 'UBA', 'Saving Account '),
(447, 3355, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zenith bank', '2471953614', 'Aniekan john udo', 'Saving'),
(449, 3178, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zaharadeen Nasir ', '1508046390 ', 'Access bank', 'Serving account '),
(450, 3331, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'soliu sheriff olaniyi', '0268084872', 'Guarantee trust bank ', 'Savings '),
(451, 2228, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Lasisi Titilayo', '0802943853', 'Access bank', 'Savings'),
(452, 1302, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'CHARITY FUNKE ADEBIYI', '0870027269', 'Ecobank', 'Saving'),
(453, 3450, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ISAH JOY OJONE', '0410000482', 'ECO BANK', 'Savings'),
(454, 1684, 'mobile', 'Azinwi Fuh Che', '683817338 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(455, 3382, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UYEH DANIEL BASSEY', '0152625062', 'GTB', 'SAVINGS'),
(456, 2824, 'crypto', NULL, NULL, 'USDT', '0x38EA6525568921F31C77c102A2C350Cec80Fa93E', 'BEP20', '', NULL, NULL, NULL, NULL),
(457, 3438, 'mobile', 'CHANTAL AVELA', ' 652523972', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(458, 2841, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Umeh Georgina Ekwu', '0007980348', 'Access bank', 'Saves account'),
(459, 3457, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Doris Dauda ', '3063461641', 'First Bank', 'Savings'),
(460, 3452, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Solomon Obinna jonah', '3145202849', 'firstbank ', 'savings'),
(461, 1351, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogbodo chisom joseph', '2141816957', 'United Bank for Africa ', 'Savings account '),
(462, 1679, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Siwoniku oluwatosin  adefuye', '0541980970', 'Guaranty trust bank', 'Savings'),
(463, 3470, 'mobile', 'JAMNGONG PASCAL CHEPNDA', '650633810', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(464, 3471, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oreoluwa O. Aderemi', '1030104992', 'Polaris bank', 'Saving'),
(465, 2243, 'mobile', 'Florence Edonde Tonge', '652027074', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(466, 3412, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emmanuel Damar', '0071281138', 'Access bank', 'Savings'),
(467, 3460, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'SUNDAY ABUGA ARI', '0013175877', 'ACCESS', 'CURRENT'),
(468, 3479, 'mobile', 'NJINI ANDERSON NFOR', '+237654115331', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(469, 2985, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sunday Emmanuel ', '0995026557', 'Union Bank', 'Savings'),
(470, 3468, 'mobile', ' Florence Edonde Tonge', '676617651', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(471, 1347, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ADAMU RABIATU ARGUNGU', '3137427528', 'FIRST BANK OF NIGERIA', 'SAVINGS'),
(472, 3123, 'mobile', 'Mbeng Priscarion Nchenge', '652702169', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(473, 3469, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Lukmon isiak lekan', '1424558148', 'Access bank ', 'Savings '),
(474, 2012, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ABDUL BISHIR', '2111355103', 'UBA', 'SAVING');
INSERT INTO `f_wallet` (`w_id`, `w_user_id`, `w_type`, `w_fullname`, `w_phone_number`, `w_coin_name`, `w_coin_address`, `w_coin_network`, `w_coin_memo`, `w_account_name`, `w_account_number`, `w_account_bank_name`, `w_account_bank_type`) VALUES
(475, 2245, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'GAMBO JUSTINA', '0611448119', 'GTBANK ', 'Savings '),
(476, 958, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Monday mba John ', '0971001531 ', 'Ecobank Nigeria ', 'Savings '),
(477, 3220, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abubakar haruna', '0090723387', 'Union bank', 'Saving account '),
(479, 1907, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Gtbank ', '0247311777', 'Isa nuhu Indabawa ', 'SAVE '),
(480, 3375, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Friday Collins onyekachi ', '2204368964', 'Uba bank ', 'Savings '),
(481, 3549, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adegbulu Samuel Ayomide ', '4050034117', 'Eco bank', 'Savings'),
(483, 283, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Raven-Anthony king', '7790058540', 'Wema bank', 'Saving '),
(484, 1696, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'QUEEN CAROLINE ESUMEI', '0137050621', 'GTB BANK', 'SAVINGS'),
(485, 2728, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyeleke Wale', '0036862798', 'GTBank', 'Savings'),
(486, 1000, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Agu Daniel Ozoemena', '2016538090', 'Kuda Microfinance Bank', 'Savings account'),
(487, 2164, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Owolabi Temiloluwa Abosede', '0005519801', 'Sterling bank', 'Savings'),
(488, 3304, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akinyosola segun Rotimi', '1001819681', 'Heritage bank', 'Savingsl'),
(489, 3508, 'mobile', 'Desmond Nunyui', '673928650', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(490, 2495, 'mobile', 'Akachi ugboaja', '9130558377 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(491, 540, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onuka izu Francis', '5333636912', 'Fidelity Bank', 'Savings'),
(493, 579, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Hussaini, Abubakar', '2011141833', 'Kuda Microfinance bank', 'Saving'),
(494, 2908, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oluwakemi Daniel ', '0010477351 ', 'Access ', 'Savings'),
(495, 3485, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Owolabi rokeebat iyanuoluwa', '1527169522', 'Access bank', 'Savings'),
(496, 3459, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyeyemi abiola Idris', '0213218107', 'Gtbank', 'Savings'),
(497, 3619, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UTHMAN TAJUDEEN A', '0116667466', 'GTBANK', 'SAVING'),
(499, 462, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Peter Fidelis', '0233375875', 'GTB', 'Savings'),
(500, 3609, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Obe Edith Etane Sakwe', '2368906451', ' Zenith bank ', 'Savings account'),
(501, 567, 'crypto', NULL, NULL, 'Binance-peg NEAR protocol', '0x7d1F5A6BFb46000A1c19EEEed1cC087d73725612', 'BEP20', '', NULL, NULL, NULL, NULL),
(503, 3165, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olanrewaju Ahmed Ayinla', '2209055894', 'Zenith', 'Savings'),
(504, 3620, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oke Daniel Adebayo', '0449782359', 'Guaranty Trust Bank', 'Savings'),
(505, 3626, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Tawakalt Maruff ', '0029858195', 'Static IBTC bank ', 'savings '),
(507, 3506, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ashiru magaji karaye', '0023807220', 'Unity Bank', 'Saving account'),
(508, 2807, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ashiru magaji karaye', '0023807220', 'Unity Bank', 'Saving account'),
(509, 2207, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ADAMU RABI\'ATU ARGUNGUN', '2681073897', 'ECOBANK OF NIGERIA', 'SAVINGS'),
(511, 3257, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Marvelous Odili ', '7818692749', 'Wema Bank ', 'Savings account '),
(512, 479, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Clementina omobhude ', '0724253304', 'Access bank ', 'Savings '),
(513, 3693, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Wema', '0239718857', 'Aliu Benjamin Buli', 'Saving'),
(514, 3680, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oladunjoye Micheal', '8227922012', 'FCMB', 'Savings'),
(515, 3659, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Paul Bamaiyi Ojih', '2463587694', 'Zenith Bank', 'Savings'),
(516, 3354, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chukwuezi prince Chimereucheya', '2057505383', 'UBA BANK', 'Savings account'),
(517, 3635, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'AYUBA Magani', '2020070928', 'First bank', 'Current account'),
(518, 3310, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Bukola chinyere falobi', '9301994482', 'Stanbic IBTC', 'Savings'),
(520, 3625, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Anthony Godwin Tolulope', '0251888043', 'Guaranty Trust Bank', 'Savings'),
(521, 3637, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aanuoluwapo blessing falobi', '2263188284', 'Zenith Bank', 'Savings'),
(522, 589, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Stella nkechi falobi', '1004812028', 'Zenith Bank', 'Current'),
(523, 1978, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Stella nkechi falobi', '1004812028', 'Zenith Bank', 'Current'),
(524, 1982, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Stella nkechi falobi', '1004812028', 'Zenith Bank', 'Current'),
(525, 3667, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Iroegbu Ogechi Chidinma ', '0147501067', 'Union Bank of Nigeria Plc ', 'Savings '),
(526, 2645, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwalioba Charles', '0056479207', 'Access Bank ', 'Savings'),
(527, 325, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adam Apalando Abubakar', '2013048091', 'Kuda Microfinance Bank', 'Saving'),
(528, 3768, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Omoyibo mercy', '2008262903', 'Zenith bank', 'Saving'),
(529, 3404, 'mobile', 'NGU NIXSON SHU', '677106473', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(530, 3774, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ISIAQ OLASUNKANMI ABDULRASAQ', '2020882341', 'KUDA', 'MICROFINANCE BANK'),
(531, 3186, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'David Nwachukwu Ezennia', '2209833137', 'Zenith Bank', 'Savings'),
(532, 3730, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akinbola Gbenga Anthony', '3035914614', 'First Bank', 'Savings '),
(533, 843, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Excellent Daniels-Jimoh', '1201054747', 'Eco Bank', 'Savings'),
(534, 3312, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Samuel Vincent Ayugu', '0220638518', 'GTB', 'Savings'),
(535, 3466, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayinde Oluwadamilare', '0011056875', 'Gtbank', 'Saving'),
(536, 3703, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oluwafemi David Mayomi ', '2212690882', 'Union Bank of Africa (UBA)', 'Saving '),
(537, 3674, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Monday T Alaku', '3307034027', 'FCMB', 'SAVING'),
(538, 2350, 'mobile', 'Kah doulezeh embwa ', '680165981', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(539, 2281, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ehirim chioma', '1455230037', 'Access bank', 'Savings acct'),
(540, 3600, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Linus Onwubiko', '2074632341', 'UBA', 'Savings'),
(541, 2633, 'crypto', NULL, NULL, 'USDT', '0x10DDBD9fD48874631e3cd85020CCbE0F35D4225c', 'ETH', '', NULL, NULL, NULL, NULL),
(542, 3830, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'FIRST BANK PLC', '3061545675', 'ADEKUNLE OLUSEGUN DAVID', 'SAVINGS'),
(543, 3804, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adetoyese Oyetayo', '0243200153', 'Wema Bank', 'Savings'),
(544, 2567, 'mobile', 'Mbonjo Emmanuella Fanwi', '+237671754504', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(545, 3722, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Treasure Johnson ', '2087871566', 'UBA', 'Savings'),
(546, 3860, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Amanie chioma Damaris', '3091812446', 'First bank', 'Savings account'),
(547, 3308, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, '2393944585', '2393944585', 'Zenith', 'Saving'),
(549, 3836, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Johnson Abraham Oluwaseyi ', '0531980272', 'GTBank ', 'Savings '),
(550, 3894, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ARIYIBI QOSIM ADESOLA', '3078142379', 'FIRST BANK OF NIGERIA', 'SAVINGS'),
(551, 3705, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Eco bank', '3271038799', 'Simon obiajuru omoroje ', 'Saving'),
(552, 3717, 'mobile', 'Browndon Dicknwi Mafany', '+237672745156', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(553, 3792, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chukwudulue Valentine Chidera', '2156050951', 'UBA Bank', 'Savings account'),
(554, 3601, 'mobile', 'Linus Kwani', '237677673915', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(555, 3046, 'mobile', 'Adeniyi Theophilus Taiwo ', '08167106291', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(556, 2898, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Stephen Abiodun Oladejo', '2014998382', 'KUDA', 'Savings'),
(557, 1901, 'mobile', 'Simon Ntah Tafah', '678631038', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(558, 3739, 'mobile', 'Linda kalu', '679885227', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(559, 4001, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Access Bank', '0048685882', 'Josiah Ogunjobi', 'Savings'),
(560, 3779, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogbuji Victor Chijindu', '0045426915', 'Access Bank', 'Savings Account'),
(561, 3132, 'mobile', 'Lendgemo Ruddy Leinyuh ', '671776352', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(562, 2310, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Shittu Usman ola', '2079441546', 'United Bank for Africa (U.B.A)', 'Current'),
(563, 3647, 'mobile', 'PETER MUMUKOM JUNIOR CHIBEH', '675586848', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(564, 3982, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwaleke Stella udoka', '3010147204', 'First bank', 'Saves'),
(565, 4003, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aliyu Abdulrahman', '0250837415', 'GT Bank', 'Savings'),
(567, 2709, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Atibaka Kate', '2083456406', 'ZENITH BANK', 'Saving'),
(568, 4067, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'SAMUEL JOY OLANIKE ', '2001706640', 'FIRST BANK ', 'CURRENT '),
(569, 1748, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ADEWOLE TAOREED ADEKUNMI', '2254446133', 'ZENITH', 'Savings'),
(570, 1705, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ODUKOYA FUMMINIYI OLUGBENGA', '2150363743', 'U B A', 'Savings'),
(571, 1469, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Offor ijeoma stella', '0778245847', 'Access bank', 'Savings'),
(572, 4071, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Inim Nsidibe victor', '2056915866', 'United Bank for Africa', 'Saving '),
(573, 943, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Awurulor Perpetual Onyinyechi', '0076939173', 'Access bank', 'Savings'),
(574, 1020, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Princess Blessing Amadi', '6002671510', 'Keystone', 'Saving'),
(575, 3297, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Williams kenechi okoh', '2402269249', 'Zenith bank ', 'Savings'),
(576, 3633, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Jegede Ajibola Joseph', '0057597457', 'Access Bank', 'Saving Account'),
(577, 2167, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Opawale Rachael Oluwatosin', '0142008947', 'GT Bank', 'Savings'),
(578, 840, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Simon Ifeanyi chukwu', '2419461331', 'Zenith bank', 'Savings'),
(579, 1952, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Habila Mohammed', '0596395606', 'GTBank', 'saveing'),
(581, 1825, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Muhammed Mahmud kokamii', '3125354603', 'FirstBank', 'Saving'),
(583, 538, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Lawal saheed Adekunle', '0248056534', 'Gtbank', 'Saving'),
(584, 3646, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oguanumba chima', '2130574282', 'United Bank of Africa', 'Savings'),
(586, 1983, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Yusuf Dalhatu', '2360108503', 'Zenith Bank', 'Saving'),
(587, 3110, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Esther Omieta Ojemu', '2211441878', 'Zenith Bank', 'Savings'),
(588, 2557, 'mobile', 'REFOR GAUIS MBONJO', '+237683755687', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(589, 1822, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinedu Elijah Nwokpo', '1470238403', 'Access Bank', 'Savings'),
(590, 2902, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Gabriel Oluwasegun Charles', '2219572019', 'Zenith bank', 'Savings'),
(592, 3568, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olatunji Fisayo Felix', '0058995422', 'Access bank', 'Savings'),
(593, 2717, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Iroabuchi chidera victory', '3068166082', 'First bank', 'Savings'),
(594, 3561, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'TINA NKIRU UMEJIEGO', '2162703926', 'UNited bank of Africa UBA bank', 'Saves account'),
(595, 878, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Asen Aondosoo Godlov', '3109312966', 'FIRST BANK', 'Savings'),
(596, 2272, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abubakar Ibrahim', '3153364669', 'First Bank', 'Saving account'),
(597, 935, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Namo Blessing Awazi', '3087160348', 'First bank', 'Saven'),
(598, 2635, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ajulo Oluwaseun Samuel', '0725351276', 'Access Bank', 'Savings'),
(599, 3967, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Esekido Felix ', '2267664838', 'Zenith bank ', 'Savings '),
(600, 4027, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adelusi Oluwatoyin Bernadette', '0020204159', 'Union Bank Nigeria PLC', 'Savings Account'),
(601, 3786, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, ' Utibeabasi Godwin Daniel', '6173453530 ', 'Fidelity', 'Savings'),
(604, 3694, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Azuka Ifesinachi Javier ', '3139858106 ', 'First Bank', 'Savings '),
(605, 4064, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Muojiuba Onyinyechi Perpetual', '0733780031', 'Access Bank PLC', 'Current account'),
(606, 3206, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nneoma Ogbonda M', '2065173561', 'UBA', 'savings '),
(607, 3150, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Christianah Williams', '2369142904', 'Zenith Bank', 'Savings'),
(608, 3318, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Raphael Grace', '0006854570', 'Stanbic bank', 'Savings account'),
(609, 3742, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Faith ogbeide ose', '2080518703', 'Zenith Bank', 'Savings'),
(610, 1638, 'crypto', NULL, NULL, 'USDT', 'TKuDevoScfTrwE7MHAfQkPfKdgi6B6V5Q7', 'TRC20', '', NULL, NULL, NULL, NULL),
(611, 1650, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Israel William Collins', '1486625671', 'Access bank', 'Saving'),
(612, 4173, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Global madam empolly stores', '0791205693', 'Access bank plc', 'Current account'),
(614, 2940, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chukwuma John Ebele ', '3053292017', 'Firstbank', 'Saving'),
(615, 3852, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Somto Nweke', '3171677439', 'First bank ', 'Savings Account'),
(616, 3416, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Juliet Adamma Shenge', '0108485599', 'Access (Diamond) bank', 'Savings'),
(617, 4141, 'mobile', 'Foryoung Junior', '+237677802114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(618, 4184, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sixtus Meh', '2382136664', 'Ecobank', 'Savings'),
(619, 3850, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Alomere Goodluck Omamurhomu', '0139231631', 'GTB', 'Saving'),
(620, 3231, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ojo Temitayo isaac', '3071248021', 'First bank', 'Savings'),
(621, 1808, 'mobile', 'NKUIN EUGENE YONG', '654150437', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(622, 2547, 'crypto', NULL, NULL, 'BNB', '0xDbB827f150ED1d0828826Bb5426Cb58De64F03d5', 'BEP20', '', NULL, NULL, NULL, NULL),
(623, 4018, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aniah marvelous ashiue', '3087677930', 'Firstbank', 'Savings'),
(625, 3594, 'mobile', 'Sama Regis Pedros', '675216978', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(626, 3745, 'crypto', NULL, NULL, 'BNB', '0x487270d9f064bfcb087593179C99A44681715410', 'BEP 20', 'Binance smart chain', NULL, NULL, NULL, NULL),
(627, 3883, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aisha Nnaguda Abdullahi', '3010892731', 'First bank', 'Savings'),
(628, 3781, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sunday Aduojo Peter', '2387918174', 'Zenith Bank', 'Savings'),
(629, 4218, 'mobile', 'Nkengafac Gabriel Ngulefac ', '673117762', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(630, 3528, 'mobile', 'BRAIN PATRICE IKOME ELIO NJONJE', '653217316', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(631, 2385, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Anwilika Uwadileke', '2282809207', 'Zenith', 'Savings'),
(632, 431, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'MUSTAPHA  AHMAD', '0501697944', 'Sterling Bank', 'Savings'),
(633, 4334, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Anyanwu Chiamaka Cynthia', '3116994173', 'First bank plc', 'Savings'),
(635, 4271, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyeyemi favour Bola', '0629810382', 'Gt bank', 'Savings'),
(636, 3926, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Jeremiah David Jesutolami', '0215107544', 'Guarantee Trust Bank', 'Savings'),
(637, 2508, 'mobile', 'Abongdia Nadege Nameunui', '670615312', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(638, 3583, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Access bank', '0067810063', 'Victor udofia', 'Current'),
(639, 4315, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ukpeli James', '8038501414', 'Opay (PayCom)', 'Savings'),
(640, 3809, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Obinna Emmanuel Nwabuikwu', '0766176456', 'Access bank', 'Savings'),
(642, 4407, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Fregene paris', '2281240575', 'Zenith Bank', 'Savings'),
(644, 4389, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okolie Stephen Chukwuma', '3090985875', 'First Bank', 'Savings'),
(645, 4401, 'mobile', 'Fortoh Xaris dasi', '+237654099983', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(646, 4370, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sifon Effiang', '3083303345', 'First Bank', 'Savings'),
(647, 4432, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Gor Simeon saaondo', '9304062072', 'stanbicIBTC Bank', 'Saving'),
(648, 4444, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Blessing sule ometere', '0080766110', 'Access bank', 'Saving'),
(649, 4410, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Boniface victor chiedozie', '0786340051', 'access bank', 'Service'),
(650, 3838, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Omorinsola Doris Isikekpei ', '1018594968', 'Polaris Bank', 'Savings'),
(651, 879, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'FAITH NGOZI NNAMJIDE', '0696469361', 'ACCESS BANK', 'SAVINGS'),
(654, 1117, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Talabi Gbekeloluwa Olumide', '0050066189', 'Gtbank', 'Savings'),
(655, 4358, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UGWU INNOCENT FRIDAY', '0041846299', 'Guaranty Trust Bank', 'Savings'),
(656, 4512, 'mobile', 'Francis Tangem Sahnji ', '677178019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(658, 4406, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Guarantee trust bank', '0142491950', 'Balogun oluwashina Michael', 'Savings'),
(659, 4507, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, ' IYANUOLUWA ABIODUN ', '2456787876', 'Zenith ', 'Savings '),
(660, 4320, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olebara Nma Beatrice', '0700728844', 'Access Bank ', 'Savings'),
(661, 4522, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Grace Asuquo Ebung', '0768909456', 'Access Bank', 'Saving'),
(662, 3174, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Moses brownson', '0254690795', 'GTB', 'Savings'),
(663, 4567, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Peter omega matudi', '2239225841', 'UBA', 'Savings '),
(665, 4318, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ike chinemerem great', '1233260199', 'Access bank plc', 'Savings '),
(666, 4473, 'mobile', 'Nche Blaise', ' 683162763', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(667, 4384, 'mobile', 'Uzodinma Emmanuella', '09035207349', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(668, 4534, 'mobile', 'FONLON RAISSA', '+237670491120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(669, 4579, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OKANLAWON OLUFEMI ELIJAH', '6013647852', 'Keystone Bank.', 'Savings'),
(670, 3919, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Essien Lydia Paulinus', '0216744780', 'Guarantee trust bank', 'Savings'),
(671, 4480, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Patrick osayi ogana', '2105505112', 'united bank for Africa', 'savings'),
(672, 4501, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Miracle Asiegbu ', '2365214696', 'Zenith Bank ', 'Savings '),
(673, 2429, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Babawale Adekanye ', '0016774644 ', 'GTB', 'Savings'),
(674, 4577, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zenith bank', '2209564631', 'Eirekholo Philip', 'Savings'),
(675, 4624, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okoro amarachi Francisca', '0810073661', 'Access', 'Savings'),
(676, 4437, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Gabriel Chukwumela Ahiauzu', '0029941381', 'Stanbic ibtc bank', 'Savings'),
(677, 2590, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sogbesan Micheal Fisoye', '2133902495', 'UBA PLC', 'Savings'),
(678, 4213, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Standard chartered bank', '5004622993', 'Ejesi elochukwu Lawrence', 'Saves '),
(679, 2333, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Alfred Andrew Gidi', '1497331417', 'Access ', 'Savings'),
(680, 4605, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'MADU MICHAEL IFEANYI', '3079567614', 'First Bank of Nigeria', 'Savings'),
(681, 4481, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oshotse David oshoriamhe', '2114083841', 'UBA', 'Savings'),
(682, 4650, 'mobile', 'SERAPHINE NYOMAH LESHUA', '652615314', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(684, 4575, 'mobile', 'Bunje Sharon Beri', '+237650991178', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(685, 3923, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Omobolanle famose', '0232276009', 'Gtbank', 'Savings'),
(686, 4431, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Basil Chisom', '0663730286', 'Guaranty Trust Bank  (GTB)', 'Saving account'),
(687, 4472, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sani Danjuma Mohammed', '3085093408', 'First Bank Of Nigeria', 'Savings'),
(689, 1459, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezeh Goodness Obiageri', '0022143127', 'Access bank', 'Savings'),
(691, 4726, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Samuel Micah', '2270309658', 'Zenith Bank', 'SAVINGS'),
(692, 4479, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Essiet Victoria. Udofia', '3026244580', 'First Bank', 'Savings'),
(693, 4582, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ZUBAIRU ISREAL', '2134020804', 'UNITED BANK FOR AFRICA (UBA)', 'SAVINGS'),
(694, 4737, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Eze Joel onyebuchi', '0029078908', 'Access Bank', 'savings '),
(695, 4438, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Esther Sokolayam Matswamgbe ', '0348396019', 'First city monument bank. ', 'Savings '),
(696, 4541, 'mobile', 'Rita Ohabuenyi', '09157070040', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(697, 4057, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Osere Sebastian princely', '2126878129', 'UBA', 'Savings'),
(699, 4768, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Clement Benedict Nimzing', '0075710126', 'Sterling bank', 'Saving'),
(700, 3534, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Victoria Edet Antigha ', '3165821518 ', 'First bank ', 'Savings '),
(701, 2363, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ajirioghene McEwan ', '0010171416', 'Guaranty Trust Bank ', 'Current '),
(702, 4748, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Michael Onyekachi Bennett', '1524058586', 'Access Bank', 'Savings'),
(703, 4733, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'AZEEZ ASUDE', '0243680199', 'WEMA BANK', 'SAVING'),
(704, 4482, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'IBEH CHIEDOZIE LAMBERT', '2021115150', 'Kuda microfinance bank', 'Savings'),
(705, 3858, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Agbam Christiana Ojum', '0046529397', 'Union Bank', 'Savings'),
(706, 4493, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okoro Timothy Chibuike', '0499159749', 'Gtb', 'Savings'),
(707, 4816, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kalu ngozi nancy', '0087447553', 'Access(Diamond)', 'Savings'),
(708, 2758, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Joseph ojapah', '0069116037', 'Diamond Bank', 'Savings'),
(709, 3921, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Lawal munirat Olabisi', '0261429689', 'GTB', 'Savings'),
(710, 3890, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ibukun Catherine olajumoke', '2055823728', 'UBA', 'Current'),
(711, 4795, 'mobile', 'Looh Martha Nyah', '653539154', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(712, 4811, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oby Atiegoba-Jack', '0136189542', 'GTB', 'Savings'),
(714, 4706, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olalekan Ismail lawal', '2149530406', 'UBA', 'Savings'),
(715, 3918, 'mobile', 'CHANCELINE NZELLE EBAH', '651944946', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(716, 4307, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abegunde benjamin', '0103322653', 'Access bank', 'Savings'),
(717, 4723, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Johnson Joseph uchenyo ', '0250485321 ', 'Wema bank', 'Saving '),
(718, 4463, 'mobile', 'Pius Esembe Ikoli', '+237650954154', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(719, 4760, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezenwa Obiajulu Paschal', '2022909602', 'Kuda Microfinance bank', 'Savings account'),
(721, 4849, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Dabiri-Anam Aghogho Ethel', '0244806841', 'Guarantee Trust Bank GTB', 'Savings'),
(722, 4854, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Obiekwe Augusta Chimaobi', '2374517902', 'Zenith', 'Savings'),
(723, 4382, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oladepo James olumide', '1500002408', 'Access bank', 'Savings account'),
(724, 4727, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UDOUMANAH DAVID PIUS', '2341244012', 'ECOBANK', 'SAVINGS'),
(725, 3518, 'crypto', NULL, NULL, 'Usdt ', 'TE6asrtCjK5w91QpzJ7JpY2a9AmX12scbF', 'Trc20', '', NULL, NULL, NULL, NULL),
(726, 4404, 'mobile', 'Kafain Marcel ', '676222378', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(727, 4879, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Omisami Andrew Sunday', '3144394488', 'First Bank', 'Savings'),
(728, 1527, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Deborah Olumolu', '2082366544', 'Zenith Bank PLC', 'Savings'),
(729, 586, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ben Ogbonna Okechukwu', '2010701913', 'UBA', 'Saving'),
(730, 4910, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Benjamin Olamide Folarin', '3083735675', 'Polaris Bank', 'Savings'),
(731, 4882, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Affanou Pierre', '0350289055', 'GTBANK ', 'savings'),
(732, 788, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chimamanda Anumba Emmanuella', '2200748782', 'UBA', 'Savings'),
(733, 4989, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Guarantee Trust Bank ', '0176456860', 'Olusola Emmanuel Segun ', 'Saving '),
(734, 4862, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Taiwo yahyah', '2170276203', 'Zenith bank', 'Saving'),
(735, 2014, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'NZEALO COSMAS CHINONSO', '5900427019', 'First City Monument Bank ', 'Savings '),
(736, 4663, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'MATHIAS UTIUNG', '2137298064', 'UBA', 'Savings'),
(737, 4846, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Obinna Olebara', '0043281470', 'Guarantee Trust Bank', 'Savings'),
(739, 823, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, ' Anumba Chiamaka Irene', '2200749208', 'UBA', 'Savings'),
(740, 5103, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Agada Maria Nancy', '6019964251', 'Fidelity', 'Saving'),
(741, 4142, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Etebefia Rita .O', '2182802816', 'United Bank of Africa', 'Savings'),
(742, 876, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olua Chinyere', '3077872422', 'First Bank of Nigeria', 'Savings account'),
(743, 5026, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'MUSA PANSHAK MANASSEH', '2214894059', 'Zennith bank', 'Savings'),
(744, 4581, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nosakhare Ogbemudia fortune', '2149090654', 'UBA Bank', 'Savings'),
(745, 5108, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okeke Ndidi Ijeoma', '0054095802', 'Sterling Bank', 'Saving account'),
(746, 3151, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OLUWAFEMI FAKUADE OLUWAKAYODE ', '3144003496', 'First Bank ', 'Savings'),
(747, 5120, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abdullahi salihu', '2137323180', 'United bank of Africa', 'Savings'),
(748, 5126, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abdullahi salihu', '1464381908', 'Access bank', 'Savings'),
(749, 5107, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sunday Chidera Wisdom', '2018483493', 'Kuda Bank', 'Savings'),
(750, 3248, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adeniji Titilola Olasumbo', '0030382197', 'Guaranty Trust Bank ', 'Savings'),
(751, 4914, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ademide Adeniji', '0461325237', 'Guaranty Trust Bank ', 'Savings'),
(752, 3571, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayomide ogunmolawa', '2425392335', 'Zenith', 'Verve'),
(754, 4572, 'mobile', 'Kwei Elvine', '+237652622368', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(755, 3326, 'mobile', 'Ijeoma ibekwe', '08100106247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(756, 2889, 'mobile', 'Tawe Franklin ', '672153206', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(757, 5190, 'mobile', 'Ezeani Augustine', '07061987513', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(758, 5205, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adegoke Kehinde', '0018835956', 'GTB', 'Savings'),
(759, 2957, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Megu Katsum', '0638904740', 'GT Bank', 'Savings'),
(760, 1988, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Iwunze Pinto Princess ', '0437130296', 'GTB', 'Savings'),
(761, 2608, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ngene Roselyn Obianuju', '1019794061', 'UBA', 'Current'),
(762, 4957, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Bamgbala David Oluwasanmi', '0714249333', 'ACCESS BANK PLC', 'Savings'),
(763, 4928, 'crypto', NULL, NULL, 'Trust wallet', '0xcD4bB408E659242C60b511168FC5c7ACd9F40C4e', 'BEP20', '', NULL, NULL, NULL, NULL),
(764, 5140, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Yila Joseph', '0043012274', 'Access (Diamond) ', 'SAVINGS'),
(765, 4965, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Victoria OLUFUNMILOLA ADEKANYE', '2034340079', 'First Bank', 'Current account'),
(766, 5185, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zenith bank account', '2219065984', 'Akolawole Abiodun Sam', 'Zenith'),
(767, 5008, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Jeremiah Ochoyama Akonye', '2053454328', 'UNITED BANK OF AFRICA (UBA) ', 'SAVINGS '),
(768, 5247, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'YAKUBU YILA JAMES', '0124954101', 'UNION BANK', 'SAVINGS'),
(769, 4183, 'mobile', 'Kanjo Junior Ndzi', '651498960', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(770, 4383, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'VICTOR EKENECHUKWU  NNAMJIDE', '4470003012', 'FCMB', 'SAVINGS'),
(771, 5237, 'mobile', 'Sam Gmarvis njong', '+237677877572', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(772, 4610, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'AJAYI ABAYOMI ADEMOLA', '2004894038', 'UNITED BANK FOR AFRICA PLC', 'SAVINGS ACCOUNT'),
(773, 5253, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Efeobhokhan Josiah', '0019419360', 'Ibtc', 'Savings'),
(774, 5261, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Liberty Eyoh', '1994489018', 'FCMB', 'Saving'),
(775, 5285, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ALEX JAMES AGBUBELE', '0039263978', 'ACCESS BANK', 'SAVINGS ACCOUNT'),
(776, 2378, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adejoh Alexander Alhassan', '2111260449', 'UBA', 'Savings'),
(777, 3401, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'BABALOLA DARE MATHEW ', '2091642822 ', 'UBA', 'SAVINGS '),
(778, 2440, 'mobile', 'Ngalla Godlove', '+237672817093', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(779, 3259, 'mobile', 'Ngubeh Therese Kongui', '237653537398', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(780, 5258, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ebube Chidiebere Sunday', '0079661594', 'Sterling bank ', 'savings'),
(781, 5324, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chike Stella nneoma', '5493010838', 'Ecobank', 'Current'),
(782, 4766, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OLAYINKA ADEKANYE', '0006872488', 'GTB', 'SAVINGS'),
(783, 5282, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Owofio Rita', '0092977238', 'Access bank', 'Savings'),
(784, 4683, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'SULAIMAN ATINUKE ESTHER', '0242101882', 'WEMA BANK', 'SAVINGS'),
(786, 5198, 'mobile', 'olaoye Wale muhyideen', '+2347069600590', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(787, 5392, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'GT   BANK  PLC', '0472580306', 'MEGWA AUGUSTINE  IFEANYICHUKWU', 'SAVING'),
(788, 2773, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nelson Mordecai Chizoba', '0248488115', 'Guaranty Trust Bank', 'Savings'),
(789, 5382, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Jalon Denyi  Amasu', '0230175043', 'Gtbank ', 'Savings '),
(790, 4151, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adejo Unekuojo Paul ', '0301618503', 'GTBANK ', 'Serving act'),
(791, 5222, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Shola oladele', '3019272196', 'First bank', 'Saving account'),
(792, 4548, 'mobile', 'Fotio wamba bodouan', '671925607', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(793, 5267, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Igbanibo Dengimo-owei Alex ', '2111672343', 'Zenith bank', 'Savings '),
(794, 5249, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ime Abraham sylva', '40222001541', 'EcoBank', 'Current'),
(795, 5328, 'mobile', 'Joan Amban Chick ', '676312614', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(796, 4441, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Maryam Mahmud', '2360234097', 'Zenith Bank ', 'Savings'),
(797, 3810, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Bellona Stanley Mamud', '1005456300', 'UBA', 'Current'),
(798, 5476, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UBA', '2220257138', 'Adegoke Samson adegboyega', 'Saving'),
(800, 5416, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olaniyan Akinola Tope', '0095039551', 'Access', 'Savings'),
(801, 5180, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Dayo Ojeyemi', '0016508290', 'Gtbank ', 'Savings '),
(802, 5538, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nzemeka tonymartins', '3143083880', 'First Bank', 'Savings'),
(803, 5535, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Obafemi Moses Temiloluwa Gilgal ', '0260710777', 'Guaranty trust bank', 'Savings account'),
(804, 5406, 'mobile', 'Enow Edith Enengwe', '674981200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(805, 4415, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okotie Monday Joseph', '2128205259', 'UBA', 'Savings'),
(806, 1989, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abubakar Yunusa', '2019869634', 'Kuda microfinance bank', 'Savings'),
(807, 3117, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Agboola Ayokunle Segun ', '2214246861', 'Zenith bank ', 'Saving '),
(808, 1884, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Esonanjo Josephine Oghale ', '0286052664', 'GTB', 'Savings '),
(809, 3130, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Erhire Grace Oghale', '2190759924', 'Zenith Bank', 'Savings account'),
(810, 5542, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Babajide Emmanuel Oluwabamise', '1436140065', 'Access bank plc', 'Savings'),
(811, 5483, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwankwo Samuel Chidiebele', '2229872475', 'UBA', 'Saving'),
(812, 5549, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Prince Ekene Ikejiaku', '2016947430', 'United Bank of Africa', 'Savings'),
(813, 5563, 'mobile', 'Hassan Enugu', '+237676547778', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(814, 3622, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayogo hycienth', '1483608402', 'Access', 'Saving'),
(815, 3079, 'mobile', 'Yerimah Edmond', '679316492', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(816, 5605, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Dagana Robinson Miebi', '2011474090', 'United Bank for Africa', 'Savings'),
(817, 5095, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Hyginus Nkemjika Emmanuel', '2122250835', 'Zenith Bank', 'Saving'),
(818, 3149, 'mobile', 'Ayatong Telson Mukum ', '+237675704123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(819, 5037, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Usman Ahmed', '0502706140', 'Sterling bank', 'Saving account'),
(820, 5393, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sunday ojemeri', '0026804085', 'GTB', 'Savings account'),
(821, 5391, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okafor Felix Kingsley ', '2014300637', 'First Bank plc', 'Current Account '),
(822, 4532, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emmanuel Christopher ', '5171046724 ', 'Ecobank', 'Saving account '),
(823, 3893, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ahmad muktar', '0050722192', 'Unity bank', 'Savings '),
(824, 5646, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Precious okorocha chibata', '0148823621', 'unlon bank', 'service'),
(825, 5589, 'mobile', 'Ngalle élise aimée ', '676141340', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(826, 3398, 'mobile', 'Tangwa Fondzenwa Godfrey', '+237677543590', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(827, 5675, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sunday Bright Adukwu', '1504340532', 'Heritage bank', 'Personal'),
(828, 4954, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'GTB ', '0159994244', 'Oteri Josephine ', 'Saving '),
(829, 2402, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Joseph Austine okechukwu', '0036417677', 'Access bank', 'Savings'),
(830, 5464, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Orinya Wisdom Chigozie', '3169554090', 'First Bank', 'First Bank'),
(831, 5717, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ajiboye Olanrewaju Emmanuel', '0452649214', 'Gtbank', 'Savings'),
(832, 4692, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Monica Haruna', '0228837788', 'GTbank', 'Savings '),
(833, 4770, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Pelemoh Monica Faith', '3048035719', 'First Bank ', 'Savings '),
(834, 3219, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ALADE OLUWASEUN ELIJAH', '2251213402', 'ZENITH BANK', 'SAVINGS'),
(835, 4702, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Hauwa Iliya Adamu', '0236330189', 'GTbank ', 'Saving '),
(836, 5481, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Owhe Eunice', '2095339074', 'Uba', 'Savings'),
(837, 5671, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogunniyi oluwaranti yetunde', '1219809440', 'Access bank', 'Savings'),
(838, 5782, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mustapha Ahmad', '2003470091', 'Kuda microfinance bank', 'Savings'),
(839, 5383, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kingsley Amaechi Ekeh', '6311185206.', 'Fidelity bank', 'savings '),
(840, 5541, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'AGBO CHINWENDU VICTORY', '2127229405', 'UBA', 'Savings'),
(841, 5730, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogunniyi Oludayo Julius', '0050762151', 'Gtbank', 'Savings'),
(842, 5647, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogunniyi Janet Ibiwumi', '0050719856', 'Gtbank', 'Savings'),
(843, 932, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Rhoda Bello Adeyinka ', '1379782157', 'Access Bank ', 'Savings '),
(844, 4781, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Hassan Usman', '0003641198', 'JAIZ', 'Savings'),
(845, 5800, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Blessed Kelechi Nwaeke', '2002476261', 'kuda', 'Savings'),
(846, 5742, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chukwunedum prosper chisom', '6554058758', 'Fidelity bank', 'Savings'),
(847, 5848, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Iheukwumere Favour Amarachi', '2270383384', 'Zenith bank', 'Savings'),
(849, 5821, 'mobile', 'Kelly Dzekewong', '+237680743336', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(851, 5509, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Joel Ehiremen Otaigbe', '2012149300', 'Kuda Microfinance Bank', 'Savings'),
(852, 2586, 'mobile', 'Chenwi Roland Ngwa', '652171292', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(853, 5731, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Suleiman Mohammed ', '0215242904', 'guaranty Trust Bank', 'saving'),
(854, 5410, 'mobile', 'Amendou Gilbert Ndam', '678319828', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(855, 5901, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adepele Elizabeth Dorathy ', '0002740921', 'Stanbic IBTC Bank', 'Current '),
(856, 4260, 'mobile', 'ATEHLEFAC LESLY ATABONG', '+237681155677', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(857, 3737, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ekwosimba Martins Ekene', '2018532724', 'Kuda bank', 'Current account'),
(858, 5937, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'REDEEMED UYOYO ODOGBO', '2113194676', 'UBA BANK', 'SAVINGS'),
(859, 5798, 'mobile', 'Asibong Javvis Tata-Ngoe', '+237679147959', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(860, 3787, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ekong Favour Etima ', '0693292775', 'Access bank', 'Savings'),
(861, 5344, 'mobile', 'Oyesanya Titilope', '08051013206', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(862, 3812, 'mobile', 'Nji Philemon Fru ', '+237 673946024', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(863, 5948, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Teddy Jude Oriakhu', '2282839105', 'Zenith Bank', 'Savings'),
(864, 5749, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olaleru Micheal', '2220027100', 'UBA', 'Savings'),
(865, 5868, 'mobile', 'Sunjo lewis Nyuykongi', '+237654392138', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(866, 3185, 'crypto', NULL, NULL, 'USDT', 'TJBVtKvmVJGWNWaYJCKWTxSoraUfJVUReM', 'TRC20', '', NULL, NULL, NULL, NULL),
(867, 5953, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyeniyi Adeniyi Oluwaseun', '3115460316', 'First Bank', 'Savings'),
(868, 5976, 'mobile', 'Henry Lobe', '677554546', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(869, 5837, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Wisdom Eromosele', '2401461572', 'Zennith bank', 'Savings'),
(870, 3089, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Samuel Onimisi Yusuf', '0627689494', 'Guarantee Trust Bank Plc', 'Savings Account'),
(871, 1171, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adeyemo Muideen Olalekan', '0175078735 ', 'Gt bank', 'Savings'),
(872, 3065, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Benedicta Bose Fingha', '2365707437', 'Zenith Bank', 'Savings'),
(873, 5470, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Confidence Eme-Oguguo ', '0043351393', 'Guaranty Trust Bank ', 'Savings account '),
(874, 2835, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ihunna amarachi Hannah ', '0201183561', 'GTbank ', 'Savings '),
(875, 5960, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Durkwa John Ayuba', '0148892944', 'GTB', 'Savings'),
(876, 847, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oloruntole Oluwasola Micheal', '0137367729', 'Guarantee Trust Bank', 'Savings'),
(877, 1093, 'crypto', NULL, NULL, 'Tether USDT', '0xd528d1bF0CA563afBE42E35C5357B0761e18aad4', 'ERC20', '', NULL, NULL, NULL, NULL),
(878, 6095, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayeyemi Samuel Mayowa', '3164033130', 'First Bank', 'Savings'),
(879, 3933, 'mobile', 'Ngantou Daniel Dinga', '+237652760484', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(880, 6118, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Tukki Sinsom Hassan', '0027198439', 'Guaranty Trust bank', 'Savings'),
(881, 3636, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'MICHAEL UGWUOKE', '2131832310', 'UBA', 'SAVINGS'),
(882, 4646, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akinwale rukayat anu', '2212913952', 'Zenith bank', 'Savings'),
(883, 3435, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okechukwu Happiness Chidumga', '0580019790', 'Ecobank', 'Saving'),
(884, 5109, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Magreth ebere obasi', '2217451213', 'Uba bank', 'Savings'),
(885, 6025, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olusegun Shina Kayode', '2065373622', 'UBA', 'SAVINGS'),
(886, 6033, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Peace Adebule', '2016650910', 'First bank', 'Current'),
(887, 1981, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Clara Anumba Amaka', '0083884239', 'Sterling bank', 'Savings'),
(888, 6146, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Victor Oboh', '0037886331', 'Access bank PLC ', 'Savings'),
(889, 6116, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UBA', '2065238530', 'Aina Oluwaseyi Olamide ', 'Savings'),
(890, 5691, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mary Paul ', '0069934433', 'access bank ', 'Serving act'),
(891, 6158, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'John lucky ', '6500949906', 'Providus Bank ', 'Savings '),
(892, 6113, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogungbenro Oluwatosin Rachael', '0617368693', 'Guaranty trust bank', 'Savings'),
(893, 5943, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ADELEYE PAUL IFEOLUWA', '3051922702', 'Polaris', 'Saving'),
(894, 6016, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Caleb Ekoh', '6322983073', 'Fidelity', 'Savings'),
(895, 5263, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'NDUNAESEOKWU CHINEDU ANTHONY ', '1394325469', 'ACCESS BANK PLC', 'Savings'),
(896, 317, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OGBENYIA CALEB IHECHI', '1001120147', 'VFD MICROFINANCE BANK', 'SAVINGS '),
(897, 6058, 'mobile', 'Thanks Keming', '+237653018457', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(898, 3059, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Casmir euphemia nwoke', '2210664562', 'United Bank of Africa', 'Saving'),
(900, 5979, 'mobile', 'Edith Ngwatang shutang', '673872299', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(901, 5728, 'mobile', 'Melisa  Tume Berinyuy', '+237653454974', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(902, 2060, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oshenyi Iroabuchi Samuel', '6556969959', 'Fidelity Bank', 'Savings'),
(903, 6147, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Unity', '0027045950', 'Ojo moses', 'Current'),
(905, 1070, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UTAZI ENOCH CHUKWUEBUKA', '8100324704', 'OPAY (PAYCOM)', 'Savings'),
(906, 2387, 'mobile', 'Evert Jai Lukong', '676139374', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(907, 2262, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Tolufashe Monday Olarewaju ', '2221423833', 'United Bank for Africa (UBA) ', 'Savings '),
(908, 3904, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Fidelity Bank', '5333043336', 'Ubong Ita Edet', 'Current account '),
(909, 4212, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onah Cynthia Ukamaka', '2404028503', 'Zenith Bank', 'Savings'),
(910, 4207, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Uzodi Esther Chinaza ', '2404033457', 'Zenith bank', 'Savings'),
(911, 1975, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinaza Sophia Anumba', '2200749693', 'UBA', 'Savings'),
(912, 312, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olalude Abiodun Dandy', '2049185229', 'UBA', 'Saving'),
(913, 3700, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Momoh Anuoluwapo Funmilola', '0630713535', 'Gtbank', 'Savings'),
(915, 3053, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ariyo Banke Deborah', '3064229334', 'First bank', 'Savings'),
(916, 2613, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chiamaka Dominic', '2401729940', 'Zenith', 'Savings'),
(917, 606, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayobami ojerinde ', '0253807016', 'Wema', 'Saving '),
(918, 5879, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ndaka Bashali', '2082181602', 'Zenith', 'Saving'),
(919, 3489, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ITODO EMMANUEL CHUKWUEMEKA', '3155609445', 'First Bank of Nigeria', 'Savings'),
(920, 2209, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aliyu Mutairu', '3119576110', 'First bank', 'Savings account'),
(921, 5859, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Demedougha Ebiwei Taye ', '2125593043', 'UBA', 'Saving '),
(922, 2392, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyewole Samuel Akinwumi', '1014903326', 'Polaris', 'Saving'),
(923, 2562, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Edeh Perpetual Nkeiruka', '0132143104', 'GTB', 'Savings account'),
(925, 1831, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'SHAMSUDDEEN MAARUF', '0002304872', 'JAIZ BANK', 'Saving'),
(926, 793, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Polaris', '3053790884', 'Usulor Monday ifeanyi', 'Saves'),
(927, 2480, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Fairmoney Newyear Ebimene', '7364386724', 'Wema bank', 'Microfinance bank'),
(928, 5734, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Gloria enebeli ', '3020913656', 'Polaris ', 'savings '),
(929, 3723, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Patricia Mary Uzochukwu', '1407987598', 'ACCESS BANK', 'Savings'),
(930, 4648, 'mobile', 'Gansey farley Petnyin', '670675902', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(931, 6184, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'MITCHELL AMAECHI EZIKEOJIAKU', '0140271341', 'GUARANTY TRUST BANK', 'SAVING ACCOUNT'),
(932, 844, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwakaife-Ugboma Maryrose Chinasa', '0826748586', 'Access Bank', 'Savings '),
(933, 3451, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Odigomma Festus Emedike', '0079705258', 'Access bank', 'Savings'),
(934, 2087, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okafor chinwe scholastica', '8594619012', 'FCMB', 'Saving'),
(935, 6228, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Falola Quadri', '2255858229', 'Zenith Bank', 'Savings account'),
(936, 4996, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ekuma Felix Chukwu ', '0462465730', 'GTB', 'Savings');
INSERT INTO `f_wallet` (`w_id`, `w_user_id`, `w_type`, `w_fullname`, `w_phone_number`, `w_coin_name`, `w_coin_address`, `w_coin_network`, `w_coin_memo`, `w_account_name`, `w_account_number`, `w_account_bank_name`, `w_account_bank_type`) VALUES
(937, 4772, 'mobile', 'Ndandah chumbow', '+237653408659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(938, 6232, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Omolabi teslimat yewande ', '0120946012', 'Gtbank ', 'Savings'),
(939, 3007, 'mobile', 'Kingsley Kingsley Agwu', '07019863995', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(940, 2283, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ASUKWO OKON EBIEME', '2003106059', 'Zenith', 'Saving'),
(942, 3973, 'mobile', 'Mbuonenui Japhet Yunishie', '670088407', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(943, 6152, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OGBEDE EMMANUEL NDUBUISI', '2115017751', 'UBA bank', 'Savings account'),
(944, 4819, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Arinze Ejefobiri', '2023219564', 'Kuda bank ', 'Savings '),
(945, 4851, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chukwudi Ogechukwu frances', '0022956218', 'Union bank', 'Savings'),
(946, 5828, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Bankole Samson Alao', '0264041112', 'GTB', 'Saving'),
(947, 3284, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Offia Oluchi Modester', '0035613506', 'Access bank', 'Saving'),
(948, 5914, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Orianwo kate', '5414812019', 'fcmb', 'savings'),
(949, 1485, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Yirensuso solomon seth', '0234893327', 'Guaranty trust bank', 'Savings '),
(950, 2544, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Greatjoy victor okoroma', '1237294512', 'Access bank', 'Savings'),
(951, 4189, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'PETER NNAJI', '0033899030', 'Stanbic IBTC Bank', 'Savings'),
(952, 4019, 'mobile', 'Neba bodwine che', '671993515', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(953, 2997, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'DAHUNSI GANIYAT IDOWU', '2284092531', 'ZENITH BANK', 'SAVINGS'),
(954, 4345, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adeniran Saheed Babatunde', '2124146349', 'UBA', 'SAVINGS'),
(955, 3182, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okpanobo Catherine Eseakpoberue', '0810659540', 'Access bank ', 'Saving account '),
(956, 6314, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kareem Sodiq Tunde', '0641600480', 'GT Bank', 'Savings'),
(957, 1529, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sagir Usman', '0025286632', 'Access Bank', 'Saving'),
(959, 6221, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, '1462550043', '1462550043', 'Ugwuoke Matthew chuhwuebuka', 'Access bank'),
(960, 6226, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Moninuola Margaret Akinseinde ', '3132256112', 'First bank', 'Saving'),
(961, 6317, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Leo emeruwa odikaesieme', '2121212968', 'Zenith', 'Savings'),
(962, 5343, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okeke Esomchi Joshua', '2205463677', 'UBA', 'Savings'),
(963, 5737, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Leo Odikaesieme', '0050131294', 'Access ', 'savings'),
(964, 6294, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emeruwa Leo Odika', '0736498421', 'Access ', 'Savings'),
(965, 6084, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abasifreke Effionge Ekpah', '2198296928', 'Uba', 'Saving'),
(967, 5112, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zainab dzwafu hassan', '2369230353', 'Zenith bank', 'Saving'),
(968, 4740, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'JOSHUA CALEB', '3115835738', 'First Bank', 'Saving'),
(969, 6080, 'mobile', 'NJEMBU FESE BLESSING ', '678417684', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(970, 6057, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'amusa kehinde lateef', '2010511318', 'kuda ', 'saving'),
(971, 6390, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emmanuel Onuchukwu ', '2284860736', 'Zenith Bank ', 'Savings '),
(972, 3805, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'JULIUS UGEH BISHUNG', '2252374511', 'Zenith Bank', 'Saving'),
(973, 5226, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Francis Tom', '2429227783', 'Zenith Bank', 'Serving'),
(974, 4258, 'mobile', 'Manyong ufuoka tracy rhoda', '652033840', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(975, 6430, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mbamara Ibezim Emilia', '2073495327', 'United Bank for Africa(UBA)', 'Savings'),
(976, 1307, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Idoko Leviticus Yahjindu', '3182729899', 'First bank of Nigeria', 'Savings account'),
(977, 6499, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Justina Chineye Eze', '1015017270', 'UBA', 'Current'),
(978, 6410, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Peter bethel Echezochukwu ', '6032787197', 'Keystone bank ', 'Savings '),
(979, 2098, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Innocent Arinze olovo', '1494709011', 'Access Bank', 'Savings '),
(981, 6186, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Afolabi wasiu olamilekan', '08137966932', 'GTB BANK', '0130185274'),
(982, 4283, 'mobile', 'Tatah Kelly Noela Nyarkamo ', '652146045', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(983, 5789, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nureni Ahmeed ', '5559588017', 'Fcmb ', 'Saving '),
(984, 5530, 'mobile', 'delli OIZOULDA', '652360191', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(985, 4645, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ifagbuyi Peter', '2005490604', 'Kuda', 'Savings'),
(986, 5764, 'mobile', 'NKONGHO GAELLE CHE', '+237673285730', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(987, 3831, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Alebiosu Mary Kehinde', '3040867176', 'First bank', 'Verve'),
(988, 5656, 'mobile', 'Sunday Tracy njweng', '+237651304911', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(989, 4948, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Salamat Kako-Are', '0055466878', 'Access bank', 'Savings '),
(990, 4708, 'mobile', 'Tamunang Nawti Alexander', '+237678589274', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(991, 5747, 'mobile', 'Tanteh Kalvin Muma', '+237 6 53 93 23 41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(992, 6168, 'mobile', 'USMANU AMADU ', '+237654296033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(993, 5620, 'mobile', 'Ntunyu Sere Ngala', '651000536', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(994, 5139, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aniagbaoso ceciliamary ogochukwu', '3023492263', 'First bk', 'Saves'),
(995, 6630, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adekunle Emmanuel', '3060476109', 'First bank ', 'Savings '),
(996, 6274, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Darlington Agu', '1406736610', 'Access Bank', 'Savings'),
(997, 6014, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Elisha Bassey', '1399791278', 'Access Bank', 'Saving'),
(998, 6696, 'mobile', 'TATA SCHERODER FOBID', '677621376', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(999, 5968, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ekatu A. Gloria', '2046016890', 'UBA', 'Savings'),
(1000, 5701, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abdulrahman Mufutau ', '3109773307', 'First Bank', 'Saving Account '),
(1001, 6706, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwaogu Godfrey Chinenye', '2087975354', 'UBA united Bank for Africa', 'Saves'),
(1002, 6600, 'mobile', 'Ferderic Bouyiba ', '673924520', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1003, 4730, 'mobile', 'Chia Ranson Ngam', '+237698027643', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1004, 6883, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezeani Stephen chisom', '2209543283', 'Zenith bank', 'Savings'),
(1005, 6693, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'United bank for Africa', '2124693829', 'Almutanna Muhammad', 'Saving Account'),
(1006, 6896, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ugorji Chinyere Mary ', '2974741023', 'FCMB', 'Savings'),
(1007, 6637, 'mobile', 'BRUNO JUNIOR NEBA ABONGDIA', '+237683776589', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1008, 5963, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'MICHEAL JAMES OLUWADIMIMU', '6230127017', 'FCMB', 'savings'),
(1009, 6784, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Timiere cleopatra yinkore ', '0011903717', 'Stanbic ibtc bank ', 'Current account '),
(1010, 6776, 'mobile', 'Atabong Nkiahlebong Joseph', '672098910', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1011, 6617, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Silvia  Nneoma Ogu', '2366508222', 'Zenith bank', 'Savings'),
(1012, 2685, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aka Tochukwu ThankGod', '0109556100', 'Access Bank', 'Savings'),
(1013, 2501, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Morebise Oluwasegun A', '2016158078', 'Kuda Microfinance bank', 'Savings'),
(1014, 6909, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onwuchekwa chetachukwu', '2369717171', 'Zenith bank', 'student'),
(1015, 6664, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Paul Ochowechi', '2079456500', 'UBA', 'Saving account '),
(1016, 6769, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sunday ifeanyi chukwu', '2179845550', 'Zenith bank', 'Saving account '),
(1017, 4211, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Tomere Dubamo', '2459076017', 'Fcmb', 'Savings'),
(1018, 5780, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oluebube Egbuchulem', '1470829913', 'Access Bank ', 'Saves '),
(1019, 4607, 'mobile', 'Demaris mbota mosaka', '671428464', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1020, 4848, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sadiq Kasim', '0262527214', 'Guarantee trust bank', 'Savings'),
(1021, 6872, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Koleoso Esther Agbomoalu', '0217121935', 'Guaranty Trust Bank(GTB)', 'Savings'),
(1022, 6738, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okoh Florence Foluke', '0697261414', 'Access', 'Savings'),
(1024, 6967, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, '0086220393', '0086220393', 'Union Bank ', 'Savings account'),
(1025, 6120, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Patrick Oviomo', '3050773643', 'First bank', 'Saving'),
(1026, 6960, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Alabi Ruth Olusayo', '0036138058', 'Access', 'Savings'),
(1027, 7023, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, ' Famous Emamuzou Alighomuwe', '2022159548', 'Kuda microfinance Bank', 'Current'),
(1028, 5117, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zainab hassan dzwafu', '2369230353', 'Zenith bank', 'Saving'),
(1029, 7073, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Standbic IBTC Bank', '0020700507', 'JOSEPH ABASHI', 'CURRENT'),
(1030, 6129, 'mobile', 'Nuradeen sani ', '09069507261 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1031, 7091, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mbang Anthony Ntui', '2284463845', 'Zenith bank', 'Saving'),
(1032, 4419, 'mobile', 'YOH MILDRATE', '+237678498789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1033, 7017, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onoyom Bassey Ikpeme', '3037092541', 'First bank', 'savings'),
(1034, 7112, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emmanuel pius olasunkanmi', '0108413196', 'GTBank plc', 'Saving'),
(1035, 7028, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ofodeme Chinyelu Onyinye', '2008358880', 'United Bank for Africa ', 'Savings'),
(1036, 7048, 'mobile', 'Fembe Metoko Etane', '652776945', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1037, 3031, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ABUBAKAR SALE SAIDU', '1238862079', 'ACCESS BANK PLC', 'SAVING'),
(1038, 5408, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akinwale rukayat anu', '0993083508', 'Eco bank', 'Savings'),
(1039, 2651, 'mobile', 'Akendoh Henry Bongaji', '676713998', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1040, 4121, 'mobile', 'Nkenfor Nkwate zidane', '+237682019199', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1041, 5296, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Daniel Bot James ', '1484785074', 'Access Bank', 'Saving '),
(1042, 7174, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'KATE PAUL OSENI', '3026684786', 'FIRST Bank', 'Savings'),
(1043, 4919, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Edith Okotietie', '0037391961', 'Union Bank of Nigeria', 'Savings'),
(1044, 3799, 'mobile', 'Chinenye Onyeoma', '08143191695', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1045, 5998, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'NWACHINEMERE THANKGOD CHIJIOKE', '1233600010', 'Access bank', 'Savings'),
(1046, 7194, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Bukola Ojeyemi', '3093823808', 'First bank ', 'Savings '),
(1047, 6627, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Stella nkechi falobi', '1004812028', 'Zenith Bank', 'Current'),
(1048, 7111, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nnanta Ruth C', '0028823597', 'Access Bank', 'Savings'),
(1049, 2584, 'mobile', 'Poulette shu Ayah', '653737498', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1050, 4393, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinasa Okonkwo', '3032329813', 'First bank of Nigeria', 'Savings'),
(1051, 7249, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwokoye ifeyinwa Endurance', '2147989282', 'UBA', 'Servings'),
(1052, 7274, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Daha Tijjani Ahmad', '5004314609', 'Standard chartered ', 'Savings'),
(1053, 7197, 'mobile', 'Anet Ekoli Ati', '679452645', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1055, 2470, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aminu Umar ', '779 012 8322', 'Wema bank', 'Saving'),
(1056, 7300, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onoyom Bassey Ikpeme', '3037092541', 'First bank', 'Savings'),
(1057, 5621, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogunsiji Adetutu Balqis ', '0050611682', 'GTCO', 'Savings'),
(1058, 4100, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UBA', '2223828559', 'Onayemi Emmanuel Oluwagbogo', 'Saving Account'),
(1059, 4052, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Muhammad Ibrahim', '2371368206', 'Zenith bank ', 'Savings '),
(1060, 4146, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Dick-Olueh Omatseye David', '2115892062', 'UBA', 'Savings Account'),
(1061, 6252, 'mobile', 'Agambom David Vumomse', '650697757', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1062, 7182, 'mobile', 'Taylor olusola Henry', '(908) 398-3004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1063, 614, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Erhabor Moses', '0013971194', 'Sterling Bank', 'Savings'),
(1064, 7398, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'GASALI ABDULSAMAD GBOLAGADE ', '0244246573', 'Guarantee Trust Bank GT-BANK ', 'saving'),
(1065, 6596, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'okosun phinito', '2283939796', 'zenith bank', 'savings'),
(1066, 2662, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Innocent simon agwu', '0064557349', 'union bank plc ', 'Saving'),
(1067, 419, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oghenekevwe Godswill Ewhujovwo', '0801616888', 'Access bank ', 'Savings'),
(1068, 4685, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chidiebere Oliver Ogduoro ', ' 8147359586 ', 'Opay', 'Online  bank'),
(1069, 5949, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olamide Femi Ojo', '2171600173', 'UBA', 'Savings'),
(1070, 4042, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Access bank', '0817201728', 'Kingsley Adiuba', 'Savings account'),
(1071, 3100, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'JAMES NICHOLAS', '2162383841', 'UNITED BANK FOR AFRICA', 'Saving '),
(1072, 6893, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ejike paul chetachukwu', '2118400930', 'UBA', 'Savings '),
(1073, 5166, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, ' Afam Salvation Chukwutem', '0102639552 ', 'union bank ', 'Savings'),
(1074, 7457, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Shima Salvation Myom', '2081732302', 'UBA', 'Savings'),
(1075, 7346, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Lawal Moshood Anuoluwapo ', '2147350651', 'Uba', 'Savings '),
(1076, 5353, 'mobile', 'Dzekamo Kingsly Dinyuy', '654237705', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1077, 7040, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Frederick Akpede', '3118323197', 'First Bank', 'Saving '),
(1078, 1314, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ali Shettima Adam', '0764060687', 'Access bank', 'Saving account'),
(1079, 7314, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Odulaja Ezekiel', '0676249605', 'Guaranty Trust Bank', 'Savings '),
(1080, 7492, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zenith bank', '2415468428', 'Joseph Akpojotor', 'Savings'),
(1081, 7462, 'mobile', 'BUSARI GANIYAT TEMITOPE', '8162357160', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1082, 7470, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adeniran Ibukun Temitope', '2136507846', 'UBA', 'Savings'),
(1083, 7522, 'mobile', ' Wirngo Alidu Bimela ', ' 674443116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1084, 6956, 'mobile', 'Nkwo Clovis Talah ', '+237679121545', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1085, 7501, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abejide Bunmi Precious ', '3071806247', 'First Bank', 'Savings '),
(1087, 5876, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sowunmi kayode Samson', '0076444099', 'Sterling bank', 'Savings'),
(1088, 6480, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Usman umar ', '0097464041 ', 'Access bank', 'Saving '),
(1089, 6792, 'mobile', 'funwie windy ', '674260609', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1090, 3333, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezeaku Ndidiamaka Anasthesia', '0108276982', 'Union Bank', ' savings '),
(1091, 7173, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ovwighoadjebre blessing onome', '0211310698', 'Guarantee trust bank', 'savings'),
(1092, 3311, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Yahaya Musa', '0081093099', 'Access bank ', 'Savings '),
(1093, 7171, 'mobile', 'Amadou Salamatu', '651565972', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1095, 7191, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chukwu chukwujekwu Jeremiah', '2020958400', 'Kuda microfinance bank', 'Savings'),
(1096, 7361, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyewo Grace Temilola ', '1455502754', 'Access ', 'Savings '),
(1098, 4571, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ENEBELI STELLA YEMISI', '2000422259', 'ZENITH BANK', 'SAVING'),
(1099, 7395, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyewo Lateef olasunkanmi', '3081057644', 'First bank', 'Savings '),
(1100, 7579, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mohammed bapetel bobbori', '2254858882', 'Zenith bank', 'Saving account'),
(1101, 7627, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Godsfavour oranu', '6558759170', 'Fidelity', 'Savings'),
(1103, 7414, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Gbenro Rufus olukunle ', '0051391094', 'Access ', 'Savings '),
(1104, 5407, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinenye Chiuba', '2366074211', 'Zenith bank', 'Savings '),
(1105, 7499, 'mobile', 'NJUA Yuh Vanessa Nabuin', '+237673731383', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1106, 2009, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chioma Agbo', '2414152272', 'Zenith bank', 'Saves account'),
(1107, 6130, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'AUSTINE OBIORA NWOBU', '1528761961', 'Access Bank', 'Savings'),
(1108, 6754, 'mobile', 'Vendufe Romeo', '677361829', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1109, 7611, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinonye   M   Ogbonnaya', '9303961525', 'Stanbic  IBTC Bank', 'SAVING'),
(1110, 443, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'MIRACLE IGHO OGHENEROH', '2214403376', 'UBA', 'Savings'),
(1111, 6781, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kemuel skwame Yusuf ', '1383700963', 'Access bank ', 'Savings '),
(1112, 4923, 'mobile', 'Bernadette Ijeumeni', '653385628', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1113, 7631, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Hassan Abdullahi', '2361968276', 'Zenith Bank', 'Saving'),
(1114, 5559, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'masud mubarak ', '2020011815', 'kuda bank', 'savings '),
(1115, 2257, 'mobile', 'Chieka Darrell Kimbi', '+237679074384', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1116, 7448, 'mobile', 'Mbeb cletus nkanji', '676157619', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1117, 1530, 'mobile', 'Ngalla scort meye', '671923877', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1118, 7651, 'mobile', 'WINIFRED NKUMUNGWO NKESI', '+237680279075', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1119, 6978, 'mobile', 'Asangwing Victory Apala', '+237654733986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1120, 5781, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Amaechi charity chijindu', '2114240659', 'UBA', 'Savings'),
(1121, 7268, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Caleb Elisha ', '6553959494', 'Fidelity bank ', 'Savings'),
(1122, 7761, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'AKEEM  OLASANMI   ABUBAKIR', '1414094964', 'ACCESS BANK PLC ', 'SAVING'),
(1123, 7918, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oladipupo Hussein Bolaji', '3158595572', 'First bank', 'Savings'),
(1124, 3163, 'mobile', 'ARRAH COMFORT TABOT', '680071225', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1125, 6000, 'mobile', 'Ngonglanceyuh', '+237653418113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1126, 7798, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Patrick Eze Chihurumnanya ', '0096167527', 'Access Bank ', 'Savings Account '),
(1127, 5432, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Itah testimony destiny', '0561643923', 'GTbank', 'Savings'),
(1128, 7344, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Iliya Lazarus', '8084878011', 'FCMB', 'Saving'),
(1129, 6494, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'AZIZI RABI YUSUF', '1009053745', 'UBA', 'CURRENT'),
(1130, 4710, 'mobile', 'Che Gracious Kendzeng', '+237 651128796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1131, 3938, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olisaemeka', '08149289548', 'Opay', 'Savings account '),
(1132, 6907, 'mobile', 'NJUAFAC LORIS NTELLAH ', '671141544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1133, 7938, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Awobono Olamide', '0015319301', 'Gtbank', 'Saving'),
(1134, 5377, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Osayomwanbor Felix Osayemwenre', '0221810119', 'GTB', 'Savings'),
(1135, 5532, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OBIJIAKU CHISOM HENRY', '2002612267', 'KUDA MICROFINANCE BANK', 'Savings'),
(1136, 4888, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akani-egwu Michael urom', '3160189936', 'First bank ', 'Savings '),
(1137, 8010, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mustapha sani', '3126869621', 'First bank', 'Saving'),
(1138, 7634, 'mobile', 'Tigwere Glory Engonwei', '651625426', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1139, 7320, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Folaremi Alonge', '2044751364', 'Uba bank', 'Savings'),
(1140, 7991, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Umoru David Haruna ', '0060132250', 'access bank ', 'Savings '),
(1141, 5980, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Omolebi Olakunle ojo', '2155923944', 'UBA', 'Savings'),
(1142, 7830, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Damudi Elizabeth chenemi', '0034088763', 'Access Bank plc', 'Savise'),
(1144, 7954, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Iyobosa Solomon', '2234241732', 'UBA bank', 'Savings account'),
(1145, 8002, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ALIYU SULEIMAN', '2256246777', 'ZENITH BANK', 'Savings'),
(1146, 4916, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ndubuisi Onyebuchi Praise', '6033768939', 'Keystone bank', 'Savings'),
(1147, 1920, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Musa Abdullahi yahaya', '0804022079', 'ACCESS BANK ', 'Saving account'),
(1148, 7202, 'mobile', 'NGATI JUSTINE NAHJELLA', '672980123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1149, 8083, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Joshua Enyi', '0724174412', 'Access bank ', 'Savings'),
(1150, 6173, 'crypto', NULL, NULL, 'USDT', 'TY7oYh5ZrFfvarqRi7f1tYYbQ7Sr96B3qS', 'TRC20', 'Transaction', NULL, NULL, NULL, NULL),
(1151, 7968, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ugwu Paul Nnaemeka', '1234943266', 'Access bank', 'Savings'),
(1152, 2946, 'mobile', 'Ayambatakor Louis takor', '654962024', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1153, 7338, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Wawan Victoria Bebe', '1395886013', 'Access Bank', 'Savings'),
(1154, 6542, 'mobile', 'Alphonsius Ndve', '672103350', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1155, 7039, 'mobile', 'Kongor Faith mukuh', '+237680484354', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1156, 6825, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Rukayya abubakar', '0469544456', 'Gt bank', 'Saving'),
(1157, 3719, 'mobile', 'Salami babatunde oluwaseun ', '08110450387', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1158, 7898, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Igboke Peculiar Chimuanya', '2183059222', 'United Bank for Africa', 'Savings'),
(1159, 7086, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ARI LIKITA ABUGA', '0091964453', 'ACCESS', 'SAVINGS'),
(1160, 8169, 'mobile', 'Egiri blessing Christian ', '08022350908', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1161, 6185, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'JESSICA SUNDAY ARENSON', '2222514749', 'UBA', 'SAVINGS'),
(1162, 6929, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sanusi Roqeeb Olalekan', '0223423463', 'GTB', 'Savings'),
(1163, 7581, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'CHRISTIAN OZOTU GODWIN', '2216380279', 'UBA', 'SAVINGS'),
(1164, 7593, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'DAUDA A DANIEL', '1009053824', 'UBA', 'CURRENT'),
(1165, 3234, 'mobile', 'Mouatou Penkmenge calvino ', '+237680514118', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1166, 5680, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'MURTALA ALUAGBI', '0016264856', 'UNITY', 'SAVINGS'),
(1167, 6458, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Lukman Ekundayo Anifowose ', '2020896236', 'Kuda microfinance bank ', 'Saving '),
(1168, 8252, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adio Peter Olakunle', '0430645706', 'Gtbank ', 'Savings'),
(1169, 3871, 'mobile', 'Belmondo Tiwa', '650387725', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1170, 8075, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Yusuf umar ', '3169972377', 'First bank ', 'Savings '),
(1171, 6268, 'mobile', 'Nfon Marrion ', '670917325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1172, 6634, 'mobile', 'Allain Kongnyu Gwei', '683411332', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1173, 8198, 'mobile', 'Cho Ndi Tembei ', '678765910', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1174, 7678, 'mobile', 'Kuinta kubalah', '681913876', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1175, 2260, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ukoh kosisochukwu blessing', '0066223404', 'Sterling bank', 'Savings'),
(1176, 5849, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ADEKOYA micheal', '0004060410', 'Gtbank', 'Savings'),
(1177, 8380, 'mobile', ' NJEMBU NELSON NKWELLE    ', '6 78 69 14 88', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1178, 8382, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ulebe Ezekiel', '2080642880', 'UBA', 'Savings'),
(1179, 8357, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ELOM FERDINAND IFEANYICHUKWU', '2075239558', 'UBA', 'Savings'),
(1180, 4246, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oyewande Temidayo', '0118403392', 'GTBANK', 'SAVINGS'),
(1181, 8277, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Osume Emmanuel Uyin', '0819965417', 'Access Bank', 'Savings'),
(1182, 7727, 'mobile', 'Angela Bari Ndzi ', '675828535', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1183, 7831, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Inaku fidelis odey', '0008966478', 'Access Bank', 'Savings '),
(1184, 5368, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'SUNDAY JUSTINA HADI', '6230915061', 'Fidelity bank', 'savings '),
(1185, 8401, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onifade Adewale', '0128300663', 'GTB', 'Savings'),
(1186, 8372, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Davidoscarblessing', '1239224562', 'Access bank', 'Saving'),
(1187, 4750, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Esther chinwendu Adia', '1230459255 ', 'Access bank ', 'Savings'),
(1188, 7037, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Moneke Okechukwu C', '5383775018', 'FCMB ', 'Current'),
(1189, 7453, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Igbinoghene osasuwen Collins', '2100362480', 'United bank of Africa', 'Savings'),
(1190, 8371, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Garba Ibrahim', '0023474548', 'GTB', 'Savings'),
(1191, 5418, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ADIGU KAYODE JOHNSON', '0058460713', 'ACCESS BANK', 'SAVINGS'),
(1192, 8442, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Tukele Iziegbe Chizoma', '3100008907', 'First Bank of Nigeria', 'Savings'),
(1193, 8328, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oletu Oghogho trust', '2103129510', 'United Bank for Africa', 'Savings'),
(1194, 5778, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adia Oviemuno', '0039184031', 'Access bank', 'Current '),
(1195, 8352, 'mobile', 'Ayuk Bessem Angel-Asumpta', '676317438', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1196, 2865, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akutamadu fortunate Damian', '0158569454', 'Union bank', 'Current account'),
(1199, 7441, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Giwa Ridwanullahi', '2005307889', 'Kuda', 'Saving'),
(1200, 5436, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ademola Kazeem Adedayo', '2257464725', 'Zenith Bank', 'Savings account'),
(1201, 8200, 'mobile', 'ACHELENGWA Valerie lanshi', '674682657', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1202, 5458, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Access Bank', '0055856829', 'Ademola Aminant Abiodun', 'Savings account'),
(1203, 5489, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Musa Aishat Ajoke', '5542419011', 'FCMB', 'Savings account'),
(1204, 5499, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oladipupo Taiwo Abimbola', '0775400117', 'Access Bank', 'Savings account'),
(1205, 5508, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Badimus Kafayat Abosede', '0223137775', 'GTB Bank', 'Savings account'),
(1206, 5519, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Owolabi Nurat', '2175736315', 'Zenith Bank', 'Savings account'),
(1207, 2945, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ademukolu Adesanmi Sunday', '2009055111', 'Zenith Bank', 'Savings account'),
(1208, 1363, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akinkuotu helen ', '0149000225', 'Gtbank', 'Savings '),
(1209, 6867, 'mobile', 'AYENG CLOVIS AYISEH', '675816002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1210, 8163, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Peace Emmanuel James', '6021048414', 'Keystone', 'Savings'),
(1211, 8682, 'mobile', 'Christian Afueh Mouleyes Ebua', '674740291', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1212, 8498, 'mobile', 'JATO George Nsalar', '653695413', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1213, 6528, 'mobile', 'VIERY AYONG MBAH TITA', '678299845', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1214, 8566, 'mobile', 'Benidict Banye', '+237654003034', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1215, 8265, 'mobile', 'Amodu Usman Faruk', '08069078409', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1216, 8542, 'mobile', 'Jeff Mofor Allo', '680510503', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1217, 8729, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mark Augustine Eyo', '2211400233', 'United Bank of Africa', 'Savings'),
(1218, 5942, 'mobile', 'Precious boseme', '672210983', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1219, 7804, 'mobile', 'Che Vanesa ', '673411037', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1220, 7772, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'First Bank', '3109423286', 'Blessing Eghosa Edokpayi ', 'Savings '),
(1221, 3840, 'mobile', 'PARTEMUS LEINYUY', '+237652962340', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1222, 8698, 'mobile', 'Francis Kongmia Gabuin', '676277434', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1223, 8772, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'CHIBUZOR CHIMAOBI BRYCE', '2192734059', 'UBA', 'Savings'),
(1224, 4287, 'mobile', 'Wainkem Daniel Nges', '671985590', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1225, 2666, 'mobile', 'David Jonathan', '08146165823', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1227, 7324, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'IGHODARO OSARETIN PROMISE', '0223137627', 'GTB', 'Savings '),
(1228, 8631, 'mobile', 'Ndike Mvungi Mark George', '670521281', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1229, 2606, 'mobile', 'Ndawaka Antoine ', '675150543', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1230, 4563, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sunusi Abba Haruna ', '0251845824', 'GT Bank', 'Saving'),
(1231, 6649, 'mobile', 'OKOH DANIEL', '08037722148', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1232, 7972, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onoyom Bassey Ikpeme', '3037092541', 'First bank', 'savings'),
(1233, 8869, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olayiwola Adegbolaga Cornelius', '2330044509', 'Zenith bank', 'Savings'),
(1234, 8157, 'mobile', 'Confidence Yanche', '674105782', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1235, 2230, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ndubueze Godwin Chijindu', '2016926541', 'KUDA microfinance bank', 'Savings'),
(1236, 4214, 'mobile', 'BAMBO DANIEL ', '+ 237677984391', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1237, 6280, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olusegun Busayo Gift', '1437007637', 'ACCESS', 'SAVINGS'),
(1238, 8673, 'mobile', ' Onang Vanessa Anembe', '670440085', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1239, 2532, 'crypto', NULL, NULL, 'Babydogecoin', '0xC0fE59a6837208432628679DB83c625613A85326', 'BEP20', '', NULL, NULL, NULL, NULL),
(1240, 8717, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Gilasom Jalon Amasu', '0048392623', 'Guaranty trust bank plc', 'savings'),
(1242, 8937, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Divine Christopher Asuquo', '3040908198', 'First Bank', 'Savings'),
(1243, 8847, 'mobile', 'Ngenue Melissa Nkambi', '670792177', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1244, 8802, 'mobile', 'Mac BRADO TITA', '654221271', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1245, 4475, 'mobile', 'Acha Emmanuel Check', '+237670651877', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1246, 6898, 'mobile', 'Mudeh Dieudonne Mukum', '673195510', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1247, 8904, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nnanna miracle chigemezu', '3128294355', 'First Bank', 'Savings'),
(1248, 8928, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Godwin Olorundare junior', '0072602406', 'Access bank ', 'Savings'),
(1249, 2952, 'mobile', 'Nkengafac Winifred  ', '682844701', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1251, 8331, 'mobile', 'Mukoro Ryan-Karl', '682482358', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1252, 9079, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OYINKANSOLA MERCY VICTOR', '3158686410', 'First bank of nigeria', 'Savings'),
(1253, 9065, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ILIYA RICHARD YAKUBU', '2065833746', 'UBA ', 'Savings'),
(1254, 6007, 'mobile', 'Thomas Ndifon Tikum', '680760551', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1255, 7737, 'mobile', 'Ngwang Diligent ngi', '237677337770', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1256, 2527, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Anita Akhikpemelo', '0458054571', 'Gtb', 'Savings'),
(1257, 8674, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ehise Otote ', '0076569512', 'Access bank ', 'Savings '),
(1258, 4691, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okale Elijah Abi', '2122042238', 'Zenith Bank', 'Saving'),
(1259, 9137, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Access bank', '1374385546', 'Jeremiah oluwafemi Joshua', 'Saving'),
(1261, 5686, 'mobile', 'Josephine Njoyep ', '+237653407069', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1262, 8514, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abolade owolola', '0156832244', 'GTB', 'Savings'),
(1263, 3801, 'mobile', 'Bemsimbom Randy', '670493205', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1264, 9183, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okewande Idowu Opeyemi ', '0067542021', 'Access bank', 'Saves '),
(1265, 8456, 'mobile', 'Wanyu pafaith fomonyuy', '+237674514886', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1266, 9028, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'First City Monument Bank', '7450855012', 'Edwin Sunday William', 'Saving'),
(1267, 6934, 'mobile', 'Nkumbe Leonard-sam', '671158235', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1268, 9175, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Bake Gideon', '1002700466', 'United Bank for Africa', 'Current'),
(1269, 8657, 'mobile', 'Matene Pezonho Synthiche', '682066617', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1270, 9143, 'mobile', 'Tchika petra chi ', '679074634', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1271, 8894, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'David Daniel ojochenemi', '2142899353', 'United Bank of Africa', 'Savings'),
(1272, 8658, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Patrick Ojay Pemu ', '0422115192', 'GTB', 'Savings '),
(1273, 8501, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kelvin Omoigbinedion Omorose ', '3188112866', 'First Bank Of Nigeria', 'Individual '),
(1274, 8253, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Murtala Hamisu', '0817535582', 'Access Bank', 'Saving'),
(1275, 9096, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ekom John david', '4959406019', 'FCMB Bank', 'Savings'),
(1276, 528, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Wilson Betty Akpowaidei', '0000560752', 'Access Bank', 'Savings'),
(1277, 8873, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'GODSPOWER  EMECHETA  IKECHUKWU', '3010008121', 'FIRST BANK', 'SAVINGS'),
(1278, 6470, 'mobile', 'VICTOR BASSEY INWANG', '08158536680', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1279, 8629, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adekoya Micheal Oluwatosin', '0007253981', 'Stanbic Ibtc Bank', 'current bank'),
(1280, 8540, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Idara Joseph Victor', '2090203152', 'U.B.A', 'Savings '),
(1281, 9254, 'mobile', 'AJIENUE FAITH CHE', '680167346', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1282, 9069, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ahaneku Chidimma M', '0019472420', 'Access bank', 'Savings'),
(1283, 7872, 'mobile', 'Bumuh Vera ', '677573173', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1284, 8960, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'PATRICIA MARY UZOCHUKWU', '1407987598', 'ACCESS BANK', 'SAVINGS'),
(1285, 7326, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Famati Richard Oluwasegun', '0070081867', 'Access bank', 'Savings'),
(1286, 8823, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mary Thomas Kuzah', '0012987411', 'Access', 'Savings'),
(1287, 9314, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Patrick Ojay Pemu ', '0422115192', 'GTB', 'Savings '),
(1288, 7386, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Hyacinth franklyn chukwdumeje ', '0078008608', 'Access diamond ', 'Savings '),
(1289, 4308, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UMUKORO JOSEPH ONOREVAOGHENE', '2122262722', 'United Bank for African', 'Savings'),
(1290, 7538, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Fuokorighe Braladei Success', '0107096879', 'Access-Diamond', 'Saving'),
(1291, 8839, 'mobile', 'Njembu Queenta Nshume ', '676009488', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1292, 9336, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, '0732552086', 'SOYOYE AZEEZ SUKANMI', 'ACCESS BANK', 'SAVINGS'),
(1293, 5720, 'mobile', 'Ese Okobia', '+2348134994516', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1294, 6114, 'mobile', 'Tsakou Nzangue Dilan', '673628860', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1295, 9302, 'mobile', 'Ayuk Lucy takuebanga', '678018656', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1296, 8699, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adamu sule', '2098760408', 'U B A', 'Saving'),
(1297, 8320, 'mobile', 'Whapi Benedine ', '678727366', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1299, 6662, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UBA', '2126878129', 'Osere sebastian princely', 'Savings'),
(1300, 9356, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Juliana Ommi', '0588809634', 'GTBank', 'SAVINGS'),
(1301, 9367, 'mobile', 'ABWA ABWA SAMUEL ', '654300645', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1302, 9349, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Hadiza Nabiye Yila', '0026306871', 'GTBank', 'SAVINGS'),
(1303, 9331, 'mobile', 'Goodness G.', '09064740659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1304, 8706, 'mobile', 'Rodrique Ful Tim', '680328065', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1306, 9384, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Brume obodoku', '3042012901', 'First bank', 'Saving'),
(1307, 2128, 'mobile', 'Nji jedidiah mbah', '+237672150290', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1308, 9388, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OLADELE OLUSEGUN JAMES', '0031634988', 'Access', 'Saving'),
(1309, 7363, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zenith bank', '2219614674', 'Rachael Opeolu Olakanla', 'Savings'),
(1310, 8465, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Galadima Ibrahim muazu', '0457094943', 'Gt bank', 'Seving'),
(1311, 9260, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwaekwe Williams Ikenna', '0253566844', 'GT bank', 'Savings'),
(1312, 7298, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chioma Favour Ani', '6012985507', 'Fidelity Bank', 'Savings'),
(1313, 8744, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'NWAKILE EBUBECHUKWU', '6151567743', 'Fidelity bank', 'Savings'),
(1314, 8927, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Elizabeth opara nnanna', '2190239183', 'Zenith Bank', 'Savings'),
(1315, 9380, 'mobile', 'Ngwa Noela', '672850748', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1316, 9392, 'mobile', 'Chagam Idrisse', '653211996', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1317, 9406, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ekene Angela Obi', '0036926367', 'Access bank ', 'Savings '),
(1318, 9448, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adetutu Balqis Ogunsiji ', '0050611682', 'GTCO', 'Savings'),
(1319, 3672, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olanrewaju muheez abiodun', '0152736652', 'union bank', 'savings'),
(1320, 6758, 'mobile', 'Tiwa Coufong sidoine', '679394829', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1321, 9455, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezekwobi ngozi Antonia ', '2004409836', 'Zenith ', 'Savings'),
(1322, 9396, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ezeanyeagbu Adaobi Jennifer ', '3011602897 ', ' Polaris bank', 'Savings'),
(1323, 7780, 'mobile', 'Emma Takuebangha', '673870479 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1324, 7680, 'mobile', 'Ebune prodencia ongeke ', '6 53 60 99 85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1325, 2376, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UBA', '2053250032', 'OHare Margaret', 'Savings'),
(1326, 5829, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinwuba Augustine Ikechukwu', '3137746036', 'Firstbank', 'Savings'),
(1327, 4943, 'mobile', 'Walters Tito Azah ', '654938541', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1328, 9526, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OZOEZEH HARRISON CHIBUIKE', '6024159364', 'KEYSTONE', 'Savings'),
(1329, 9517, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Uzoma Nnenna Chika', '2089162370', 'United Bank for Africa', 'Savings'),
(1330, 3912, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adedeji Funmilayo Victoria', '3076078980', 'First Bank', 'Savings'),
(1331, 5944, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogbuagu Chioma', '0062486373', 'Access bank', 'Savings'),
(1332, 5295, 'mobile', 'Haris washui', '652207994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1333, 3183, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Alloh Tunde Collins ', '0007468907', 'Guaranty Trust Bank', 'Savings '),
(1334, 4603, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Manuwa Patience Omolayo ', '0029813141 ', 'Guaranty Trust bank(Gtb) ', 'Savings'),
(1335, 8922, 'mobile', 'Che Rene Fusi', '+237681381798', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1336, 6306, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Bridget Ukwade', '3049942922', 'First Bank plc', 'Savings'),
(1337, 9565, 'mobile', 'Geukeu chime Francine ', '652135193', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1338, 4935, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'IGBINEDION GODWIN OSEADE', '2112173159', 'UBA', 'Service '),
(1339, 8846, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Umar Abdullahi salihu', '2164677890', 'UBA', 'Saving'),
(1340, 9580, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Hamza Huseini', '3120262873', 'First bank', 'Saving account'),
(1341, 8172, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, '  nwachukwu precious chidimma ', '3113531775', 'First bank ', 'Savings '),
(1342, 6015, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olukoya Boluwatife Emmanuel ', '3135433334', 'First bank ', 'Savings '),
(1343, 9194, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zenith Bank', '2283438316', 'chinonso victory mgbechi', 'Savings '),
(1344, 5119, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Uche Ebere Justice ', '2084453206', 'Zenith Bank ', 'Savings '),
(1345, 8379, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Benedict Obiora Ubajaka', '6040414297', 'Fidelity bank', 'Savings'),
(1346, 5444, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Bennett Olamilekan Akintolure', '2010579787', 'Kuda Bank', 'Savings '),
(1347, 1345, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mohammed Mohammadu hamman Adama ', '3115886895', 'first bank ', 'saving account '),
(1348, 5321, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Bennett Olamilekan Akintolure', '0435665901', 'GTBank', 'Savings '),
(1349, 9378, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Yahaya hamisu', '2217073831', 'UBA', 'Saving'),
(1350, 6024, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Francis Stephen', '2217641278', 'Zenith Bank Plc', 'Savings'),
(1351, 9429, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Faith Anisiobi', '2033091271', 'UBA', 'Savings'),
(1353, 9581, 'mobile', 'YVONNE AMBAI KONGWE', '676808952', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1354, 9608, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mustapha Ahmad', '0246318143', 'Wema bank', 'Savings'),
(1356, 8536, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Udin Victor Oghenevo', '0015061033', 'GTBANK', 'Savings'),
(1357, 8845, 'mobile', 'Samba faith Nwajeh ', '+237654833924', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1358, 2129, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ISRAEL EGEDE', '2285908682', 'ZENITH BANK', 'SAVINGS'),
(1360, 5260, 'mobile', 'Eyo Nyong', '08067775588', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1361, 8798, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abdulwasiu Sulyman Olamilekan ', '0465239237', 'GTB', 'Savings '),
(1362, 9650, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogunniyi oluwaseun grace', '0816062016', 'Access bank', 'Savings'),
(1365, 3960, 'mobile', 'KUNJEM MOUICHE HONORE', '650239078', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1366, 9064, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onajobi Ayomide Oluwaranti ', '0737309106', 'Access Bank ', 'Savings '),
(1367, 9393, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adebukola Adewunmi Benard', '2015400101', 'First Bank', 'Current'),
(1368, 7878, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adedayo Alice Abosede', '2121047700', 'Zenith bank', 'Savings'),
(1369, 8814, 'mobile', 'Agbortogo Emmanuel Nsoyo', '675858265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1370, 9120, 'mobile', 'BAIRING GONMOGA', '+237673986341', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1371, 5703, 'mobile', 'Tangwe Sandra Neg', '654124106', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1372, 9262, 'mobile', 'Togna Tongue Nzenkwe Florianne', '651635211', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1373, 5361, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, '1403824006', '1403824006', 'Access bank', 'Savings'),
(1374, 4918, 'mobile', 'Belangeley Etane Balikey', '683616156', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1376, 7026, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Osaze Godspower Imorame', '1520536437', 'Access Bank', 'Savings account'),
(1377, 1486, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Idowu Mosadioluwa Idowu', '2018284791', 'First Bank', 'Current '),
(1378, 9502, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Goziemartin', '6151555814', 'Fidelity bank', 'Savings'),
(1379, 8778, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kuda Bank', '2011208246', 'Isah Muhammad saeed', 'saving'),
(1380, 5011, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Iwuajoku Blessing Ebere', '2124437197', 'United Bank of Africa (UBA Bank)', 'Saving Account'),
(1381, 2873, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Uche Sandra Ezeama Josephine', '6160023371', 'Fidelity bank', 'Savings'),
(1382, 4145, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abdulhakeem Abubakar', '2461705139', 'Zenith Bank', 'Savings account'),
(1383, 9481, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Eze Chidom', '1219985018', 'Access Bank', 'Savings Account'),
(1384, 7014, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Agi Josephine Peace', '0021614152', 'Access bank', 'Savings'),
(1385, 4484, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ehisuoria Clifford Oyakhilomen', '2264673703', 'Zenith bank', 'Savings'),
(1386, 8433, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adesoji Akinade Monsuru', '3108902513', 'First Bank', 'Savings'),
(1387, 3305, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Smith Wisdom David ', '0468098646', 'GTBank', 'Saving Account '),
(1389, 5643, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Fidelity Bank', '6052206206', 'Veronica Akpen', 'Saving');
INSERT INTO `f_wallet` (`w_id`, `w_user_id`, `w_type`, `w_fullname`, `w_phone_number`, `w_coin_name`, `w_coin_address`, `w_coin_network`, `w_coin_memo`, `w_account_name`, `w_account_number`, `w_account_bank_name`, `w_account_bank_type`) VALUES
(1390, 9113, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kingsley Chinedu Agbazue', '6001299316', 'Heritage Bank', 'Current'),
(1391, 9744, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Anochili Oluchi ', '2453160166', 'Zenith bank ', 'Savings account '),
(1393, 4561, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'John Daibo', '3056665883', 'First bank', 'Savings'),
(1394, 6539, 'mobile', 'Minkhia Saker Ghaanguo', '676461825', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1395, 4015, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chioma Okorie', '3118202722', 'First bank', 'Savings account'),
(1396, 6655, 'mobile', 'Toh Josiah Neakoh', '+237651923483', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1397, 6287, 'mobile', 'NDATELOR ZIBION ATOH', '682478810', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1398, 4228, 'mobile', 'Akia Samuel Chah', '671223492', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1399, 350, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OKANYA JOSHUA CHISIMDI', '2063758504', 'UBA Bank', 'Savings'),
(1400, 7102, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Aishat Umar', '2059635738', 'UBA', 'Saving'),
(1401, 7497, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'GASALI ABDULSAMAD GBOLAGADE ', '2022830999', 'KUDA BANK', 'Saving '),
(1402, 3811, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chika chukwudubem Ethelbert great', '2195707562', 'Uba', 'Savings'),
(1403, 3842, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Moyebi Emmanuel Akolawole', '2080852863', 'Zenith', 'Savings'),
(1405, 2530, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adeoye Abdulbasit Temitope', '0506380137', 'GTbank ', 'Savings'),
(1407, 9527, 'mobile', 'Ayuk Thomas Antem', '674511433', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1409, 9685, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nnah Sunday', '0040583411', 'Unity Bank', 'Saving'),
(1410, 7090, 'mobile', 'Princely bibidla', '237650730452', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1411, 3553, 'mobile', 'Fonsah Pageo', '675416098', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1413, 4196, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Echekwu Michael chukwudi', '2121972280', 'United Bank of Africa', 'Savings'),
(1414, 8575, 'mobile', 'Tiosop therese', '654759832', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1415, 8757, 'mobile', 'Gefeh Niwuh Christian', '670834526', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1416, 9687, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Obodumu eche John', '2033104131', 'First bank', 'Current'),
(1417, 9485, 'mobile', 'Babila Caleb', '678680041', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1418, 8589, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogundipe Ayodele Abioye', '0012709697', 'Guaranty  trust Bank, GTB', 'Savings'),
(1419, 3911, 'mobile', 'Nchotu Ringnyui Nidelle Suh', '670726116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1420, 9308, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Atueyi chidozie simplicity', '2070281789', 'U.B.A', 'Savings account'),
(1421, 5496, 'mobile', 'BESSEM BELTHA AYUK', '678166313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1422, 9350, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Emmanuel Nicholas Ndatuwa', '2016401729', 'Kuda microfinance', 'Savings'),
(1423, 6178, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Francis Gospel', '6550935154', 'Fidelity', 'Savings'),
(1424, 8837, 'mobile', 'NOELA BIH MOKOM', '676768008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1425, 9599, 'mobile', 'Forkum Gordon Sama ', '672571968', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1426, 7007, 'mobile', 'Lot Neba Nche', '671948050', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1427, 9799, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayan Gabriel Oghenekpabo', '0612702555', 'GT bank', 'Saving account '),
(1428, 9263, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Zenith Bank', '2285247235', 'Chris Uchechukwu Royalseed', 'Commercial'),
(1429, 314, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'CHINAECHEREM PRECIOUS OKOYE-NNAEZE', '2010563070', 'KUDA BANK', 'SAVINGS'),
(1430, 9160, 'mobile', 'Blandine Crukoh ', '+237675595883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1431, 9140, 'mobile', 'Adeline nghuievo ', '+237652111318', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1432, 9989, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Jonathan Amodu', '3080965774', 'Polaris Bank ', 'Savings'),
(1433, 8639, 'mobile', 'Nfon Racheal lum', '650332715', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1434, 6721, 'mobile', 'Sorelle simo wouembe', '676794267', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1435, 510, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ndu holyson nkem ', '0020638589', 'Access Bank ', 'Savings account '),
(1436, 8129, 'mobile', 'AWA BRANDON AWA', '237675806959 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1437, 5537, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Afeez giwa', '2002691945', 'Zenith bank', 'Savings'),
(1438, 9702, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OLUWADARE MAKANJUOLA AYO', '0026665207', 'Access Bank Plc', 'Savings'),
(1439, 9564, 'mobile', 'Kwai-E-Zee Effendi Ndoufutai', '652222227', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1440, 9658, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Jimmy precious', '2428619864', 'Zenith Bank', 'Savings'),
(1441, 9707, 'mobile', 'BORIS SOREL KENFACK', '+237676792977', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1443, 6077, 'mobile', 'Toh Yvisimbom Jethro Kumah', '+237678447765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1444, 10007, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ntene Barinaadaa Dickson ', '0763531832', 'Access Bank ', 'Savings'),
(1445, 1061, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okeke blessing ngozi ', '2066644387', 'UBA', 'Saving'),
(1446, 2505, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ibukun Mathew Longe', '0814077007', 'Ibukun Mathew Longe', 'Savings'),
(1447, 8861, 'mobile', 'Mei Emmanuel Nchia', '+237 6 75 16 40 80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1448, 8981, 'mobile', 'MBAWEI NORAPhINE AWOM', '654892306', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1449, 6174, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Obedu Lotanna R.', '6011230169', 'Fidelity bank', 'Saving'),
(1450, 5633, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Angelina E Gaiya', '0135990725', 'GTbank', 'Savings'),
(1451, 7309, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akinrinde Alice Funmilayo', '0001809829', 'Stanbic IBTC', 'Savings'),
(1452, 8652, 'mobile', 'Penn Faithful', '678408809', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1453, 10063, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'TYOKENDE F SIMEON', '0562024792', 'ECO BANK', 'CURRENT'),
(1454, 8270, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Michael Ayomide taiwo', '2121751593', 'Zenith bank', 'Savings'),
(1455, 9390, 'mobile', 'Elibe Manfred Mekumba', '237651565292', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1456, 1857, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Salau Kamoli Akanni', '0000715392', 'Stanbic ibtc bank', 'Saving'),
(1457, 4483, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Suleiman Bilal Abdulrahman', '2201558168', 'United Bank For Africa', 'Savings'),
(1458, 9134, 'mobile', 'Emilia Njweng Mujem', '673223318', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1459, 8001, 'mobile', 'Patrick Pascal leinyuy', '+237681262909', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1460, 9258, 'mobile', 'Wirknar Richard Chin', '650495258', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1461, 10156, 'mobile', 'Muku Karngong Jececa', '675007867', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1462, 6262, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ifeoluwa W. Aderemi ', '2403804539', 'Zenith bank', 'Saving'),
(1463, 2299, 'mobile', 'REFOR GAUIS MBONJO', '678064461', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1464, 9144, 'mobile', 'BA’A JOEL LEMNYUY ', '650606582', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1465, 8453, 'mobile', 'Oumarou Dio ', '+237682342650', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1466, 2566, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ifebuche Samson', '7269263340', 'Wema bank', 'Savings'),
(1467, 8094, 'mobile', 'Suleman musa muazu', '+2347081664011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1468, 8637, 'mobile', 'Awe Adekunle Titus', '08056014611', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1469, 5644, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ruth Udom ', '2283707142', 'Zenith Bank ', 'Savings '),
(1471, 10064, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abraham Uwem Essien', '8142058875', 'Opay', 'Saving'),
(1472, 6713, 'mobile', 'Ngang Brandon Tsi', '680704419', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1473, 4580, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okolo innocent Eleojo ', '0094579416', 'Access bank ', 'Saving '),
(1474, 5836, 'mobile', 'SAAH NAHYEM', '680829435', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1475, 9684, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Msughter Elisha An-or', '1483646293', 'Access bank', 'Saving account'),
(1476, 6661, 'mobile', 'Wirdzenyuy Anthony', '672026226', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1477, 9797, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Joseph Emmanuel Olyver', '2411801988', 'zenith bank', 'saving'),
(1478, 3767, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Fasola Fadebi Ijaola', '0023496876', 'GTB', 'Savings'),
(1479, 9649, 'mobile', 'Oyere Laura Ojong ', '676530189', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1480, 7894, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Owolabi Felix Oluwaseun', '0669341613', 'Guarantee trust bank', 'Saving'),
(1481, 9149, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Happiness emmanuel amachree ', '0810716128 ', 'Access bank ', 'Savings '),
(1482, 10134, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Usman safiyanu', '3189749782', 'First Bank', 'Savings'),
(1483, 9806, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Jones Geoffrey Enoch ', '0260446434', 'GT Bank ', 'Savings Account '),
(1484, 9562, 'mobile', 'Shu Afuenwi Clinton Akumengwa ', '+237681110360', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1485, 3119, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Umar hamisu danladi', '2191716393', 'Zenith Bank', 'Save'),
(1486, 9077, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Nwankwo kenechukwu Samuel', '0047229976', 'Access Bank', 'Savings'),
(1487, 10267, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Anueyiagu David Chidera', '762 861 9017', 'FCMB', 'SAVINGS ACCOUNT'),
(1488, 1626, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onwuka Prince Nwabugo', '3098999436', 'First Bank', 'Savings Account'),
(1489, 10074, 'mobile', 'Nahfork Nicoline', '652454522', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1490, 8979, 'mobile', 'Beatrice mewabeu', '682476751', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1491, 10282, 'mobile', 'Mambo Chimalang Nadesh', '+237678166824', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1492, 4224, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Madu joy Chidimma', '2091821281', 'UBA', 'Savings'),
(1493, 6104, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Madu ngozi uchenna', '0089433985', 'Access bank', 'Savings'),
(1494, 9875, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Joshua Oche Sunday', '2029750959', 'UBA', 'Savings'),
(1495, 10068, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Onwuli Nneka Cecilia', '0220001589', 'Guaranty Trust Bank', 'Savings '),
(1496, 10322, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'John E I EDO', '4557827016', 'FCMB', 'Saving'),
(1497, 9344, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Raji mariam omeiza', '2154767198', 'United bank of Africa', 'Savings'),
(1498, 8597, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adomi Okeroghene ', '2026040527 ', 'First Bank ', 'Current account '),
(1499, 7355, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Salawu Rasheed Bamidele', '2020046349', 'Zenith', 'Saving s'),
(1500, 10153, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Prince ik uduka', '2123152224', 'UBA', 'Savings'),
(1501, 10369, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mercy john', '0258817943', 'Gtb', 'Saving'),
(1502, 8859, 'mobile', 'Ndzi Diane Musah', '677301238', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1503, 9679, 'mobile', 'Dinia bih Fobugwe', '+237676863224', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1504, 8758, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ayobami Emmanuel Lawrence', '0076031233', 'Sterling  bank', 'Savings'),
(1505, 9021, 'mobile', 'Mboh Evelyn ijang', '673409832', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1506, 4822, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogbunando Blessing Adaeze', '0615996852', 'Gtb', 'Savings'),
(1507, 10371, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chidi Naphtali Chinonso', '0068754214', 'Access Bank', 'Savings'),
(1508, 6346, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Utibe Ubon Udohaya', '2117945203', 'Zenith bank', 'Savings'),
(1509, 9338, 'mobile', 'Blessing Elizabeth Fafung Moussa', '+237672561716', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1510, 10482, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oluwatoyin Bamidele Mary', '3097467680', 'First Bank', 'Savings'),
(1511, 10223, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olaku Biliwa John ', '0038970301', 'Access bank ', 'Savings'),
(1512, 9662, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Agi Joypraise onma', '0044004808', 'Access Bank', 'Savings'),
(1513, 3990, 'mobile', 'Anyangwe Dickson Anangadi', '+237653377162', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1514, 10505, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Odika kosisochukwu', '2250606872', 'Zenith', 'Savings'),
(1515, 10065, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Paul Leviticos', '2117116098', 'Union Bank for Africa', 'Savings'),
(1516, 10350, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sadiq abdullahi adamu ', '2014673999', 'Kuda', 'Saving '),
(1518, 9607, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Princess Esther Eze ', '2151778737', 'UBA', 'Savings'),
(1519, 10032, 'crypto', NULL, NULL, 'USDT', 'TKyoymkjTyxvibsEprfoY8Sf3TGbyRhpCc', 'TRC20', '', NULL, NULL, NULL, NULL),
(1521, 7649, 'mobile', 'Doh marcelinus dayebga tambi', '+237653115895', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1522, 9724, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Istifanus talaka ayuba', '2286150787', 'Zenith', 'Savings'),
(1523, 10306, 'mobile', 'Thelma Doh Akwi ', '680689614', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1524, 6258, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adeyanju Busayo oluwaseun', '0064919853', 'Sterling bank', 'Saving'),
(1525, 10390, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'johnmoses Kelechi Chukwuma', '2180517217', 'Uba', 'Savings'),
(1526, 10545, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Omong Joy kechicuber', '3136333761', 'first bank', 'saving account'),
(1527, 10552, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Wololo Appiung Grace', '0022249424', 'Union Bank ', 'Saving'),
(1528, 4365, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogbu onyebuchi ', '0136301010', 'GTBANK ', 'Saves '),
(1529, 9619, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kareem-Ojo Khadijat Seun', '2018991350', 'Kuda bank', 'Savings'),
(1530, 10617, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ape Damola Emmanuel ', '2188795390', 'UBA', 'Savings'),
(1531, 9970, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'AKWASH JONATHAN JACOB', '0012936354', 'ACCESS', 'Savings'),
(1532, 8116, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sylvanus kenneth chinweotito', '1529970366', 'Access bank', 'Saving'),
(1534, 6433, 'mobile', 'Desiderio Boi', '650984696', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1535, 10209, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Agbalaka Kennedy', '2451659981', 'zenith', 'Current Account'),
(1536, 9657, 'mobile', 'Ndi Brilliant Ngwang ', '671189395', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1537, 10743, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ANIJIOFOR JOSHUA CHIMAOBI', '0102204183', 'UNION BANK', 'SAVINGS '),
(1538, 1847, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olaniyan Idayat', '0006431599', 'Access bank', 'Savings'),
(1539, 10543, 'mobile', 'Ernest kemoh ', '237680206460', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1540, 10815, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Dimaro jakare', '6035848640 ', 'Keystone ', 'Savings '),
(1541, 10653, 'mobile', 'TOBIFOR NCHANG MATIDAL', '+237672906835', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1542, 10404, 'mobile', 'Abunyam Jeremiah Ambe', '+237671731610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1543, 10820, 'mobile', 'Besong Immaculate Eyong', '676426982', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1544, 10683, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okafor progress kenechi', '4920010537', 'Eco bank', 'Savings'),
(1545, 10813, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Eze Franklin', '2177319547', 'UBA', 'Savings'),
(1546, 7468, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sowunmi Kayode Samson', '0030178691', 'Guarantee Trust Bank', 'Savings'),
(1547, 7868, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Fr ozumba Chidi jude', '6050548849', 'Fidelity bank', 'Savings'),
(1548, 10811, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Wema bank ', '7810086418', 'Susan Amuta ', 'Savings '),
(1549, 10434, 'mobile', 'Ndam micheal', '676286742', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1550, 10807, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olorunfemi Sunday Raphael', '0724433595', 'Access Bank', 'Savings'),
(1551, 9669, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Antigha, Victoria edet', '3165821518 ', 'First bank ', 'Savings'),
(1552, 6820, 'mobile', 'GOBTI MARVEL NSOM ', '671974441', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1553, 4470, 'mobile', 'Eta Tanimo Mohamed Mbeng', '651967447', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1554, 7668, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogundare oluwafemi Emmanuel', '0701942502', 'Access bank', 'Current'),
(1555, 9811, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OROGUN OCHUKO LUCKY', '2044320780', 'UBA', 'SAVINGS ACCOUNT'),
(1556, 5340, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Kemi Monday', '7019543909', 'PAYCOM/OPAY', 'Savings'),
(1557, 10823, 'mobile', 'Fon noela Neg', '672837223', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1558, 10580, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'JOSEPH C NWOBODO', '1018127075', 'UNITED BANK FOR AFRICA', 'CURRENT'),
(1559, 10902, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'OMIJIE EMMANUEL CHINAZA', '3169914386', 'FIRST BANK OF NIGERIA', 'Savings'),
(1560, 5352, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'ADEJUMOBI JONH OLUWAFUNMI', '2193380220', 'Zenith', 'Savings'),
(1561, 9305, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Matthew praise olamide', '3177622352', 'First bank', 'Savings'),
(1562, 8716, 'mobile', 'Mei Raphael Ndze', '+237673437190', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1563, 4149, 'mobile', 'Molua kelvin', '(+23) 767-3964178', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1564, 10427, 'mobile', 'ASANJI HUMPHREY ', '+237 678485833 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1565, 8789, 'mobile', 'Meme Rhoda Ethere Ngwe', '+237670184281', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1566, 10583, 'mobile', 'KAPIERDOUNE KASPAM', '673801271', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1567, 9250, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Alexander Ademola ', '2000208510', 'KUDA MFB', 'Savings'),
(1568, 8794, 'mobile', 'Yvanka Ngwashi khin', '+237682039637', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1569, 3682, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Iroakazi Chisom', '2221256396', 'United bank of Africa ', 'Commercial bank '),
(1570, 6648, 'mobile', 'FONJOCK BECKLY NKEMTENGU', '678474931', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1571, 9888, 'mobile', 'Ngu Michael Choh', '681027788', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1572, 8763, 'mobile', 'Tangah Delobel Kwen', '679678614', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1573, 1829, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Effiong Denis Bernard', '2157929232', 'UBA', 'Saving'),
(1574, 4565, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ifeanyi Nnayere', '6036098590', 'Keystone bank', 'Savings'),
(1575, 7356, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'antenyi ngbede joseph', '3048920563', 'first bank', 'savings'),
(1576, 10178, 'mobile', 'Kenne Lontsi Marius', '670628544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1577, 4602, 'mobile', 'Toumboure adjani ines', '651925533', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1578, 9696, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Vincent festus chidiebere', '2122792296', 'Zinith bank', 'Savings'),
(1579, 8593, 'mobile', 'Ndi Junior Cho Ndi ', '678162127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1580, 1837, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Haruna Mahmud', '2006099633', 'Kuda micro finance', 'Savings account'),
(1581, 7793, 'mobile', 'Mbuih Aisha Pendashi', '+237671480566', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1582, 7233, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Asneconstruction company', '5959083019', 'Fcmb ', 'Current '),
(1583, 2132, 'mobile', 'Njighang Christian', '+237654863906', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1584, 9541, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Margaret Musa', '2377510863', 'Zenith Bank', 'Savings '),
(1585, 10401, 'mobile', 'Sylvestre Staline Tchinda', '672169767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1586, 2297, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ikenna Ngene', '2005033584', 'Kuda bank', 'Service'),
(1587, 9801, 'mobile', 'Asenek Akwewoh Destian', '651761231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1588, 8266, 'mobile', 'Tchouala philomen ', '+237678013918', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1589, 11115, 'mobile', 'Maisa Elangwe Theophilus ', '670451781', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1590, 9697, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Omagajiya Agi', '0043939770', 'Access Bank', 'Savings'),
(1591, 9046, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adegboye Emmanuel Adejare', '3124359481', 'First bank of Nigeria', 'Savings'),
(1592, 3697, 'mobile', 'AJIRBEE SENA', '07033288303', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1593, 10514, 'mobile', 'Kelvin Abonge', ' 672634534', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1594, 7571, 'mobile', 'Mbuoni Claudette Ngeloh', '680815517', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1595, 5289, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'GTB', '0266649880', 'Ukonu Harrison', 'Savings'),
(1596, 11207, 'mobile', 'Fuh Quinette Nchangnwi', '676341122', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1597, 10067, 'mobile', 'Isah Vicky metango', '675658898', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1598, 5880, 'mobile', 'Ansah Leslie ngang ', '650726255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1599, 8668, 'mobile', 'Oben Bakia', '674275387', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1600, 10221, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Agi Anna', '1449084066', 'Access Bank', 'Savings'),
(1601, 11331, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinonyerem Uzor Lucy', '0056498203', 'Access bank', 'Savings'),
(1602, 11366, 'mobile', 'Kubi Boris Tanko', '673208045', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1603, 9583, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Charity ntol joseph', '2215873323', 'zenith bank', 'savings'),
(1604, 8216, 'mobile', 'Chui Romeo tita', '681378597', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1605, 9178, 'mobile', 'Takeng Dorcase Ngwanya', '650424700', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1606, 11326, 'mobile', 'Akem Mariette Anji', '679742544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1607, 10384, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Donatus Gabriel Peter', '0152399022 ', 'Guaranty Trust Bank Nigeria ', 'Savings'),
(1608, 5491, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Quadri Lukman A', '0215989067', 'GTB', 'Savings'),
(1609, 5157, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ogechi Nnachi', '0070104085 ', 'Access Bank', 'Savings'),
(1610, 9497, 'mobile', 'Mbong clarise Angu', '(+237)672013366', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1611, 11512, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ajogwu Anne Joy', '2394118190', 'Zenith Bank', 'Savings'),
(1612, 10742, 'mobile', 'N A OUMAR HAMID', '677565532', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1613, 11169, 'mobile', 'BIRGITTA EYAMBE DIALE', '671044578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1614, 10425, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'UBA', '2179628227', 'Obidike Somtoochuckwu Lois', 'Savings'),
(1615, 11526, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ajogwu Anne Joy', '0048174311', 'GTB', 'Savings'),
(1616, 11344, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Toluwalase GRACE OMOLOLA', '0038903411', 'Stanbic ibtc bank', 'Savings'),
(1617, 9584, 'mobile', 'Ngong Sophie Nabuin', '670800271', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1618, 10591, 'mobile', 'Rostant Brice ', '672676685', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1619, 8985, 'mobile', 'Afoaseh Destiny', '650332454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1620, 10079, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Dalhatu Abdulaziz ', '0498862095', 'GT bank ', 'Savings '),
(1621, 11558, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Elizabeth Owoloyi Ameh', '3028243130', 'First Bank', 'Savings'),
(1622, 10512, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abilama Ejima Christy', '0021701401', 'Access Bank ', 'Savings '),
(1623, 11443, 'mobile', 'Elem Victor chidi', '09034784361', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1624, 10719, 'mobile', 'Mafain Nelson', '+237652476272', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1625, 10606, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abdullahi ahmadu abdullahi', '2397991109', 'Zenith Bank', 'Saving'),
(1626, 11013, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Wosa CYRIL anele', '2230095528', 'Uba bank', 'Savings'),
(1627, 11555, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Margaret Adams', '3034732989', 'First Bank', 'savings '),
(1628, 11082, 'mobile', 'Serki Hawa Kulu', '+237674395516', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1629, 8860, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Precious Chukwuemeka', '3113910305', 'First Bank Nigeria', 'Savings'),
(1630, 11183, 'mobile', 'Brisley magyielimbom', '679399824', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1631, 1169, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Karimatu Muhammed', '2014689888', 'Kuda bank', 'Savings'),
(1632, 10159, 'mobile', 'Bongajim Karen', '+237653249845', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1633, 11665, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'John Sarah Istifanus', '3133763804', 'First Bank', 'savings '),
(1634, 11382, 'mobile', 'Nchadze Mari-noel Nyuyfoni', '672600239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1635, 9063, 'mobile', 'Ndi Joel Nganyu', '+237678928943', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1637, 11550, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Odemenam Ogochukwu Lorrita ', '0087918455', 'Union Bank', 'Saving '),
(1638, 6809, 'mobile', 'YOUNWA YVES AWAH', '650508083', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1639, 11726, 'mobile', 'Mildred Ewei Kemeng', '+237683403410', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1640, 11708, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Oloruntola Beatrice ayokunnu ', '2114940375', 'United bank of africa ', 'Savings '),
(1641, 10180, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Funminiyi Segun Mathew', '0790347945', 'Access', 'Savings '),
(1642, 11659, 'mobile', 'Esong Eleanor Ntube', '670749880', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1643, 11251, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Joseph Onyekachi Amuzie', '0812536663', 'Access Bank', 'Savings '),
(1644, 11086, 'mobile', 'Eziekel', '673933618', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1645, 3167, 'mobile', 'Roseline saha mafognon bense', '650038452', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1646, 5630, 'mobile', 'Nshie veroline', '+237672680699', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1647, 10986, 'mobile', 'Fang Josiah', '674666881', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1648, 5544, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Osunkunle Paul Ayomide', '2017977382', 'Kuda Microfinance Bank', 'Savings'),
(1649, 10558, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Mohammed Umar baba', '2404212270', 'Zenith Bank', 'Saving'),
(1650, 10111, 'mobile', 'Manjo Nicoline Bih', '680038956', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1651, 11794, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adedoyin Miracle', '0769913836', 'Access Bank', 'Savings'),
(1652, 10057, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Abubakar ahmed tijjani', '2009610466', 'First bank', 'Current'),
(1653, 4662, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Friday udi', '3058270045', 'Firstbank', 'Savings'),
(1654, 2760, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'SAMMANI GARBA MUHAMMAD', '0234358178', 'GT Bank', 'Saving'),
(1655, 9182, 'mobile', 'Agbor Victory Abeck ', '673038740 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1656, 9987, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Chinenye Eneje', '2110645913', 'Zenith', 'Savings'),
(1657, 11872, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Judith Sunday Obayemi', '2177453045', 'Zenith', 'Saving'),
(1658, 10921, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Amina Momodu-Yesufu ', '3054482068', 'First bank', 'Savings'),
(1660, 11478, 'mobile', 'Tendong Jonathan azazem', '671896840', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1661, 11627, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Olivia Ejaita Ebrawinoro', '0151429586', 'Guaranty Trust Bank', 'Savings'),
(1663, 3060, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Dauda yakubu', '2020199470', 'Kuda bank', 'Savings'),
(1664, 9996, 'mobile', 'Yvette honorine ngo missango', '671867217', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1665, 11305, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Gift Shalon iwuoha', '0064409310', 'Access bank', 'Savings'),
(1666, 5415, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Adamu jibreel', '3027426899', 'First bank ', 'Seven'),
(1667, 12007, 'mobile', 'OBENARRAH JONAS TABE', '676472469', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1668, 9246, 'mobile', 'Sandra Fonkwa Nina ', '671366710', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1669, 3728, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Sekondi Chukwudi Emmanuel', '0766258507', 'Access', 'Savings'),
(1670, 4739, 'mobile', 'Nfuh Anderson', '+237 6 71 83 81 79', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1671, 11999, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Omorinsola Omobolarinwa Ajumobi ', '2006239271', 'First Bank ', 'Current'),
(1672, 10343, 'mobile', 'Takang Cecilia Manyor', '+237678278334', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1673, 12099, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Akinlabi Iretiayo Olatubunbosun', '2001200188', 'Kuda Microfinance Bank', 'Savings'),
(1674, 12080, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'nmachi chibuike ', '7790129811', 'Wema bank', 'Savings'),
(1675, 3205, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'maryam yunusa', '2151038910', 'United Bank For Africa ', 'Savings '),
(1676, 12006, 'mobile', 'Njoume Nzenkwe tabi ', '+237652391033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1677, 8964, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Agwa Eberechi g', '2085365809', 'Zenith bank', 'Savice'),
(1678, 10574, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Dike precious chiamaka', '2401444081', 'Zenith bank ', 'Savings'),
(1679, 2630, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Ihechukwu favour Nelson ', '2122679195', 'Zenith bank', 'Savings '),
(1680, 11363, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Okereke Chikamso', '7748862016', 'FCMB', 'Savings'),
(1681, 2634, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Isaac Christian izuchukwu ', '2213284459 ', 'Zenith bank ', 'Savings'),
(1682, 8165, 'mobile', 'Kacha Blessing', '+237672401270', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1683, 12142, 'mobile', 'Ekoma Eseme Valdez', '679672566', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1684, 11760, 'mobile', 'Umenie Isaac', '675028238', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1685, 9787, 'mobile', 'Yaje Isabelle', '677776960', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1686, 1165, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'KAMISU MOHAMMED', '2225566376', 'UBA BANK', '2225566376'),
(1687, 12050, 'mobile', 'AGBOR Brian mbeng ', '652199934', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1688, 11935, 'mobile', '  Mustapha Nyuysimo ', '677198822', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1689, 10158, 'mobile', 'Ndowchi Damaris', '683186393', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1690, 10161, 'mobile', 'Ebude Miriam ', '670074811', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1691, 12085, 'bank', NULL, NULL, NULL, NULL, NULL, NULL, 'Wisdom Zebulon', '2056852633', 'Uba', 'Savings'),
(1692, 11853, 'mobile', 'Ndzelen salome mendzen', '+237675833294', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1693, 9275, 'mobile', 'Afumbom Ferdinand Mih', '+237679810954', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1694, 7822, 'mobile', 'Nda Green-Field Njong', '673958943', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1695, 11227, 'mobile', 'Asenek Akwewoh Destian', '651761231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1696, 8491, 'mobile', 'Ihunze prince', '09059287000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `f_website_settings`
--

CREATE TABLE `f_website_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_title` varchar(255) NOT NULL DEFAULT 'My Website',
  `website_tagline` varchar(255) NOT NULL DEFAULT 'Cool Website',
  `website_description` text NOT NULL,
  `website_keyword` text NOT NULL,
  `website_url` varchar(255) NOT NULL,
  `website_logo` varchar(255) DEFAULT NULL,
  `website_favicon` varchar(255) DEFAULT NULL,
  `website_phone_number` varchar(255) NOT NULL,
  `website_address` varchar(255) NOT NULL,
  `website_email` varchar(255) NOT NULL,
  `website_author` varchar(255) NOT NULL,
  `website_dev_name` varchar(255) NOT NULL,
  `website_dev_link` text NOT NULL,
  `website_facebook` varchar(255) DEFAULT NULL,
  `website_twitter` varchar(255) DEFAULT NULL,
  `website_youtube` varchar(255) DEFAULT NULL,
  `website_instagram` varchar(255) DEFAULT NULL,
  `website_currency` varchar(10) NOT NULL DEFAULT '$',
  `website_header_code` longtext DEFAULT NULL,
  `website_footer_code` longtext DEFAULT NULL,
  `website_per_coin` decimal(25,19) NOT NULL,
  `website_act_withdrawal_status` tinyint(4) NOT NULL DEFAULT 1,
  `website_ref_withdrawal_status` tinyint(4) NOT NULL DEFAULT 1,
  `website_min_withdrawal` decimal(25,19) DEFAULT 1.0000000000000000000,
  `website_max_withdrawal` decimal(25,19) DEFAULT 1.0000000000000000000,
  `website_reward_name` varchar(255) NOT NULL,
  `website_facebook_code` varchar(255) NOT NULL,
  `website_coin_public` varchar(255) NOT NULL,
  `website_coin_secret` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_website_settings`
--

INSERT INTO `f_website_settings` (`id`, `website_title`, `website_tagline`, `website_description`, `website_keyword`, `website_url`, `website_logo`, `website_favicon`, `website_phone_number`, `website_address`, `website_email`, `website_author`, `website_dev_name`, `website_dev_link`, `website_facebook`, `website_twitter`, `website_youtube`, `website_instagram`, `website_currency`, `website_header_code`, `website_footer_code`, `website_per_coin`, `website_act_withdrawal_status`, `website_ref_withdrawal_status`, `website_min_withdrawal`, `website_max_withdrawal`, `website_reward_name`, `website_facebook_code`, `website_coin_public`, `website_coin_secret`) VALUES
(1, 'Bartanetwork', 'The Crypto of the future', 'Barta-network is a digital currency project that aims to keep cryptocurrency mining accessible as the centralisation of first generation currencies like bitcoin has put them beyond the reach of everyday users.', 'Mining,crypto,currency', 'https://bartanetwork.com', '/img/identity/website_logo.jpg', '/img/identity/website_favicon.jpg', '09129079450', '667,South Ervay Street, Downtown PID, Dallas, Dallas Country, Texas, 75215, United State.', 'support@bartanetwork.com', 'Bartanetwork', 'Bartacoin Technology', 'https://bartanetwork.com', 'https://facebook.com/bartanetworkng', 'https://twitter.com/', 'https://youtube.com/', 'https://instagram.com/bartanetwork', '$', '<script async src=\"https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-6823670729553916\"\n     crossorigin=\"anonymous\"></script>\n\n\n\n\n', '', '0.0012000000000000000', 0, 1, '15.0000000000000000000', '1000.0000000000000000000', 'BAT', '4555054274577883', '2Rk7QFjl1QOh3mQ99laj7U1Q4', 'Lz7CPfcpGbsX0i9pN72AJmbJSxtZ3Mg1yJHzXVcU');

-- --------------------------------------------------------

--
-- Table structure for table `f_withdrawal_history`
--

CREATE TABLE `f_withdrawal_history` (
  `w_wid` bigint(20) UNSIGNED NOT NULL,
  `w_trx_id` varchar(15) NOT NULL,
  `w_user_id` bigint(20) NOT NULL,
  `w_wtype` varchar(5) NOT NULL,
  `w_amount` decimal(25,19) NOT NULL,
  `w_status` tinyint(4) NOT NULL DEFAULT 0,
  `w_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `f_admins`
--
ALTER TABLE `f_admins`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `f_bonus`
--
ALTER TABLE `f_bonus`
  ADD UNIQUE KEY `b_id` (`b_id`);

--
-- Indexes for table `f_coupons`
--
ALTER TABLE `f_coupons`
  ADD UNIQUE KEY `c_id` (`c_id`),
  ADD UNIQUE KEY `c_code` (`c_code`),
  ADD KEY `c_usedby` (`c_usedby`),
  ADD KEY `c_author` (`c_author`);

--
-- Indexes for table `f_earning_history`
--
ALTER TABLE `f_earning_history`
  ADD UNIQUE KEY `h_id` (`h_id`),
  ADD KEY `h_user_id` (`h_user_id`);

--
-- Indexes for table `f_mining_history`
--
ALTER TABLE `f_mining_history`
  ADD UNIQUE KEY `m_id` (`m_id`),
  ADD KEY `m_user_id` (`m_user_id`);

--
-- Indexes for table `f_notice`
--
ALTER TABLE `f_notice`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `f_pages`
--
ALTER TABLE `f_pages`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `page_author` (`page_author`);

--
-- Indexes for table `f_plans`
--
ALTER TABLE `f_plans`
  ADD UNIQUE KEY `plan_id` (`plan_id`);

--
-- Indexes for table `f_posts`
--
ALTER TABLE `f_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `f_posts_track`
--
ALTER TABLE `f_posts_track`
  ADD UNIQUE KEY `t_id` (`t_id`),
  ADD KEY `t_post_id` (`t_post_id`),
  ADD KEY `t_user_id` (`t_user_id`);

--
-- Indexes for table `f_referrals`
--
ALTER TABLE `f_referrals`
  ADD UNIQUE KEY `r_id` (`r_id`),
  ADD KEY `r1_id` (`r1_id`),
  ADD KEY `r2_id` (`r2_id`);

--
-- Indexes for table `f_upline_generation`
--
ALTER TABLE `f_upline_generation`
  ADD PRIMARY KEY (`g_id`);

--
-- Indexes for table `f_users`
--
ALTER TABLE `f_users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `f_wallet`
--
ALTER TABLE `f_wallet`
  ADD UNIQUE KEY `w_id` (`w_id`),
  ADD KEY `w_user_id` (`w_user_id`);

--
-- Indexes for table `f_website_settings`
--
ALTER TABLE `f_website_settings`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `f_withdrawal_history`
--
ALTER TABLE `f_withdrawal_history`
  ADD UNIQUE KEY `w_wid` (`w_wid`),
  ADD KEY `w_user_id` (`w_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `f_admins`
--
ALTER TABLE `f_admins`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `f_bonus`
--
ALTER TABLE `f_bonus`
  MODIFY `b_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `f_coupons`
--
ALTER TABLE `f_coupons`
  MODIFY `c_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `f_earning_history`
--
ALTER TABLE `f_earning_history`
  MODIFY `h_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `f_mining_history`
--
ALTER TABLE `f_mining_history`
  MODIFY `m_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `f_notice`
--
ALTER TABLE `f_notice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `f_pages`
--
ALTER TABLE `f_pages`
  MODIFY `page_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `f_plans`
--
ALTER TABLE `f_plans`
  MODIFY `plan_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `f_posts`
--
ALTER TABLE `f_posts`
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `f_posts_track`
--
ALTER TABLE `f_posts_track`
  MODIFY `t_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `f_referrals`
--
ALTER TABLE `f_referrals`
  MODIFY `r_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `f_upline_generation`
--
ALTER TABLE `f_upline_generation`
  MODIFY `g_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `f_users`
--
ALTER TABLE `f_users`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `f_wallet`
--
ALTER TABLE `f_wallet`
  MODIFY `w_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1697;

--
-- AUTO_INCREMENT for table `f_website_settings`
--
ALTER TABLE `f_website_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `f_withdrawal_history`
--
ALTER TABLE `f_withdrawal_history`
  MODIFY `w_wid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
