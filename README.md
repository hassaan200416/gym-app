# Gym Landing App

Flutter + Supabase app that currently boots into a simple landing screen, with shared UI components and a centralized Supabase configuration. It is structured to be extended later (for example with a waitlist flow or marketing site).

## High-level architecture
- `lib/main.dart` – boots the app, ensures bindings, initializes Supabase, runs `App`.
- `lib/core/app.dart` – sets global `ThemeData` and provides the root `MaterialApp` with a single `home` route (`LandingScreen` placeholder).
- `lib/core/config/supabase_config.dart` – Supabase URL/key and single initialization point (`SupabaseConfig.initialize()`), global client getter (ready for future data access).
- `lib/core/theme/app_theme.dart` – primary color, Material 3, button and input themes shared across the app.
- `lib/widgets/...` – reusable UI:
  - `buttons/primary_button.dart` – elevated button with built‑in loading state.
  - `inputs/custom_text_field.dart` – configurable text field (normal, password, numeric) with validation hook.

## Current screens and flows
- **LandingScreen** (temporary, defined in `lib/core/app.dart`):
  - Minimal `Scaffold` with centered “Landing Screen” text.
  - Intended to be replaced by a proper landing/marketing/waitlist screen in the next phase.

## Supabase details
- Config only:
  - `lib/core/config/supabase_config.dart` initializes Supabase at app startup and exposes `SupabaseConfig.client`.
- There are **no active tables or RLS-dependent features** in the current frontend code; all previous members/auth CRUD logic has been removed.

## Project structure (key dirs)
```
lib/
 ├─ core/
 │   ├─ app.dart          // App widget + LandingScreen placeholder
 │   ├─ config/
 │   │   └─ supabase_config.dart
 │   └─ theme/
 │       └─ app_theme.dart
 ├─ services/             // empty for now; reserved for future services (e.g., waitlist_service.dart)
 ├─ widgets/
 │   ├─ buttons/
 │   │   └─ primary_button.dart
 │   └─ inputs/
 │       └─ custom_text_field.dart
 └─ main.dart
```

## How to run
1) Install Flutter & Dart SDK (see `pubspec.yaml` for SDK constraint).
2) Set your Supabase URL/key in `lib/core/config/supabase_config.dart` (already populated; replace for production or use env‑based config).
3) Run `flutter pub get`.
4) Run `flutter run` for your desired platform.

## Notes / future extensions
- Add a real `LandingScreen` (e.g., marketing + waitlist form) under `lib/screens/` and wire it from `App`.
- Introduce service files under `lib/services/` (for example `waitlist_service.dart`) to encapsulate Supabase or HTTP calls.
- Add additional shared widgets (cards, form controls) under `lib/widgets/` as the UI grows.
