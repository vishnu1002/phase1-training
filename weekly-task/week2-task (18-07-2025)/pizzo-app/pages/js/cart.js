document.addEventListener("DOMContentLoaded", function () {
  function renderCart() {
    const cart = JSON.parse(localStorage.getItem("cart")) || [];
    const cartBody = document.getElementById("cart-body");
    const emptyMsg = document.getElementById("empty-cart-message");
    const table = cartBody.closest(".table-responsive");
    const totals = document.querySelector(".list-group.mb-4");
    const actions = document.getElementById("cart-actions");
    let subtotal = 0;

    if (cart.length === 0) {
      emptyMsg.style.display = "";
      table.style.display = "none";
      totals.style.display = "none";
      if (actions) actions.style.display = "none";
      return;
    } else {
      emptyMsg.style.display = "none";
      table.style.display = "";
      totals.style.display = "";
      if (actions) actions.style.display = "";
    }

    cartBody.innerHTML = "";
    cart.forEach((item, idx) => {
      const itemSubtotal = item.price * item.qty;
      subtotal += itemSubtotal;
      cartBody.innerHTML += `
        <tr>
          <td><img src="../assets/${item.image}" alt="${
        item.name
      }" style="width:60px;height:60px;object-fit:cover;border-radius:0.5rem;"/></td>
          <td>${item.name}</td>
          <td>$${item.price.toFixed(2)}</td>
          <td>${item.qty}</td>
          <td>$${itemSubtotal.toFixed(2)}</td>
          <td><button class="btn btn-link text-danger delete-item" data-name="${
            item.name
          }" title="Remove"><i class="fas fa-trash"></i></button></td>
        </tr>
      `;
    });
    document.getElementById("subtotal").textContent = `$${subtotal.toFixed(2)}`;
    const gst = subtotal * 0.05;
    document.getElementById("gst").textContent = `$${gst.toFixed(2)}`;
    document.getElementById("total").textContent = `$${(subtotal + gst).toFixed(
      2
    )}`;
  }

  // Initial render
  renderCart();

  // Event delegation for delete buttons
  document.getElementById("cart-body").addEventListener("click", function (e) {
    if (e.target.closest(".delete-item")) {
      const btn = e.target.closest(".delete-item");
      const name = btn.getAttribute("data-name");
      let cart = JSON.parse(localStorage.getItem("cart")) || [];
      cart = cart.filter((item) => item.name !== name);
      localStorage.setItem("cart", JSON.stringify(cart));
      renderCart();
    }
  });
});

document
  .getElementById("placeOrderBtn")
  ?.addEventListener("click", function (e) {
    // Gather cart data from the page or localStorage
    const cart = JSON.parse(localStorage.getItem("cart")) || [];
    if (!cart.length) return;

    // Calculate total and create order object
    let total = 0;
    const items = cart.map((item) => {
      const subtotal = item.price * item.qty;
      total += subtotal;
      return {
        name: item.name,
        quantity: item.qty, // FIX: use item.qty
        price: item.price,
      };
    });
    const order = {
      orderId: "ORD" + Date.now(),
      items,
      totalPrice: total,
    };

    // Save to orders in localStorage
    let orders = JSON.parse(localStorage.getItem("orders")) || [];
    orders.push(order);
    localStorage.setItem("orders", JSON.stringify(orders));

    // Optionally clear cart
    // localStorage.removeItem('cart');

    // Navigation to payment.html is handled by the anchor href
  });
