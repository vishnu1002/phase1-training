document
  .getElementById("registerForm")
  .addEventListener("submit", function (e) {
    e.preventDefault();
    const name = document.getElementById("name").value.trim();
    const address = document.getElementById("address").value.trim();
    const contact = document.getElementById("contact").value.trim();
    const errorDiv = document.getElementById("registerError");
    errorDiv.style.display = "none";
    errorDiv.textContent = "";
    // Validation
    if (!name || !address || !contact) {
      errorDiv.textContent = "All fields are required.";
      errorDiv.style.display = "block";
      return;
    }
    if (!/^\d{10}$/.test(contact)) {
      errorDiv.textContent = "Contact number must be 10 digits.";
      errorDiv.style.display = "block";
      return;
    }
    // Registration successful, navigate to menu
    window.location.href = "menu.html";
  });
