---
title: The Antigravity Constitution & Global Standards
description: Core development standards, project guidelines, and global rules for Antigravity AI.
---

# Project: West Country Leders Website

This is a Jekyll-based static site for the West Country Leders board game club. It features a custom tournament management system and a blog-style update feed.

## 1. Environment & Build

### Prerequisites

- Ruby 3.0+
- Bundler

### Commands

- **Install Dependencies:** `bundle install`
- **Development Server:** `bundle exec jekyll serve --livereload`
- **Production Build:** `bundle exec jekyll build`
- **Windows Helper:** `.\start-jekyll.ps1` (Automates the above)

### Verification

- After changes, run the build command to check for Liquid syntax errors.
- Verify no 404s for generated links, especially for the `tournaments` collection.

## 2. Architecture & conventions

### Directory Structure

- `_tournaments/`: **Crucial.** Custom collection for tournament events.
- `pages/`: Static pages (`home.md`, `about.md`). _Keep these strictly Markdown/Frontmatter._
- `_posts/`: Standard blog posts.
- `_includes/`: Contains ALL complex logic (Liquid sorting, filtering, HTML structure).
- `_sass/`: SCSS styling.

### Code Style Guidelines

#### Markdown & Content (Strict Rule)

- **Non-Technical Friendly:** The `pages/` and `_tournaments/` files must remain simple Markdown.
- **No Logic in Content:** Do **NOT** put complex Liquid loops or JS in `.md` files. Move logic to an `_include` and reference it.
  - _Bad:_ Writing a `for` loop in `pages/tournaments.md`.
  - _Good:_ Putting the loop in `_includes/tournament-archive.html` and using `{% include tournament-archive.html %}` in the page.

#### SCSS / CSS

- **Variables:** ALWAYS use variables from `_sass/_variables.scss` (e.g., `$wood-light`, `$brand-color`).
- **Theme:** Maintain the "Parchment & Wood" board game aesthetic.
- **Responsiveness:** Use `clamp()` for fluid typography and `flex-wrap` for components.
- **Naming:** Use kebab-case for classes (e.g., `.featured-tournament-hero`).

#### Liquid & HTML

- **Paths:** ALWAYS use `| relative_url` filter for internal links and assets.
- **Dates:** Use `Europe/London` timezone logic when comparing dates (e.g., `site.time`).
- **Indentation:** 2 spaces.

## 3. Key Features Implementation

### Tournaments System

- **Frontmatter:**
  ```yaml
  layout: tournament
  reg_start: YYYY-MM-DD
  reg_end: YYYY-MM-DD
  signup_url: "https://..."
  ```
- **Logic:**
  - `signup_url` buttons ONLY appear if `site.time` is between `reg_start` and `reg_end`.
  - Future tournaments are visible thanks to `future: true` in `_config.yml`.

### Home Page

- **Hero Section:** Displays "Next Gathering" and "Featured Tournaments" (if registration is open).
- **Feed:** Infinite scroll implementation via `_includes/infinite-scroll.html`.
