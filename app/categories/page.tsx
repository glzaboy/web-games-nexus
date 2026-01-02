
import { Button } from "@/components/ui/button";
import { getDbAsync } from "../lib/db"
import { Metadata } from "next";

export const metadata: Metadata = {
    title: "分类",
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
export default async function Categories() {
    const db = await getDbAsync();
    const [categories] = await Promise.all([
        db.query.categories.findMany()
    ])
    console.log(categories);
    return <>
        <main className="flex-grow">
            <div className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
                <div className="px-4 py-6 sm:px-0">
                    {

                        categories.map((element) => {
                            return <Button key={element.id} >{element.name}</Button>
                        })

                    }
                    {
                        categories.map((e) => (<>{e.id}</>))
                    }
                </div>
            </div>
        </main>
    </>
}