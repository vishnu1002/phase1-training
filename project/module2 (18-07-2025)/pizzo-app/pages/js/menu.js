// Helper: Get pizzas from localStorage or fallback to window.pizzas
function getPizzas() {
  return (
    JSON.parse(localStorage.getItem("pizzas")) ||
    (window.pizzas ? [...window.pizzas] : [])
  );
}

// Helper: Get admin-added pizzas from localStorage
function getAdminPizzas() {
  return JSON.parse(localStorage.getItem("admin_pizzas")) || [];
}
// Helper: Get all pizzas (default + admin)
function getAllPizzas() {
  return (window.pizzas ? [...window.pizzas] : []).concat(getAdminPizzas());
}

if (!window.pizzas) {
  console.warn(
    "Default pizzas not found. Make sure pizzas.js is loaded before menu.js"
  );
}

const pizzaList = document.getElementById("pizza-list");
const pizzasToShow = getAllPizzas();
pizzasToShow.forEach((pizza) => {
  const col = document.createElement("div");
  col.className = "col-sm-6 col-md-4 col-lg-3";
  col.innerHTML = `
    <div class="card h-100">
      <img src="${
        pizza.image.startsWith("http")
          ? pizza.image
          : "../assets/" + pizza.image
      }" class="card-img-top" alt="${pizza.name} Pizza" />
      <div class="card-body d-flex flex-column shadow-lg">
        <h5 class="card-title">${pizza.name}</h5>
        <p class="mb-1"> $${pizza.price.toFixed(2)}</p>
        <p class="mb-1"> ${pizza.category}</p>
        ${
          pizza.freeDelivery
            ? '<span class="mb-2 d-block" style="color: #28a745; font-weight: 500;">Delivered Free</span>'
            : '<span class="mb-2 d-block" style="color: #dc3545; font-weight: 500;">Delivery Fee Applies</span>'
        }
        <button class="btn btn-warning mt-auto add-to-cart">Add to Cart</button>
      </div>
    </div>
  `;
  pizzaList.appendChild(col);
});

// Toast logic using Bootstrap 5 toast
const liveToast = document.getElementById("liveToast");
const toast = new bootstrap.Toast(liveToast);
document.addEventListener("click", function (e) {
  if (e.target && e.target.classList.contains("add-to-cart")) {
    // Find the pizza index from the DOM
    const card = e.target.closest(".card");
    const pizzaName = card.querySelector(".card-title").textContent;
    const pizza = pizzasToShow.find((p) => p.name === pizzaName);
    if (pizza) {
      let cart = JSON.parse(localStorage.getItem("cart")) || [];
      const existing = cart.find((item) => item.name === pizza.name);
      if (existing) {
        existing.qty += 1;
      } else {
        cart.push({
          name: pizza.name,
          price: pizza.price,
          image: pizza.image.replace("../assets/", ""),
          qty: 1,
        });
      }
      localStorage.setItem("cart", JSON.stringify(cart));
    }
    toast.show();
  }
});
// Logout button logic
const logoutBtn = document.getElementById("logoutBtn");
if (logoutBtn) {
  logoutBtn.addEventListener("click", function () {
    localStorage.removeItem("pizzo_username");
    localStorage.removeItem("pizzo_password");
    location.reload();
  });
}
