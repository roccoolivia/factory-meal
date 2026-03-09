/**
 * 部署时根据环境变量生成 config.js
 * Vercel/Netlify 在项目设置中配置 SUPABASE_URL 和 SUPABASE_KEY
 */
const fs = require('fs');
const url = process.env.SUPABASE_URL || 'YOUR_SUPABASE_URL';
const key = process.env.SUPABASE_KEY || 'YOUR_SUPABASE_ANON_KEY';
fs.writeFileSync('config.js', `/** 工厂点餐 - 自动生成 */\nconst SUPABASE_URL='${url}';\nconst SUPABASE_KEY='${key}';\n`);
console.log('config.js generated');
