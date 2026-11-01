# wantidah.github.io

Source for Wantida's personal research website — built with
[Quarto](https://quarto.org) and published via GitHub Pages at
<https://wantidah.github.io>.

## Structure

```
.
├── _quarto.yml          # Site config (navbar, theme, footer)
├── theme.scss           # Warm earth-tone color palette & typography
├── styles.css           # Small CSS tweaks on top of theme.scss
├── index.qmd            # Home page
├── about.qmd            # About / bio / CV link
├── research.qmd         # Research themes
├── publications.qmd     # Publications list
├── blog.qmd             # Blog listing page (auto-reads posts/)
├── contact.qmd          # Contact info
├── posts/               # Blog posts (one folder per post)
│   ├── _metadata.yml    # Shared defaults for all posts
│   └── welcome/
│       └── index.qmd
├── images/              # Site images (profile.jpg, favicon.png, etc.)
└── files/               # Downloadable files (CV PDF, etc.)
```

## Edit / preview locally

```bash
quarto preview
```

Opens a live-reloading browser window. Edit a `.qmd` file → browser
refreshes.

## Publish to GitHub Pages

Push to `main`. The GitHub Action in `.github/workflows/publish.yml`
renders the site and updates the `gh-pages` branch, which GitHub Pages
serves.

(See `SETUP_GUIDE.html` for the full first-time setup, including how to
install Quarto, make the repo public, and wire up GitHub Pages.)

## Add a new blog post

```bash
mkdir posts/my-new-post
```

Create `posts/my-new-post/index.qmd` with front matter:

```yaml
---
title: "A short, descriptive title"
description: "One-line summary"
date: "2026-04-19"
categories: [wildlife, one-health]
image: thumbnail.jpg
---
```

Then write your post in Markdown below the `---`. A `thumbnail.jpg` in
the same folder is used on the blog listing card.
