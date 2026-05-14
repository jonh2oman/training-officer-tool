# training_officer_tool

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Access this app here:
https://jonh2oman.github.io/training-officer-tool/

# ⚓ Training Officer Tool (TOT)

![Training Officer Tool Banner](assets/images/banner.png)

## 📋 Overview

The **Training Officer Tool (TOT)** is a premium, high-fidelity Flutter application designed specifically for Sea Cadet Corps Training Officers. It streamlines the complex task of scheduling, resource management, and reporting, allowing officers to focus on what matters most: delivering high-quality training to cadets.

Built with a modern aesthetic and robust functionality, TOT transforms traditional spreadsheets and paper-based planning into a dynamic, intelligent digital workflow.

---

## ✨ Key Features

### 📅 Intelligent Training Planning
- **Multi-Phase Matrix**: Plan across all four training phases (Phase 1-4) simultaneously with a clear, synchronized matrix view.
- **Dynamic Scheduling**: Support for regular Parade Nights, full-day Training Days, and intensive Weekend Sessions.
- **Academic & Full-Year Modes**: Flexible calendar configurations to suit your corps' specific operational cycle.

### 🛡️ Resource Management & Deconfliction
- **Instructor Registry**: Manage staff profiles, qualifications, and availability.
- **Location Tracking**: Assign classrooms, ranges, and parade squares while preventing double-bookings.
- **Visual Deconfliction**: Instant feedback when instructors or locations are overbooked (Look for the **IN USE** indicators).

### 📄 Professional reporting
- **Automated Routine Orders**: Generate professional PDF Routine Orders at the click of a button.
- **Training Schedules**: Export high-fidelity schedules for posting or distribution.
- **Standardized EO Codes**: Built-in library of Sea Cadet Enabling Objectives (EOs) with phase-specific suffixes.

### 🧠 Advanced Automation (Experimental)
- **Auto-Plan**: Leverage intelligent algorithms to draft initial training schedules based on lesson requirements and historical data.
- **Progress Tracking**: Real-time stats dashboard to monitor yearly training progress and completion rates.

---

## 🎨 Premium Design System

TOT is built with a focus on **Visual Excellence**:
- **Glassmorphism**: Elegant blurred transparency across cards and navigation elements.
- **Modern Typography**: Powered by Google Fonts (Outfit/Inter).
- **Multi-Theme Support**: Choose from **Light**, **Dark**, **Sea**, or **System** themes to match your environment.
- **Lucide Icons**: Crisp, professional iconography throughout the app.

---

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [Riverpod](https://riverpod.dev)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
- **Persistence**: Shared Preferences
- **PDF Generation**: `pdf` & `printing` packages
- **Icons**: Lucide Icons
- **Fonts**: Google Fonts

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version recommended)
- Dart SDK
- Android Studio / VS Code with Flutter extension

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/jonh2oman/training-officer-tool.git
   cd training-officer-tool
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

---

## 🗺️ Roadmap & Changelog

For a detailed history of changes and planned features, please refer to the [CHANGELOG.md](CHANGELOG.md).

---

## 🤝 Contributing

Contributions are welcome! If you have suggestions for new features or find any bugs, please open an issue or submit a pull request.

---

## 📜 License

This project is proprietary and intended for use by Canadian Sea Cadet Corps. 

---

*Built with ❤️ for the Cadet Program.*
