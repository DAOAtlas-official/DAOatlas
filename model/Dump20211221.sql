CREATE DATABASE  IF NOT EXISTS `dao_collection` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dao_collection`;
-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: dao_collection
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `group` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dao_post`
--

DROP TABLE IF EXISTS `dao_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dao_post` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'This is the title of a DAO',
  `body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tag` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'The tags of the DAO',
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'This is the name of a DAO',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Logo url of the DAO',
  `members` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'number of members',
  `summary` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'summary or goal of a DAO',
  `introduction` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `start_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1900-00-00',
  `how_to_join` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `activities` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Normal',
  `key_contributors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Here is the main contributors',
  `token_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Here is the token name',
  `token_link` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Here is the token link',
  `token_holders` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Here is the token holders number',
  `treasury` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Here is DAO treasury information',
  `AUM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'The treasury amout',
  `voting` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Here is the voting information',
  `forum` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Here is the forum url',
  `website` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Here is the website',
  `twitter` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Here is the twitter url',
  `discord` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Here is the discord url',
  `wiki` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Here is the wiki url',
  UNIQUE KEY `pid_UNIQUE` (`pid`),
  KEY `pid_index_dao` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dao_post`
--

LOCK TABLES `dao_post` WRITE;
/*!40000 ALTER TABLE `dao_post` DISABLE KEYS */;
INSERT INTO `dao_post` VALUES (2,'1hive','1Hive is a community that builds and experiments with decentralized applications and protocols. At the center of these experiments is an effort to build a sustainable and thriving economy around a currency called Honey, which is used to influence the direction of the community. Anyone can buy honey or earn it by contributing to 1Hive and can use it, among other things, to vote on funding proposals and protocol changes with a weight that is equal to the Honey they hold.\nBy optimizing how they issue and distribute Honey they hope to create a future that is more free, fair, open, and humane. ‌','Web3, Creative','1hive','1hive_400x400.png','500-1000','A community of activists seeking to build a future that is more free, fair, open, and humane.','1Hive is a community that builds and experiments with decentralized applications and protocols. At the center of these experiments is an effort to build a sustainable and thriving economy around a currency called Honey, which is used to influence the direction of the community. Anyone can buy honey or earn it by contributing to 1Hive and can use it, among other things, to vote on funding proposals and protocol changes with a weight that is equal to the Honey they hold.\nBy optimizing how they issue and distribute Honey they hope to create a future that is more free, fair, open, and humane. ‌','2020/5/4','1. Read the community covenant,join the discord and join the forum.\n2. Register for Pollen - a program that tracks interactions on Github, the forum, and Discord and rewards community members with Honey on a weekly basis. \n3. Subscribe to the 1hive calendar and participate in a Swarm - on which 1Hive projects is coordinated. Each working group is independent and may have developed its own structure and processes. Find one you are interested in and ask in the corresponding channel how you can help. \n4. Submit a proposal - if you have an idea or a suggestion that hasn’t been covered elsewhere, you could consider submitting a proposal.\nYou can find all the link above at https://wiki.1hive.org/','high','DogeKing,;DO$H,;solarmkd,;','HNY','https://etherscan.io/token/0xc3589f56b6869824804a5ea29f2c9886af1b0fce','57','https://blockscout.com/xdai/mainnet/address/0x47Aa2DF36e30ADa9f8Ceee54b3C8a60FD4787706/transactions','$3,000 ','https://gardens.1hive.org/#/xdai/garden/0x8ccbeab14b5ac4a431fffc39f4bec4089020a155','https://forum.1hive.org/','https://1hive.org/','https://twitter.com/1hiveorg','https://discord.gg/NTDBRNz','https://wiki.1hive.org/'),(3,'Aave Grants','Aave is a decentralised non-custodial liquidity protocol where users can participate as depositors or borrowers.\nAave Grants DAO is a community-led grants program to fund ideas submitted by the Aave protocol’s community, with a focus on empowering a wider network of community developers. The community has allocated $1 million per quarter for two quarters for funding grants. The program will run from May 10 to November 10. The grants program was created after a community discussion, which can be found on Aave\'s governance forum.','Grants,DeFi','Aave Grants','AaveGrants_400x400.jpg','12000+','To provide grants to projects, ideas, and events that benefit Aave and its ecosystem.','Aave is a decentralised non-custodial liquidity protocol where users can participate as depositors or borrowers.\nAave Grants DAO is a community-led grants program to fund ideas submitted by the Aave protocol’s community, with a focus on empowering a wider network of community developers. The community has allocated $1 million per quarter for two quarters for funding grants. The program will run from May 10 to November 10. The grants program was created after a community discussion, which can be found on Aave\'s governance forum.','2021/5/10','Join the Aave Developers DAO:\nFill out the application at https://aavegrants.org/Apply-to-join-the-Developers-DAO-ac1235eca30e4833b09754e7562a670b\n\nApply for a grant:\nFill out the application at https://airtable.com/shrnAYUx16J8uCo59 or sharing your proposal on Aave\'s community forum, depending on the grants amount discribed at https://aavegrants.org/How-do-I-apply-ce626759cdfd4dd68124a1f6499515e4','high','Shreyas Hariharan,;Aleks Larsen,;','AAVE','https://etherscan.io/token/0x7fc66500c84a76ad7e9c93437bfc5ac33e2ddae9','102,271','https://dune.xyz/llama/Aave-Treasury-Finances-by-Llama','$376,130,000 ','https://snapshot.org/#/aave.eth','https://governance.aave.com/','https://aavegrants.org/','https://twitter.com/AaveGrants','https://aave.com/discord','https://docs.aave.com/portal/'),(4,'AfrofutureDAO','This is a tokenized community that aim to maintain and promote Africa\'s art, culture and history through Web 3. The community maintains treasury and token value by auctioning NFTs related to African art and organizing art events. On this basis, members are encouraged to participate in promoting related projects, including the establishment of the African Archivist Training Fund and the African History Preservation Fund.','Creative, NFT, Social impact','AfrofutureDAO','afrofutureDAO_400x400.jpg','Less than 100','To unlock the value of Africa\'s historical & cultural assets to invest into the next generation of Africans.','This is a tokenized community that aim to maintain and promote Africa\'s art, culture and history through Web 3. The community maintains treasury and token value by auctioning NFTs related to African art and organizing art events. On this basis, members are encouraged to participate in promoting related projects, including the establishment of the African Archivist Training Fund and the African History Preservation Fund.','2021/3/1','1. Complete member application\n2. Acquire & hold 1000 aftr on uniswap\n3. !join the discord','low','Salim,https://twitter.com/salimcamerapix; Trupti,https://twitter.com/trupshah; Andrew,https://twitter.com/thewitzcarlton; Osinachi,https://twitter.com/osinachiart','AFTR','https://etherscan.io/token/0x56dfa98f363edb99240b63f8a5141d8b64cfaf6e','70','','','','','https://www.afrofuture.ai/','https://twitter.com/afrofutureai','https://discord.com/invite/tnDt4f8EPf','https://afrofuture.medium.com/'),(5,'AladdinDAO','AladdinDAO is a DAO that uses wisdom of crowds to make investments wiser. Using a unique voting scheme, it hopes to identify, analyze, and provide quality DeFi projects to the community members. Boule Members earn AladdinDAO tokens (ALD) as results of their participation in the DAO.\nThere are 4 keys roles that make the whole mechanism work: Boule Members, Talent Hunters, Boule Plus Members and Strategy Developers. Boule Members identify the most promising DeFi projects. Boule Plus members are reservists of Boule. Talent hunters are responsible for attracting and recommending potential boule candidates for the DAO. And Strategy developers are responsible for conducting technical integration of liquidity mining programs to the platform and writing strategy contracts.','Venture','AladdinDAO','AladdinDAO_400x400.jpg','500-600','Use wisdom of crowds to make investments wiser.','AladdinDAO is a DAO that uses wisdom of crowds to make investments wiser. Using a unique voting scheme, it hopes to identify, analyze, and provide quality DeFi projects to the community members. Boule Members earn AladdinDAO tokens (ALD) as results of their participation in the DAO.\nThere are 4 keys roles that make the whole mechanism work: Boule Members, Talent Hunters, Boule Plus Members and Strategy Developers. Boule Members identify the most promising DeFi projects. Boule Plus members are reservists of Boule. Talent hunters are responsible for attracting and recommending potential boule candidates for the DAO. And Strategy developers are responsible for conducting technical integration of liquidity mining programs to the platform and writing strategy contracts.','2021/3/1','Anyone can become a Boule Plus member by satisfying the following conditions:\n1. Passed any one of AladdinDAO\'s Quiz.\n2. A verifiable Twitter handle is provided.\n3. Stake a certain amount of ALD.\n\nAnd Boule members can be elected by the AladdinDAO community.','high','naviSP3,https://twitter.com/naviSP3;martinkrung,https://www.twitter.com/martinkrung','ALD','https://etherscan.io/token/0xb26C4B3Ca601136Daf98593feAeff9E0CA702a8D','3,252','https://etherscan.io/address/0x47e9517C2c179349c6C8F4a347acbeDFCA5E99Bc','$1,875,000 ','https://vote.aladdin.club/#/','https://forum.aladdin.club/','https://aladdin.club/','https://twitter.com/aladdindao','https://discord.gg/PVUSDPAsrU','https://docs.aladdin.club/'),(6,'Allships','ALLSHIPS is a coalition of creatives, with a focus on high quality content created by their community of vetted artists. They build bridges between brands and creators, in order to provide world class visuals via a streamlined process. Their curation of talent is based upon real community connections, which ensures that every project they build reaches its maximum potential.','Creative','Allships','allshipsco_400x400.jpg','500-1000','A creative community, dedicated to the idea that a rising tide raises all ships.','ALLSHIPS is a coalition of creatives, with a focus on high quality content created by their community of vetted artists. They build bridges between brands and creators, in order to provide world class visuals via a streamlined process. Their curation of talent is based upon real community connections, which ensures that every project they build reaches its maximum potential.','2020/8/1','Anyone can join the discord and participate in activities organized by the community.There are also a command center requires NFTs to access named The Bridge. The Bridge allocates the Artist Fund, and artists who benefit from the fund are added to The Bridge: Artist Sector for additional support and guidance. To apply to be a Bridge Artist head over to # apply-for-artist-fund in the discord.','low','davekrugman,https://twitter.com/dave_krugman','','','','','','','','https://allships.co/','https://twitter.com/allshipsco','https://discord.com/invite/Q5W8SuKXT9',''),(7,'AnalystDAO','AnalystDAO is a distributed equity research DAO constructed with the purpose of coordinating a collection of emerging DeFi, Web3 and NFT analysts to produce high quality digital asset research and to curate a community to hone members\' craft together.\nYou can discuss about analyses with free thinkers around the globe with backgrounds in finance, philosophy, data science, psychology, computer science etc.','Social&Club,Research','AnalystDAO','analystDAO_400x400.jpg','Less than 100','A distributed equity research DAO constructed with the purpose of coordinating a collection of emerging DeFi, Web3 and NFT analysts to produce high quality digital asset research  and community.','AnalystDAO is a distributed equity research DAO constructed with the purpose of coordinating a collection of emerging DeFi, Web3 and NFT analysts to produce high quality digital asset research and to curate a community to hone members\' craft together.\nYou can discuss about analyses with free thinkers around the globe with backgrounds in finance, philosophy, data science, psychology, computer science etc.','2021/9/1','If you\'re interested in being an \nanalyst, writer, graphic designer, or engineer in the initial launch of Analyst Dao,you can apply at https://docs.google.com/forms/d/e/1FAIpQLSdmjuji0lH2j85bAzmuNNM8Y09pUBYHj7gUpIg_xDmwD1e_Pw/viewform.\nPlease attach your resume, relevant documents/links, and any other information in the form. If you\'re applying to be an analyst, they also require a 1 page investment thesis on a digital asset (long or short).After reviewing your applications, they will run interviews with selected candidates.\nApplications for recruitment are open by season. If you have missed season 1, you can ask the time of next season in the discord.','medium','Patrick Fitzgerald,https://twitter.com/patfitzgerald01;Noah Goldberg,https://twitter.com/TraderNoah;redphonecrypto,https://twitter.com/redphonecrypto;','','','','','','','','','https://twitter.com/AnalystDao','discord.gg/aTBkSgRUxP',''),(8,'AngelDAO','AngelDAO focused on offering support to projects driving global adoption and technological innovation for distributed systems. They have a data driven research process that they use to identify opportunities, while still maintaining a collaborative effort between DAO members to form consensus on decisions.\nAngelDAO is deployed on the Aragon platform. They use a non-transferable token to represent membership. Decisions are made based on one-member-one-vote governance.','Venture','AngelDAO','analystDAO_400x400.png','unknown','A distributed systems investment collective.','AngelDAO focused on offering support to projects driving global adoption and technological innovation for distributed systems. They have a data driven research process that they use to identify opportunities, while still maintaining a collaborative effort between DAO members to form consensus on decisions.\nAngelDAO is deployed on the Aragon platform. They use a non-transferable token to represent membership. Decisions are made based on one-member-one-vote governance.','2020/12/1','You can apply jobs at https://work.angeldao.org/0035b703090641faa2a9425d032d2311?v=ef6a3257f4a74059a45183ff575ffeda or get bounties at https://work.angeldao.org/416ca268531a4058a10d92cca29c029f?v=086e929965e6408587816c49c66262ef.','unknown','Meir Bank,https://twitter.com/MeirBank; John Gower,https://twitter.com/Blockchase;Daniel Warrick,https://twitter.com/Danuuuule','','','','','','','','https://angeldao.org/','https://twitter.com/angeldaoorg','','https://angeldao.medium.com/'),(9,'BAG DAO','The Blockchain Adventurers Guild (BAG) is a guild aiming to learn about blockchain, earn financial rewards via competing game quests about airdrops projects.\nQuests are designed to teach users about blockchain finance as well as enrich adventurers for their efforts. Quests will streamline marketing efforts for projects who want to find new users and make it trivial for them to distribute rewards or airdrops. A quest can be, for example, reading a tutorial on AAVE and try out lending. The user who complete the quest will receive 100 experience points, 100 BGLD, 0.01 AAVE.\nBAG is the guild token representing a share of the BAG DAO, BAG holders can make proposals and vote to influence the BAG DAO.\nIt is IMPORTANT to be careful that although the guild was designed as a DAO, we did not see the community treasury address made public, nor did we see the community vote for the project in the discord. Before you earn financial rewards via competing game quests, you will pay at least $20 for an avatar. We are not sure it\'s worth it, so be careful.','Game','BAG DAO','BAG_DAO_400x400.jpg','unknown','A guild to learn about blockchain, earn financial rewards via competing game quests about airdrops projects.','The Blockchain Adventurers Guild (BAG) is a guild aiming to learn about blockchain, earn financial rewards via competing game quests about airdrops projects.\nQuests are designed to teach users about blockchain finance as well as enrich adventurers for their efforts. Quests will streamline marketing efforts for projects who want to find new users and make it trivial for them to distribute rewards or airdrops. A quest can be, for example, reading a tutorial on AAVE and try out lending. The user who complete the quest will receive 100 experience points, 100 BGLD, 0.01 AAVE.\nBAG is the guild token representing a share of the BAG DAO, BAG holders can make proposals and vote to influence the BAG DAO.\nIt is IMPORTANT to be careful that although the guild was designed as a DAO, we did not see the community treasury address made public, nor did we see the community vote for the project in the discord. Before you earn financial rewards via competing game quests, you will pay at least $20 for an avatar. We are not sure it\'s worth it, so be careful.','2021/3/1','1. Read all the docs at https://app.thisistheway.finance/faq and https://app.thisistheway.finance/The_Blockchain_Adventurers_Guild_Brown_Paper.pdf. Be sure you understand how the whole system works.\n2. Register at https://app.thisistheway.finance/register with your email or wallet.\n3. Complete quests step by step. You may be asked to buy avatar for at least $20  at quest 4. We are not sure it\'s worth it, so be careful.\n4. If you have any question, just ask them in the discord.','medium','DonnerKebab,;slishyslice,https://twitter.com/SlishySlice;','BAG','https://etherscan.io/token/0xf33121A2209609cAdc7349AcC9c40E41CE21c730','198','','','','','https://app.thisistheway.finance/','https://twitter.com/bag_dao','https://discord.com/invite/GQ5HZWPsD6','https://app.thisistheway.finance/faq'),(10,'BeetsDAO','BeetsDAO is a private, global NFT collective first formed in the EulerBeats community amongst 58 collaborators who met on a Discord server, with a shared passion for the long-term power of NFTs.\n\nThey started their journey by winning an auction for 4 original Enigma LPs: #02, #04, #17 and #20. They made a pledge to create long-term value for the NFT community-at-large and their commitment starts with the print holders who own prints of those Enigmas.\n\nThey are also building: starting with their Snoop x Nyan Cat collaboration with more to come in music, art, film, metaverse real estate and generative/algorithmic development. ','NFT,Creative','BeetsDAO','BeetsDAO_400x400.jpg','Less than 100','A private, global NFT collective with a shared passion for the long-term power of NFTs.','BeetsDAO is a private, global NFT collective first formed in the EulerBeats community amongst 58 collaborators who met on a Discord server, with a shared passion for the long-term power of NFTs.\n\nThey started their journey by winning an auction for 4 original Enigma LPs: #02, #04, #17 and #20. They made a pledge to create long-term value for the NFT community-at-large and their commitment starts with the print holders who own prints of those Enigmas.\n\nThey are also building: starting with their Snoop x Nyan Cat collaboration with more to come in music, art, film, metaverse real estate and generative/algorithmic development. ','2021/3/1','Their round 2 membership round is now closed to further members. To be notified when membership opportunities may arise, fill the form at https://www.beetsdao.com/#get-involved, and they will put you on a waiting list for future membership consideration. Note that BeetsDAO has a lifetime cap of 99 governance seats.\nAlthough BeetsDAO\'s governance seats are now closed.The collaborator network, with a hard cap of 800 has opened in October 2021.','medium','Jordan Garbis,;_noxcuse,https://twitter.com/noxcusej;','BEETS','https://etherscan.io/token/0xa8a44d8c221e40a0c9b5e6c2168efc19e77aba1c','79','','','','','https://www.beetsdao.com/','https://twitter.com/beetsdao','https://discord.com/invite/UJSvT3wP8F',''),(11,'BitDAO','BitDAO is a DAO of grants and venture who looks up to partner with projects through token swaps, co-development efforts and providing grants. \nSwap — they aim to token swap and accumulate a collection of the top existing and emerging DeFi and crypto projects.\nBuild — they aim to build core products which enable BitDAO or other DAOs to function more effectively including governance suite and treasury Management.\nGrant — they aim to provide grants to teams that produce research or products that are public goods for the crypto industry. One possibility is to match Gitcoin grants.','Grants,Venture','BitDAO','BitDAO_400x400.jpg','2000+','To provide support in the form of  research and development, liquidity boot strapping, and funding of open finance and a decentralized tokenized economy.','BitDAO is a DAO of grants and venture who looks up to partner with projects through token swaps, co-development efforts and providing grants. \nSwap — they aim to token swap and accumulate a collection of the top existing and emerging DeFi and crypto projects.\nBuild — they aim to build core products which enable BitDAO or other DAOs to function more effectively including governance suite and treasury Management.\nGrant — they aim to provide grants to teams that produce research or products that are public goods for the crypto industry. One possibility is to match Gitcoin grants.','2021/4/1','You can be a community member, contributor, partner or token holder.\nCommunity Members: Non-token holders can participate in their forum and social media, and share ideas. Good ideas may be adopted by BIT token holders. Community leaders may be provided with delegated votes.\nContributors: Individuals or teams that can help develop BitDAO protocols, or work to arrange due diligence and token swaps with other projects, and request grants from BitDAO.\nPartners: They welcome any DeFi or CeFi project that can contribute to BitDAO, or are willing to look for ways for their protocols to work together.\nToken Holders: BIT token holders can propose and vote on the direction of BitDAO and the use of BitDAO treasury assets.','high','JΞ,; Kirby Ong,https://twitter.com/kirbyongeo;deefs,;','BIT','https://etherscan.io/token/0x1a4b46696b2bb4794eb3d4c26f1c55f9170fa4c5','13,723','https://etherscan.io/address/0x78605Df79524164911C144801f41e9811B7DB73D','$613,288,652 ','https://snapshot.org/#/bitdao.eth','https://discourse.bitdao.io/','https://www.bitdao.io/','https://twitter.com/bitdao_official','https://discord.com/invite/KU4jG84QTW','https://bitdao.notion.site/bitdao/BitDAO-Community-5a43b5ee21594cb7ab41236d8d8f0a31'),(17,'AMPLED','Ampled is a Patreon-like platform for musicians, owned by its artists and workers.\n\nIt allows artists to be directly supported by their community without intermediaries or gatekeepers (and is collectively owned by its artists and workers).\n\nThey call themselves a Co-op, which means a company owned by its workers, customers, or both. In stark contrast to Silicon Valley ethos, they reject traditional venture capital and embrace radical transparency, democratic governance, and broad-based user ownership.\n\nAlthough they call themselves a co-op rather than a DAO, their values are very consistent with DAO\'s: disintermediation, emphasis on fairness and transparency, mission-driven, and rebellion against the traditional world, etc. This shows that spirit of DAO is also nurturing at the other corners of the world, non-crypto world. They will eventually reach the same destination from different paths. \n\nWhether you are interested in an artist-autonomous community, or you want to compare the similarities and differences between a cooperative and a DAO, this community deserves your attention.','Creative,Music','AMPLED','Ampled_400x400.jpg','100-500','A cooperative platform for musicians, created to make the online economy more fair and inclusive for artists.','Ampled is a Patreon-like platform for musicians, owned by its artists and workers.\n\nIt allows artists to be directly supported by their community without intermediaries or gatekeepers (and is collectively owned by its artists and workers).\n\nThey call themselves a Co-op, which means a company owned by its workers, customers, or both. In stark contrast to Silicon Valley ethos, they reject traditional venture capital and embrace radical transparency, democratic governance, and broad-based user ownership.\n\nAlthough they call themselves a co-op rather than a DAO, their values are very consistent with DAO\'s: disintermediation, emphasis on fairness and transparency, mission-driven, and rebellion against the traditional world, etc. This shows that spirit of DAO is also nurturing at the other corners of the world, non-crypto world. They will eventually reach the same destination from different paths. \n\nWhether you are interested in an artist-autonomous community, or you want to compare the similarities and differences between a cooperative and a DAO, this community deserves your attention.','Oct-20','There are three roles you can choose:\n\nArtists: Create an artist page at http://www.ampled.com/create-artist. Once your page achieves 10 supporters, you are eligible to become an Artist-Owner of Ampled.\n\nWorkers: Introduce yourself and tell them how you’d be interested in helping build or grow Ampled. You can mail hello@ampled.com or fill out the form at https://ampled.typeform.com/to/c65YZu or just join their Discord to talk with the community!\n\nCommunity members: As a community member, you’ll officially become part of Ampled’s co-op. And you’ll receive a seat at the table, exclusive content and access to the team. Head to ampled.com/community and click “Support What You Want,” then go through the flow. Community member support begins at $3, but you can also select a higher amount.','good','Ryan DeShon,;Rene Kladzyk,;Nicole d’Avis,;','','','','','','','','https://www.ampled.com/','https://twitter.com/ampl3d','https://discord.gg/nJc2KZKx7b','https://docs.ampled.com/coop/'),(18,'Blockzero Labs','Blockzero Labs is a Web 3.0 venture studio with a mission to build, launch, and scale the next generation of blockchain projects into the decentralized world.\n\nThey organized the community in the form of a DAO. It issues a token called XIO. All DAO members are required to have a minimum of 100 XIO tokens. In addition to buying, you can also earn tokens by completing community tasks at https://blockzerolabs.io/moon/.  \n\nAll members can make proposals for community development or project development. They can also vote on proposals made by others.\nSeveral defi projects, such as flashstake, aquafi, dropzero, ect., have been incubated by the community. Their NFT project Cryptonaut runs well too.\n\nIn our opinion, their community is well run, but several Defi projects are not very successful. Although the Defi projects have been audited, they are not open source and the technical details have not been disclosed too much, so we cannot give further judgment. We suggest readers sink into the community for more extensive and in-depth information before deciding to invest in their Defi project. In short, do your own research.\n','NFT,Defi','Blockzero Labs','blockzerolabs_400x400.jpg','3000+','To build, launch, and own the next generation of Web3 projects.','Blockzero Labs is a Web 3.0 venture studio with a mission to build, launch, and scale the next generation of blockchain projects into the decentralized world.\n\nThey organized the community in the form of a DAO. It issues a token called XIO. All DAO members are required to have a minimum of 100 XIO tokens. In addition to buying, you can also earn tokens by completing community tasks at https://blockzerolabs.io/moon/.  \n\nAll members can make proposals for community development or project development. They can also vote on proposals made by others.\nSeveral defi projects, such as flashstake, aquafi, dropzero, ect., have been incubated by the community. Their NFT project Cryptonaut runs well too.\n\nIn our opinion, their community is well run, but several Defi projects are not very successful. Although the Defi projects have been audited, they are not open source and the technical details have not been disclosed too much, so we cannot give further judgment. We suggest readers sink into the community for more extensive and in-depth information before deciding to invest in their Defi project. In short, do your own research.\n','Dec-20','1. Create a passport by filling out a form at https://blockzero.typeform.com/passport\n2. Join the discord to introduce yourself to the community and answer the ten onboarding questions.\n3. All Citizens are required to have a minimum of 100 XIO tokens. If you do not have the capital to buy these, you can earn 100 XIO tokens by joining the Blockzero Discord and introducing yourself through video.','high','Zachary Dash,https://twitter.com/ZacharyDash;steve.eth,;Panos,https://twitter.com/panosmek; ','XIO','https://etherscan.io/token/0x0f7F961648aE6Db43C75663aC7E5414Eb79b5704','4,966','https://gnosis-safe.io/app/eth:0x5089722613C2cCEe071C39C59e9889641f435F15/balances','$8,532,636 ','https://vote.blockzerolabs.io/#/','','https://blockzerolabs.io/','https://twitter.com/blockzerolabs','https://discord.com/invite/gfcYsdHGnt','https://medium.com/bombx'),(19,'Buildspace','Buildspace is a web3 tech teaching network for developers. The network emphasizes learning in practice. You will learn the whole web3 techs by completing 7 projects for beginners, including solidity, NFT, Solana, DAO, Avalanche, etc. Each small step is guided by detailed documents. If there is a problem, you can seek help from the corresponding channel of the discord. After completion, you can share it in the channel and let your classmates try it out. Everyone will share your joy of completion.\n\nIn addition to teaching, buildspace also provides web3 job opportunities. You can upload your resume here and it will be seen by web3 companies. If it is appropriate, they will contact you.\n\nThis is a very friendly network, and it is still completely free. If you are interested in web3 dev and want to learn web3 tech, you must not miss this network.','Education,Social&Club','Buildspace','buildspace_400x400.jpg','20000+','Learn crypto tech by actually building something','Buildspace is a web3 tech teaching network for developers. The network emphasizes learning in practice. You will learn the whole web3 techs by completing 7 projects for beginners, including solidity, NFT, Solana, DAO, Avalanche, etc. Each small step is guided by detailed documents. If there is a problem, you can seek help from the corresponding channel of the discord. After completion, you can share it in the channel and let your classmates try it out. Everyone will share your joy of completion.\n\nIn addition to teaching, buildspace also provides web3 job opportunities. You can upload your resume here and it will be seen by web3 companies. If it is appropriate, they will contact you.\n\nThis is a very friendly network, and it is still completely free. If you are interested in web3 dev and want to learn web3 tech, you must not miss this network.','Aug-21','Join the discord and enroll in a project at https://app.buildspace.so/ and link your Discord account to get access to the rest of the channels.\nThe basics of javascript and maybe a little react is needed. Also, you should know the basics of running stuff inside a terminal. If you\'re familiar with the basics of web dev, you can do this for sure. If not, well, you\'ll need to learn and that\'s okay.Learn JS: https://scrimba.com/learn/learnjavascript, Learn React: https://scrimba.com/learn/learnreact','very high','Farza,https://twitter.com/FarzaTV;David,https://twitter.com/davbarrick;Alec,https://twitter.com/alec_dilanchian;Emily,https://twitter.com/emotes__;','','','','','','','','https://buildspace.so/','https://twitter.com/_buildspace','https://discord.com/invite/buildspace',''),(20,'HausDao','DAOhaus is a no-code platform for launching and running DAOs. All DAOs on the platform use the glorious open-source code of Moloch. The platform is free to use except for some necessary gas fee and anyone can use it to launch a DAO.\n\nThis HAUS doesn’t build itself.\n\nIt takes a community, and HausDAO is the community of contributors working together directly to design, build, and communicate the actual product.\n\nAnother related DAO is UberHaus, it is the DAO that governs the DAOhaus product and the HAUS token. It’s made up of actual DAOhaus users & community members.','Web3,Professional Services','HausDao','DAOhaus_400x400.png','less than 100','A no-code platform for launching and running DAOs.','DAOhaus is a no-code platform for launching and running DAOs. All DAOs on the platform use the glorious open-source code of Moloch. The platform is free to use except for some necessary gas fee and anyone can use it to launch a DAO.\n\nThis HAUS doesn’t build itself.\n\nIt takes a community, and HausDAO is the community of contributors working together directly to design, build, and communicate the actual product.\n\nAnother related DAO is UberHaus, it is the DAO that governs the DAOhaus product and the HAUS token. It’s made up of actual DAOhaus users & community members.','Aug-19','If you are passionate about building for decentralized communities,you can join HausDAO. Just find them in their Discord, and they are looking for contributors in content, community, design and development.\nIf you are DAOhaus users or community members, you can join UberHaus further through pledging a minimum of 500 HAUS.','good','JohnD.Storey,https://twitter.com/j0xhnD;Nikhil Bhaskar,;DanielHolmgren,;','HAUS','https://etherscan.io/token/0xf2051511b9b121394fa75b8f7d4e7424337af687','438','https://app.daohaus.club/dao/0x64/0x283bdc900b6ec9397abb721c5bbff5ace46e0f50/vaults','$167,742 ','https://app.daohaus.club/dao/0x64/0x283bdc900b6ec9397abb721c5bbff5ace46e0f50/proposals','https://forum.daohaus.club/','https://daohaus.club/','https://twitter.com/nowdaoit','https://discord.gg/daohaus','https://daohaus.club/docs/'),(21,'dOrg','dOrg is a DAO collective of web3 engineers, designers, and project managers. They collaborate with projects to advance the web3 stack (DAOs, NFTs, DeFi, dev tools, L2s). \n\nThey aim to become the best service provider, workplace, and example of what is possible to achieve with web3 technology. dOrg is a consulting company in the web3 world, helping web3 projects solve problems such as talents, governance, workplace, technology. \n\nInterestingly, in its discord, it also provides channels in the theme of other DAOs: one DAO a channel, which will help those DAOs to be known to more web3 builders.','Professional Services','dOrg','dOrg_400x400.jpg','less than 100','A DAO collective of web3 engineers, designers, and project managers.','dOrg is a DAO collective of web3 engineers, designers, and project managers. They collaborate with projects to advance the web3 stack (DAOs, NFTs, DeFi, dev tools, L2s). \n\nThey aim to become the best service provider, workplace, and example of what is possible to achieve with web3 technology. dOrg is a consulting company in the web3 world, helping web3 projects solve problems such as talents, governance, workplace, technology. \n\nInterestingly, in its discord, it also provides channels in the theme of other DAOs: one DAO a channel, which will help those DAOs to be known to more web3 builders.','Mar-19','They need 4 kinds of builders for now: fullstack blockchain engineer, frontend developer, UI/UX Designer,and smart contract engineer. If you are interested in the opportunities, apply at https://airtable.com/shr0eQZfACL3Yarac.If a suitable role arises, they will reach out. After an interview with an existing dOrg builder, you should just wait for the proposal.','medium','Anna-Marie,https://twitter.com/MrsBadgerface;','dOrg','https://etherscan.io/token/0x62300cec5240e5b273781ad67ce735107f3dacd4','94','https://gnosis-safe.io/app/eth:0xdb22d2d37db92EA7fa6993C9f6Ead55FBb1eF4EA/balances','160,451','https://snapshot.org/#/dorg.eth','https://forum.dorg.tech/login','https://www.dorg.tech/#/','https://twitter.com/dorg_tech','https://discord.com/invite/bA9ZM7WXZU','https://docs.dorg.tech/');
/*!40000 ALTER TABLE `dao_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `tid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid_index` (`tid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文章标签隐射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `cate` tinyint NOT NULL,
  `use_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (12,'Social&Club',2,0),(13,'Game',2,0),(14,'Sport',2,0),(15,'Music',2,0),(16,'Creative',2,0),(17,'Venture',2,0),(18,'Grants',2,0),(19,'Social impact',2,0),(20,'Web3',2,0),(21,'Research',2,0),(22,'Professional Service',2,0),(23,'DeFi',2,0),(24,'Real Estate',2,0),(25,'Education',2,0),(26,'Collector',2,0),(27,'NFT',2,0),(28,'Metaverse',2,0),(29,'Media',2,0);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tps`
--

DROP TABLE IF EXISTS `tps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` smallint DEFAULT '0',
  `info` varchar(255) DEFAULT NULL,
  `status` varchar(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tps`
--

LOCK TABLES `tps` WRITE;
/*!40000 ALTER TABLE `tps` DISABLE KEYS */;
INSERT INTO `tps` VALUES (1,'简介',0,'第一个分类','1'),(2,'新DAO',3,'new dao','1');
/*!40000 ALTER TABLE `tps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dao-admin',0,0,'90f12a1bb74d4ed8e0c000b6000b823d');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` bigint unsigned DEFAULT NULL,
  `updated_at` bigint unsigned DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `typeid` smallint DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `click` smallint DEFAULT NULL,
  `tuijian` tinyint DEFAULT NULL,
  `swiper` tinyint DEFAULT NULL,
  `pic` varchar(500) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `content` mediumtext,
  `body` mediumtext,
  `scenes` tinyint NOT NULL DEFAULT '1',
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_views_deleted_at` (`deleted_at`),
  KEY `scenes_index_view` (`scenes`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (1,1638620394,1638620394,NULL,1,'欢迎使用DAO list ',0,0,0,'',1,'欢迎使用DAO list','欢迎使用DAO list',1,NULL),(2,1638635584,1639821572,NULL,1,'标题党哈哈哈',3,1,0,'',1,'就是快递费积分电风扇asdasdf','<p>就是快递费积分电风扇</p><p>asdasdf</p>',1,'Dao,EOS,11#wenzhangbiaoq,9#通用'),(3,1638636041,1638688296,NULL,1,'DAO 文章标题',0,1,0,'',1,'haohshdj 安徽省到付件','<p>haohshdj 安徽省到付件</p>',2,'10#ETH'),(4,1638702537,1638702596,NULL,2,'我的dao',0,0,0,'/static/upload/images/20211205/1638702450543.png',1,'打发打发看开始开始打发第三方','<p>打发打发看开始开始<mip-img src=\"/static/upload/images/20211205/1638702450543.png\"></mip-img></p><p>打发第三方</p>',2,''),(5,1639025961,1639025974,NULL,2,'12-9 test again我的测试',0,1,0,'/static/upload/images/20211209/1639025914834.png',1,'阿斯顿发的发的发的','<p><br/></p><p>阿斯顿发的发的发的</p><p><mip-img src=\"/static/upload/images/20211209/1639025914834.png\"></mip-img></p>',2,''),(6,1639664770,1639821656,NULL,2,'测试文章5',1,0,1,'/static/upload/images/20211216/1639664694992.png',1,'我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao','<p><mip-img src=\"/static/upload/images/20211216/1639664694992.png\"></mip-img></p><p><br/></p><p>我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao</p><p>我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao我要加入daodao</p><p>我要加入daodao</p>',2,',7#BTC,8#EOS'),(7,1639840702,1639840702,NULL,2,'测试文章888',0,1,0,'',1,'阿斯顿发丹江口市来得及弗雷斯科监督管理','<p>阿斯顿发丹江口市来得及弗雷斯科监督管理</p><p><br/></p><audio controls=\"controls\" style=\"display: none;\"></audio>',1,''),(8,1639840757,1639840757,NULL,2,'大法',0,0,0,'',1,'史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫','史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫<audio controls=\"controls\" style=\"display: none;\"></audio>',2,''),(9,1639840760,1639840760,NULL,2,'大法',0,0,0,'',1,'史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫','史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫<audio controls=\"controls\" style=\"display: none;\"></audio>',2,''),(10,1639840762,1639840762,NULL,2,'大法',0,0,0,'',1,'史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫','史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫史蒂夫<audio controls=\"controls\" style=\"display: none;\"></audio>',2,''),(11,1639882221,1639882221,NULL,2,'测试4444',2,0,1,'',1,'我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试','我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试我是测试<audio controls=\"controls\" style=\"display: none;\"></audio>',2,'');
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-21 22:37:19
