# 📁 E-Commerce App

A Flutter e-commerce client with customer authentication, a product catalog, and a shopping cart.

## Overview

This Flutter app is a client for an e-commerce REST API (`ecommerceflutter2.runasp.net`). Customers can create an account, log in, browse the product catalog, and add or remove products from their cart.

## Features

- Customer sign-up and login with form validation
- Product catalog: grid of products with image, name, description, price, category, and stock quantity
- Add-to-cart / remove-from-cart per product, with the in-cart state reflected on the button
- Cart state managed with Provider (`ChangeNotifier`)

## Tech Stack

- Flutter / Dart (SDK `^3.9.2`)
- [dio](https://pub.dev/packages/dio) — HTTP client
- [provider](https://pub.dev/packages/provider) — state management
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) `^1.0.8`

## Getting Started

### Prerequisites

- Flutter SDK (3.9.x or compatible)
- Access to the e-commerce backend at `ecommerceflutter2.runasp.net`

### Run

```bash
flutter pub get
flutter run
```

## Notes

- The app is in an early stage: authentication, product listing, and cart add/remove are implemented. There is no cart screen, checkout, product-details page, or order flow yet.
- The repository name (`ecommerce3`) is generic; see the repository report for rename recommendations.