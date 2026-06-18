# minku93.github.io

Personal academic website of **Minku Kang (강민구)** — built with [Quarto](https://quarto.org),
styled after [paulamoraga.com](https://www.paulamoraga.com/) (Quarto `about`/trestles template).

Migrated from the previous Google Site (`sites.google.com/view/kangminku`), 2026-06.

## Structure

| File | Page |
|---|---|
| `index.qmd` | Home / About (trestles: photo + links + bio) |
| `cv.qmd` | Full CV |
| `research.qmd` | Research projects & grants |
| `dashboard.qmd` | Research dashboard (⚠ contains internal pipeline notes — review before publishing) |
| `publications.qmd` | Publications |
| `teaching.qmd` / `teaching-prevmed.qmd` | Teaching / What is preventive medicine? |
| `media.qmd` | Media appearances |
| `contact.qmd` | Contact |
| `korean.qmd` / `interview.qmd` / `life.qmd` | 약력 / 인터뷰 / 일상 (Korean) |
| `_quarto.yml` | Site config + navbar |
| `custom.scss` | Theme (Source Sans 3, blue accent #2761e3 — the Paula Moraga palette) |
| `images/`, `assets/` | Profile photo, 일상 gallery, CV PDF |

## Edit & preview locally

Quarto is installed at `C:\Users\mk7ma\AppData\Local\Programs\quarto\bin\quarto.exe`.

```powershell
$q = "C:\Users\mk7ma\AppData\Local\Programs\quarto\bin\quarto.exe"
& $q preview .   # live preview in browser
& $q render .    # build into docs/
```

Edit content by editing the `.qmd` files (plain Markdown — same as your manuscripts).

## Publish to https://minku93.github.io

1. Create a GitHub repo named **`minku93.github.io`** (public) under your account `minku93`.
2. From this folder:
   ```bash
   git add -A
   git commit -m "Update site"
   git remote add origin https://github.com/minku93/minku93.github.io.git   # first time only
   git push -u origin main
   ```
3. On GitHub: **Settings → Pages → Build and deployment → Source: Deploy from a branch → Branch: `main` / `/docs`**.
4. Site goes live at https://minku93.github.io within a minute.

After any edit: `quarto render .` then commit & push.
