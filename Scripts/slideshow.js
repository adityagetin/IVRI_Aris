document.addEventListener("DOMContentLoaded", function () {
    const slideshowContainer = document.querySelector(".slideshow");
    const imageFolder = "Slideimage/";

    // Array of image filenames
   document.addEventListener("DOMContentLoaded", function () {
    const slideshowContainer = document.querySelector(".slideshow");
    const imageFolder = "slideimage/";

    // Array of image filenames
       const imageFilenames = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"];

    let currentImageIndex = 0;

    function loadImages() {
        imageFilenames.forEach(filename => {
            const img = new Image();
            img.src = imageFolder + filename;
            img.alt = "Slideshow Image";
            img.style.opacity = "0"; // Hide all images initially
            slideshowContainer.appendChild(img);
        });

        // Display the first image
        showImage(currentImageIndex);
    }

    function showImage(index) {
        // Hide all images
        const images = slideshowContainer.querySelectorAll("img");
        images.forEach(img => {
            img.style.opacity = "0";
        });

        // Display the specified image
        images[index].style.opacity = "1";

        // Increment the image index
        currentImageIndex = (currentImageIndex + 1) % imageFilenames.length;

        // Schedule the next image to be shown after a certain delay
        setTimeout(function () {
            showImage(currentImageIndex);
        }, 2000); // 2000 milliseconds (2 seconds) delay
    }

    // Load images when the page loads
    window.addEventListener("load", loadImages);
});


    let currentImageIndex = 0;

    function loadImages() {
        imageFilenames.forEach(filename => {
            const img = new Image();
            img.src = imageFolder + filename;
            img.alt = "Slideshow Image";
            img.style.opacity = "0"; // Hide all images initially
            slideshowContainer.appendChild(img);
        });

        // Display the first image
        showImage(currentImageIndex);
    }

    function showImage(index) {
        // Hide all images
        const images = slideshowContainer.querySelectorAll("img");
        images.forEach(img => {
            img.style.opacity = "0";
        });

        // Display the specified image
        images[index].style.opacity = "1";

        // Increment the image index
        currentImageIndex = (currentImageIndex + 1) % imageFilenames.length;

        // Schedule the next image to be shown after a certain delay
        setTimeout(function () {
            showImage(currentImageIndex);
        }, 2000); // 2000 milliseconds (2 seconds) delay
    }

    // Load images when the page loads
    window.addEventListener("load", loadImages);
});
