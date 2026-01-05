// db/schema.ts
import { sqliteTable, text, integer, index, primaryKey } from 'drizzle-orm/sqlite-core';
import { relations } from 'drizzle-orm';

// 游戏表
export const games = sqliteTable('games', {
  id: integer('id').primaryKey({ autoIncrement: true }),
  slug: text('slug').notNull().unique(),
  title: text('title').notNull(),
  description: text('description'),
  coverImage: text('cover_image'),
  gameUrl: text('game_url').notNull(), // 游戏实际URL
  playUrl: text('play_url').notNull(), // 直接通过a标签访问
  categoryId: integer('category_id').references(() => categories.id),
  isHot: integer('is_hot', { mode: 'boolean' }).default(false),
  createdAt: integer('created_at', { mode: 'timestamp' }).notNull(),
}, (table) => ({
  slugIdx: index('slug_idx').on(table.slug),
  hotIdx: index('hot_idx').on(table.isHot),
}));
// 游戏分类
export const platforms = sqliteTable('platforms', {
  id: integer('id').primaryKey({ autoIncrement: true }),
  slug: text('slug').notNull().unique(),
  name: text('name', { length: 30 }).notNull(),
  icon: text('icon'),
}, (table) => ({
  slug: index("slug").on(table.slug),
}));
// 游戏分类
export const categories = sqliteTable('categories', {
  id: integer('id').primaryKey(),
  slug: text('slug').notNull().unique(),
  name: text('name').notNull(),
  icon: text('icon'),
});

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
  collections: many(collectionGames),
  reviews: many(reviews),
}));

export const collectionsRelations = relations(collections, ({ many }) => ({
  games: many(collectionGames),
}));