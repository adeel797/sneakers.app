# 👟 Sneakers App

## 🌟 Introduction

<div style="text-align: justify">
Welcome to the <b>Sneakers App</b>, a modern and user-friendly e-commerce mobile application crafted for sneaker enthusiasts! 🏀 Built with <b>Flutter</b> and the <b>Stacked architecture</b>, this app delivers a clean, scalable, and maintainable codebase. Powered by <b>SQLite</b> for local data storage, it ensures a seamless offline experience for user authentication, cart management, and order history tracking. With a sleek, responsive interface and customizable themes (light, dark, and system default), it’s the ultimate platform for sneaker shopping on both iOS and Android devices. 📱
<br><br>
The Sneakers App lets users explore a curated collection of sneakers, add items to their cart, place orders, and track their purchase history with user-specific order numbering. Robust user authentication ensures secure and personalized shopping, while SQLite’s local storage allows access to cart and order data even offline. The Stacked architecture separates UI, business logic, and data services, making it easy to extend with new features. Whether you're a sneakerhead or a casual shopper, this app brings style and functionality to your fingertips! 👟✨
</div>

## ✅ Requirements Fulfilled

<div style="text-align: justify">
The Sneakers App meets the following key requirements:

- <b>🔒 User Authentication</b>: Register with a unique username and password, log in securely, and log out, with data stored locally in SQLite for fast and secure access.
- <b>🛍️ Product Browsing</b>: Browse a curated list of sneakers with details like name, price, description, and images.
- <b>🛒 Cart Management</b>: Add sneakers to the cart, adjust quantities, and remove items, with data persisted per user in SQLite.
- <b>📦 Order Placement</b>: Checkout the cart to place orders, saved with total price and timestamp, linked to the user’s account.
- <b>📜 Order History</b>: View user-specific order history with numbering starting from Order #1 for each account, showing detailed order information.
- <b>🎨 Theme Customization</b>: Switch between light, dark, and system default themes for a personalized experience.
- <b>🌐 Offline Support</b>: Store all data (user accounts, cart, orders) locally in SQLite, enabling core functionality without an internet connection.
- <b>🛠️ Debugging Tools</b>: Inspect the SQLite database schema (table names and columns) via the settings screen for development and troubleshooting.
</div>

## ✨ App Features

### 🔐 User Authentication
<div style="text-align: justify">
- <b>Register</b>: Create an account with a unique username and password. 📝
- <b>Log In</b>: Securely access personalized features with your credentials. 🔑
- <b>Log Out</b>: Clear the session and return to the login screen. 🚪
</div>

### 🛍️ Sneaker Catalog
<div style="text-align: justify">
- Browse a curated list of sneakers with images, names, prices, and descriptions. 👟
- Explore all available sneakers in a dedicated "See All" view. 🔎
</div>

### 🛒 Cart Functionality
<div style="text-align: justify">
- Add sneakers to the cart with a default quantity of 1. ➕
- Increment or decrement item quantities in the cart. 🔢
- Remove items from the cart. 🗑️
- Persist cart data per user in SQLite for offline access. 💾
</div>

### 📦 Order Management
<div style="text-align: justify">
- Checkout the cart to place an order, calculating the total price. 💸
- View order history with user-specific order numbers (e.g., Order #1, Order #2 per user). 📜
- Display order details, including items, quantities, total price, and order date. 📋
</div>

### 🎨 Theme Switching
<div style="text-align: justify">
- Choose between light, dark, or system default themes. 🌗
- Save theme preferences for consistent app sessions. 💿
</div>

### 🛠️ Database Inspection
<div style="text-align: justify">
- View the SQLite database schema (table names and columns) from the settings screen for debugging. 🔍
</div>

### 📱 Responsive UI
<div style="text-align: justify">
- Clean and intuitive interface with a bottom navigation bar for easy access to Home, Shop, Cart, Order History, and Settings. 🧭
- Custom components like <code>ShoeTile</code>, <code>CartTile</code>, and <code>MyButton</code> ensure a consistent look and feel. 🎨
</div>

### 💾 Offline Data Persistence
<div style="text-align: justify">
- SQLite database stores user accounts, cart items, orders, and order items locally. 🗄️
- Foreign key constraints ensure data integrity (e.g., linking cart/orders to users). 🔗
</div>

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
    <td><img src="https://github.com/user-attachments/assets/38a0eb20-9455-44fc-afe9-c2f9280603e0" width="200" height="400" alt="Login Screen Dark Mode"></td>
  </tr>
</table>

### Home Screen
<table>
  <tr>
    <th>lightmode</th>
    <th>darkmode</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/a77cf638-632b-4eea-9561-af1aad01c019" width="200" height="400" alt="Home Screen Light Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/ae130aac-8d06-4e16-94c3-718ccdd9d88f" width="200" height="400" alt="Home Screen Dark Mode"></td>
  </tr>
</table>

### Cart Screen
<table>
  <tr>
    <th>lightmode</th>
    <th>darkmode</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/2e35e89e-a343-4748-956f-750ebd920883" width="200" height="400" alt="Cart Screen Light Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/e305c72b-6adb-4701-993e-383c82adfde9" width="200" height="400" alt="Cart Screen Dark Mode"></td>
  </tr>
</table>

### Order History Screen
<table>
  <tr>
    <th>lightmode</th>
    <th>darkmode</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/0ea2c841-0278-4366-8b13-48b1780f213f" width="200" height="400" alt="Order History Screen Light Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/dfb79a50-84dc-4948-9199-f999c0c13a01" width="200" height="400" alt="Order History Screen Dark Mode"></td>
  </tr>
</table>

### Settings Screen
<table>
  <tr>
    <th>lightmode</th>
    <th>darkmode</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/5f5dc41d-0cd4-4185-8339-898838b67867" width="200" height="400" alt="Settings Screen Light Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/b2e30b2a-2769-4d19-863d-0a871231ee8d" width="200" height="400" alt="Settings Screen Dark Mode"></td>
  </tr>
</table>

## 📲 Download the App

<div style="text-align: justify">
The The Sneakers App and its code are open source, allowing anyone to contribute, update, and share it on GitHub or create their own releases. Developed for educational purposes, I hope you enjoy learning about Flutter, Stacked architecture, and SQLite integration through this project! Download the app for Android to explore it in a development environment from our <a href="https://drive.google.com/file/d/1qQhtyxlw81PGwA4v9KAtie01Ezzr3Ycj/view?usp=drive_link">Download Link</a>. 📱👟
</div>

## 🤝 Contribute

<div style="text-align: justify">
We’re thrilled to invite contributions to make the Sneakers App even better! 🌟 Whether you’re passionate about adding new features, enhancing the UI, optimizing performance, or fixing bugs, your input is invaluable. Here’s how you can get involved:

- <b>🐛 Submit Issues</b>: Report bugs or suggest enhancements via GitHub Issues.
- <b>🔧 Pull Requests</b>: Propose changes with clear descriptions and tests.
- <b>💡 Feature Ideas</b>: Share ideas for new features, like sneaker filters, payment integration, or advanced search.
- <b>📝 Code Improvements</b>: Help refactor code, improve documentation, or add unit tests for robustness.
<br><br>
Join us in making the Sneakers App the ultimate destination for sneaker shopping! 👟🚀
</div>
