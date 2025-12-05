# Flowva App

Flowva App is a referral-based Flutter application designed to engage users through a contest/giveaway mechanism. It features secure authentication, real-time countdown timers, and a seamless invitation system integrated with social sharing capabilities.

## 📱 Features

-   **User Authentication**: Secure Sign Up, Login, and Forgot Password functionality powered by Supabase.
-   **Referral System**: Specialized referral links with copy-to-clipboard functionality.
-   **Social Sharing**: Integrated placeholders for sharing via WhatsApp, Twitter (X), and LinkedIn.
-   **Real-time Countdown**: Live countdown timer for contest deadlines.
-   **Persistent Session**: Automatic login state persistence using SharedPreferences.
-   **Responsive UI**: Custom designs with fancy snackbars, optimized SVG assets, and fluid animations.

## 🛠 Tech Stack

-   **Framework**: Flutter (Dart)
-   **Backend**: Supabase (Auth & Database)
-   **State Management**: Provider
-   **Architecture**: Feature-First / Clean Architecture
-   **Local Storage**: Shared Preferences
-   **Environment Management**: flutter_dotenv

## 📂 Code Structure

The project follows a **Feature-First** architecture to ensure scalability and maintainability.

```
lib/
├── core/
│   ├── app/                # Root app configuration (e.g., app.dart)
│   ├── extensions/         # Dart extensions (Validation, Navigation)
│   ├── resources/          # Shared resources (Colors, Drawables/Assets)
│   └── widgets/            # Reusable UI components (Buttons, Inputs, SVGs)
├── features/
│   ├── auth/               # Authentication feature
│   │   ├── data/           # Repositories & Data Sources
│   │   ├── manager/        # State Management (AuthProvider)
│   │   └── screens/        # UI Screens (Login, SignUp, ForgotPassword)
│   ├── home/               # Home/Dashboard feature
│   │   └── screens/        # Home Screen with Timer & Referral logic
│   └── splash_screen/      # Initial App Entry & Session Check
└── main.dart               # Entry point & Initializations
```

## 🚀 Getting Started

### Prerequisites

-   [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
-   A [Supabase](https://supabase.com/) project created.

### 1. Setup Environment Variables

Create a `.env` file in the root directory of the project. This file is ignored by git for security.

```bash
touch .env
```

Add your Supabase credentials to the `.env` file:

```env
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

### 2. Install Dependencies

Run the following command to install all required packages:

```bash
flutter pub get
```

### 3. Run the Application

Connect a device or start an emulator/simulator, then run:

```bash
flutter run
```

## 🔐 Supabase Setup

1.  **Create Project**: Go to [Supabase](https://supabase.com/) and create a new project.
2.  **Enable Auth**: Go to `Authentication -> Providers` and enable **Email/Password**.
3.  **Get Keys**: Go to `Settings -> API` to find your `Project URL` and `anon` public key. Paste these into your `.env` file.

### Initialization Configuration

The application authenticates with Supabase at startup. This logic is handled in `lib/main.dart` using the environment variables:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Supabase
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );

  runApp(const MyApp());
}
```

## 🔗 Links

-   [Download APK](https://drive.google.com/file/d/1c30kss5KC-bLE3ZYwR-4DF28_rGN9RVg/view?usp=sharing)
-   [Live Web App](LINK_TO_LIVE_WEB_URL)
