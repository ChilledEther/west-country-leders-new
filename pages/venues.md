---
layout: page
title: Venues
category: venues
permalink: /venues
---

Alongside our more spontaneous events, we also organise a number of regular board game meet ups at specific venues. If you would like to come along to any of them, please let us know via Discord or email!

<!-- Grid of Cards (Click trigger) -->
<div class="events-grid">
  {% for venue in site.data.venues %}
  <div class="event-card-wrapper" onclick="openVenueModal('venue-modal-{{ forloop.index }}')">
    <div class="event-card" style="cursor: pointer;">
      <div class="card-header-badge" style="background-color: {{ venue.badge_style | default: 'orange' }};">
        {{ venue.badge }}
      </div>
      <div class="card-content">
        <div class="event-title">{{ venue.title }}</div>
        <div class="event-location">
          <i class="fa-solid fa-calendar-days"></i> {{ venue.frequency }}
        </div>
        <div class="stat-block">
            <div class="stat-box">
              <span class="stat-label">Time</span>
              <span class="stat-value">{{ venue.time }}</span>
            </div>
            <div class="stat-box">
              <span class="stat-label">Price</span>
              <span class="stat-value">{{ venue.price }}</span>
            </div>
        </div>
      </div>
    </div>
  </div>
  {% endfor %}
</div>

<!-- Modal Structures (Hidden by default) -->
{% for venue in site.data.venues %}
<div id="venue-modal-{{ forloop.index }}" class="venue-modal-overlay" onclick="closeVenueModal(event, 'venue-modal-{{ forloop.index }}')">
  <div class="venue-modal-content">
    <button class="venue-modal-close" onclick="closeVenueModal(event, 'venue-modal-{{ forloop.index }}')">&times;</button>
    
    <div class="venue-modal-header">
      <h2>{{ venue.title }}</h2>
      <div class="venue-modal-badges">
        <span class="venue-badge" style="background-color: {{ venue.badge_style | default: 'orange' }}">{{ venue.badge }}</span>
      </div>
    </div>

    <div class="venue-modal-body">
      {% if venue.image %}
      <img src="{{ venue.image | relative_url }}" alt="{{ venue.title }}" class="venue-modal-image">
      {% endif %}
      
      <div class="venue-details">
        <p class="venue-description">{{ venue.description }}</p>
        
        <div class="venue-info-grid">
           <div class="venue-info-item">
             <i class="fa-solid fa-location-dot"></i>
             <strong>Address:</strong> {{ venue.address }}
           </div>
           <div class="venue-info-item">
             <i class="fa-solid fa-clock"></i>
             <strong>Time:</strong> {{ venue.time }}
           </div>
           <div class="venue-info-item">
             <i class="fa-solid fa-calendar-days"></i>
             <strong>Frequency:</strong> {{ venue.frequency }}
           </div>
           <div class="venue-info-item">
             <i class="fa-solid fa-coins"></i>
             <strong>Price:</strong> {{ venue.price }}
           </div>
        </div>

        {% if venue.map_iframe and venue.map_iframe != "" %}
        <div class="venue-map-container">
          {{ venue.map_iframe }}
        </div>
        {% endif %}
      </div>
    </div>
  </div>
</div>
{% endfor %}

<style>
/* Modal Styles */
.venue-map-container {
  margin-top: 25px;
  width: 100%;
  height: 350px;
  border-radius: 8px;
  overflow: hidden;
  background: transparent !important;
  box-shadow: none !important;
  border: none !important;
  display: flex;
}

.venue-map-container iframe {
  width: 100% !important;
  height: 100% !important;
  display: block;
  border: none;
  margin: 0 !important;
  box-shadow: none !important;
  border-radius: 8px !important;
  max-width: none !important;
  filter: sepia(20%); 
}
.venue-modal-overlay {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(44, 62, 80, 0.85); /* Dark dim */
  z-index: 9999;
  overflow-y: auto; /* Allow scrolling on small screens */
  padding: 20px;
  box-sizing: border-box;
  backdrop-filter: blur(5px);
  animation: fadeIn 0.2s ease-out;
}

.venue-modal-content {
  background: #fcf8f3; /* Parchment base */
  border: 4px solid #6e4c2f;
  border-radius: 8px;
  max-width: 800px;
  margin: 40px auto;
  position: relative;
  box-shadow: 0 20px 50px rgba(0,0,0,0.5);
  animation: slideUp 0.3s ease-out;
}

.venue-modal-close {
  position: absolute;
  top: 10px;
  right: 15px;
  background: none;
  border: none;
  font-size: 2rem;
  color: #6e4c2f;
  cursor: pointer;
  z-index: 10;
  line-height: 1;
}

.venue-modal-header {
  background: #e8dcc5;
  padding: 20px 30px;
  border-bottom: 2px solid #6e4c2f;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 15px;
}

.venue-modal-header h2 {
  margin: 0;
  font-family: "Inter", sans-serif; /* Using base font instead of undefined serif */
  font-weight: 800;
  color: #4d2d18;
  font-size: 1.8rem;
}

.venue-badge {
  color: white;
  padding: 5px 12px;
  border-radius: 4px;
  font-weight: bold;
  text-transform: uppercase;
  font-size: 0.8rem;
  box-shadow: 1px 1px 0 rgba(0,0,0,0.2);
}

.venue-modal-body {
  padding: 30px;
}

.venue-modal-image {
  width: 100%;
  max-height: 300px;
  object-fit: cover;
  border-radius: 6px;
  border: 2px solid #d4a76a;
  margin-bottom: 25px;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.venue-description {
  font-size: 1.1rem;
  line-height: 1.6;
  margin-bottom: 25px;
  color: #333;
}

.venue-info-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 15px;
  background: rgba(212, 167, 106, 0.15);
  padding: 20px;
  border-radius: 8px;
  border: 1px dashed #d4a76a;
}

.venue-info-item i {
  color: #d4a76a;
  margin-right: 8px;
  width: 20px;
  text-align: center;
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes slideUp {
  from { transform: translateY(20px); opacity: 0; }
  to { transform: translateY(0); opacity: 1; }
}

@media (max-width: 600px) {
  .venue-modal-content {
    margin: 10px auto;
  }
  .venue-modal-body {
    padding: 20px;
  }
  .venue-modal-header h2 {
    font-size: 1.4rem;
  }
}
</style>

<script>
function openVenueModal(modalId) {
  document.getElementById(modalId).style.display = 'block';
  document.body.style.overflow = 'hidden'; // Prevent background scrolling
}

function closeVenueModal(event, modalId) {
  // Close if clicked content close button OR clicked the overlay background
  if (event.target.classList.contains('venue-modal-overlay') || 
      event.target.classList.contains('venue-modal-close')) {
    document.getElementById(modalId).style.display = 'none';
    document.body.style.overflow = 'auto'; // Restore scrolling
  }
}

// Close on Escape key
document.addEventListener('keydown', function(event) {
  if (event.key === "Escape") {
    const modals = document.querySelectorAll('.venue-modal-overlay');
    modals.forEach(modal => {
      modal.style.display = 'none';
    });
    document.body.style.overflow = 'auto';
  }
});
</script>
