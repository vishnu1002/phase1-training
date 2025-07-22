document.getElementById("loginForm").addEventListener("submit", function (e) {
  e.preventDefault();
  const username = document.getElementById("username").value.trim();
  const password = document.getElementById("password").value;
  const errorDiv = document.getElementById("loginError");
  errorDiv.style.display = "none";
  errorDiv.textContent = "";
  // Validation
  if (!username || !password) {
    errorDiv.textContent = "Username and password are required.";
    errorDiv.style.display = "block";
    return;
  }
  if (password.length < 8) {
    errorDiv.textContent = "Password must be at least 8 characters.";
    errorDiv.style.display = "block";
    return;
  }
  if (!/[A-Z]/.test(password)) {
    errorDiv.textContent =
      "Password must contain at least one uppercase letter.";
    errorDiv.style.display = "block";
    return;
  }
  if (!/[0-9]/.test(password)) {
    errorDiv.textContent = "Password must contain at least one number.";
    errorDiv.style.display = "block";
    return;
  }
  if (!/[^A-Za-z0-9]/.test(password)) {
    errorDiv.textContent =
      "Password must contain at least one special character.";
    errorDiv.style.display = "block";
    return;
  }
  // Navigation
  if (username === "admin") {
    // Demo: store login in localStorage
    localStorage.setItem("pizzo_username", username);
    localStorage.setItem("pizzo_password", password);
    window.location.href = "admin.html";
  } else {
    localStorage.setItem("pizzo_username", username);
    localStorage.setItem("pizzo_password", password);
    window.location.href = "menu.html";
  }
});
