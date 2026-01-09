## 游戏复古网站
本项目是一个***复古游戏***平台，项目本身基于```nextjs```+```drizzle``` 项目可以托管于Cloudflare平台。此项目充分利用Cloudflare的各种资源，除了域名外其它均可以免费托管于Cloudflare平台。


## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.





# 重要命令

## export data d1
```bash
npx wrangler d1 export web-games-nexus --remote --output a.sql
```

## import data d1
```bash
npx wrangler d1 execute web-games-nexus --local --file a.sql
```

# 列出本地数据表
```bash
npx wrangler d1 execute web-games-nexus --local --command="SELECT name FROM sqlite_schema WHERE type='table' AND name NOT LIKE 'sqlite_%';"
```
# 执行命令
```bash
npx wrangler d1 execute web-games-nexus --local --command="drop table _cf_METADATA;"
npx wrangler d1 execute web-games-nexus --local --command="drop table reviews;"
npx wrangler d1 execute web-games-nexus --local --command="drop table collections;"
npx wrangler d1 execute web-games-nexus --local --command="drop table collection_games;"
npx wrangler d1 execute web-games-nexus --local --command="drop table games;"
npx wrangler d1 execute web-games-nexus --local --command="drop table categories;"
npx wrangler d1 execute web-games-nexus --local --command="drop table platforms;"
```