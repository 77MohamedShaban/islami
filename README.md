# Islami App (إسلامي) 🌙

**Islami** is a modern, feature-rich Islamic application built with **Flutter**. It provides a comprehensive spiritual experience, combining essential religious tools with a beautiful, high-performance user interface designed for a seamless user journey.

---

## 🎥 App Demo

<div align="center">
  <video src="https://github.com/user-attachments/assets/3832b4e7-9522-45e2-a583-bce20d5a834a" width="300" controls>
  </video>
</div>

---

## 📖 About the Project

The "Islami" project was developed to serve as a comprehensive companion for every Muslim. The goal was to create an application that is not only functional but also aesthetically pleasing, following modern UI/UX principles while maintaining a traditional Islamic identity.

### Why Flutter?
- **Cross-Platform:** Single codebase for Android and iOS with native-level performance.
- **Reactive Framework:** Enabled smooth animations (like the Sebha rotation) and a responsive design.
- **Rich Ecosystem:** Leveraged powerful packages for audio streaming, local storage, and state management.

---

## ✨ Features

### 📖 Holy Quran
- **Digital Reading:** Clean interface for reading all 114 Surahs.
- **Search System:** Real-time search by Arabic or English names.
- **Recently Read:** Automatically tracks and persists the last Surahs visited using `shared_preferences`.

### 📜 Hadith
- Dedicated section for Prophetic Hadiths with structured content and detailed views.

### 📿 Digital Sebha
- **Interactive Counter:** Digital rosary with a tap-to-count feature.
- **Smooth Animations:** Uses `AnimatedRotation` for a realistic mechanical feel.

### 📻 Islamic Radio & Reciters
- **Live Streaming:** Listen to various Islamic radio stations globally.
- **Reciters List:** Access high-quality recitations from world-renowned Sheikhs.
- **Tech:** Powered by `just_audio` for low-latency streaming and `dio` for API integration.

### 📅 Prayer Times & Hijri Calendar
- Stay updated with accurate prayer times and Hijri dates to keep track of daily worship.

### 🖼️ Premium Onboarding
- A smooth 5-step introductory guide for new users.
- **Persistence:** Managed by a custom `PrefsManager` to ensure it only appears on the first launch.

---

## 🛠️ Tech Stack & Architecture

- **State Management:** [Provider](https://pub.dev/packages/provider) for clean and reactive UI updates.
- **Networking:** [Dio](https://pub.dev/packages/dio) for robust API handling.
- **Audio:** [Just Audio](https://pub.dev/packages/just_audio) for seamless background streaming.
- **Local Storage:** [Shared Preferences](https://pub.dev/packages/shared_preferences) for caching app state.
- **UI Components:** [Animated Toggle Switch](https://pub.dev/packages/animated_toggle_switch) and [Flutter SVG](https://pub.dev/packages/flutter_svg).
- **Architecture:** Follows a **Layered Clean Architecture** (Core, Model, UI) for maximum maintainability.

---

## 📸 Screenshots

<div align="center">
   <h3>🌟 Onboarding & Splash</h3>
   <table style="width:100%">
    <tr>
      <td><img src="https://github.com/user-attachments/assets/a47df863-af3c-47cf-9ba3-9391b14914fb" width="200" alt="Splash" /></td>
      <td><img src="https://github.com/user-attachments/assets/3c5cf35c-3534-46c3-8f08-c12f4fc9d177" width="200" alt="Intro 1" /></td>
      <td><img src="https://github.com/user-attachments/assets/1dba92c6-2402-4e36-838b-0e618f6cde4c" width="200" alt="Intro 2" /></td>
    </tr>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/f42f0571-4d61-4147-96f6-e5345ca3bebf" width="200" alt="Intro 3" /></td>
      <td><img src="https://github.com/user-attachments/assets/28585f6c-c079-44b8-95dd-b33a6643c646" width="200" alt="Intro 4" /></td>
      <td><img src="https://github.com/user-attachments/assets/b30e7477-70f1-49e0-b5bc-235d019882b0" width="200" alt="Intro 5" /></td>
    </tr>
  </table>

<h3>🕋 Main App Features</h3>
   <table style="width:100%">
    <tr>
      <td><img src="https://github.com/user-attachments/assets/dc8c538d-0a5d-4043-acb4-b970ec3667b2" width="200" alt="Home" /></td>
      <td><img src="https://github.com/user-attachments/assets/8bcb8240-487c-4a86-8024-baca4fb0f1ad" width="200" alt="Quran" /></td>
      <td><img src="https://github.com/user-attachments/assets/fb1e7556-9d64-40e7-9e7c-fb14280ae539" width="200" alt="Hadeth" /></td>
      <td><img src="https://github.com/user-attachments/assets/87c353cf-8ef3-45a3-b2ab-e925094b2fac" width="200" alt="Sebha" /></td>
    </tr>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/bcd2bf32-af31-44d2-86b1-604c602de548" width="200" alt="Radio" /></td>
      <td><img src="https://github.com/user-attachments/assets/275f14b9-ef26-4116-9d95-628710f85387" width="200" alt="Time" /></td>
      <td><img src="https://github.com/user-attachments/assets/67d12dfd-d48d-4ac5-8014-a656e9be13ca" width="200" alt="Time" /></td>
    </tr>
  </table>
</div>

---

## 🛠️ Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/77MohamedShaban/islami.git
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run
   ```

---
Made with ❤️ by [Mohamed Shaban](https://github.com/77MohamedShaban)
