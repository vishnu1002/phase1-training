document.getElementById("paymentForm").addEventListener("submit", function (e) {
  e.preventDefault();
  // Remove previous error
  let errorDiv = document.getElementById("paymentError");
  if (errorDiv) errorDiv.remove();

  const cardNumber = document
    .getElementById("cardNumber")
    .value.replace(/\s+/g, "");
  const expiry = document.getElementById("expiry").value;
  const cvv = document.getElementById("cvv").value;

  // Card number: 16 digits
  if (!/^\d{16}$/.test(cardNumber)) {
    showError("Card number must be 16 digits.");
    return;
  }
  // Expiry: not in the past
  if (!expiry) {
    showError("Expiry date is required.");
    return;
  }
  const [expYear, expMonth] = expiry.split("-").map(Number);
  const now = new Date();
  if (
    expYear < now.getFullYear() ||
    (expYear === now.getFullYear() && expMonth < now.getMonth() + 1)
  ) {
    showError("Expiry date cannot be in the past.");
    return;
  }
  // CVV: 3 digits
  if (!/^\d{3}$/.test(cvv)) {
    showError("CVV must be 3 digits.");
    return;
  }
  // Simulate payment processing
  setTimeout(function () {
    document.getElementById("paymentSuccess").style.display = "block";
    setTimeout(function () {
      window.location.href = "order-success.html";
    }, 1500);
  }, 800);
});

function showError(msg) {
  let errorDiv = document.createElement("div");
  errorDiv.id = "paymentError";
  errorDiv.style.color = "red";
  errorDiv.style.marginTop = "10px";
  errorDiv.textContent = msg;
  document.querySelector(".payment-container").prepend(errorDiv);
}
