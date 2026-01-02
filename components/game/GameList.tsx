// components/game/GameList.tsx
import GameCard from "./GameCard";

interface Game {
    id: number;
    slug: string;
    title: string;
    description?: string;
    coverImage?: string;
    gameUrl: string;
    playUrl: string;
    categoryId: number | null;
    isHot?: boolean;
    category?: {
        id: number;
        slug: string;
        name: string;
        icon: string | null;
    };
}

interface GameListProps {
    games: Game[];
    columns?: 2 | 3 | 4 | 5 | 6;
}

export default function GameList({ games, columns = 4 }: GameListProps) {
    const gridCols = {
        2: 'grid-cols-2',
        3: 'grid-cols-2 md:grid-cols-3',
        4: 'grid-cols-2 md:grid-cols-3 lg:grid-cols-4',
        5: 'grid-cols-2 md:grid-cols-3 lg:grid-cols-5',
        6: 'grid-cols-2 md:grid-cols-3 lg:grid-cols-6',
    };

    return (
        <div className={`grid ${gridCols[columns]} gap-4 md:gap-6`}>
            {games.map((game) => (
                <GameCard key={game.id} game={game} />
            ))}
        </div>
    );
}