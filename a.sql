PRAGMA defer_foreign_keys=TRUE;
CREATE TABLE `categories` (
	`id` integer PRIMARY KEY NOT NULL,
	`slug` text NOT NULL,
	`name` text NOT NULL,
	`icon` text
);
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
CREATE TABLE `games` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`slug` text NOT NULL,
	`title` text NOT NULL,
	`description` text,
	`cover_image` text,
	`game_url` text NOT NULL,
	`play_url` text NOT NULL,
	`category_id` integer,
	`is_hot` integer DEFAULT false,
	`created_at` integer NOT NULL,
	FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE no action
);
CREATE TABLE `platforms` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`slug` text NOT NULL,
	`name` text(30) NOT NULL,
	`icon` text
);
INSERT INTO "platforms" VALUES(1,'nes','NES',NULL);
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
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('platforms',1);
CREATE UNIQUE INDEX `categories_slug_unique` ON `categories` (`slug`);
CREATE UNIQUE INDEX `collections_slug_unique` ON `collections` (`slug`);
CREATE UNIQUE INDEX `games_slug_unique` ON `games` (`slug`);
CREATE INDEX `slug_idx` ON `games` (`slug`);
CREATE INDEX `hot_idx` ON `games` (`is_hot`);
CREATE UNIQUE INDEX `platforms_slug_unique` ON `platforms` (`slug`);
CREATE INDEX `slug` ON `platforms` (`slug`);
