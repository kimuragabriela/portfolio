# Portfolio — Gabriela Kimura

Personal portfolio site built with plain HTML, CSS and vanilla JavaScript.
Designed in Figma · Deployed on Vercel.

## Structure

```
portfolio/
├── index.html          # Home page
├── pages/
│   ├── who.html        # About page
│   └── project.html    # Project case study template
├── assets/
│   ├── css/
│   │   └── global.css  # Shared styles (tokens, reset, nav, footer)
│   └── images/         # Project screenshots and photos
└── README.md
```

## Running locally

Just open `index.html` in your browser — no build step needed.

```bash
# Or with a simple local server (recommended)
npx serve .
```

## Deploying to Vercel

1. Push this repo to GitHub
2. Go to [vercel.com](https://vercel.com) → **New Project**
3. Import this repository
4. Click **Deploy** — done

## Connecting a custom domain

In your Vercel project: **Settings → Domains → Add** your domain,
then update the DNS records at your registrar as instructed.

## Tech stack

- HTML5 / CSS3 (custom properties, grid, flexbox)
- Vanilla JavaScript
- Google Fonts — Rubik + Inter
- No frameworks, no build tools, no dependencies
