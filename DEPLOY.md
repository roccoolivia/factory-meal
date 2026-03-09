# 工厂点餐 - 上线部署指南

## 一、创建 Supabase 项目

1. 打开 [supabase.com](https://supabase.com) 注册/登录
2. 点击 **New Project** 创建项目
3. 在 **SQL Editor** 中执行 `supabase-schema.sql` 的全部内容
4. 在 **Settings → API** 中复制：
   - **Project URL** → 用作 `SUPABASE_URL`
   - **anon public** key → 用作 `SUPABASE_KEY`

## 二、部署方式

### 方式 A：Vercel（推荐）

1. 将项目推送到 GitHub
2. 在 [vercel.com](https://vercel.com) 导入项目
3. 在 **Settings → Environment Variables** 添加：
   - `SUPABASE_URL` = 你的 Supabase 项目 URL
   - `SUPABASE_KEY` = 你的 anon key
4. 部署完成后访问你的域名

### 方式 B：Netlify

1. 在 [netlify.com](https://netlify.com) 导入项目
2. **Build command**: `node build-config.js`
3. **Publish directory**: `.`
4. 在 **Site settings → Environment variables** 添加 `SUPABASE_URL` 和 `SUPABASE_KEY`

### 方式 C：本地/自托管

1. 编辑 `config.js`，填入你的 Supabase URL 和 Key
2. 将整个文件夹上传到任意静态托管（如 Nginx、Apache、GitHub Pages）
3. 确保 `config.js` 与 HTML 同目录

## 三、访问入口

- 首页：`/` 或 `/index.html`
- 工人点餐：`/工厂点餐_工人版_v2.html` 或 `/worker`
- 餐馆视图：`/工厂点餐_餐馆视图_v2.html` 或 `/kitchen`
- 文员后台：`/工厂点餐_文员后台_v2.html` 或 `/admin`
