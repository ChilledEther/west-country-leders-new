# West Country Leders - Design System

## Core Philosophy

Modern, clean, and friendly. The design uses spacious layouts, a sophisticated dark/light contrast, and vibrant accents to reflect the welcoming energy of the board game community.

## Color Palette

- **Brand Dark**: `#2c3e50` - Used for headings and strong text.
- **Accent Orange**: `#e67e22` - Used for links, highlights, and calls to action.
- **Background**: `#f8f9fa` - A soft off-white for reduced eye strain.
- **Text**: `#333333` - Dark grey for optimal readability.

## Typography

- **Headings**: `Inter` (700 weight) - Bold and modern.
- **Body**: `Inter` / `Roboto` - Clean sans-serif for high legibility.
- **Monospace**: `Source Code Pro` - For code snippets.

## Layout

- **Container Max Width**: `1200px`
- **Content Max Width**: `1000px` (Applied to About, Venues, Events, Contact)
- **Fluidity**: All layouts are 100% fluid below the desktop breakpoints.

## Components

### Header

- Fixed position with **Glassmorphism** (blur effect).
- Auto-hides menu on mobile, replaced by a dropdown hamburger menu.
- Active underlines on hover.

### Images & Embeds

- All images and iframes (Maps, Calendars) automatically receive:
  - `border-radius`: 12px
  - `box-shadow`: Soft drop shadow
  - `max-width`: 100% (Responsive)

### Tables

- Clean rows with faint borders.
- Hover effects on rows for better readability.
- Rounded corners on the container.
