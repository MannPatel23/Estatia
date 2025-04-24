# ESTATIA 🏠✨

A cross-platform real estate listing application built with Flutter and Firebase.

## 📋 Table of Contents

- [📖 About](#about)
- [🚀 Features](#features)
- [🖼️ Screenshots](#screenshots)
- [🛠️ Technologies Used](#technologies-used)
- [📁 Project Structure](#project-structure)
- [⚡ Getting Started](#getting-started)
- [🧑‍💻 Usage](#usage)
- [🤝 Contributing](#contributing)
- [📝 License](#license)
- [📬 Contact](#contact)

---

## 📖 About

**Estatia** is a modern real estate platform that allows users to browse, list, and manage property listings across various Indian states. It leverages Firebase for authentication, data storage, and image hosting, providing a seamless and secure experience for users.

## 🚀 Features

- 🔐 User authentication (Email/Password & Google Sign-In)
- 🏡 List new properties with images and details
- 🔎 Browse all available properties, filter by Indian state
- 📋 View detailed property information
- ❤️ Mark properties as favourites
- 📝 Manage your own listings (edit/delete)
- 📱 Responsive UI for mobile and web
- 💾 Persistent user sessions
- ✨ Smooth transitions and animations

## 🖼️ Screenshots

![Splash Screen](assets/images/Estatia.png)

*(Add more screenshots by taking them in-app and saving them in the assets/images folder, then referencing them here.)*

## 🛠️ Technologies Used

- **Flutter** (cross-platform UI toolkit) 🐦
- **Firebase** (Authentication, Firestore, Storage) 🔥
- **Provider** (state management) 🧩
- **Google Sign-In** 🔑
- **Image Picker** 🖼️
- **Shared Preferences** (local storage) 💾
- **Animations** (Flutter Spinkit, Material Animations) 🎞️
- **Dart 3.7+** 💻

## 📁 Project Structure

```
flutter_app/
├── assets/
│   └── images/           # App images and logos
├── lib/
│   ├── models/           # Data models (e.g., Property)
│   ├── providers/        # State management (Provider)
│   ├── screens/          # All UI screens (Home, Login, Register, etc.)
│   ├── services/         # Business logic (e.g., AuthService)
│   ├── utils/            # Utilities (e.g., Indian states list)
│   ├── widgets/          # Reusable widgets (e.g., PropertyCard)
│   └── main.dart         # App entry point
├── pubspec.yaml          # Flutter dependencies and assets
└── README.md             # Project documentation
```

## ⚡ Getting Started

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd flutter_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Add your Firebase configuration:**
   - The app uses Firebase for backend services. Make sure to set up your own Firebase project and update the configuration as needed.

4. **Run the app:**
   ```bash
   flutter run
   ```

## 🧑‍💻 Usage

- 🔑 **Login/Register:** Start by creating an account or logging in (supports Google Sign-In).
- 🏡 **Browse Properties:** View all available properties, filter by state, and mark favourites.
- ➕ **List a Property:** Add your own property with images and details.
- 📝 **Manage Listings:** Edit or delete your own property listings.
- ⚙️ **Settings:** Logout from your account.

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request for improvements or bug fixes. 🙌

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details. 📄

## 📬 Contact

For questions, suggestions, or feedback, please open an issue on GitHub or contact the maintainer. 💌
