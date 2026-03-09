-- 工厂点餐 - Supabase 数据库表结构
-- 在 Supabase Dashboard -> SQL Editor 中执行此脚本

-- 创建 orders 表
CREATE TABLE IF NOT EXISTS orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  worker_name TEXT NOT NULL,
  items TEXT NOT NULL,
  special TEXT,
  order_time TEXT NOT NULL,
  order_date TEXT NOT NULL,
  lang TEXT DEFAULT 'zh',
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 创建索引（加速按日期查询）
CREATE INDEX IF NOT EXISTS idx_orders_date ON orders(order_date);
CREATE INDEX IF NOT EXISTS idx_orders_created ON orders(created_at);

-- 启用 Row Level Security (RLS)
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;

-- 允许匿名用户：插入、查询、删除（内部使用，可按需收紧）
CREATE POLICY "Allow anon insert" ON orders FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "Allow anon select" ON orders FOR SELECT TO anon USING (true);
CREATE POLICY "Allow anon delete" ON orders FOR DELETE TO anon USING (true);
