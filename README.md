```
# Flutter Todo App with Stacked and Hive

A simple Todo application built using Flutter, with Stacked for state management and Hive for local data storage.

## Features

- Add new todos
- Display list of todos
- Mark todos as complete or incomplete
- Edit todo titles
- Delete todos
- Local data persistence using Hive

## dependencies

- [Flutter](https://flutter.dev/)
- [Stacked](https://pub.dev/packages/stacked)
- [Hive](https://pub.dev/packages/hive)
- [GetIt](https://pub.dev/packages/get_it)

## Getting Started

1. Ensure you have [Flutter](https://flutter.dev/docs/get-started/install) installed.
2. Clone this repository:
   ```
   git clone https://github.com/Stoic2002/flutter_todoapp_stacked.git
   ```
3. Navigate to the project directory:
   ```
   cd flutter-todo-app
   ```
4. Run `flutter pub get` to install dependencies.
5. Run `flutter pub run build_runner build` to generate necessary code.
6. Run the app:
   ```
   flutter run
   ```

## Project Structure

```
lib/
  ├── app/
  │   ├── app.dart
  │   └── locator.dart
  ├── models/
  │   └── todo.dart
  ├── services/
  │   └── todo_service.dart
  ├── ui/
  │   ├── views/
  │   │   └── home/
  │   │       ├── home_view.dart
  │   │       └── home_viewmodel.dart
  └── main.dart
```