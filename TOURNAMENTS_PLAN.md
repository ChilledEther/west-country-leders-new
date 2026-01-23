# Implementation Plan: "Upcoming Tournaments" Feature

## Phase 1: Tournaments Dropdown & Collection

### Tasks
- [ ] Configure `tournaments` collection in `_config.yml`
- [ ] Add "Tournaments" menu item to `_data/settings.yml` with `dropdown: true`
- [ ] Create `_tournaments/` directory
- [ ] Create sample tournament `_tournaments/root-league-2026.md`
- [ ] Create tournaments index page `pages/tournaments.md`
- [ ] Update `_includes/header.html` with dropdown logic (desktop & mobile)
- [ ] Add dropdown styles to `_sass/_header.scss`
- [ ] Rename "Club Updates & Tournaments" to "Club Updates" in `pages/posts.md`

### Files to Modify
| File | Change |
|------|--------|
| `_config.yml` | Add `collections: tournaments` configuration |
| `_data/settings.yml` | Add "Tournaments" menu item with `dropdown: true` |
| `_includes/header.html` | Add dropdown rendering logic for desktop & mobile nav |
| `_sass/_header.scss` | Add `.nav-dropdown` styles (~50 lines) |
| `pages/posts.md` | Rename title to "Club Updates" |

### Files to Create
| File | Purpose |
|------|---------|
| `_tournaments/` | Jekyll collection directory |
| `_tournaments/root-league-2026.md` | Sample tournament file |
| `pages/tournaments.md` | Tournaments index page listing all tournaments |

---

## Phase 2: Tournament Card CTA Text

### Goal
Tournament cards/links should display "Sign up!" instead of "Read Update" (which is used for regular posts).

### Current State
- `_includes/post-card.html` (line 14) shows `<span>Read Update</span>` for all items
- This same include is used for both posts and potentially tournament listings

### Implementation Options

**Option A: Conditional in post-card.html**
Check if the item is a tournament and show different text:
```liquid
<span>{% if post.collection == 'tournaments' %}Sign up!{% else %}Read Update{% endif %}</span>
```

**Option B: Create separate tournament-card.html**
Create a dedicated `_includes/tournament-card.html` with "Sign up!" text, used specifically for tournament listings.

**Option C: Frontmatter-driven CTA**
Add a `cta` field to frontmatter so each post/tournament can define its own button text:
```yaml
# In tournament frontmatter
cta: "Sign up!"
```
```liquid
<span>{{ post.cta | default: "Read Update" }}</span>
```

### Recommended Approach
**Option A** is simplest if tournaments will always say "Sign up!". Use **Option C** for maximum flexibility.

### Tasks
- [ ] Decide on implementation approach (A, B, or C)
- [ ] Update `_includes/post-card.html` or create new include
- [ ] Test tournament cards display "Sign up!"
- [ ] Test regular post cards still display "Read Update"

---

## Phase 3: Footer Text Line Break

### Goal
Format the footer so "Board Gamers" appears on its own line below "West Country Leders", preventing awkward word-wrapping on mobile where "Board" and "Gamers" could split across lines.

**Current:**
```
West Country Leders | board gamers
```

**Desired:**
```
West Country Leders |
Board Gamers
```

### Current State
- `_includes/footer.html` (line 5): `{{ site.title }} | {{ site.description }}`
- `_config.yml` has `description: "board gamers"` (lowercase)

### Implementation
Update `_includes/footer.html` to use a `<br>` tag and capitalize "Board Gamers":

```html
<div class="footer-description">
  {{ site.title }} |<br>
  Board Gamers
</div>
```

Alternatively, use CSS `text-transform: capitalize` on the description, or update `_config.yml` to have proper capitalization.

### Tasks
- [ ] Update `_includes/footer.html` to add line break before "Board Gamers"
- [ ] Ensure proper capitalization ("Board Gamers" not "board gamers")
- [ ] Test on mobile to confirm no awkward word wrapping

---

## Phase 4: Home Page & About Us Restructure

### Goal
Swap the current Home page and Posts page:
- **Posts page** (Club Updates) → becomes the new **Home page** (`/`)
- **Current Home page** (About WCL text) → becomes **About Us** page (`/about`)
- Add "About Us" to the navigation header

### Current State
| Page | URL | Content |
|------|-----|---------|
| `pages/home.md` | `/` | About WCL intro text (front-page layout) |
| `pages/posts.md` | `/posts/` | Club Updates grid with pagination |

### Desired State
| Page | URL | Content |
|------|-----|---------|
| `pages/posts.md` (renamed) | `/` | Club Updates grid (new home page) |
| `pages/about.md` (new) | `/about` | About WCL intro text |

### Implementation

1. **Create `pages/about.md`** with current home.md content
2. **Update `pages/home.md`** to show the posts grid (or rename posts.md)
3. **Update `_data/settings.yml`** to add "About Us" menu item
4. **Update permalinks** as needed

### Files to Modify
| File | Change |
|------|--------|
| `pages/home.md` | Change to posts grid layout, permalink stays `/` |
| `_data/settings.yml` | Add "About Us" menu item, remove "Posts" |

### Files to Create
| File | Purpose |
|------|---------|
| `pages/about.md` | New About Us page with current home.md content |

### Tasks
- [ ] Create `pages/about.md` with current home page content
- [ ] Update `pages/home.md` to use posts grid layout
- [ ] Add "About Us" to navigation in `_data/settings.yml`
- [ ] Remove or rename "Posts" menu item
- [ ] Test navigation and page routing

---

## Phase 5: Form Embed Display (TODO - Needs Review)

### Goal
Fix how a form embed currently displays (reported as looking awkward).

### Current State
- **Unknown location** - needs review to identify which form/embed is affected
- Possible locations:
  - Google Forms embedded in blog posts (`_layouts/post.html` has form handling)
  - Google Calendar iframe on Events page (`_layouts/page-events.html`)

### Tasks
- [ ] **TODO**: Identify which form embed looks awkward
- [ ] Review current styling/sizing
- [ ] Implement fix once location is confirmed
