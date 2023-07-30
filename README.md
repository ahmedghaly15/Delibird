# Delibird-App

Delibird is a powerful and intuitive Flutter application designed exclusively for Acer enthusiasts. With its sleek user interface, advanced features, and smooth performance, Delibird offers a seamless shopping experience for Acer products.

## Contents

- [Preview](#preview)
- [App Structure](#app-structure)
- [Features](#features)
- [Installation](#installation)
- [Getting Started](#getting-started)

## Preview

https://github.com/ahmedghaly15/Delibird-App/assets/108659381/e121cc53-227b-45df-8589-fcaf01b9ae1d

## App Structure

```
lib
├── core
│   ├── global
│   ├── models
│   ├── network
│   ├── utils
│   └── widgets
│
├── features
│   ├── splash
│   ├── auth
│   ├── get_help
│   ├── phone_verification
│   ├── layout
│   ├── home
│   ├── product_details
│   ├── notifications
│   ├── settings
│   └── log_out
│
└── main.dart

```

## Features

🔥 **Firebase Authentication**: Delibird implements secure user authentication functionalities using Firebase, ensuring a safe and reliable login experience. Users can sign in using their Google accounts or their phone numbers.

⚙️ **Dependency Injection**: Delibird embraces the concept of dependency injection by utilizing the `get_it` package. This allows for efficient and organized management of dependencies, leading to cleaner code architecture and scalability.

🌐 **RESTful API Integration**: With the power of the `dio` package, Delibird seamlessly communicates with a RESTful API, enabling real-time data retrieval and updates. Users can access the latest Acer products, prices, and availability, ensuring an up-to-date shopping experience.

📦 **Local Data Management**: Delibird leverages the `SharedPreferences` package to store local data, ensuring offline functionality and a smoother user experience. Users can browse products and manage their shopping carts even without a stable internet connection.

🎨 **Immersive Animations**: Delibird focuses on creating an immersive user experience with captivating animations. From elegant transition effects to delightful microinteractions, the app delivers a visually pleasing and engaging journey for every user.

## Installation

Follow these simple steps to get started with Delibird:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/delibird.git
   ```

2. **Navigate to the project directory**:

   ```bash
   cd delibird
   ```

3. **Install dependencies**:

   ```bash
   flutter pub get
   ```

4. **Run the app**:

   ```bash
   flutter run
   ```

## Getting Started

This project represents a social app designed to help user communicate with everyone.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
