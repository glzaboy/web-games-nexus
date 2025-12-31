import { sqliteTable, AnySQLiteColumn, text, numeric, integer, uniqueIndex, index, int, } from "drizzle-orm/sqlite-core"
import { sql, eq } from "drizzle-orm"

const baseTable = {
  id: integer().primaryKey({ autoIncrement: true }).notNull(),
  createdAt: integer("created_at", { mode: 'timestamp' }).notNull()
    .default(sql`(unixepoch())`),
  updateAt: integer("update_at", { mode: 'timestamp' }).notNull()
    .default(sql`(unixepoch())`)
}




export const categories = sqliteTable("categories", {
  ...baseTable,
  slug: text().notNull().unique(),
  name: text().notNull(),
  icon: text(),
  sortOrder: int().default(0),
  expTime: integer('exp_time', { mode: "timestamp" }).notNull()
},
  (table) => [
    index("idx_categories_slug").on(table.slug),
  ]);

export const games = sqliteTable("games", {
  ...baseTable,
  slug: text().notNull().unique(),
  title: text().notNull(),
  description: text(),
  coverUrl: text(),
  gameUrl: text(),
  categoryId: text("category_id").notNull().references(() => categories.id),
  isFeatured: integer("is_featured", { mode: "boolean" }).default(false),
  playCount: int("play_count").default(0),
  likes: int().default(0),
  expTime: integer('exp_time', { mode: "timestamp" }).notNull()
},
  (table) => [
    index("idx_game_slug").on(table.slug),
  ]);


export const reviews = sqliteTable("reviews", {
  ...baseTable,
  gameId: int("game_id").notNull().references(() => games.id),
  title: text().notNull(),
  content: text().notNull(),
  type: text().notNull(),
  videoUrl: text("video_url").notNull(),
  authorName: text("author_name").notNull(),
  viewCount: int("view_count").default(0),
  isFeatured: integer("is_featured", { mode: "boolean" }).default(false),
  expTime: integer('exp_time', { mode: "timestamp" }).notNull()
},
  (table) => [
    index("idx_reviews_Id").on(table.gameId),
  ]);