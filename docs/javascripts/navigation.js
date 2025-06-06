document.addEventListener('DOMContentLoaded', function() {
    const header = document.querySelector('.md-header__inner');
    
    // Create mobile navigation toggle button
    const mobileNavToggle = document.createElement('button');
    mobileNavToggle.className = 'mobile-nav-toggle';
    mobileNavToggle.innerHTML = '☰';
    mobileNavToggle.setAttribute('aria-label', 'Toggle navigation menu');
    
    // Insert toggle button before the title
    const titleElement = header.querySelector('.md-header__title');
    header.insertBefore(mobileNavToggle, titleElement);
    
    // Get navigation menu
    const nav = header.querySelector('.custom-nav');
    
    // Toggle navigation on button click
    mobileNavToggle.addEventListener('click', function() {
        nav.classList.toggle('show');
        mobileNavToggle.innerHTML = nav.classList.contains('show') ? '✕' : '☰';
    });
    
    // Close navigation when clicking outside
    document.addEventListener('click', function(event) {
        if (!nav.contains(event.target) && !mobileNavToggle.contains(event.target)) {
            nav.classList.remove('show');
            mobileNavToggle.innerHTML = '☰';
        }
    });
}); 