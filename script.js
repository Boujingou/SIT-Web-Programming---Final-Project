let currentGuests = 1;
let currentPrice = 0;
let currentTour = '';

// Set minimum date to today
document.getElementById('tourDate').min = new Date().toISOString().split('T')[0];

// Filter functionality
function filterTours(city) {
    const cards = document.querySelectorAll('.tour-card');
    const buttons = document.querySelectorAll('.filter-btn');
    
    // Update active button
    buttons.forEach(btn => btn.classList.remove('active'));
    event.target.classList.add('active');
    
    // Show/hide cards
    cards.forEach(card => {
        if (city === 'all' || card.dataset.city === city) {
            card.style.display = 'block';
        } else {
            card.style.display = 'none';
        }
    });
}

// Booking modal functions
function openBookingModal(tourName, city, price) {
    currentTour = tourName;
    currentPrice = price;
    currentGuests = 1;
    
    document.getElementById('tourDetails').innerHTML = `
        <strong>${tourName}</strong><br>
        <span style="color: #64748b;">${city}</span>
    `;
    document.getElementById('guestCount').textContent = currentGuests;
    updateTotalPrice();
    document.getElementById('bookingModal').classList.add('active');
}

function closeBookingModal() {
    document.getElementById('bookingModal').classList.remove('active');
}

function increaseGuests() {
    if (currentGuests < 10) {
        currentGuests++;
        document.getElementById('guestCount').textContent = currentGuests;
        updateTotalPrice();
    }
}

function decreaseGuests() {
    if (currentGuests > 1) {
        currentGuests--;
        document.getElementById('guestCount').textContent = currentGuests;
        updateTotalPrice();
    }
}

function updateTotalPrice() {
    const total = currentPrice * currentGuests;
    document.getElementById('totalPrice').textContent = total.toLocaleString();
}

function closeSuccessModal() {
    document.getElementById('successModal').classList.remove('active');
}

// Form submission
document.getElementById('bookingForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    // Generate random reservation ID
    const reservationId = '#' + Math.random().toString(36).substr(2, 9).toUpperCase();
    document.getElementById('reservationId').textContent = reservationId;
    
    // Close booking modal and show success modal
    closeBookingModal();
    document.getElementById('successModal').classList.add('active');
    
    // Reset form
    this.reset();
    document.getElementById('tourDate').min = new Date().toISOString().split('T')[0];
});

// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Close modals when clicking outside
window.addEventListener('click', function(e) {
    const bookingModal = document.getElementById('bookingModal');
    const successModal = document.getElementById('successModal');
    
    if (e.target === bookingModal) {
        closeBookingModal();
    }
    if (e.target === successModal) {
        closeSuccessModal();
    }
});

// Tour cards
async function loadTourCards() {
    const grid = document.getElementById('toursGrid');
    const response = await fetch('api/get_tours.php');
    const tours = await response.json();

    tours.forEach(tour => {
        const card = createTourCard(tour);
        grid.appendChild(card);
    });
}

function createTourCard(tour) {
    const card = document.createElement('div');
    card.className = 'tour-card';
    card.setAttribute('data-city', tour.city);

    card.innerHTML = `
        <img src="${tour.image}" alt="${tour.title}" class="tour-image">
        <div class="tour-content">
            <div class="tour-header">
                <span class="tour-city">${tour.city}</span>
                <div class="tour-rating">
                    <span class="star">★</span>
                    <span>${tour.rating}</span>
                </div>
            </div>
            <h3 class="tour-title">${tour.title}</h3>
            <p class="tour-description">${tour.description}</p>
            <div class="tour-footer">
                <div>
                    <span class="tour-price">¥${tour.price.toLocaleString()}</span>
                    <span class="price-unit">/person</span>
                </div>
                <button class="btn" onclick="openBookingModal('${tour.title}', '${tour.city}', ${tour.price})">Book Now</button>
            </div>
        </div>
    `;
    return card;
}

function loadTourCards() {
    const grid = document.getElementById('toursGrid');
    tours.forEach(tour => {
        const card = createTourCard(tour);
        grid.appendChild(card);
    });
}

window.addEventListener('DOMContentLoaded', loadTourCards);