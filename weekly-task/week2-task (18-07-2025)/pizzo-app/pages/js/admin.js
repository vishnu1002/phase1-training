// Render pizza data in table
const adminTableBody = document.getElementById("adminTableBody");
let itemCount = pizzas.length;

// Helper: Get pizzas from localStorage or fallback to window.pizzas
function getPizzas() {
  return (
    JSON.parse(localStorage.getItem("pizzas")) ||
    (window.pizzas ? [...window.pizzas] : [])
  );
}
// Helper: Save pizzas to localStorage
function savePizzas(pizzas) {
  localStorage.setItem("pizzas", JSON.stringify(pizzas));
}

// Helper: Get admin-added pizzas from localStorage
function getAdminPizzas() {
  return JSON.parse(localStorage.getItem("admin_pizzas")) || [];
}
// Helper: Save admin-added pizzas to localStorage
function saveAdminPizzas(pizzas) {
  localStorage.setItem("admin_pizzas", JSON.stringify(pizzas));
}
// Helper: Get all pizzas (default + admin)
function getAllPizzas() {
  return (window.pizzas ? [...window.pizzas] : []).concat(getAdminPizzas());
}

// Render pizzas (default + admin-added)
function renderAdminTable() {
  adminTableBody.innerHTML = "";
  const pizzas = getAllPizzas();
  pizzas.forEach((pizza, idx) => {
    const tr = document.createElement("tr");
    const idStr = `PIZZO-${(idx + 1).toString().padStart(2, "0")}`;
    const categoryOptions = ["Vegetarian", "Non-Vegetarian"];
    const categorySelect =
      `<select class="form-select" required>` +
      categoryOptions
        .map(
          (opt) =>
            `<option value="${opt}"${
              pizza.category === opt ? " selected" : ""
            }>${opt}</option>`
        )
        .join("") +
      "</select>";
    tr.innerHTML = `
      <td><input type="text" class="form-control" value="${idStr}" readonly required /></td>
      <td><input type="text" class="form-control" value="${
        pizza.name
      }" required /></td>
      <td><input type="number" class="form-control" value="${
        pizza.price
      }" min="0" step="0.01" required /></td>
      <td><input type="date" class="form-control" value="${
        pizza.dateOfLaunch
      }" required /></td>
      <td>${categorySelect}</td>
      <td><input type="checkbox" class="form-check-input" ${
        pizza.freeDelivery ? "checked" : ""
      } /></td>
      <td><button type="button" class="trash-btn" title="Delete"><span>&#128465;</span></button></td>
    `;
    adminTableBody.appendChild(tr);
  });
}

renderAdminTable();

// Add new item logic
const addItemBtn = document.getElementById("addItemBtn");
if (addItemBtn) {
  addItemBtn.addEventListener("click", function () {
    itemCount++;
    const idStr = `PIZZO-${itemCount.toString().padStart(2, "0")}`;
    const categoryOptions = ["Vegetarian", "Non-Vegetarian"];
    const categorySelect =
      `<select class="form-select" required>` +
      categoryOptions
        .map((opt) => `<option value="${opt}">${opt}</option>`)
        .join("") +
      "</select>";
    const tr = document.createElement("tr");
    tr.innerHTML = `
      <td><input type="text" class="form-control" value="${idStr}" readonly required /></td>
      <td><input type="text" class="form-control" value="" required /></td>
      <td><input type="number" class="form-control" value="" min="0" step="0.01" required /></td>
      <td><input type="date" class="form-control" value="" required /></td>
      <td>${categorySelect}</td>
      <td><input type="checkbox" class="form-check-input" /></td>
      <td><button type="button" class="trash-btn" title="Delete"><span>&#128465;</span></button></td>
    `;
    adminTableBody.insertBefore(tr, adminTableBody.firstChild);
    // Focus on the first input
    tr.querySelector("input:not([readonly])").focus();
    // Listen for Enter key in any input in this row
    tr.querySelectorAll("input,select").forEach((input) => {
      input.addEventListener("keydown", function (e) {
        if (e.key === "Enter") {
          e.preventDefault();
          // Gather values
          const tds = tr.querySelectorAll("td");
          const name = tds[1].querySelector("input").value.trim();
          const price = parseFloat(tds[2].querySelector("input").value);
          const dateOfLaunch = tds[3].querySelector("input").value;
          const category = tds[4].querySelector("select").value;
          const freeDelivery = tds[5].querySelector(
            'input[type="checkbox"]'
          ).checked;
          if (!name || isNaN(price) || !dateOfLaunch) {
            alert("Please fill all fields correctly.");
            return;
          }
          // Add to admin pizzas in localStorage
          const adminPizzas = getAdminPizzas();
          adminPizzas.push({
            name,
            price,
            dateOfLaunch,
            category,
            freeDelivery,
            image: "pizza1.jpg", // Default image, can be changed later
            description: "",
          });
          saveAdminPizzas(adminPizzas);
          renderAdminTable();
        }
      });
    });
  });
}

// Save button handler
// (Optional: can update localStorage with all rows if needed)
document.getElementById("adminForm").addEventListener("submit", function (e) {
  e.preventDefault();
  alert("Values updated");
});

// Logout button logic
const logoutBtn = document.getElementById("logoutBtn");
if (logoutBtn) {
  logoutBtn.addEventListener("click", function () {
    localStorage.clear();
    window.location.href = "login.html";
  });
}

if (!window.pizzas) {
  console.warn(
    "Default pizzas not found. Make sure pizzas.js is loaded before admin.js"
  );
}
