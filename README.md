<!-- HEADER BANNER -->
<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=002AFF&height=200&section=header&text=Alumni%20Connect&fontSize=50&fontColor=ffffff&fontAlignY=38&desc=Connecting%20Students%20%7C%20Alumni%20%7C%20Faculty&descAlignY=58&descSize=18&descColor=ccddff" width="100%"/>

</div>

<!-- LOGO + TITLE -->
<div align="center">
  <br/>

  ![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
  ![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
  ![Firebase](https://img.shields.io/badge/Firebase-Firestore-FF6F00?style=for-the-badge&logo=firebase&logoColor=white)
  ![Android](https://img.shields.io/badge/Android-✓-3DDC84?style=for-the-badge&logo=android&logoColor=white)
  ![iOS](https://img.shields.io/badge/iOS-✓-000000?style=for-the-badge&logo=apple&logoColor=white)
  ![Web](https://img.shields.io/badge/Web-✓-4285F4?style=for-the-badge&logo=googlechrome&logoColor=white)
  ![Windows](https://img.shields.io/badge/Windows-✓-0078D6?style=for-the-badge&logo=windows&logoColor=white)

  <br/>

  ![Stars](https://img.shields.io/github/stars/mohak1206/Alumini?style=flat-square&color=002AFF)
  ![Last Commit](https://img.shields.io/github/last-commit/mohak1206/Alumini?style=flat-square&color=002AFF)
  ![Repo Size](https://img.shields.io/github/repo-size/mohak1206/Alumini?style=flat-square&color=002AFF)
  ![License](https://img.shields.io/badge/License-Academic-orange?style=flat-square)

</div>

<br/>

---

## 🌟 What is Alumni Connect?

<table>
<tr>
<td width="60%">

**Alumni Connect** is a real-time, cross-platform mobile app built for colleges and departments. It digitally connects the entire academic community — **students, alumni, faculty, parents**, and **industry partners** — in one place.

The app is powered by **Firebase Firestore**, meaning every update to alumni profiles, videos, or notices reflects **instantly** across all devices — no refresh needed.

> 🎓 Built as an academic project to demonstrate real-world Flutter + Firebase development skills.

</td>
<td width="40%" align="center">

```
 ┌─────────────────────┐
 │   🎓 Alumni Connect  │
 ├──────┬──────┬───────┤
 │  👥  │  🎬  │  📢  │
 │ Dir  │ Show │ Notc  │
 │ ecto │ case │ ice   │
 │  ry  │      │ Board │
 └──────┴──────┴───────┘
    Real-time • Firebase
```

</td>
</tr>
</table>

---

## ✨ Key Features at a Glance

<div align="center">

| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Feature | What it does |
|:---:|:---|:---|
| 🔴 | **Live Real-time Data** | Firestore `StreamBuilder` — updates live, no refresh |
| 🔍 | **Smart Search** | Instant alumni filter by name or company |
| 🎬 | **In-App YouTube Player** | Watch alumni videos without leaving the app |
| 📢 | **Categorized Notice Board** | Notices filtered by Students / Parents / Alumni / Industry |
| 🔐 | **Admin Mode** | Password-protected panel to manage alumni data |
| 📶 | **Offline Detection** | Shows friendly screen when internet is lost |
| 🎨 | **Royal Blue Branding** | Custom `#002AFF` theme, splash screen & app icon |
| 📱 | **Cross-Platform** | One codebase → Android, iOS, Web, Windows |

</div>

---

## 📱 App Screens — Detailed Breakdown

<details open>
<summary><b>👥 Screen 1 — Alumni Directory</b></summary>
<br/>

> The **home screen** of the app — a live-updating directory of all alumni.

| Element | Description |
|---|---|
| 🔍 **Search Bar** | Real-time filter by alumni name or company |
| 🪪 **Alumni Card** | Shows avatar, name, role, company, batch year |
| 🔗 **LinkedIn Button** | One tap opens alumni's LinkedIn in browser |
| ➕ **Admin FAB** | Green `+` button visible only in Admin Mode |
| 🔒 **Admin Lock Icon** | In the top-right app bar to toggle admin mode |

</details>

<details open>
<summary><b>🎬 Screen 2 — Alumni Showcase (Videos)</b></summary>
<br/>

> A video gallery of alumni **talks, interviews, and sessions** — played inline.

| Element | Description |
|---|---|
| 🖼️ **YouTube Thumbnail** | Auto-loaded preview image for each video |
| ▶️ **Play Button** | Tap to load and play video inside the app |
| 📺 **Inline Player** | Uses `youtube_player_iframe` — no YouTube app needed |
| ⛶ **Full Screen** | Supports landscape full-screen playback |
| 🔄 **Auto-Reset** | Returns to thumbnail view after video ends |

</details>

<details open>
<summary><b>📢 Screen 3 — Notices & Department Outreach</b></summary>
<br/>

> A smart **notice board** with audience-based filtering.

**Filter Categories (chip-style):**

`All` &nbsp; `Students` &nbsp; `Parents` &nbsp; `Alumni` &nbsp; `Industry Partner` &nbsp; `General`

| Element | Description |
|---|---|
| 🏷️ **Category Chip** | Color-labeled audience tag on each notice |
| 📋 **Notice Title** | Bold heading with date |
| 🔽 **Expandable Card** | Tap to expand and read full notice content |
| ⚡ **Real-time** | New notices appear instantly via Firestore stream |

</details>

---

## 🛠️ Tech Stack

<div align="center">

| Layer | Technology | Badge |
|:---:|:---|:---:|
| **Frontend** | Flutter (Dart) | ![Flutter](https://img.shields.io/badge/-Flutter-02569B?logo=flutter&logoColor=white) |
| **Database** | Cloud Firestore | ![Firestore](https://img.shields.io/badge/-Firestore-FF6F00?logo=firebase&logoColor=white) |
| **Auth** | Firebase Auth | ![Auth](https://img.shields.io/badge/-Firebase%20Auth-FF6F00?logo=firebase&logoColor=white) |
| **Storage** | Firebase Storage | ![Storage](https://img.shields.io/badge/-Firebase%20Storage-FF6F00?logo=firebase&logoColor=white) |
| **Video** | YouTube Player iFrame | ![YouTube](https://img.shields.io/badge/-YouTube%20iFrame-FF0000?logo=youtube&logoColor=white) |
| **Links** | URL Launcher | ![URL](https://img.shields.io/badge/-URL%20Launcher-4285F4?logo=google&logoColor=white) |
| **Network** | Connectivity Plus | ![Net](https://img.shields.io/badge/-Connectivity%20Plus-34A853?logo=google&logoColor=white) |
| **Splash** | Flutter Native Splash | ![Splash](https://img.shields.io/badge/-Native%20Splash-02569B?logo=flutter&logoColor=white) |

</div>

---

## 🔥 Firebase — Database Collections

<table>
<tr>
<td width="33%">

### 👤 `Alumni`
```
name       → String
company    → String
role       → String
batch      → String
linkedin   → String (URL)
```

</td>
<td width="33%">

### 🎬 `Videos`
```
title      → String
speaker    → String
youtubeUrl → String (URL)
```

</td>
<td width="33%">

### 📢 `Notices`
```
title       → String
category    → String
date        → String
description → String
```

</td>
</tr>
</table>

> **Category values for Notices:** `Students` · `Parents` · `Alumni` · `Industry Partner` · `General`

---

## 📁 Project Structure

```
📦 Alumni-main/
 ┣ 📂 lib/
 ┃  ┣ 📄 main.dart                  ← App entry, theme & bottom nav
 ┃  ┣ 📄 firebase_options.dart      ← Auto-generated Firebase config
 ┃  ┣ 📄 network_wrapper.dart       ← Offline detection widget
 ┃  ┗ 📂 screens/
 ┃     ┣ 📄 directory_screen.dart   ← Alumni list + admin panel
 ┃     ┣ 📄 showcase_screen.dart    ← YouTube video showcase
 ┃     ┗ 📄 outreach_screen.dart    ← Notices & outreach board
 ┣ 📂 assets/
 ┃  ┗ 🖼️ logo.png                   ← App icon & splash logo
 ┣ 📂 android/                      ← Android build config
 ┣ 📂 ios/                          ← iOS build config
 ┣ 📂 web/                          ← Web build config
 ┣ 📂 windows/                      ← Windows desktop config
 ┣ 📄 firebase.json                 ← FlutterFire CLI config
 ┣ 📄 pubspec.yaml                  ← Dependencies & metadata
 ┗ 📄 README.md                     ← You are here!
```

---

## 🚀 Getting Started

### ✅ Step 1 — Prerequisites

Make sure you have these installed:

| Tool | Version | Download |
|:---:|:---:|:---:|
| ![Flutter](https://img.shields.io/badge/Flutter-SDK-02569B?logo=flutter) | 3.x | [flutter.dev](https://flutter.dev/docs/get-started/install) |
| ![Android](https://img.shields.io/badge/Android-Studio-3DDC84?logo=android) | Latest | [developer.android.com](https://developer.android.com/studio) |
| ![Git](https://img.shields.io/badge/Git-SCM-F05032?logo=git) | Latest | [git-scm.com](https://git-scm.com) |

```bash
# Verify everything is set up
flutter doctor
```

---

### ✅ Step 2 — Clone & Install

```bash
# 1. Clone the repo
git clone https://github.com/mohak1206/Alumini.git
cd Alumini

# 2. Install all Flutter packages
flutter pub get

# 3. Accept Android licenses (first time only)
flutter doctor --android-licenses
```

---

### ✅ Step 3 — Run the App

```bash
# Android (emulator or physical device)
flutter run

# Windows Desktop (no emulator needed!)
flutter run -d windows

# Web Browser
flutter run -d chrome
```

---

<details>
<summary>⚠️ <b>Firebase Setup (Only if deploying to a NEW project)</b></summary>
<br/>

> The Firebase project `alumini-project-b0e01` is **already configured**. Skip this if cloning for evaluation.

1. Create a new project at [console.firebase.google.com](https://console.firebase.google.com)
2. Enable **Cloud Firestore** and **Firebase Authentication**
3. Install FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```
4. Re-configure Firebase for your project:
   ```bash
   flutterfire configure
   ```
5. Add data to Firestore following the [collection schemas above](#-firebase--database-collections)

</details>

---

## 🔐 Admin Panel — For Faculty / Evaluators

<div align="center">

| Step | Action |
|:---:|:---|
| **1** | Open the app → go to the **Directory** tab |
| **2** | Tap the 🔒 **lock icon** in the top-right corner of the app bar |
| **3** | Enter the admin password: &nbsp; `admin123` |
| **4** | A green ➕ **FAB button** appears at the bottom-right |
| **5** | Tap `+` to open the **Add Alumni form** |
| **6** | Fill in name, company, role, batch, LinkedIn → **Save** |
| **7** | Tap the 🔓 icon again to **exit admin mode** |

</div>

> 💡 **Note for Faculty:** The password `admin123` is hardcoded for academic demonstration. In production, Firebase Auth role-based access would be used instead.

---

## 📲 Supported Platforms

<div align="center">

| Platform | Status | Notes |
|:---:|:---:|:---|
| <img src="https://img.shields.io/badge/Android-✓-3DDC84?logo=android&logoColor=white"/> | ✅ Supported | `google-services.json` configured |
| <img src="https://img.shields.io/badge/iOS-✓-000000?logo=apple&logoColor=white"/> | ✅ Supported | `GoogleService-Info.plist` configured |
| <img src="https://img.shields.io/badge/Web-✓-4285F4?logo=googlechrome&logoColor=white"/> | ✅ Supported | Firebase Web SDK configured |
| <img src="https://img.shields.io/badge/Windows-✓-0078D6?logo=windows&logoColor=white"/> | ✅ Supported | CMake build system configured |

</div>

---

## 📦 Dependencies

<details open>
<summary><b>View pubspec.yaml packages</b></summary>
<br/>

```yaml
dependencies:
  firebase_core: ^4.13.0          # 🔥 Firebase app initialization
  cloud_firestore: ^6.8.0         # 📡 Real-time NoSQL database
  firebase_storage: ^13.4.6       # 🗄️  Cloud file & media storage
  firebase_auth: ^6.5.7           # 🔑 User authentication
  url_launcher: ^6.3.2            # 🔗 Open LinkedIn & URLs in browser
  youtube_player_iframe: ^6.0.2   # 🎬 Embedded YouTube video player
  connectivity_plus: ^7.3.1       # 📶 Network connectivity detection
  flutter_native_splash: ^2.4.8   # 🖼️  Custom splash screen

dev_dependencies:
  flutter_launcher_icons: ^0.14.1 # 🎨 Custom app launcher icons
  flutter_lints: ^6.0.0           # ✅ Dart code quality lint rules
```

</details>

---

## 🎨 Design & Branding

<div align="center">

| Element | Value | Preview |
|:---|:---|:---:|
| **Primary Color** | `#002AFF` — Royal Blue | ![#002AFF](https://img.shields.io/badge/%20-002AFF?style=flat-square&color=002AFF) |
| **Background** | `#FFFFFF` — Pure White | ![#FFFFFF](https://img.shields.io/badge/%20-FFFFFF?style=flat-square&color=FFFFFF) |
| **App Bar** | Royal Blue + White text | ![AppBar](https://img.shields.io/badge/AppBar-Blue-002AFF?style=flat-square) |
| **Bottom Nav Active** | Royal Blue | ![Nav](https://img.shields.io/badge/Nav-Active-002AFF?style=flat-square) |
| **Admin FAB** | Green `#4CAF50` | ![FAB](https://img.shields.io/badge/Admin%20FAB-green-4CAF50?style=flat-square) |

</div>

---

## 👨‍💻 Contributing

```bash
# 1. Fork & clone
git clone https://github.com/mohak1206/Alumini.git

# 2. Create your branch
git checkout -b feature/your-feature-name

# 3. Make changes & commit
git commit -m "feat: add your feature description"

# 4. Push and open a Pull Request
git push origin feature/your-feature-name
```

---

<!-- FOOTER WAVE -->
<img src="https://capsule-render.vercel.app/api?type=waving&color=002AFF&height=120&section=footer" width="100%"/>

<div align="center">

**Built with Flutter & Firebase** &nbsp;•&nbsp; Academic Project

![Visitor Count](https://visitor-badge.laobi.icu/badge?page_id=mohak1206.Alumini)

</div>
