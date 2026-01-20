# Gym Landing App

A responsive Flutter landing page for a gym and fitness platform, built as a technical assignment. The project demonstrates clean UI structure, responsive layouts, animations, and Supabase integration for email waitlist collection.

## Purpose of This Project

This project was built as part of a recruitment assignment to demonstrate:
- Flutter UI composition and layout control
- Responsive design for web and mobile
- Asset handling and theming
- Backend integration using Supabase
- Clean project structure and readable code

## Stack
- Flutter 3.10.x
- Dart
- Supabase (email waitlist backend)
- Material 3 theming

## Assignment Requirements Coverage

| Requirement        | Implementation                                                        |
|--------------------|-----------------------------------------------------------------------|
| Hero section       | Full-width hero with background image, gradient overlay, headline, subtext, and CTA |
| Features section   | Three feature cards with icons/images and descriptions                |
| Call-to-action     | Primary CTA button in hero and waitlist section                       |
| Email input        | Validated email field                                                 |
| Backend integration| Supabase insert into waitlist table                                   |
| Duplicate handling | Unique email constraint with error handling                           |
| Responsive layout  | Desktop two-column layout, mobile stacked layout                      |
| Animations         | Entrance animations, hover effects, CTA pulse                         |
| Assets usage       | Local images registered via pubspec.yaml                              |
| Screenshots        | Included during submission                                            |

This table exists to allow quick verification of task completion.

## Features

### Hero Section
- Background image with layered left-to-right gradient for readability
- Animated headline and supporting text
- Primary CTA button that scrolls to the waitlist section
- Responsive two-column layout on web, stacked layout on mobile

### Features Section
- Three feature cards representing platform capabilities
- Image-based visuals loaded from local assets
- Hover lift and scale effects on web
- Staggered fade and slide entrance animations

### Waitlist Section
- Email input with validation
- Submission handled via Supabase
- Duplicate email protection using database constraint
- Success and error feedback using snackbars
- Width-constrained layout on large screens

## Project Structure
```
lib/
├─ core/
│  ├─ app.dart                 # Root MaterialApp
│  ├─ config/
│  │  └─ supabase_config.dart  # Supabase initialization
│  └─ theme/
│     └─ app_theme.dart        # Colors, typography, components
├─ features/
│  └─ landing/
│     ├─ landing_screen.dart
│     └─ widgets/
│        ├─ hero_section.dart
│        ├─ features_section.dart
│        └─ waitlist_section.dart
├─ services/
│  └─ waitlist_service.dart    # Supabase interaction logic
├─ widgets/
│  ├─ buttons/
│  │  └─ primary_button.dart
│  └─ inputs/
│     └─ custom_text_field.dart
└─ main.dart
```

The structure follows feature-based separation to keep UI, logic, and configuration isolated and scalable.

## Assets

Registered in `pubspec.yaml`:
```
assets/images/
```

Used assets include:
- `hero_1.png` for hero background
- Feature-related images such as maps, diet tracking, and personalized workouts

All images are bundled locally and loaded via `Image.asset`.

## Responsive Design and Animations
- Breakpoint at 800px for web vs mobile layout
- Hero height scales with viewport
- Feature cards switch from row to column on smaller screens
- Hover interactions applied only where pointer input is available
- Subtle entrance animations to improve perceived performance without distraction

## Design System
- **Primary color**: Deep purple `#7C3AED`
- **Accent color**: Pink `#EC4899`
- **Background**: Dark neutral tones
- **Typography hierarchy** defined centrally in `app_theme.dart`
- Reusable buttons and inputs for consistency

## Supabase Configuration

Create a waitlist table:
```sql
CREATE TABLE waitlist (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

Supabase credentials are configured in:
```
lib/core/config/supabase_config.dart
```

Row Level Security policies should allow inserts based on project needs.

## Setup
```bash
flutter pub get
flutter run
```

Web-specific run:
```bash
flutter run -d chrome
```

## Testing
```bash
flutter test
```

## Production Builds
```bash
flutter build web
flutter build apk --release
flutter build ios --release
```

## Code Style
- Follows Dart and Flutter conventions
- Widgets kept small and focused
- Clear naming and minimal logic in UI layers
- Business logic isolated in services

## License
MIT

## Author
Hassaan Raheel
