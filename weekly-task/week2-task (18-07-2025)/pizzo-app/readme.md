Here’s a clean, structured `README.md` that you can feed into Cursor AI (or similar tools) to generate your static pizza app — no confusion, just clear specs:

---

# 🍕 PizzaPlace — Static Pizza Ordering App

## 📄 Project Overview

Build a simple, responsive, static website using HTML, CSS, JS, and Bootstrap 5 with multiple pages:

- **Customer-facing**: browse menu, add to cart (UI only), view cart, order success.
- **Admin-facing**: simple form interface to edit pizza item fields (all static/no backend).

---

## 📁 Project Structure

```
/project-root
│ index.html
│ menu.html
│ cart.html
│ order-success.html
│ admin.html
│ /css
│   └ style.css       # Optional custom styles
│ /js
│   └ app.js          # Shared JS for UI interactions
```

---

## 🎯 Pages & Features

### 1. `index.html`

- Header with logo/site name.
- Bootstrap navbar linking: Home, Menu, Cart, Admin.
- Simple hero section or welcome message.
- Footer with copyright.

### 2. `menu.html`

- Page title: “Pizza Menu”.
- Bootstrap responsive grid (`.row` / `.col-sm-6`, `.col-md-4`, `.col-lg-3`).
- Card per pizza:

  - Image, Name, Price.
  - “Add to Cart” button (UI-only; event listener).

- “View Cart” button linking to `cart.html`.

### 3. `cart.html`

- Header/navbar and footer consistent with other pages.
- Display a few pizzas in a cart list:

  - Image, Name, Price, Quantity (fixed/static).

- Total bill (calculated by JS).
- “Checkout” button → links to `order-success.html`.

### 4. `order-success.html`

- Minimal page saying: “Thank you! Your order is confirmed.”
- Could show a static order summary.
- Button/link back to “Menu” (`menu.html`).

### 5. `admin.html`

- Header/navbar/footer.
- Form or table listing pizza items (static hard-coded rows).
- Columns:

  - Item ID (read-only or disabled)
  - Name (text input)
  - Price (number input)
  - Launch Date (date input)
  - Category (select or text input)
  - Free Delivery (checkbox)

- “Save” button at bottom — UI-only (triggers JavaScript alert like “Values saved (not really)”).
- No actual data persistence.

---

## ✨ Shared Components

- **Header** (in all pages):

  ```html
  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.html">PizzaPlace</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="menu.html">Menu</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="cart.html">Cart</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="admin.html">Admin</a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  ```

- **Footer** (in all pages):

  ```html
  <footer class="text-center py-3">
    <p>&copy; 2025 PizzaPlace. All rights reserved.</p>
  </footer>
  ```

---

## 🛠 Styling & Responsiveness

- Use Bootstrap 5 via CDN.
- Use custom `style.css` only for overrides (e.g., footer spacing).
- Use responsive grid classes for `.col-*`.
- Navbar collapses automatically for mobile (use `.navbar-expand-lg`).

---

## ⚙️ JavaScript (`app.js`)

- **Add to Cart** buttons:

  - Use `document.querySelectorAll` → add `click` listener.
  - Simulate adding to an in-memory cart array.
  - Optionally update a cart badge.

- **`cart.html`**:

  - On page load, read simulated cart.
  - Render each pizza row and compute total price.

- **Form submission (in `admin.html`)**:

  - Bind a `submit` event → `alert('Saved (not really)')`.
  - Prevent default submission (use `event.preventDefault()`).

- Keep all JS in `app.js`. Link it in all HTML files at the bottom of `<body>`.

---

## 🗂 File Summary

| File                 | Purpose                                     |
| -------------------- | ------------------------------------------- |
| `index.html`         | Home page with navbar and footer            |
| `menu.html`          | Pizza browsing UI with add-to-cart buttons  |
| `cart.html`          | Cart view with items, total, and checkout   |
| `order-success.html` | Order confirmation                          |
| `admin.html`         | Admin form for editing pizza data (UI only) |
| `css/style.css`      | Optional custom styles                      |
| `js/app.js`          | Shared JS for UI logic                      |

---

## 🧩 Usage Flow

1. User lands on `index.html`, navigates to Menu.
2. On `menu.html`, clicking “Add to Cart” simulates adding items.
3. On `cart.html`, user sees cart summary and total.
4. Clicking “Checkout” takes user to `order-success.html`.
5. Admin visits `admin.html`, edits fields, clicks “Save” – sees alert.

---

This `README.md` defines a clear, static site spec with UI behaviors, folder layout, and no backend confusion — perfect input for Cursor AI to generate accurate code with no ambiguity.
