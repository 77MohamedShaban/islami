# Islami App (إسلامي) 🌙

**Islami** is a modern, feature-rich Islamic application built with **Flutter**. It provides a comprehensive spiritual experience, combining essential religious tools with a beautiful, high-performance user interface designed for a seamless user journey.

---

## 🎥 App Demo

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
      <td><img src="https://github.com/user-attachments/assets/b23f6da9-ebcc-4893-8625-c8e8d13e0762" width="200" alt="Splash" /></td>
      <td><img src="https://github.com/user-attachments/assets/61944ffb-c887-45a6-83a1-bd30317de9ab" width="200" alt="Intro 1" /></td>
      <td><img src="https://github.com/user-attachments/assets/2a36bebf-de2e-4fbb-ae1e-9376cee839f2" width="200" alt="Intro 2" /></td>
    </tr>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/8d093c24-43d5-4cdf-97c2-9130dcb6b450" width="200" alt="Intro 3" /></td>
      <td><img src="https://github.com/user-attachments/assets/63c335bb-cf60-4d55-be99-1f5104083542" width="200" alt="Intro 4" /></td>
      <td><img src="https://github.com/user-attachments/assets/a234f762-c567-46c3-a422-9986cedf7c38" width="200" alt="Intro 5" /></td>
    </tr>
  </table>

<h3>🕋 Main App Features</h3>
   <table style="width:100%">
    <tr>
      <td><img src="https://github.com/user-attachments/assets/80cd90f8-fe31-487c-85c0-5d7725547d8b" width="200" alt="Home" /></td>
      <td><img src="https://github.com/user-attachments/assets/95a1770f-0c9f-4198-9da3-f2739649318c" width="200" alt="Quran" /></td>
      <td><img src="https://github.com/user-attachments/assets/e8d96ca7-73e5-4221-9618-d11af740c71b" width="200" alt="Hadeth" /></td>
    </tr>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/264bf72d-d242-4cf8-a01a-f72040e9d635" width="200" alt="Sebha" /></td>
      <td><img src="https://github.com/user-attachments/assets/3031d8a2-90a6-48d9-bfb7-1e775b46cf45" width="200" alt="Radio" /></td>
      <td><img src="https://github.com/user-attachments/assets/81aa27e3-95ef-42ad-91cc-58f5be591236" width="200" alt="Time" /></td>
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
