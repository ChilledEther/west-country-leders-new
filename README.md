# 🎲 West Country Leders Website

Welcome to the repository for the **West Country Leders** website! This is where we manage the digital home of our board game club.

## 🔗 Quick Links
- **🌍 Live Website:** [westcountryleders.com](https://westcountryleders.com) (or relevant URL)
- **🏗️ Staging Site:** [Staging Environment](https://chilledether.github.io/west-country-leders-new/)

---

## 📝 How to Update Content

### 📅 Events Calendar
Our events page is **automated**!
1. Go to the **Google Calendar** associated with the club (`westcountryleders@gmail.com`).
2. Create or edit an event.
3. The website will automatically update (it might take a few moments to refresh).

**✨ Fancy Event Badges:**
The website automatically adds badges like "Tournament" or "Social" to event cards.
- **Automatic:** It looks for words like "Tournament", "Cup", "Social", "Pub" in the title.
- **Manual Control:** Want a custom badge? Add this tag to the **Description** of your Google Calendar event:
  > `[Badge: Mega Battle]`
  
  This will force the badge to say **Mega Battle**.

### 🏆 Tournaments
To add a new tournament page:
1. Go to the `_tournaments` folder.
2. Create a new file (e.g., `2024-root-winter.md`).
3. Copy the format from an existing tournament file.
4. **Important:** Make sure the `reg_start` and `reg_end` dates are correct so the signup button appears at the right time!

### 📰 News & Blog Posts
1. Go to the `_posts` folder.
2. Create a new file with the date in the name: `YYYY-MM-DD-your-title.md`.
3. Write your update!

### 📍 Venues & Locations
To add or update a venue (like a new pub or cafe):
1. Go to the `_data` folder and edit **`venues.yml`**.
2. Copy an existing venue block and just update the details:
   ```yaml
   - title: "New Gaming Pub"
     frequency: "Every Monday"
     time: "18:00 - 23:00"
     price: "Free"
     url: "#new-pub"
     badge: "Pub"
     badge_style: "green"
     address: "123 Board Game Lane, Bristol"
     image: "/assets/img/new-pub.jpg"
     description: "A lovely place to roll dice."
     map_iframe: '<iframe src="..."></iframe>' 
   ```
   *(To get the map iframe: Go to Google Maps -> Share -> Embed a map -> Copy HTML)*

---

## ⚙️ Settings for Non-Developers

### 🏷️ Configuring Event Badges
We have moved the badge settings to a dedicated file to make it cleaner!
Go to the `_data/` folder and edit **`event_badges.yml`**.

```yaml
- keywords: ["tournament", "cup"]  # If title has these words...
  text: "Tournament"               # ...show this text...
  style: "red"                     # ...in Red!
    
- keywords: ["newbie"]
  text: "New Players"
  style: "teal"
```

### 🎨 Available Colors
You can use any of these predefined names for the `style` setting:

| Color Name | Hex | Vibe |
| :--- | :--- | :--- |
| **red** | 🔴 | Battles, Tournaments |
| **green** | 🟢 | Social, Friendly |
| **blue** | 🔵 | Official, Standard |
| **light-blue**| 🧊 | Ice, Cold |
| **orange** | 🟠 | Default, Warn |
| **yellow** | 🟡 | Gold, Winner |
| **purple** | 🟣 | Royal, Campaign |
| **pink** | 🌸 | Fun, Light |
| **teal** | 🧼 | Teaching, New |
| **brown** | 🟤 | Wood, Earth |
| **grey** | ⚪ | Neutral, Info |
| **black** | ⚫ | Serious, Night |

---

## 💻 Technical Info (For Developers)

This site is built with **Jekyll**.

### Installation
1. Install Ruby and Bundler.
2. Run `bundle install` to get dependencies.

### Running Locally
To preview the site on your computer:
```bash
bundle exec jekyll serve
```
Then open `http://localhost:4000` in your browser.

### Deployment
*   **Main Branch:** Deploys to the Live site.
*   **Develop Branch:** Deploys to Staging.

---
*Maintained by the West Country Leders Tech Meeple.* ♟️
