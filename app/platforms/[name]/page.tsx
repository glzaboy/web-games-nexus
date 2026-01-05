
export default async function Home({
    params,
}: {
    params: Promise<{ name: string }>
}) {
    const { name } = await params;
    return <>当前游戏平台: {name}</>
}