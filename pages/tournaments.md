---
layout: page
title: Tournaments
permalink: /tournaments/
---

We organise competitive tournaments throughout the year for various games. Check back here for upcoming events!

## Upcoming Tournaments

{% assign upcoming = site.tournaments | where_exp: "t", "t.date >= site.time" | sort: "date" %}
{% if upcoming.size > 0 %}
| Tournament | Date | Venue |
|------------|------|-------|
{% for t in upcoming %}| [{{ t.title }}]({{ t.url | relative_url }}) | {{ t.date | date: "%B %d, %Y" }} | {{ t.venue }} |
{% endfor %}
{% else %}
*No upcoming tournaments scheduled. Check back soon!*
{% endif %}

## Past Tournaments

{% assign past = site.tournaments | where_exp: "t", "t.date < site.time" | sort: "date" | reverse %}
{% if past.size > 0 %}
| Tournament | Date | Venue |
|------------|------|-------|
{% for t in past %}| [{{ t.title }}]({{ t.url | relative_url }}) | {{ t.date | date: "%B %d, %Y" }} | {{ t.venue }} |
{% endfor %}
{% else %}
*No past tournaments yet.*
{% endif %}
