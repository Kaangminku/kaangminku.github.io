# kangminku-kr.github.io

Personal academic website of **Minku Kang (강민구)** — preventive-medicine physician and
health-policy researcher. Built with [Quarto](https://quarto.org); strict black-and-white
Helvetica editorial theme (`custom.scss`).

Live at **https://kangminku-kr.github.io**.

## Structure

- **7 languages**: English at the site root; `ko/`, `fr/`, `ja/`, `de/`, `es/`, `ru/` subdirectories
  (same page set in each). One shared navbar in `_quarto.yml`; `lang-toggle.html` localizes the nav
  labels and builds the per-page language switcher (keys off the `/xx/` path segment, so it only
  works when served at the domain root — not under a `file://` preview).
- **Pages** (per language): `index` (home), `cv`, `research`, `publications`, `teaching`, `media`,
  `contact`; Korean-only `interview`, `life`.
- **Blog**: `blog.qmd` (a Quarto listing) over `posts/` — one shared board at the site root; posts are
  written in any language and appear on every language version (not translated 7×).
- `custom.scss` — theme (`.mk-*` home classes + site-wide element styling).

## Publishing — automatic (GitHub Actions)

`.github/workflows/publish.yml` renders the site and deploys it to GitHub Pages on **every push to
`main`** (Pages Source = "GitHub Actions"). The build output `docs/` is **git-ignored** — the repo
holds sources only; the Action rebuilds it.

**Add a blog post (no local tools needed):** on GitHub, create `posts/<name>.qmd` via the web/mobile
editor with front matter, then commit — it auto-publishes in ~1–2 min:

```markdown
---
title: "Post title"
date: "2026-07-20"
categories: [단상]
---

Write freely here.
```

Editing any other `.qmd` and committing works the same way.

## Local preview (optional)

```bash
quarto render     # builds into docs/ (git-ignored); open docs/index.html
# or: quarto preview
```

Then just `git push` the sources — the Action deploys. Do **not** commit `docs/`.
