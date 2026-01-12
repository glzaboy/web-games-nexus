// db/schema.ts
import { sqliteTable, text, integer, index, primaryKey } from 'drizzle-orm/sqlite-core';
import { relations, sql } from 'drizzle-orm';
import { boolean } from 'drizzle-orm/gel-core';

const baseTable = {
  id: integer().primaryKey({ autoIncrement: true }).notNull(),
  createdAt: integer("created_at", { mode: 'timestamp' }).notNull()
    .default(sql`(unixepoch())`),
  updateAt: integer("update_at", { mode: 'timestamp' }).notNull()
    .default(sql`(unixepoch())`)
}

// 游戏表
export const games = sqliteTable('games', {
  ...baseTable,
  slug: text('slug').notNull().unique(),
  title: text('title').notNull(),
  description: text('description'),
  coverImage: text('cover_image'),
  gameUrl: text('game_url').notNull(), // 游戏实际URL
  playUrl: text('play_url').notNull(), // 直接通过a标签访问
  categoryId: integer('category_id').references(() => categories.id),
  platformId: integer('platform_id').references(() => platforms.id),
  isHot: integer('is_hot', { mode: 'boolean' }).default(false),
  enable: integer("enable", { mode: "boolean" }).default(true),
}, (table) => [
  index('idx_games_title').on(table.title),
  index('idx_games_platformID').on(table.platformId, table.enable),
  index('idx_games_category').on(table.categoryId, table.enable),
  index('idx_games_hot').on(table.isHot, table.enable),
  index('idx_games_enable').on(table.enable)
]);
// 游戏分类
export const platforms = sqliteTable('platforms', {
  ...baseTable,
  slug: text('slug').notNull().unique(),
  name: text('name', { length: 30 }).notNull(),
  icon: text('icon'),
  sort: integer('sort'),
}, (table) => [
  index("idx_platforms_sulg").on(table.slug),
]);
// 游戏分类
export const categories = sqliteTable('categories', {
  ...baseTable,
  slug: text('slug').notNull().unique(),
  name: text('name').notNull(),
  icon: text('icon'),
  sort: integer('sort'),
  enable: integer("enable", { mode: 'boolean' }).default(true)
}, (table) => [
  index("idx_categories_slug").on(table.slug)
]);

// 专题（游戏集合）
export const collections = sqliteTable('collections', {
  id: integer('id').primaryKey(),
  slug: text('slug').notNull().unique(),
  title: text('title').notNull(),
  description: text('description'),
  coverImage: text('cover_image'),
  featured: integer('featured', { mode: 'boolean' }).default(false),
});

// 专题-游戏关联表
export const collectionGames = sqliteTable('collection_games', {
  id: integer(),
  collectionId: integer('collection_id').references(() => collections.id),
  gameId: integer('game_id').references(() => games.id),
}, (table) => ({
  pk: primaryKey(table.collectionId, table.gameId),
}));

// 评测（文章）
export const reviews = sqliteTable('reviews', {
  id: integer('id').primaryKey(),
  gameId: integer('game_id').references(() => games.id),
  title: text('title').notNull(),
  content: text('content').notNull(),
  author: text('author'),
  rating: integer('rating'), // 1-5星
  isVideo: integer('is_video', { mode: 'boolean' }).default(false),
  videoUrl: text('video_url'),
  createdAt: integer('created_at', { mode: 'timestamp' }).notNull(),
});

// 关系定义
export const gamesRelations = relations(games, ({ one, many }) => ({
  category: one(categories, {
    fields: [games.categoryId],
    references: [categories.id],
  }),
  platform: one(platforms, {
    fields: [games.platformId],
    references: [platforms.id],
  }),
  collections: many(collectionGames),
  reviews: many(reviews),
}));

export const collectionsRelations = relations(collections, ({ many }) => ({
  games: many(collectionGames),
}));