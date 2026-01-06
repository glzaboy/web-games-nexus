PRAGMA defer_foreign_keys=TRUE;
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
	`icon` text
, `sort` integer);
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
CREATE TABLE `games` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`created_at` integer DEFAULT (unixepoch()) NOT NULL,
	`update_at` integer DEFAULT (unixepoch()) NOT NULL,
	`slug` text NOT NULL,
	`title` text NOT NULL,
	`description` text,
	`cover_image` text,
	`game_url` text NOT NULL,
	`play_url` text NOT NULL,
	`category_id` integer,
	`platform_id` integer,
	`is_hot` integer DEFAULT false,
	FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`platform_id`) REFERENCES `platforms`(`id`) ON UPDATE no action ON DELETE no action
);
INSERT INTO "games" VALUES(1,1767599937,1767599937,'1945 改 III','1945Kill',NULL,'https://img.1990i.com/arcadepic/1945kiii.png','rom=https://gamepad.steamsda.com/roms/1945kiii.zip&coreType=Arcade','gamepad.steamsda.com/EmulatorJS-4.2.3/index.html?rom=https://gamepad.steamsda.com/roms/1945kiii.zip&coreType=Arcade',1,1,0);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('platforms',3);
INSERT INTO "sqlite_sequence" VALUES('categories',11);
INSERT INTO "sqlite_sequence" VALUES('games',1);
CREATE UNIQUE INDEX `collections_slug_unique` ON `collections` (`slug`);
CREATE UNIQUE INDEX `platforms_slug_unique` ON `platforms` (`slug`);
CREATE INDEX `idx_platforms_sulg` ON `platforms` (`slug`);
CREATE UNIQUE INDEX `categories_slug_unique` ON `categories` (`slug`);
CREATE INDEX `idx_categories_slug` ON `categories` (`slug`);
CREATE UNIQUE INDEX `games_slug_unique` ON `games` (`slug`);
CREATE INDEX `idx_games_title` ON `games` (`title`);
CREATE INDEX `idx_games_platformID` ON `games` (`platform_id`);
CREATE INDEX `idx_games_category` ON `games` (`category_id`);
CREATE INDEX `idx_games_hot` ON `games` (`is_hot`);
