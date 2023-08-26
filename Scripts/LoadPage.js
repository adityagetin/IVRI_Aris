const profileImage = document.querySelector(".profile-image");
const profileCard = document.querySelector(".profile-card");

// Function to load content from external HTML file
function loadPageContent(pageUrl) {
    fetch(pageUrl)
        .then(response => response.text())
        .then(content => {
            mainContent.innerHTML = content;
        })
        .catch(error => {
            console.error("Error loading content:", error);
        });
}

// Toggle profile card visibility when profile image is clicked
profileImage.addEventListener("click", () => {
    profileCard.classList.toggle("show");
});

// Close profile card when clicking outside
document.addEventListener("click", event => {
    if (!profileImage.contains(event.target) && !profileCard.contains(event.target)) {
        profileCard.classList.remove("show");
    }
});
 function loadPage(pageUrl) {
        var iframe = document.getElementById('contentFrame');
    iframe.src = pageUrl;
    }