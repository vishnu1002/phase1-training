// Dummy: get orders from localStorage (should be set after order placement)
// Example structure: [{orderId, items: [{name, quantity, price}], totalPrice}]
function getOrders() {
  // For demo, use a sample if none in storage
  let orders = JSON.parse(localStorage.getItem("orders"));
  if (!orders) {
    orders = [
      {
        orderId: "ORD001",
        items: [
          { name: "Margherita", quantity: 2, price: 200 },
          { name: "Pepperoni", quantity: 1, price: 250 },
        ],
        totalPrice: 650,
      },
    ];
  }
  return orders;
}

function renderOrders() {
  const orders = getOrders();
  const tbody = document.querySelector("#ordersTable tbody");
  tbody.innerHTML = "";
  let grandTotal = 0;
  orders.forEach((order) => {
    // Calculate total for this order from items
    let orderTotal = 0;
    order.items.forEach((item) => {
      // Ensure price and quantity are numbers
      const price = Number(item.price) || 0;
      const quantity = Number(item.quantity) || 0;
      orderTotal += price * quantity;
    });
    const orderGST = orderTotal * 0.05;
    const orderTotalWithGST = orderTotal + orderGST;
    grandTotal += orderTotalWithGST;
    order.items.forEach((item, idx) => {
      const tr = document.createElement("tr");
      if (idx === 0) {
        const tdOrderId = document.createElement("td");
        tdOrderId.rowSpan = order.items.length;
        tdOrderId.textContent = order.orderId;
        tr.appendChild(tdOrderId);
      }
      const tdName = document.createElement("td");
      tdName.textContent = item.name;
      const tdQty = document.createElement("td");
      tdQty.textContent = Number(item.quantity) || 0;
      const tdPrice = document.createElement("td");
      tdPrice.textContent = Number(item.price) || 0;
      const tdTotal = document.createElement("td");
      if (idx === 0) {
        tdTotal.rowSpan = order.items.length;
        tdTotal.textContent = `$${orderTotalWithGST.toFixed(2)}`;
        tr.appendChild(tdName);
        tr.appendChild(tdQty);
        tr.appendChild(tdPrice);
        tr.appendChild(tdTotal);
      } else {
        tr.appendChild(tdName);
        tr.appendChild(tdQty);
        tr.appendChild(tdPrice);
      }
      tbody.appendChild(tr);
    });
  });
  // Display total sum and GST
  const totalElem = document.getElementById("ordersTotal");
  const gstElem = document.getElementById("ordersGST");
  if (totalElem && gstElem) {
    totalElem.textContent = `$${grandTotal.toFixed(2)}`;
    gstElem.textContent = `$${((grandTotal * 0.05) / 1.05).toFixed(2)}`;
  }
}

document.addEventListener("DOMContentLoaded", renderOrders);
