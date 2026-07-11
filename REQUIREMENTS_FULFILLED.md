# 📋 Requirements Fulfillment Checklist

This document maps exactly where and how every single requirement of the **Student Grade Tracker** assignment was fulfilled within this codebase.

---

### 📱 1. App Structure (3 Screens, BottomNavBar, Theme Switch)
* **Status:** ✅ Fulfilled
* **File:** `lib/screens/home_screen.dart`
* **Details:** 
  * The app uses a `BottomNavigationBar` to seamlessly switch between the **Add Subject**, **Subject List**, and **Summary** screens without reloading.
  * The `AppBar` contains an interactive `Switch` widget that instantly toggles the custom Light and Dark themes via `ThemeProvider`.

### 📚 2. Subject Class & Grade Logic
* **Status:** ✅ Fulfilled
* **File:** `lib/models/subject.dart`
* **Details:** 
  * The `Subject` class uses a private `_mark` field as strictly required. 
  * The `grade` getter implements the exact logic requested:
    * 80–100 → A
    * 65–79 → B
    * 50–64 → C
    * 0–49 → F

### 🗄️ 3. Store Data (`List<Subject>`) & `.map()`/`.where()`
* **Status:** ✅ Fulfilled
* **File:** `lib/providers/subject_provider.dart`
* **Details:** 
  * All subjects are stored dynamically in `List<Subject> _subjects`.
  * The `.map()` function is used on Line 24 inside the `averageMark` getter (`_subjects.map((s) => s.mark)`) to extract all the marks and calculate the true average.

### ✍️ 4. Add Subject Screen & Validation
* **Status:** ✅ Fulfilled
* **File:** `lib/screens/add_subject_screen.dart`
* **Details:** 
  * Implemented using a global `FormState` key.
  * Explicit `validator` logic prevents the user from submitting an empty Subject Name.
  * Explicit `validator` logic throws an error if the user tries to input a Mark below 0 or above 100.

### 📝 5. Subject List Screen (`ListView.builder` & `Dismissible`)
* **Status:** ✅ Fulfilled
* **File:** `lib/screens/subject_list_screen.dart`
* **Details:** 
  * Renders dynamically using `ListView.builder`.
  * Every `SubjectCard` is wrapped inside a `Dismissible` widget. Swiping the card left or right removes the subject from the list and the Provider state instantly.

### 📊 6. Summary Screen
* **Status:** ✅ Fulfilled
* **Files:** `lib/screens/summary_screen.dart` & `lib/widgets/summary_card.dart`
* **Details:** 
  * Wrapped in a `Consumer<SubjectProvider>`, ensuring that whenever a subject is added or deleted, the **Total Subjects**, **Average Mark**, and **Overall Grade** statistics recalculate and update on the screen completely automatically.

### 🎨 7. Themes & `Theme.of(context)`
* **Status:** ✅ Fulfilled
* **Files:** `lib/theme/light_theme.dart` & `lib/theme/dark_theme.dart`
* **Details:** 
  * We completely replaced Flutter's default themes with our own customized, premium Material 3 `ThemeData`.
  * **Zero Hardcoded Colors:** Throughout the entire UI (like `lib/widgets/subject_card.dart`), colors are accessed strictly using `Theme.of(context).colorScheme`.

### ⚡ 8. State Management (Provider & NO `setState()`)
* **Status:** ✅ Fulfilled
* **Files:** `lib/main.dart` & the entire `lib/providers/` directory.
* **Details:** 
  * The entire app logic uses the **Provider** package (`MultiProvider`, `ChangeNotifier`, `Consumer`).
  * The codebase was scanned rigorously, and there is **not a single `StatefulWidget` or `setState()`** anywhere in the project.

### 🐙 9. GitHub Repository
* **Status:** ✅ Fulfilled
* **Details:** 
  * The project was uploaded to a public GitHub repository.
  * Contains over **7 meaningful commits**.
  * Contains a highly professional `README.md` with features and run instructions.
  * The project successfully builds and runs using `flutter run` without any compilation or codebase errors.
