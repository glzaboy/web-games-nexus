import { Metadata } from "next";
import { Flame, Grid3X3, Gamepad2 } from 'lucide-react';
const ITEMS_PER_PAGE = 12;


export const metadata: Metadata = {
  title: "Game - 在线FC游戏，复古游戏，超级玛丽",
  description: "发现并游玩数千款免费在线游戏",
  keywords: ['游戏', '在线游戏', '免费游戏', '网页游戏', '休闲游戏'],
  openGraph: {
    title: "Game - 在线FC游戏，复古游戏，超级玛丽",
    description: "游戏, 在线游戏, 免费游戏, 网页游戏, 休闲游戏",
  },
  twitter: {
    title: "Game - 在线FC游戏，复古游戏，超级玛丽",
    description: "游戏, 在线游戏, 免费游戏, 网页游戏, 休闲游戏",
  },
  authors: [
    { name: "glzaboy", url: "github.com/SteamSda" }
  ],
};
import { getDbAsync } from "@/lib/db";
import GameList from "@/components/game/GameList";
import { games } from "@/db/schema";
import { count } from "drizzle-orm";
import ServerPagination from "@/components/game/ServerPagination";

export const revalidate = 3600; // 缓存1小时，3600秒 = 1小时

export default async function Home({
  searchParams,
}: {
  searchParams: Promise<{ page?: number }>
}) {
  const q = await searchParams;
  const page = q.page ?? 1;
  const db = await getDbAsync();
  const [hotGames, categories, allGames, totalGamesResult] = await Promise.all([
    db.query.games.findMany({
      where: (games, { eq }) => eq(games.isHot, true),
      limit: 12,
      with: { category: true }
    }),
    db.query.categories.findMany({
      limit: 8, orderBy: (categories, { asc, desc }) => [],
      where: (categories, { eq }) => eq(categories.enable, true)
    }),
    db.query.games.findMany({
      //where: (games, { eq }) => eq(games.isHot, true),
      offset: (page - 1) * ITEMS_PER_PAGE,
      limit: ITEMS_PER_PAGE,
      with: { category: true }
    }),
    db.select({ count: count() }).from(games)
  ]);
  // 获取总数
  const totalGamesCount = totalGamesResult[0]?.count || 0;
  // 计算分页信息
  const totalPages = Math.ceil(totalGamesCount / ITEMS_PER_PAGE);
  const hasPreviousPage = page > 1;
  const hasNextPage = page < totalPages;

  return (
    <main className="grow">
      <div className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
        <div className="px-4 py-6 sm:px-0">
          {/* 游戏分类 */}
          <section className="mb-12">
            <div className="flex items-center gap-2 mb-6">
              <Grid3X3 className="h-6 w-6 text-red-500" />
              <h2 className="text-2xl font-bold">游戏分类</h2>
            </div>
            <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-8 gap-4">
              {categories.map((category) => (
                <a
                  key={category.id}
                  href={`/categories/${category.slug}`}
                  className="flex flex-col items-center p-4 rounded-lg border hover:bg-accent transition-colors"
                >
                  <Gamepad2 className="h-8 w-8 mb-2" />
                  <span className="text-sm font-medium">{category.name}</span>
                </a>
              ))}
            </div>
          </section>
          <section className="mb-12">
            <div className="flex items-center gap-2 mb-6">
              <Flame className="h-6 w-6 text-red-500" />
              <h2 className="text-2xl font-bold">热门游戏</h2>
            </div>

            <GameList games={hotGames}></GameList>

          </section>


          <section className="mb-12">
            <div className="flex items-center gap-2 mb-6">
              <Flame className="h-6 w-6 text-red-500" />
              <h2 className="text-2xl font-bold">所有游戏</h2>
            </div>
          </section>
          <GameList games={allGames} />

          {allGames.length > 0 ? (
            <>

              {/* 分页组件 */}
              {/* 使用封装的分页组件 */}
              <div className="mt-12">
                <ServerPagination
                  currentPage={page}
                  totalPages={totalPages}
                  baseUrl="/"
                  pageParam="page"
                  showInfo={true}
                />
              </div>
            </>
          ) : (
            <div className="text-center py-12">
              <Gamepad2 className="h-16 w-16 mx-auto text-gray-300 mb-4" />
              <h3 className="text-xl font-semibold text-gray-500 mb-2">
                暂无游戏
              </h3>
            </div>
          )}


        </div>
      </div>
    </main>
  );
}
