---
layout: default
title: Posts
permalink: /posts/
pagination:
  enabled: true
---

<div class="page-content">
  <h1 style="margin-bottom: 40px;">Club Updates & Tournaments</h1>
  
  {% for post in paginator.posts %}
    {% include featured-post.html %}
  {% endfor %}

  <!-- Pagination links -->

{% if paginator.total_pages > 1 %}

  <div class="pagination" style="text-align: center; margin-top: 40px;">
    {% if paginator.previous_page %}
      <a href="{{ paginator.previous_page_path | relative_url }}" class="pagination-button pagination-active">&laquo; Newer</a>
    {% endif %}
    
    {% if paginator.next_page %}
      <a href="{{ paginator.next_page_path | relative_url }}" class="pagination-button pagination-active">Older &raquo;</a>
    {% endif %}
  </div>
  {% endif %}
</div>
