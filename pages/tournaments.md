---
layout: page
title: Tournaments
permalink: /tournaments/
---

We organise competitive tournaments throughout the year for various games. Check back here for upcoming events!

## Upcoming Tournaments

{% assign upcoming = site.tournaments | where_exp: "t", "t.date >= site.time" | sort: "date" %}
{% if upcoming.size > 0 %}
<div class="tournaments-list">
  {% for t in upcoming %}
  <div class="minimal-card">
    <div class="card-header">
      <h3><a href="{{ t.url | relative_url }}">{{ t.title }}</a></h3>
    </div>
    
    <div class="card-details">
      <div class="card-item">
        <span class="card-label">Date</span>
        <span class="card-value">{{ t.date | date: "%B %d, %Y" }}</span>
      </div>
      <div class="card-item">
        <span class="card-label">Venue</span>
        <div class="card-value">
          {{ t.venue }}
          {% if t.address %}<small>{{ t.address }}</small>{% endif %}
        </div>
      </div>
      <div class="card-item">
        <span class="card-label">Time</span>
        <span class="card-value">{{ t.time }}</span>
      </div>
    </div>

    {% if t.signup_url %}
      {% assign now_ts = site.time | date: '%s' | plus: 0 %}
      {% assign start_ts = t.reg_start | date: '%s' | plus: 0 %}
      {% assign end_ts = t.reg_end | date: '%s' | plus: 0 %}
      {% assign show_signup = false %}
      {% if t.reg_start and t.reg_end %}
        {% if now_ts >= start_ts and now_ts <= end_ts %}{% assign show_signup = true %}{% endif %}
      {% else %}
        {% assign show_signup = true %}
      {% endif %}

      {% if show_signup %}
      <div class="card-accent-footer">
        <span class="card-footer-text">Registration is currently open!</span>
        <a href="{{ t.signup_url }}" class="pagination-button pagination-active" target="_blank">Sign up now →</a>
      </div>
      {% endif %}
    {% endif %}
  </div>
  {% endfor %}
</div>
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
