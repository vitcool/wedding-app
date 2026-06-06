# Wedding Invitation Site

**Live site:** https://kate-vitalii-wedding.netlify.app/

A single-page wedding invitation with a live countdown, event details, activities, photo QR code, and FAQ.

## Stack

- Pure HTML/CSS/JS — no build step, no dependencies
- [Netlify](https://netlify.com) — hosting

## Project structure

```
index.html   # entire site (styles + markup + scripts)
img/QR.JPG   # QR code for the photo-sharing album
robots.txt   # blocks all search engine indexing
```

## Deploy to Netlify

1. Push this repo to GitHub
2. Go to [app.netlify.com](https://app.netlify.com) → **Add new site** → **Import an existing project**
3. Select the GitHub repo
4. No build command needed — publish directory is `.` (root)
5. Click **Deploy**

Any push to `main` triggers an automatic redeploy.
