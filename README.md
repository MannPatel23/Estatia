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

<img width="325" alt="LoginScreen" src="https://github.com/user-attachments/assets/357fa76f-635f-4f55-80fd-73c719ae5173" />
<img width="323" alt="RegisterPage" src="https://github.com/user-attachments/assets/38dca765-0b9d-4a4f-adc9-a013038a2df9" />
<img width="323" alt="HomeScreen" src="https://github.com/user-attachments/assets/7ae7f21c-129d-4dfd-b46c-6636dd341bd3" />
<img width="324" alt="ListPropertyPage" src="https://github.com/user-attachments/assets/f3cd388d-b566-41d0-a9ff-00aeb0a90c03" />
<img width="324" alt="MyListingsPage" src="https://github.com/user-attachments/assets/5674e826-880b-4053-af1a-311f2144cbfa" />
<img width="322" alt="FavouritesPage" src="https://github.com/user-attachments/assets/316431a2-0ca5-4e66-ae32-4afd89ed67ba" />
<img width="322" alt="SettingsPageLogout" src="https://github.com/user-attachments/assets/d1772136-7577-4c39-95c6-aa5f8c198572" />




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
   flutter run -d chrome --web-port=5000  
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
