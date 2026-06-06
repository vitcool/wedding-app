# Wedding Invitation Site

**Live site:** https://kate-vitalii-wedding.netlify.app/

A single-page wedding invitation with a live countdown, event details, timeline, activities, photo QR code, and a gift wishlist backed by Supabase.

## Stack

- Pure HTML/CSS/JS — no build step
- [Supabase](https://supabase.com) — wishlist data (PostgreSQL + RLS)
- [Netlify](https://netlify.com) — hosting

## Project structure

```
index.html          # entire site (styles + markup + scripts)
supabase-setup.sql  # run once in Supabase Dashboard → SQL Editor
robots.txt          # blocks all search engine indexing
```

## Setup

### 1. Supabase

1. Create a project at [supabase.com](https://supabase.com)
2. Go to **SQL Editor** and run `supabase-setup.sql`
3. Copy your **Project URL** and **anon public key** from Project Settings → API
4. Paste them into `index.html`:

```js
const CONFIG = {
  SUPABASE_URL:      'https://your-project.supabase.co',
  SUPABASE_ANON_KEY: 'your-anon-key',
  PHOTO_APP_URL:     '',  // optional — photo sharing app URL
};
```

### 2. Deploy to Netlify

1. Push this repo to GitHub
2. Go to [app.netlify.com](https://app.netlify.com) → **Add new site** → **Import an existing project**
3. Select the GitHub repo
4. No build command needed — publish directory is `.` (root)
5. Click **Deploy**

## Managing the wishlist

Use Supabase Dashboard → Table Editor, or run SQL directly:

```sql
-- Add a gift
INSERT INTO wishlist_items (id, emoji, name, description, sort_order)
VALUES ('camera', '📷', 'Camera', 'Mirrorless or film', 5);

-- Update
UPDATE wishlist_items SET name = 'New name' WHERE id = 'camera';

-- Delete
DELETE FROM wishlist_items WHERE id = 'camera';

-- Reorder
UPDATE wishlist_items SET sort_order = 10 WHERE id = 'camera';
```
