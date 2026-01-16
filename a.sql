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
INSERT INTO "platforms" VALUES(4,1768469816,1768469816,'snes','SNES',NULL,4);
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
INSERT INTO "games" VALUES(3,1768360800,1768360800,'双截龙1(美版)','双截龙1(美版)','https://gamepad.steamsda.com/roms/nes/Double%20Dragon%20(U).nes.png','https://gamepad.steamsda.com/roms/nes/Double%20Dragon%20(U).nes','Nintendo Entertainment System',3,3,0,1);
INSERT INTO "games" VALUES(4,1768360908,1768360908,'双截龙2(日版)','双截龙2','https://gamepad.steamsda.com/roms/nes/Double%20Dragon%202%20-%20The%20Revenge%20(J).nes.png','https://gamepad.steamsda.com/roms/nes/Double%20Dragon%202%20-%20The%20Revenge%20(J).nes','Nintendo Entertainment System',3,3,0,1);
INSERT INTO "games" VALUES(5,1768361132,1768361132,'功夫','功夫','https://gamepad.steamsda.com/roms/nes/Yie%20Ar%20Kung-Fu%20(J).nes.png','https://gamepad.steamsda.com/roms/nes/Yie%20Ar%20Kung-Fu%20(J).nes','Nintendo Entertainment System',9,3,1,1);
INSERT INTO "games" VALUES(6,1768361469,1768361469,'马里奥医生','马里奥医生','https://gamepad.steamsda.com/roms/nes/vs%20dr%20mario.zip.png','https://gamepad.steamsda.com/roms/nes/vs%20dr%20mario.zip','Nintendo Entertainment System',8,3,0,1);
INSERT INTO "games" VALUES(7,1768363280,1768363280,'影子传说(日版)','影子传说','https://gamepad.steamsda.com/roms/nes/%E5%BD%B1%E5%AD%90%E4%BC%A0%E8%AF%B4.nes.png','https://gamepad.steamsda.com/roms/nes/%E5%BD%B1%E5%AD%90%E4%BC%A0%E8%AF%B4.nes','Nintendo Entertainment System',3,3,1,1);
INSERT INTO "games" VALUES(8,1768395148,1768395148,'FC马戏团','非常经典的FC红白机游戏——《FC马戏团》（英文名：Circus Charlie，也有译作《马戏团查理》）。  这是一款1984年由科乐美（Konami）公司发行的经典横向卷轴动作游戏。  游戏亮点回顾： 主角：玩家操控一位名叫查理（Charlie）的马戏团演员。  经典关卡：游戏由多个风格迥异的马戏表演项目组成，每个关卡都像一场独立的杂技表演：  第一关 跳火圈：骑着狮子（在早期版本中看起来也像狗）连续跳过多个火圈。  第二关 踩球：在球上平衡前进，跳过猴子或障碍物。  第三关 走钢丝：在高空钢丝上行走，跳过小丑和猴子，小心平衡。  第四关 弹簧床：利用弹簧床不断向上跳，抓住空中的秋千。  第五关 骑马：在奔跑的马背上跳跃，跳过障碍物和猴子。  第六关 空中飞人：抓住摆动的秋千，在空中飞跃。  魔性音乐：其背景音乐（尤其是第一关）节奏明快、旋律洗脑，是许多80后、90后玩家的“童年音轨”之一，至今令人印象深刻。  简单而困难的玩法：操作非常简单（主要是跑和跳），但关卡设计巧妙，难度递进，稍有不慎就会失败，非常考验时机和节奏感。  文化意义： FC时代代表作：它是早期电子游戏的代表作之一，和《超级马里奥》、《魂斗罗》等一样，承载了一代人的游戏记忆。  聚会常客：因其简单易上手又充满挑战，曾是朋友或家庭聚会时热门的轮流挑战游戏。  所以，当人们提到“FC马戏团”时，第一时间想到的往往不是现实中的马戏团，而是这款充满回忆的经典像素游戏。它完美地将马戏团的杂技项目转化为了有趣的游戏关卡。','https://gamepad.steamsda.com/roms/nes/%E9%A9%AC%E6%88%8F%E5%9B%A2.zip.png','https://gamepad.steamsda.com/roms/nes/%E9%A9%AC%E6%88%8F%E5%9B%A2.zip','Nintendo Entertainment System',7,3,1,1);
INSERT INTO "games" VALUES(9,1768395467,1768395467,'1943(日版)','1943(日版)','https://gamepad.steamsda.com/roms/nes/1943.png','https://gamepad.steamsda.com/roms/nes/1943.zip','Nintendo Entertainment System',2,3,0,1);
INSERT INTO "games" VALUES(10,1768395467,1768395467,'1942','1942','https://gamepad.steamsda.com/roms/nes/1942.png','https://gamepad.steamsda.com/roms/nes/1942.zip','Nintendo Entertainment System',2,3,0,1);
INSERT INTO "games" VALUES(11,1768399790,1768399790,'F1公路赛车','F1公路赛车','https://gamepad.steamsda.com/roms/nes/F1%E5%85%AC%E8%B7%AF%E8%B5%9B%E8%BD%A6.zip.png','https://gamepad.steamsda.com/roms/nes/F1%E5%85%AC%E8%B7%AF%E8%B5%9B%E8%BD%A6.zip','Nintendo Entertainment System',10,3,1,1);
INSERT INTO "games" VALUES(12,1768400627,1768400627,'快乐猫','快乐猫 - FC怀旧像素风猫咪冒险 发行年份： 1992 (虚构) 平台： 红白机 / FC / NES 游戏类型： 横向卷轴 平台 动作 开发商： 像素猫软件 (虚构)  游戏简介： 唤醒你的8位游戏之魂！《快乐猫》是一款充满FC时代经典风味的平台跳跃游戏。控制一只灵巧的猫咪，在充满挑战与秘密的像素世界中穿梭，目标是收集所有“快乐星星”，从捣蛋的汪汪军团手中拯救被绑架的小猫朋友们！  故事背景： 在宁静的“喵喵村”，一年一度的“快乐星庆典”即将开始。然而，讨厌节日的“汪汪军团”偷走了维持庆典能量的快乐星星，并抓走了你的朋友们！作为村里最勇敢的小猫“咪咕”，你必须踏上穿越森林、城市、海滩和汪汪城堡的冒险之旅，让快乐重回村庄！  核心玩法：  经典平台跳跃： 精准的跳跃和移动是核心。奔跑、攀爬、利用弹簧和移动平台穿越复杂地形。  猫咪式攻击： 使用基本的 “猫拳” 攻击敌人，或捡起场景中的 “毛线球” 作为投掷武器。在特定关卡，还能获得 “火箭爪” 或 “超级喵吼” 等限时强力道具。  探索与收集： 每个关卡都藏有 三颗“快乐星星” 和额外的 “小鱼干”（用于奖励生命和分数）。找到隐藏的砖块或密道是通关的关键。  多样化的关卡：  森林关： 躲避乌龟和会丢松果的松鼠。  城市关： 在屋顶跳跃，避开飞鸟和烟囱。  水下关： （经典的游泳操控）与泡泡鱼周旋，寻找氧气。  汪汪城堡： 最终决战，对抗汪汪军团的头目们！  怀旧视听体验： 典型的FC时代明亮色块像素画风，搭配 “芯片音乐” 风格的洗脑旋律，瞬间带你回到童年。  为何要玩《快乐猫》？ 这是一封写给FC黄金时代的情书。它完美复刻了那个年代游戏的纯粹挑战感、简单的快乐和精巧的隐藏元素。对于老玩家，它是唤醒记忆的时光机；对于新玩家，它是了解游戏历史魅力的绝佳入门作。  准备好挑战8位元的经典难关了吗？插入卡带，按下开始键，和咪咕一起开始这场复古的快乐救援大冒险吧！','https://gamepad.steamsda.com/roms/nes/%E5%BF%AB%E4%B9%90%E7%8C%AB.nes.png','https://gamepad.steamsda.com/roms/nes/%E5%BF%AB%E4%B9%90%E7%8C%AB.nes','Nintendo Entertainment System',3,3,1,1);
INSERT INTO "games" VALUES(13,1768402585,1768402585,'超级玛莉1英文','超级马力欧兄弟 - 开创时代的经典之作 发行年份： 1985 平台： 任天堂家用机 (NES) 游戏类型： 横向卷轴平台跳跃 开发商： 任天堂  游戏简介： 这是一款定义了平台跳跃游戏类型、并成为文化标志的史诗级作品！《超级马力欧兄弟》将带你进入一个充满活力、危机四伏却又精彩纷呈的蘑菇王国。  故事背景： 邪恶的库巴大王入侵了和平的蘑菇王国，掳走了碧姬公主。王国的命运落在了两位勇敢的水管工兄弟——马力欧和路易吉的肩上。你将扮演马力欧（或第二位玩家扮演路易吉），跨越八个风格迥异的世界，穿越草原、地牢、水下关卡和城堡，展开一场拯救公主的冒险之旅。  核心玩法：  奔跑与跳跃： 挑战超过30个精心设计的横向卷轴关卡。  击败敌人： 通过踩踏或发射火球，消灭栗宝宝、慢慢龟等经典敌人。  发现道具： 撞击隐藏方块，获取神奇道具：超级蘑菇让你变大，火焰花让你发射火球，无敌星则能让你所向披靡。  探索秘密： 寻找隐藏区域、传送管道和捷径，帮助你快速通关。  决战头目： 在库巴的诡诈堡垒中，与他的爪牙展开紧张刺激的头目战。  为何时至今日依然值得一玩？ 这是一部可以亲身游玩的游戏史。虽然以今日的标准来看画面简单，但其无可挑剔的操作手感、设计精妙的关卡布局以及永不过时的魅力，使其成为每位玩家不可或缺的经典体验。它是后世无数游戏赖以建立的基石。  现在就游玩《超级马力欧兄弟》，亲历传奇的开端！','https://gamepad.steamsda.com/roms/nes/%E8%B6%85%E7%BA%A7%E7%8E%9B%E8%8E%89.nes.png','https://gamepad.steamsda.com/roms/nes/%E8%B6%85%E7%BA%A7%E7%8E%9B%E8%8E%89.nes','Nintendo Entertainment System',3,3,1,1);
INSERT INTO "games" VALUES(14,1768403065,1768403065,'双截龙2(美版)','双截龙 II：复仇 - 街头格斗的巅峰之作 发行年份： 1989 平台： 红白机 / FC / NES 游戏类型： 清版动作 / 卷轴格斗 开发商： Technōs Japan  游戏简介： 这是FC平台上不可逾越的清版动作游戏丰碑！《双截龙II：复仇》在前作基础上全面进化，带来了更流畅的操控、更丰富的招式以及更激烈的双人合作体验。扮演比利和吉米·李（李比利与李吉姆）两兄弟，用拳脚与毅力，踏上为爱复仇的硬核征程。  故事背景： 在粉碎“黑武士”团伙一年后，李兄弟的女友玛丽安被神秘武装集团绑架并残忍杀害。悲愤交加的兄弟俩发现，这一切的幕后主使竟是曾被他们击败的敌人——黑武士残党发起的复仇。为了给玛丽安报仇，兄弟二人决定单枪匹马，深入敌巢，彻底铲除这个罪恶组织。  核心玩法与特色：  标志性战斗系统：  基础招式： 拳击、脚踢、抓取、投掷。  经典必杀： 旋风腿（跳跃中↓+B）、膝顶（抓住敌人后按A）、上勾拳等招式悉数回归，手感扎实。  新增核心动作： 本作加入了至关重要的 “后肘击”（反方向+A），极大地提升了被包围时的反击能力。  革命性的双人模式：  支持 同时双人合作通关，乐趣倍增。但需要注意，玩家之间可以互相伤害（可开关此选项），考验真正的默契。  丰富的关卡设计： 共9个风格迥异的关卡，从都市街头、直升机平台、地下基地、森林到敌人的最终堡垒，场景多变，敌人种类繁多。  多样的敌人与头目： 面对忍者、拳击手、巨汉等不同攻击模式的敌人，并在每关结尾挑战独特的强力头目。  美版特色： 相比日版，美版在部分画面表现（如颜色）和敌人受击效果上略有调整，但核心内容一致，难度硬核，是当年北美玩家的经典记忆。  为何至今仍被奉为经典？ 《双截龙II》代表了FC时代清版动作游戏的最高水准。它将优秀的操作性、适中的挑战性、爽快的打击感和完美的合作体验融为一体。其悲壮的复仇剧情、热血的配乐和拳拳到肉的战斗，塑造了无数玩家的童年记忆。它不仅是一款游戏，更是一个时代的符号。  召集你的战友，重温这部硬派格斗经典吧！用旋风腿踢出一条血路，完成复仇！','https://gamepad.steamsda.com/roms/nes/Double%20Dragon%202%20-%20The%20Revenge%20(J).nes.png','https://gamepad.steamsda.com/roms/nes/%E5%8F%8C%E6%88%AA%E9%BE%992-%E8%8B%B1%E6%96%87.nes','Nintendo Entertainment System',3,3,1,1);
INSERT INTO "games" VALUES(15,1768469821,1768469821,'Super Boss Gaiden','Super Boss Gaiden - 终极头目挑战书 发行年份： 1994 (虚构) 平台： 超级任天堂 / SFC 游戏类型： Boss Rush / 动作挑战 开发商： 挑战者工作室 (虚构)  游戏简介： 忘掉漫长的关卡和杂兵！《Super Boss Gaiden》是一款专注于极致对决的“头目攻坚”游戏。在这里，你将直面来自多个经典虚构游戏世界的强化版终极头目，体验最纯粹、最紧张、最高强度的技巧挑战。你的操作、反应与毅力将受到终极考验。  故事背景（极简框架）： 时空乱流撕裂了各个游戏世界的屏障，最强大、最邪恶的头目们被汇聚到了一个被称为“挑战回廊”的异次元角斗场。一位神秘的守护者召唤了史上最强的英雄（即玩家你），目标只有一个：连续击败所有头目，恢复多元宇宙的平衡。没有剧情铺垫，只有一场接一场的生死斗。  核心玩法与特色：  纯粹的Boss Rush模式：  游戏直接进入主题，包含 5大章节，共25场 精心设计的头目战，每场战斗都是独立的终极挑战。  多元化的头目设计：  头目灵感来源于多种经典游戏类型，包括：  巨兽型： 考验躲避与耐心。  敏捷型： 考验反应与预判。  解谜型： 需要发现特定弱点与攻击模式。  多形态/多阶段型： 随着战斗推进，头目的攻击模式会发生剧变。  自适应英雄系统：  在每场战斗开始前，你可以从 三位能力迥异的英雄 中选择一位：  骑士（平衡型）： 剑与盾，攻防一体。  巫师（远程型）： 高风险高回报的魔法攻击，生命值较低。  游侠（敏捷型）： 高机动性，擅长闪避与快速连击。  你的选择将从根本上改变每场战斗的策略与体验。  严苛的资源管理：  生命值与魔力值 不会在战斗间完全恢复。你必须合理使用有限的回复道具，为漫长的挑战回廊制定长远策略。  经典的16位美学：  采用精致的SFC风格像素美术，头目动画魄力十足。背景音乐则根据头目风格变化，从史诗交响到电子摇滚，烘托出每场对决的独特氛围。  为何是硬核玩家的必玩之作？ 《Super Boss Gaiden》剥离了一切冗余，只保留了动作游戏最核心、最令人兴奋的部分：与强大对手的博弈。它不适合寻求轻松叙事的玩家，而是专为那些渴望磨练技术、享受在失败中学习并最终战胜看似不可逾越之敌的成就感的核心玩家所设计。  你准备好接受这份来自最强头目们的挑战书了吗？踏入挑战回廊，证明谁是真正的终极英雄！','https://gamepad.steamsda.com/roms/snes/Super%20Boss%20Gaiden%20(J)%20(V1.2).sfc.png','https://gamepad.steamsda.com/roms/snes/Super%20Boss%20Gaiden%20(J)%20(V1.2).sfc','Super Nintendo Entertainment System',2,4,1,1);
INSERT INTO "games" VALUES(16,1768543842,1768543842,'超级马里奥2','超级马里奥2','https://gamepad.steamsda.com/roms/nes/%E8%B6%85%E7%BA%A7%E9%A9%AC%E9%87%8C%E5%A5%A52.zip.png','https://gamepad.steamsda.com/roms/nes/%E8%B6%85%E7%BA%A7%E9%A9%AC%E9%87%8C%E5%A5%A52.zip','Nintendo Entertainment System',3,3,1,1);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('categories',11);
INSERT INTO "sqlite_sequence" VALUES('platforms',4);
INSERT INTO "sqlite_sequence" VALUES('games',16);
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
