---
layout: default
title: Posts
permalink: /posts/
pagination:
  enabled: true
---

<div class="page-content">
  <h1 style="margin-bottom: 30px;">Club Updates & Tournaments</h1>
  
  <div class="posts-grid">
    {% for post in paginator.posts %}
      {% include post-card.html %}
    {% endfor %}
  </div>

  <!-- Pagination links -->

{% if paginator.total_pages > 1 %}

  <div class="pagination" style="text-align: center; margin-top: 40px;">
    {% if paginator.previous_page %}
      <a href="{{ paginator.previous_page_path | relative_url }}" class="pagination-button pagination-active">← Newer Updates</a>
    {% endif %}
    
    {% if paginator.next_page %}
      <a href="{{ paginator.next_page_path | relative_url }}" class="pagination-button pagination-active">Older Updates →</a>
    {% endif %}
  </div>
  {% endif %}
</div>
