# 👟 Sneakers App

![Sneakers App Banner](assets/images/banner.png)

## 🌟 Introduction

Welcome to the **Sneakers App**, a modern and user-friendly e-commerce mobile application crafted for sneaker enthusiasts! 🏀 Built with **Flutter** and the **Stacked architecture**, this app delivers a clean, scalable, and maintainable codebase. Powered by **SQLite** for local data storage, it ensures a seamless offline experience for user authentication, cart management, and order history tracking. With a sleek, responsive interface and customizable themes (light, dark, and system default), it’s the ultimate platform for sneaker shopping on both iOS and Android devices. 📱

The Sneakers App lets users explore a curated collection of sneakers, add items to their cart, place orders, and track their purchase history with user-specific order numbering. Robust user authentication ensures secure and personalized shopping, while SQLite’s local storage allows access to cart and order data even offline. The Stacked architecture separates UI, business logic, and data services, making it easy to extend with new features. Whether you're a sneakerhead or a casual shopper, this app brings style and functionality to your fingertips! 👟✨

## ✅ Requirements Fulfilled

The Sneakers App meets the following key requirements:

- **🔒 User Authentication**: Register with a unique username and password, log in securely, and log out, with data stored locally in SQLite for fast and secure access.
- **🛍️ Product Browsing**: Browse a curated list of sneakers with details like name, price, description, and images.
- **🛒 Cart Management**: Add sneakers to the cart, adjust quantities, and remove items, with data persisted per user in SQLite.
- **📦 Order Placement**: Checkout the cart to place orders, saved with total price and timestamp, linked to the user’s account.
- **📜 Order History**: View user-specific order history with numbering starting from Order #1 for each account, showing detailed order information.
- **🎨 Theme Customization**: Switch between light, dark, and system default themes for a personalized experience.
- **🌐 Offline Support**: Store all data (user accounts, cart, orders) locally in SQLite, enabling core functionality without an internet connection.
- **🛠️ Debugging Tools**: Inspect the SQLite database schema (table names and columns) via the settings screen for development and troubleshooting.

## ✨ App Features

### 🔐 User Authentication
- **Register**: Create an account with a unique username and password. 📝
- **Log In**: Securely access personalized features with your credentials. 🔑
- **Log Out**: Clear the session and return to the login screen. 🚪

### 🛍️ Sneaker Catalog
- Browse a curated list of sneakers with images, names, prices, and descriptions. 👟
- Explore all available sneakers in a dedicated "See All" view. 🔎

### 🛒 Cart Functionality
- Add sneakers to the cart with a default quantity of 1. ➕
- Increment or decrement item quantities in the cart. 🔢
- Remove items from the cart. 🗑️
- Persist cart data per user in SQLite for offline access. 💾

### 📦 Order Management
- Checkout the cart to place an order, calculating the total price. 💸
- View order history with user-specific order numbers (e.g., Order #1, Order #2 per user). 📜
- Display order details, including items, quantities, total price, and order date. 📋

### 🎨 Theme Switching
- Choose between light, dark, or system default themes. 🌗
- Save theme preferences for consistent app sessions. 💿

### 🛠️ Database Inspection
- View the SQLite database schema (table names and columns) from the settings screen for debugging. 🔍

### 📱 Responsive UI
- Clean and intuitive interface with a bottom navigation bar for easy access to Home, Shop, Cart, Order History, and Settings. 🧭
- Custom components like `ShoeTile`, `CartTile`, and `MyButton` ensure a consistent look and feel. 🎨

### 💾 Offline Data Persistence
- SQLite database stores user accounts, cart items, orders, and order items locally. 🗄️
- Foreign key constraints ensure data integrity (e.g., linking cart/orders to users). 🔗

## 📸 App Images

Below are screenshots showcasing the Sneakers App’s key screens in light and dark modes:

### Login Screen
<table>
  <tr>
    <th>lightmode</th>
    <th>darkmode</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/5219e6ec-f2d7-408b-93e0-0ac8d51eca6f" width="200" height="400" alt="Login Screen Light Mode"></td>
    <td><img src="assets/images/login_screen_dark.png" width="200" height="400" alt="Login Screen Dark Mode"></td>
  </tr>
</table>

### Shop Screen
<table>
  <tr>
    <th>lightmode</th>
    <th>darkmode</th>
  </tr>
  <tr>
    <td><img src="assets/images/shop_screen_light.png" width="200" height="400" alt="Shop Screen Light Mode"></td>
    <td><img src="assets/images/shop_screen_dark.png" width="200" height="400" alt="Shop Screen Dark Mode"></td>
  </tr>
</table>

### Cart Screen
<table>
  <tr>
    <th>lightmode</th>
    <th>darkmode</th>
  </tr>
  <tr>
    <td><img src="assets/images/cart_screen_light.png" width="200" height="400" alt="Cart Screen Light Mode"></td>
    <td><img src="assets/images/cart_screen_dark.png" width="200" height="400" alt="Cart Screen Dark Mode"></td>
  </tr>
</table>

### Order History Screen
<table>
  <tr>
    <th>lightmode</th>
    <th>darkmode</th>
  </tr>
  <tr>
    <td><img src="assets/images/order_history_screen_light.png" width="200" height="400" alt="Order History Screen Light Mode"></td>
    <td><img src="assets/images/order_history_screen_dark.png" width="200" height="400" alt="Order History Screen Dark Mode"></td>
  </tr>
</table>

### Settings Screen
<table>
  <tr>
    <th>lightmode</th>
    <th>darkmode</th>
  </tr>
  <tr>
    <td><img src="assets/images/settings_screen_light.png" width="200" height="400" alt="Settings Screen Light Mode"></td>
    <td><img src="assets/images/settings_screen_dark.png" width="200" height="400" alt="Settings Screen Dark Mode"></td>
  </tr>
</table>

## 🤝 Contribute

We’re thrilled to invite contributions to make the Sneakers App even better! 🌟 Whether you’re passionate about adding new features, enhancing the UI, optimizing performance, or fixing bugs, your input is invaluable. Here’s how you can get involved:

- **🐛 Submit Issues**: Report bugs or suggest enhancements via GitHub Issues.
- **🔧 Pull Requests**: Propose changes with clear descriptions and tests.
- **💡 Feature Ideas**: Share ideas for new features, like sneaker filters, payment integration, or advanced search.
- **📝 Code Improvements**: Help refactor code, improve documentation, or add unit tests for robustness.

Join us in making the Sneakers App the ultimate destination for sneaker shopping! 👟🚀
