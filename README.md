# Castollux

Castollux is a Flutter persona catalog. Persona records are stored locally on
the device.

## Run

```sh
flutter pub get
flutter run
```

Run the checks with:

```sh
flutter analyze
flutter test
```

## Structure

- `lib/main.dart` initializes local storage and starts the app.
- `lib/app/` contains app setup and shared theme.
- `lib/features/personas/models/` defines the persona data model and options.
- `lib/features/personas/data/` handles local persistence.
- `lib/features/personas/presentation/` contains the list, create, and detail screens.
- `test/` covers the persona creation and detail flow.
- `android/`, `ios/`, `web/`, `linux/`, `macos/`, and `windows/` contain Flutter platform runners.

The original SwiftUI project is retained separately as an untouched reference;
this app uses the platform runners in `ios/`.
