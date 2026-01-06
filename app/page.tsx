import { Metadata } from "next";
//import GameList from '@/components/game/GameList';
import { Flame } from 'lucide-react';

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

export default async function Home() {
  const db = await getDbAsync();
  const [hotGames, categories, collections] = await Promise.all([
    db.query.games.findMany({
      where: (games, { eq }) => eq(games.isHot, true),
      limit: 12,
      with: { category: true }
    }),
    db.query.categories.findMany({ limit: 8 }),
    db.query.collections.findMany({
      where: (collections, { eq }) => eq(collections.featured, true),
      limit: 4
    })
  ]);
  console.log(hotGames, categories, collections);
  return (
    <main className="grow">
      <div className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
        <div className="px-4 py-6 sm:px-0">
          <section className="mb-12">
            <div className="flex items-center gap-2 mb-6">
              <Flame className="h-6 w-6 text-red-500" />
              <h2 className="text-2xl font-bold">热门游戏</h2>
            </div>
          </section>

        </div>
      </div>
    </main>
  );
}
