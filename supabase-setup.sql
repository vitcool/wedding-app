-- ══════════════════════════════════════════════════════════
--  Wedding site — Supabase Setup
--  Run this SQL in Supabase Dashboard → SQL Editor
-- ══════════════════════════════════════════════════════════


-- ── 1. Gifts table ────────────────────────────────────────
create table if not exists wishlist_items (
  id          text        primary key,       -- unique slug, e.g. 'airpods-pro'
  emoji       text        not null default '🎁',
  name        text        not null,
  description text        not null default '',
  url         text        default null,      -- link to product (optional)
  sort_order  integer     not null default 0, -- lower = higher in list
  created_at  timestamptz default now()
);

-- ── 2. Bookings table ─────────────────────────────────────
create table if not exists wishlist_bookings (
  item_id     text        primary key references wishlist_items(id),
  booker_name text        not null,
  booked_at   timestamptz default now()
);

-- ── 3. Row Level Security ──────────────────────────────────
alter table wishlist_items    enable row level security;
alter table wishlist_bookings enable row level security;

-- wishlist_items: public read, only admin can insert/update
create policy "Public read items"
  on wishlist_items for select using (true);

-- wishlist_bookings: public read and one-time insert
create policy "Public read bookings"
  on wishlist_bookings for select using (true);

create policy "Public insert once"
  on wishlist_bookings for insert
  with check (true);
-- UPDATE and DELETE are not allowed — no policies defined → blocked by default

-- ── 4. Seed data (replace with real gifts) ────────────────
insert into wishlist_items (id, emoji, name, description, sort_order) values
  ('test1', '🎁', 'Тест 1', 'Опис першого подарунку — буде оновлено.', 1),
  ('test2', '✨', 'Тест 2', 'Опис другого подарунку — буде оновлено.',  2),
  ('test3', '🌿', 'Тест 3', 'Опис третього подарунку — буде оновлено.', 3)
on conflict (id) do nothing;

-- ══════════════════════════════════════════════════════════
--  Managing gifts:
--
--  Add:       INSERT INTO wishlist_items (id, emoji, name, description, sort_order)
--             VALUES ('new-item', '📚', 'Name', 'Description', 4);
--
--  Update:    UPDATE wishlist_items SET name = 'New name' WHERE id = 'test1';
--
--  Delete:    DELETE FROM wishlist_items WHERE id = 'test1';
--             (booking is removed automatically via FK CASCADE — if ON DELETE CASCADE is added)
--
--  Reorder:   UPDATE wishlist_items SET sort_order = 10 WHERE id = 'test3';
-- ══════════════════════════════════════════════════════════
