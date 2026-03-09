CREATE TABLE orders (
  id bigint generated always as identity primary key,
  name text not null,
  meal text not null,
  meal_en text,
  emoji text,
  note text,
  time text,
  date text,
  status text default 'pending',
  created_at timestamptz default now()
);
alter table orders enable row level security;
create policy "Allow all" on orders for all using (true);
