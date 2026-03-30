# 🌱 EcoTrack — Sustainability & Waste Management App

> A Flutter-first hackathon project for Sustainability & Waste Management.  
> Built by a team, feature-by-feature — fast, clean, and conflict-free.

---

## 📋 Table of Contents

- [About the Project](#about-the-project)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Feature Ownership](#feature-ownership)
- [Setup & Running](#setup--running)
- [Flutter Dependencies](#flutter-dependencies)
- [External Services](#external-services-optional)
- [Best Practices](#best-practices)
- [Git Workflow](#git-workflow)
- [Contribution Guidelines](#contribution-guidelines)

---

## 🌍 About the Project

**EcoTrack** is a sustainability app that helps users track waste, find eco-friendly locations, and get AI-powered recommendations — all from a single cross-platform Flutter app.

Built for a hackathon: simple, modular, and fast to develop as a team.

> **Status:** Base setup complete. Feature development in progress.

---

## 🛠 Tech Stack

| Layer | Tool | Purpose |
|-------|------|---------|
| UI | Flutter (Dart) | Cross-platform app (Android, iOS, Web) |
| State | Provider | Simple, beginner-friendly state management |
| HTTP | Dio | REST API calls to any backend |
| Routing | GoRouter | Declarative navigation (optional — use Navigator if simpler) |
| Local Storage | SharedPreferences | User prefs, cached tokens |
| Environment | flutter_dotenv | Load `.env` config |
| Fonts | google_fonts | Clean typography |

> **Why Provider over Riverpod/Bloc?**  
> For a 24-hour hackathon, Provider is the simplest choice — less boilerplate, widely understood, and fast to implement.

---

## 📂 Project Structure

This project uses a **feature-first architecture** inside `lib/`.  
Each teammate owns one feature folder and works independently.

```
lib/
│
├── core/                       # Shared app-wide config
│   ├── config/                 # App constants, env loader, API base URL
│   ├── theme/                  # Colors, text styles, ThemeData
│   ├── utils/                  # Date helpers, formatters, validators
│   └── errors/                 # Custom exception classes
│
├── features/                   # 🚀 Main development area
│   │
│   ├── dashboard/              # Home screen — summary cards, quick actions
│   │   ├── data/               # Models, API calls for this feature
│   │   └── presentation/       # Screens and widgets for this feature
│   │
│   ├── waste_tracker/          # Log and track waste disposal
│   │   ├── data/
│   │   └── presentation/
│   │
│   ├── eco_map/                # Map of nearby eco-friendly spots
│   │   ├── data/
│   │   └── presentation/
│   │
│   └── ai_classifier/          # AI waste classification (via API)
│       ├── data/
│       └── presentation/
│
├── services/                   # App-wide infrastructure
│   ├── api/                    # Dio setup, interceptors, base API client
│   └── local/                  # SharedPreferences wrapper
│
├── shared/                     # Cross-feature reusable code
│   ├── widgets/                # Common buttons, cards, loaders
│   └── models/                 # Shared data models (User, Response wrappers)
│
├── router/                     # GoRouter or Navigator configuration
│
└── main.dart                   # App entry point
```

### Why Feature-First?

| Benefit | Explanation |
|---------|-------------|
| 🙋 Team isolation | Each person works in their own `features/<name>/` folder |
| 🔀 Fewer merge conflicts | Features don't touch each other's files |
| 📦 Self-contained | Data + UI live together per feature |
| ⚡ Fast to build | Jump in and start coding without touching shared code |

---

## 👥 Feature Ownership

Assign one feature per teammate at the start of the hackathon:

| Feature Folder | Description | Owner |
|----------------|-------------|-------|
| `features/dashboard/` | Home screen, summaries | Teammate 1 |
| `features/waste_tracker/` | Log waste, history | Teammate 2 |
| `features/eco_map/` | Map of eco spots | Teammate 3 |
| `features/ai_classifier/` | AI image classifier | Teammate 4 |
| `core/` + `services/` + `shared/` | Shared infra | Team Lead |

> **Rule:** Never edit another teammate's feature folder without discussing first.

---

## ⚙️ Setup & Running

### Prerequisites
- Flutter SDK installed → see [FLUTTER_SETUP_WINDOWS.md](./FLUTTER_SETUP_WINDOWS.md)
- An Android emulator or connected device

### Steps

```powershell
# 1. Clone the repo
git clone <your-repo-url>
cd eco-hackathon

# 2. Create the Flutter project (first-time setup only)
flutter create --org com.ecohack --project-name ecotrack .

# 3. Install dependencies
flutter pub get

# 4. Set up environment
copy .env.example .env
# Open .env and fill in your API_BASE_URL

# 5. Run the app
flutter run
```

### Useful Commands

```powershell
flutter run                    # Run on emulator/device
flutter run -d chrome          # Run on browser
flutter pub get                # Install packages
flutter analyze                # Check for lint errors
flutter clean                  # Clear build cache
```

---

## 🖥️ Backend Setup (Minimal)

A simple shared Node.js server lives in the `backend/` folder.  
All teammates connect Flutter to **the same port (5000)**.

### Prerequisites
- Node.js v18+ installed → https://nodejs.org

### Steps

```powershell
# 1. Navigate to the backend folder
cd backend

# 2. Install dependencies
npm install

# 3. Create your .env file
copy .env.example .env
# .env already has PORT=5000 — no changes needed

# 4. Start the server (with auto-reload)
npm run dev
```

### Verify It's Working

Open your browser or run in PowerShell:

```powershell
# Should return: "Server running"
curl http://localhost:5000
```

Console output:
```
Server running on port 5000
```

> **⚠️ Team Note:** Every team member must use **PORT=5000** in their `.env` so Flutter's `API_BASE_URL=http://localhost:5000` points to the same server.

---

## 📦 Flutter Dependencies

Add these to your `pubspec.yaml` after `flutter create`:

```powershell
# State Management
flutter pub add provider

# Navigation
flutter pub add go_router

# HTTP Client
flutter pub add dio
flutter pub add connectivity_plus

# Local Storage
flutter pub add shared_preferences

# Environment Config
flutter pub add flutter_dotenv

# UI
flutter pub add google_fonts
flutter pub add flutter_svg
flutter pub add cached_network_image
flutter pub add shimmer

# Utilities
flutter pub add logger
flutter pub add intl

# Code Generation (if using Freezed for models)
flutter pub add freezed_annotation
flutter pub add json_annotation
flutter pub add --dev build_runner
flutter pub add --dev freezed
flutter pub add --dev json_serializable
```

---

## 🌐 External Services (Optional)

EcoTrack can connect to external backends, but they are **not part of this repo**.  
Flutter communicates with them purely via REST API through `lib/services/api/`.

| Service | Technology | When to Use |
|---------|-----------|-------------|
| Main API | Node.js + Express | Auth, CRUD, user data |
| AI Service | FastAPI (Python) | Waste image classification |
| Database | MongoDB | Managed by backend team |

> **Hackathon tip:** If the backend isn't ready, use **mock JSON data** inside `lib/features/<name>/data/` and swap it for real API calls later.

---

## ✅ Best Practices

### Hackathon Rules
- 🚀 **Build fast** — don't over-engineer; done is better than perfect
- 🧩 **Stay in your folder** — only touch your own `features/<name>/` folder
- 🎭 **Use mocks freely** — return dummy data if your API isn't ready
- 🧼 **Keep `shared/` clean** — only add things that 2+ features actually need
- 🔌 **Don't hardcode URLs** — use `.env` and the `core/config/` constants

### Naming Conventions

| Type | Style | Example |
|------|-------|---------|
| Files | `snake_case` | `waste_list_screen.dart` |
| Classes | `PascalCase` | `WasteListScreen` |
| Variables | `camelCase` | `wasteItems` |
| Folders | `snake_case` | `waste_tracker/` |
| Widget names | `PascalCase` + type suffix | `WasteItemCard`, `AddWasteButton` |

---

## 🌿 Git Workflow

```
main       → stable, demo-ready code only
develop    → active development (merge PRs here)
feature/*  → one branch per feature
```

### Branch Naming

```
feature/dashboard
feature/waste-tracker
feature/eco-map
feature/ai-classifier
fix/login-redirect
chore/setup-dio
```

### Commit Messages

```
feat: add waste logging form
fix: resolve map crash on Android
chore: configure Dio base URL
docs: update README structure
```

### Workflow

```powershell
# Start new feature
git checkout develop
git pull origin develop
git checkout -b feature/waste-tracker

# Work... commit often...
git add .
git commit -m "feat: add waste tracker screen"

# Push and open PR to develop
git push origin feature/waste-tracker
```

---

## 🤝 Contribution Guidelines

1. Branch from `develop` — **never commit directly to `main`**
2. Stick to your assigned `features/<name>/` folder
3. Run `flutter analyze` before opening a PR
4. Write a short PR description (what you built, how to test it)
5. At least **1 teammate must review** before merging

---

## 📄 License

Developed for hackathon purposes. All rights reserved by the contributors.

---

> Built with 💚 for a greener planet.