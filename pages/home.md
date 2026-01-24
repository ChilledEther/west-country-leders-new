---
layout: default
title: West Country Leders
permalink: /
pagination:
  enabled: true
---

{% include next-gathering.html %}
{% include featured-tournament.html %}

<div class="page-content">
  <h1 style="margin-bottom: 30px;">Club Updates</h1>
  
  <div id="posts-grid" class="posts-grid">
    {% for post in paginator.posts %}
      {% include post-card.html %}
    {% endfor %}
  </div>

  <div id="infinite-scroll-status" style="text-align: center; margin-top: 40px; display: none;">
    <div class="pagination-button" style="cursor: default; opacity: 0.7;">
      <i class="fa fa-spinner fa-spin"></i> Loading more updates...
    </div>
  </div>

  <!-- Traditional Pagination Fallback -->
  <div id="pagination-fallback" class="pagination" style="text-align: center; margin-top: 40px;">
    {% if paginator.previous_page %}
      <a href="{{ paginator.previous_page_path | relative_url }}" class="pagination-button pagination-active">← Newer Updates</a>
    {% endif %}
    
    {% if paginator.next_page %}
      <a id="next-page-link" href="{{ paginator.next_page_path | relative_url }}" class="pagination-button pagination-active">Older Updates →</a>
    {% endif %}
  </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
  var nextPageUrl = document.getElementById('next-page-link') ? document.getElementById('next-page-link').getAttribute('href') : null;
  var grid = document.getElementById('posts-grid');
  var status = document.getElementById('infinite-scroll-status');
  var fallback = document.getElementById('pagination-fallback');
  var loading = false;

  if (!nextPageUrl) return;

  // Hide traditional pagination if we're going to use infinite scroll
  fallback.style.display = 'none';

  window.addEventListener('scroll', function() {
    if (loading || !nextPageUrl) return;

    // Check if we're near the bottom of the page
    if (window.innerHeight + window.scrollY >= document.documentElement.offsetHeight - 800) {
      loadMore();
    }
  });

  function loadMore() {
    loading = true;
    status.style.display = 'block';

    fetch(nextPageUrl)
      .then(response => response.text())
      .then(data => {
        var parser = new DOMParser();
        var doc = parser.parseFromString(data, 'text/html');
        var newPosts = doc.querySelectorAll('#posts-grid .post-card');
        
        // Append new posts to the current grid
        newPosts.forEach(function(post) {
          grid.appendChild(post);
        });

        // Search for the next page link in the fetched document
        var nextLink = doc.getElementById('next-page-link');
        nextPageUrl = nextLink ? nextLink.getAttribute('href') : null;

        loading = false;
        status.style.display = 'none';
        
        if (!nextPageUrl) {
          // No more posts to load
          status.innerHTML = '<div class="pagination-button" style="cursor: default; opacity: 0.5;">No more updates to show</div>';
          status.style.display = 'block';
        }
      })
      .catch(err => {
        console.error('Error loading posts:', err);
        loading = false;
        status.style.display = 'none';
        fallback.style.display = 'block'; // Show fallback on error
      });
  }
});
</script>
