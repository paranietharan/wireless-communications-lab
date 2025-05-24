# 🃏 Jokes Flutter Apps

This repository contains two Flutter applications showcasing how to fetch and display jokes from public APIs using different architectural patterns:

- **`jokes_app`** – A beginner-friendly example focusing on simplicity.
- **`jokes_app_v2`** – An advanced version with caching, animations, and refined UI/UX.

---

## 📂 Repository Structure

```
jokes_flutter/
├── jokes_app/        # Basic implementation
├── jokes_app_v2/     # Advanced version with enhanced UX
└── README.md
```

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
  - [jokes_app](#jokes_app)
  - [jokes_app_v2](#jokes_app_v2)
- [Project Structure](#project-structure)
- [Installation](#installation)
  - [jokes_app](#running-jokes_app)
  - [jokes_app_v2](#running-jokes_app_v2)
- [Dependencies](#dependencies)

---

## 🧩 Overview

Both applications are developed in **Dart** using the **Flutter framework**, with the purpose of demonstrating API integration and UI construction:

- `jokes_app` offers a minimal working prototype for learning.
- `jokes_app_v2` implements local caching, error handling, custom animations, and UI enhancements.

---

## 🚀 Features

### `jokes_app`

- Fetches jokes from [JokeAPI v2](https://v2.jokeapi.dev).
- Simple `ListView`-based UI.
- Basic error logging.
- Minimalistic structure for ease of understanding.

### `jokes_app_v2`

- Fetches jokes from [Official Joke API](https://official-joke-api.appspot.com/).
- Uses `shared_preferences` for offline caching.
- Pull-to-refresh support.
- Animated `AppBar`, gradient backgrounds, and smooth transitions.
- Modular architecture (separation of concerns).
- Graceful fallback to cache on network failure.

---

## 🏗️ Project Structure

### `jokes_app`

```
lib/
├── main.dart                # Entry point
├── joke_service.dart        # API integration
├── joke_list.dart           # Joke display screen
└── generate_jokes_button.dart  # Reusable UI widget
```

### `jokes_app_v2`

```
lib/
├── main.dart
├── model/
│   └── joke.dart            # Joke data model
├── services/
│   └── joke_service.dart    # API + caching logic (Dio + SharedPreferences)
├── screens/
│   └── home_page.dart       # Home screen with pull-to-refresh
└── widgets/
    ├── custom_app_bar.dart  # Animated AppBar widget
    └── joke_card.dart       # Reusable joke card UI
```

---

## 🛠️ Installation

> Requires [Flutter SDK](https://flutter.dev/docs/get-started/install)

### Clone the Repository

```bash
git clone https://github.com/your-username/jokes_flutter.git
cd jokes_flutter
```

---

### Running `jokes_app`

```bash
cd jokes_app
flutter pub get
flutter run
```

---

### Running `jokes_app_v2`

```bash
cd jokes_app_v2
flutter pub get
flutter run
```

---

## 📦 Dependencies

Each app declares its own dependencies in its `pubspec.yaml`. Key packages include:

| Package                | Description                                  | Used In           |
|------------------------|----------------------------------------------|-------------------|
| `dio`                 | Robust HTTP client for Dart                  | `jokes_app_v2`    |
| `shared_preferences`  | Lightweight key-value storage                | `jokes_app_v2`    |
| `flutter_test`        | Testing framework                            | Both              |
| `cupertino_icons`     | iOS-style icons                              | Both              |


```

## 📌 Notes

- Consider integrating CI/CD (e.g., GitHub Actions) for automated testing.
- You can extend `jokes_app_v2` to include themes, unit tests, or state management (e.g., Provider, Riverpod).
