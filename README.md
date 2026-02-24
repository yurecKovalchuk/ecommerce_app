# 🛍️ Ecommerce Flutter Demo

**Ecommerce Flutter Demo** is a modern, high-performance mobile application built with **Flutter**. The project showcases advanced software engineering practices, including **Clean Architecture** and **Domain-Driven Design (DDD)** principles.

---

## 🚀 Overview

This project serves as a blueprint for a scalable architecture suitable for large-scale production solutions. The primary focus is on **maintainability** and **testability**.

### ✨ Key Features

* 🔐 **Authentication Flow**: Secure login using JWT tokens with automated persistence.
* 🚦 **Session Management**: Automatic app state restoration and navigation via **Auth Guard**.
* 📦 **Product Discovery**: Infinite scroll pagination for seamless product browsing.
* 🧡 **Wishlist & Cart**: Local state management for high-performance user interactions.
* 🛡️ **Secure Storage**: Encryption of sensitive data (tokens) using Android Keystore and iOS Keychain.

---

## 🏗️ Architecture

The application is developed following **Clean Architecture** combined with **DDD**, ensuring a strict separation of concerns:

| Layer | Description |
| :--- | :--- |
| **Domain Layer** | **The Core.** Contains pure Dart logic: Entities, Value Objects, and Repository interfaces. It has **zero** dependencies on external libraries or Flutter. |
| **Data Layer** | **Infrastructure.** Implements repositories, handles API requests (Dio), Data Transfer Objects (DTOs), and mappers to convert raw data into Domain Entities. |
| **Presentation Layer** | **User Interface.** Uses **BLoC/Cubit** for state management. The UI is built with modular, reusable widgets following **Material 3** guidelines. |
