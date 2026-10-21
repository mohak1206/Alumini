# 🎓 Alumni Connect App

<p align="center">
  <img src="assets/logo.png" alt="Alumni Connect Logo" width="120"/>
</p>

<p align="center">
  A cross-platform mobile application built with <strong>Flutter</strong> and powered by <strong>Firebase</strong>, designed to bridge the gap between students, alumni, parents, and industry partners of a department/institution.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart" alt="Dart"/>
  <img src="https://img.shields.io/badge/Firebase-Firestore-FFCA28?logo=firebase" alt="Firebase"/>
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Windows-blue" alt="Platform"/>
  <img src="https://img.shields.io/badge/Status-Active-brightgreen" alt="Status"/>
</p>

---

## 📖 Table of Contents

- [About the Project](#-about-the-project)
- [Key Features](#-key-features)
- [App Screens](#-app-screens)
- [Tech Stack](#-tech-stack)
- [Firebase Database Structure](#-firebase-database-structure)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Admin Panel](#-admin-panel)
- [Supported Platforms](#-supported-platforms)
- [Dependencies](#-dependencies)

---

## 📌 About the Project

**Alumni Connect** is a Flutter-based mobile application developed as a college/department project. It serves as a centralized digital platform for:

- 📂 **Browsing alumni profiles** — students and faculty can explore where graduates are working, their roles, and connect with them on LinkedIn.
- 🎬 **Watching alumni showcase videos** — YouTube videos of alumni talks, interviews, and inspirational sessions — played directly inside the app.
- 📢 **Reading department notices** — Important announcements for students, parents, industry partners, and the general community are published and categorized here.

The app connects to **Firebase Firestore** in real-time, meaning all data updates instantly without needing to restart the app.

---

## ✨ Key Features

| Feature | Description |
|---|---|
| 🔴 **Real-time Data** | Uses Firebase Firestore `StreamBuilder` — data updates live without refreshing |
| 🔍 **Search Alumni** | Instantly filter alumni by name or company |
| 🎬 **In-App YouTube Player** | Watch alumni videos without leaving the app |
| 📢 **Notice Board with Categories** | Filter notices by target audience (Students, Parents, Alumni, Industry Partner, General) |
| 🔐 **Admin Mode** | Password-protected admin login to add new alumni entries |
| 📶 **Offline Detection** | Automatically shows a "No Internet Connection" screen when offline |
| 🎨 **Custom Branding** | Royal Blue (`#002AFF`) theme with custom splash screen and launcher icon |
| 📱 **Cross-Platform** | Runs on Android, iOS, Web, and Windows |

---

## 📱 App Screens

### 1. 👥 Alumni Directory (`Directory` Tab)

The main screen of the app. Displays a list of all alumni fetched from Firestore.

- **Search Bar** — Filter alumni in real-time by name or company
- **Alumni Cards** — Each card shows:
  - Name initial avatar
  - Full name
  - Job role and company
  - Graduation batch year
  - LinkedIn profile link (opens in external browser)
- **Admin FAB Button** — A green `+` button appears only when admin mode is active, allowing new alumni to be added

### 2. 🎬 Alumni Showcase (`Showcase` Tab)

A video gallery screen featuring YouTube videos of alumni interviews, talks, and presentations.

- Shows YouTube **thumbnail** with a play button by default
- Tapping the play button loads the video **inline** (no external app needed) using `youtube_player_iframe`
- Supports full-screen playback
- Video auto-resets to thumbnail state after it ends
- Video data (title, speaker, YouTube URL) is fetched from Firestore `Videos` collection

### 3. 📢 Notices & Outreach (`Outreach` Tab)

A departmental notice board with category-based filtering.

- **Filter Chips** (horizontally scrollable):
  - `All` | `Students` | `Parents` | `Alumni` | `Industry Partner` | `General`
- Each notice card is **expandable** (ExpansionTile) showing:
  - Category chip
  - Notice title
  - Date
  - Full description on tap
- Data is fetched live from Firestore `Notices` collection

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| **Flutter (Dart)** | UI framework — cross-platform frontend |
| **Firebase Core** | Firebase initialization |
| **Cloud Firestore** | Real-time NoSQL database |
| **Firebase Auth** | Authentication infrastructure (integrated) |
| **Firebase Storage** | File/media storage infrastructure (integrated) |
| **YouTube Player iFrame** | Embedded YouTube video playback |
| **URL Launcher** | Open LinkedIn profiles in browser |
| **Connectivity Plus** | Detect network state changes |
| **Flutter Native Splash** | Custom splash screen |
| **Flutter Launcher Icons** | Custom app icon generation |

---

## 🔥 Firebase Database Structure

The app uses **Cloud Firestore** with the following collections:

### `Alumni` Collection
```
Alumni/
  └── {docId}/
        ├── name       : String  → Full name of the alumni
        ├── company    : String  → Current employer
        ├── role       : String  → Job designation
        ├── batch      : String  → Graduation year (e.g., "2023")
        └── linkedin   : String  → LinkedIn profile URL
```

### `Videos` Collection
```
Videos/
  └── {docId}/
        ├── title      : String  → Video title
        ├── speaker    : String  → Alumni name / speaker
        └── youtubeUrl : String  → Full YouTube video URL
```

### `Notices` Collection
```
Notices/
  └── {docId}/
        ├── title       : String  → Notice heading
        ├── category    : String  → One of: "Students", "Parents", "Alumni", "Industry Partner", "General"
        ├── date        : String  → Notice date (e.g., "22 Oct 2024")
        └── description : String  → Full notice body/content
```

---

## 📁 Project Structure

```
Alumni-main/
├── lib/
│   ├── main.dart                    # App entry point, theme config, bottom nav
│   ├── firebase_options.dart        # Auto-generated Firebase platform config
│   ├── network_wrapper.dart         # Offline detection widget
│   └── screens/
│       ├── directory_screen.dart    # Alumni directory + admin panel
│       ├── showcase_screen.dart     # YouTube video showcase
│       └── outreach_screen.dart     # Notices & department outreach
├── assets/
│   └── logo.png                     # App logo (used for icon & splash)
├── android/                         # Android-specific config
├── ios/                             # iOS-specific config
├── web/                             # Web-specific config
├── windows/                         # Windows desktop config
├── firebase.json                    # FlutterFire CLI config
├── pubspec.yaml                     # Flutter dependencies & metadata
└── README.md                        # Project documentation
```

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

| Tool | Download |
|---|---|
| Flutter SDK (3.x) | [flutter.dev](https://flutter.dev/docs/get-started/install) |
| Dart SDK | Included with Flutter |
| Android Studio | [developer.android.com/studio](https://developer.android.com/studio) |
| Git | [git-scm.com](https://git-scm.com) |

Verify installation:
```bash
flutter doctor
```

---

### Installation & Setup

**1. Clone the repository**
```bash
git clone https://github.com/mohak1206/Alumini.git
cd Alumini
```

**2. Install Flutter dependencies**
```bash
flutter pub get
```

**3. Accept Android licenses** *(first time only)*
```bash
flutter doctor --android-licenses
```

**4. Run the app**
```bash
# On a connected Android device or emulator
flutter run

# On Windows desktop (no emulator needed)
flutter run -d windows

# On Chrome (web)
flutter run -d chrome
```

---

### Firebase Setup (For New Deployment)

> ⚠️ The Firebase project is already configured. These steps are only needed if deploying to a **new Firebase project**.

1. Create a project at [console.firebase.google.com](https://console.firebase.google.com)
2. Enable **Firestore Database** and **Firebase Authentication**
3. Install FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```
4. Configure Firebase:
   ```bash
   flutterfire configure
   ```
5. Populate Firestore with the collections described in the [Database Structure](#-firebase-database-structure) section above.

---

## 🔐 Admin Panel

The app includes a **password-protected admin mode** for managing alumni data.

| Action | How |
|---|---|
| **Enable Admin** | Tap the 🔒 lock icon in the top-right of the Directory screen |
| **Password** | `admin123` |
| **Add Alumni** | A green `+` FAB button appears — tap it to fill the add-alumni form |
| **Disable Admin** | Tap the 🔓 lock icon again to exit admin mode |

> 📝 **For Faculty/Evaluators**: The admin password is hardcoded as `admin123` for demonstration purposes. In a production deployment, this would be replaced with Firebase Authentication-based role management.

---

## 📲 Supported Platforms

| Platform | Status |
|---|---|
| ✅ Android | Fully Supported |
| ✅ iOS | Fully Supported |
| ✅ Web | Fully Supported |
| ✅ Windows | Fully Supported |
| ⚠️ Linux | Not Configured |
| ⚠️ macOS | Config present (same as iOS) |

---

## 📦 Dependencies

```yaml
dependencies:
  firebase_core: ^4.13.0          # Firebase initialization
  cloud_firestore: ^6.8.0         # Real-time Firestore database
  firebase_storage: ^13.4.6       # Cloud file storage
  firebase_auth: ^6.5.7           # User authentication
  url_launcher: ^6.3.2            # Open URLs in browser
  youtube_player_iframe: ^6.0.2   # Embedded YouTube player
  connectivity_plus: ^7.3.1       # Network connectivity detection
  flutter_native_splash: ^2.4.8   # Custom splash screen

dev_dependencies:
  flutter_launcher_icons: ^0.14.1 # Custom app launcher icon
  flutter_lints: ^6.0.0           # Lint rules for code quality
```

---

## 🎨 Design & Branding

| Element | Value |
|---|---|
| **Primary Color** | Royal Blue `#002AFF` |
| **Background** | White `#FFFFFF` |
| **App Bar** | Royal Blue with white text |
| **Bottom Nav (Active)** | Royal Blue |
| **Splash Screen** | Royal Blue background with logo |
| **Launcher Icon** | Custom logo on all platforms |

---

## 👨‍💻 Contributing

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "Add: your feature"`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a Pull Request

---

<p align="center">
  Made with ❤️ using Flutter & Firebase
</p>
