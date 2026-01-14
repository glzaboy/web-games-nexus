PRAGMA defer_foreign_keys=TRUE;
CREATE TABLE `categories` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`created_at` integer DEFAULT (unixepoch()) NOT NULL,
	`update_at` integer DEFAULT (unixepoch()) NOT NULL,
	`slug` text NOT NULL,
	`name` text NOT NULL,
	`icon` text,
	`sort` integer,
	`enable` integer DEFAULT true
);
INSERT INTO "categories" VALUES(1,1767597598,1767597598,'Platformer','平台跳跃',NULL,2,1);
INSERT INTO "categories" VALUES(2,1767598075,1767598075,'Shoot ''em up','横版射击',NULL,NULL,1);
INSERT INTO "categories" VALUES(3,1767598075,1767598075,'Beat ''em up','清版动作',NULL,NULL,1);
INSERT INTO "categories" VALUES(4,1767598075,1767598075,'Action-Adventure','动作冒险',NULL,NULL,1);
INSERT INTO "categories" VALUES(5,1767598075,1767598075,'RPG','角色扮演',NULL,NULL,1);
INSERT INTO "categories" VALUES(6,1767598075,1767598075,'SRPG','策略角色扮演',NULL,NULL,1);
INSERT INTO "categories" VALUES(7,1767598075,1767598075,'Sports','体育游戏',NULL,NULL,1);
INSERT INTO "categories" VALUES(8,1767598166,1767598166,'Puzzle','益智游戏',NULL,NULL,1);
INSERT INTO "categories" VALUES(9,1767598166,1767598166,'Fighting','格斗游戏',NULL,NULL,1);
INSERT INTO "categories" VALUES(10,1767598166,1767598166,'Racing','赛车游戏',NULL,NULL,1);
INSERT INTO "categories" VALUES(11,1767598166,1767598166,'Music','音乐游戏',NULL,NULL,1);
CREATE TABLE `collection_games` (
	`id` integer,
	`collection_id` integer,
	`game_id` integer,
	PRIMARY KEY(`collection_id`, `game_id`),
	FOREIGN KEY (`collection_id`) REFERENCES `collections`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`game_id`) REFERENCES `games`(`id`) ON UPDATE no action ON DELETE no action
);
CREATE TABLE `collections` (
	`id` integer PRIMARY KEY NOT NULL,
	`slug` text NOT NULL,
	`title` text NOT NULL,
	`description` text,
	`cover_image` text,
	`featured` integer DEFAULT false
);
CREATE TABLE `platforms` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`created_at` integer DEFAULT (unixepoch()) NOT NULL,
	`update_at` integer DEFAULT (unixepoch()) NOT NULL,
	`slug` text NOT NULL,
	`name` text(30) NOT NULL,
	`icon` text,
	`sort` integer
);
INSERT INTO "platforms" VALUES(1,1767594991,1767594991,'dos','DOS',NULL,3);
INSERT INTO "platforms" VALUES(2,1767594991,1767594991,'arcade','街机',NULL,2);
INSERT INTO "platforms" VALUES(3,1767594991,1767594991,'nes','NES',NULL,1);
CREATE TABLE `reviews` (
	`id` integer PRIMARY KEY NOT NULL,
	`game_id` integer,
	`title` text NOT NULL,
	`content` text NOT NULL,
	`author` text,
	`rating` integer,
	`is_video` integer DEFAULT false,
	`video_url` text,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`game_id`) REFERENCES `games`(`id`) ON UPDATE no action ON DELETE no action
);
CREATE TABLE `games` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`created_at` integer DEFAULT (unixepoch()) NOT NULL,
	`update_at` integer DEFAULT (unixepoch()) NOT NULL,
	`title` text NOT NULL,
	`description` text,
	`cover_image` text,
	`rom_url` text NOT NULL,
	`core_type` text NOT NULL,
	`category_id` integer,
	`platform_id` integer,
	`is_hot` integer DEFAULT false,
	`enable` integer DEFAULT true,
	FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`platform_id`) REFERENCES `platforms`(`id`) ON UPDATE no action ON DELETE no action
);
INSERT INTO "games" VALUES(1,1768317506,1768317506,'俄罗斯方块','俄罗斯方块','https://gamepad.steamsda.com/roms/nes/tetrisa.zip.png','https://gamepad.steamsda.com/roms/nes/tetrisa.zip','Nintendo Entertainment System',8,3,1,1);
INSERT INTO "games" VALUES(2,1768360466,1768360466,'中国象棋','《FC 中国象棋经典版》作为一款在 FC 平台上的经典棋类游戏，将传统中国象棋与电子游戏巧妙融合，为玩家带来充满策略与智慧的对弈体验，深受广大棋类爱好者喜爱。  《FC中国象棋经典版》游戏简介  《FC中国象棋经典版》完美复刻传统中国象棋玩法，在FC游戏机上就能体验到这一传统棋艺的魅力。游戏提供人机对战与双人对战模式，玩家既可以独自挑战电脑AI，磨炼棋艺，也能和朋友来一场面对面的精彩对决。它有着简单、普通、困难等不同难度级别，满足不同水平玩家需求，是一款趣味性与策略性兼具的经典之作。  fc中国象棋经典版下载  《FC中国象棋经典版》规则介绍  棋盘由九条纵线和十条横线组成，中间以楚河汉界分隔。双方各有16枚棋子，包括将(帅)、士(仕)、象(相)、车、马、炮、卒(兵)。走棋时，红方先行，双方轮流各走一着。将(帅)在“九宫”内活动，每次一格;士(仕)沿“九宫”斜线走一格;象(相)走“田”字，不能过河，“田”字中心有子则不能走;车可沿直线或横线任意走;马走“日”字，有棋子绊马腿则不能走;炮走法同车，吃子时需隔一子;卒(兵)过河前只能直走一格，过河后可左右走一格，任何时候不能后退。  《FC中国象棋经典版》游戏特色  1. 原汁原味呈现中国象棋古老规则与玩法，让玩家感受传统棋艺魅力。  2. 多种难度级别设置，从新手适用的简单难度，到考验高手的困难难度，满足不同玩家水平。  3. 支持双人对战，增添社交互动性，朋友间可随时来一场象棋较量。  《FC中国象棋经典版》游戏亮点  1. 即使在FC有限机能下，也实现了较为智能的AI设计，电脑对手落子有策略，能给玩家带来挑战。  2. 简洁明了的像素棋盘与棋子画面，虽不华丽，但清晰展现棋盘布局，让玩家专注于棋局本身。  3. 游戏音效贴合象棋对弈场景，落子音效等增强游戏真实感。  《FC中国象棋经典版》经典棋谱推荐  1. “中炮对屏风马”：常见布局，红方以中炮开局进攻，黑方屏风马防御，双方展开激烈对抗，变化丰富。  2. “飞相局”：红方首着飞相，先稳固阵型，后续再伺机而动，注重子力协调与局面掌控。  3. “顺炮直车对横车”：双方第一步均架中炮，然后红方出直车，黑方出横车，开局就充满火药味，对攻激烈。  《FC中国象棋经典版》玩家评论  1. “这游戏让我对象棋产生浓厚兴趣，小时候常和小伙伴一起玩，如今还会在模拟器上重温，难度设置很有意思。”  2. “AI有一定水平，困难模式下想赢不容易，通过不断对战，我的象棋水平提高了很多。”  3. “双人对战模式太棒了，和朋友一边下棋一边斗嘴，充满欢乐，是童年美好回忆。”  《FC 中国象棋经典版》凭借对传统中国象棋规则的忠实还原、丰富的游戏模式、智能的 AI 设计等，成为 FC 平台上的棋类游戏佳作。无论是象棋新手还是资深爱好者，都能从中获得独特乐趣与挑战，在电子游戏世界中领略中国象棋的无穷魅力 。','https://gamepad.steamsda.com/roms/nes/%E4%B8%AD%E5%9B%BD%E8%B1%A1%E6%A3%8B.nes.png','https://gamepad.steamsda.com/roms/nes/%E4%B8%AD%E5%9B%BD%E8%B1%A1%E6%A3%8B.nes','Nintendo Entertainment System',8,3,1,1);
INSERT INTO "games" VALUES(3,1768360800,1768360800,'双截龙1(美版)','双截龙1(美版)',NULL,'https://gamepad.steamsda.com/roms/nes/Double%20Dragon%20(U).nes','Nintendo Entertainment System',3,3,1,1);
INSERT INTO "games" VALUES(4,1768360908,1768360908,'双截龙2','双截龙2',NULL,'https://gamepad.steamsda.com/roms/nes/Double%20Dragon%202%20-%20The%20Revenge%20(J).nes','Nintendo Entertainment System',3,3,1,1);
INSERT INTO "games" VALUES(5,1768361132,1768361132,'功夫','功夫',NULL,'https://gamepad.steamsda.com/roms/nes/Yie%20Ar%20Kung-Fu%20(J).nes','Nintendo Entertainment System',9,3,1,1);
INSERT INTO "games" VALUES(6,1768361469,1768361469,'马里奥医生','马里奥医生','https://gamepad.steamsda.com/roms/nes/vs%20dr%20mario.zip.png','https://gamepad.steamsda.com/roms/nes/vs%20dr%20mario.zip','Nintendo Entertainment System',8,3,1,1);
INSERT INTO "games" VALUES(7,1768363280,1768363280,'影子传说-日版','影子传说',NULL,'https://gamepad.steamsda.com/roms/nes/%E5%BD%B1%E5%AD%90%E4%BC%A0%E8%AF%B4.nes','Nintendo Entertainment System',3,3,1,1);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('categories',11);
INSERT INTO "sqlite_sequence" VALUES('platforms',3);
INSERT INTO "sqlite_sequence" VALUES('games',7);
CREATE UNIQUE INDEX `categories_slug_unique` ON `categories` (`slug`);
CREATE INDEX `idx_categories_slug` ON `categories` (`slug`);
CREATE UNIQUE INDEX `collections_slug_unique` ON `collections` (`slug`);
CREATE UNIQUE INDEX `platforms_slug_unique` ON `platforms` (`slug`);
CREATE INDEX `idx_platforms_sulg` ON `platforms` (`slug`);
CREATE INDEX `idx_games_title` ON `games` (`title`);
CREATE INDEX `idx_games_platformID` ON `games` (`platform_id`,`enable`);
CREATE INDEX `idx_games_category` ON `games` (`category_id`,`enable`);
CREATE INDEX `idx_games_hot` ON `games` (`is_hot`,`enable`);
CREATE INDEX `idx_games_enable` ON `games` (`enable`);
