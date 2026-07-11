# Grade Tracker

A modern, premium Flutter application for students to track their subjects, marks, and overall grades. This project implements a clean architecture utilizing Provider for state management with zero `setState()` calls.

## Features
- **Add Subjects**: Easily add subjects with their respective marks (0-100).
- **View Subjects**: See a beautiful list of all your subjects, displaying their name, mark, and dynamically computed grade. Swipe to instantly delete a subject.
- **Live Summary**: A dashboard showing your total subjects, average mark, and overall grade, updated automatically as data changes.
- **Modern UI**: Styled with Material 3, custom theming, soft elevations, rounded cards, and responsive hover effects for web/desktop.
- **Dark/Light Mode**: Full custom theme support tailored for both light and dark modes with a simple toggle switch.

## Folder Structure
```text
lib/
├── models/
│   └── subject.dart             # Data model and grade computation
├── providers/
│   ├── add_subject_provider.dart # Manages Add Subject form state
│   ├── navigation_provider.dart  # Manages bottom navigation state
│   ├── subject_provider.dart     # Core business logic and subject lists
│   └── theme_provider.dart       # Light/Dark mode state
├── screens/
│   ├── add_subject_screen.dart   # Form to add subjects
│   ├── home_screen.dart          # Main screen with BottomNavigationBar
│   ├── subject_list_screen.dart  # ListView of subjects
│   └── summary_screen.dart       # Dashboard of statistics
├── theme/
│   ├── dark_theme.dart           # Custom Material 3 Dark Theme
│   └── light_theme.dart          # Custom Material 3 Light Theme
├── widgets/
│   ├── custom_text_field.dart    # Styled form input
│   ├── empty_state.dart          # Illustration for empty data
│   ├── hover_button.dart         # Responsive button with hover effects
│   ├── subject_card.dart         # Card displaying subject details
│   └── summary_card.dart         # Card displaying statistics
└── main.dart                     # App entry point and Provider setup
```

## Technologies Used
- **Flutter & Dart**: The core framework and language.
- **Provider**: For scalable, reactive state management without `setState()`.
- **Material 3**: For modern typography, colors, and components.

## Provider Architecture
The application fully leverages the `Provider` package to handle all state changes. 
- `SubjectProvider` maintains the list of subjects. It computes total subjects, average marks, and overall grade dynamically (utilizing `.map()` and `.where()`).
- UI components listen to `SubjectProvider` and automatically rebuild when `notifyListeners()` is triggered (e.g. after adding or deleting a subject).
- `ThemeProvider` manages the active theme (light or dark).
- `NavigationProvider` and `AddSubjectProvider` replace `StatefulWidget` boilerplate for navigating between tabs and handling text controllers.

## How to Run the Project
1. Ensure you have Flutter installed (`flutter --version`).
2. Clone this repository and navigate to the project folder:
   ```bash
   cd student_grade_tracker
   ```
3. Get the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app on your preferred device or emulator:
   ```bash
   flutter run
   ```

## Screenshots
> *(Placeholders for future screenshots)*
- [Add Subject Screen Placeholder]
- [Subject List Screen Placeholder]
- [Summary Screen Placeholder]
- [Dark Mode Preview Placeholder]

## GitHub Commit History Expectations
This repository contains a clean commit history demonstrating the development process, broken down into meaningful milestones (e.g. state management setup, UI improvements, and documentation).
