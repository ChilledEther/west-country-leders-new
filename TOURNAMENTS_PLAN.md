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
