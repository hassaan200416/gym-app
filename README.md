# Gym Landing App

A modern, responsive Flutter landing page application for a gym management platform. Features a beautiful hero section, feature showcase, and email waitlist collection integrated with Supabase.

## 🚀 Features

- **Hero Section**: Full-screen background image with animated text and CTA button
- **Features Section**: Three animated feature cards showcasing key benefits
- **Waitlist Section**: Email collection form with validation and Supabase integration
- **Responsive Design**: Optimized for both web and mobile devices
- **Smooth Animations**: Entrance animations, hover effects, and transitions
- **Dark Theme**: Modern dark theme with purple/pink accent colors

## 📋 Prerequisites

- Flutter SDK (3.10.7 or higher)
- Dart SDK
- Supabase account and project
- Git (for version control)

## 🛠️ Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd gym_landing_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Supabase**
   - Open `lib/core/config/supabase_config.dart`
   - Replace `supabaseUrl` and `supabaseAnonKey` with your Supabase project credentials
   - Ensure you have a `waitlist` table in your Supabase database with:
     - `email` column (text, unique, not null)
     - Row Level Security (RLS) policies configured as needed

4. **Run the application**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── core/                    # Core application configuration
│   ├── app.dart            # Root MaterialApp widget
│   ├── config/
│   │   └── supabase_config.dart  # Supabase configuration
│   └── theme/
│       └── app_theme.dart   # Application theme
├── features/                # Feature-based modules
│   └── landing/
│       ├── landing_screen.dart
│       └── widgets/
│           ├── hero_section.dart
│           ├── features_section.dart
│           └── waitlist_section.dart
├── services/               # Business logic services
│   └── waitlist_service.dart
├── widgets/               # Reusable UI components
│   ├── buttons/
│   │   └── primary_button.dart
│   └── inputs/
│       └── custom_text_field.dart
└── main.dart              # Application entry point
```

## 🎨 Design System

### Colors
- **Primary**: Deep Purple (`#7C3AED`)
- **Secondary**: Pink Accent (`#EC4899`)
- **Background**: Very Dark (`#0F0F0F`)
- **Surface**: Dark (`#1A1A1A`)

### Typography
- **Headline**: 72px (web) / 52px (mobile), Bold (900)
- **Subheadline**: 24px (web) / 20px (mobile), Medium (500)
- **Body**: 18px, Regular

## 🔧 Configuration

### Supabase Setup

1. Create a Supabase project at [supabase.com](https://supabase.com)
2. Create a `waitlist` table:
   ```sql
   CREATE TABLE waitlist (
     id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
     email TEXT UNIQUE NOT NULL,
     created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
   );
   ```
3. Configure Row Level Security (RLS) policies as needed
4. Update credentials in `lib/core/config/supabase_config.dart`

## 📱 Responsive Breakpoints

- **Mobile**: < 800px width
- **Web**: ≥ 800px width

The application automatically adjusts layouts, font sizes, and spacing based on screen width.

## 🎬 Animations

- **Hero Section**: Fade and slide entrance animations
- **Features Section**: Staggered card animations
- **CTA Button**: Continuous pulse animation with hover effects
- **Feature Cards**: Scale and lift effects on hover

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 📦 Building for Production

### Web
```bash
flutter build web
```

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 Code Style

- Follow Flutter/Dart style guidelines
- Use meaningful variable and function names
- Add documentation comments for public APIs
- Keep widgets focused and reusable

## 🐛 Known Issues

- None at the moment

## 📄 License

This project is licensed under the MIT License.

## 👤 Author

Your Name

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Supabase for backend services
- Material Design for design guidelines
