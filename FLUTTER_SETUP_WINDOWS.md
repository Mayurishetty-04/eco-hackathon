# 🪟 Flutter Setup Guide — Windows Only

> Complete, step-by-step instructions to set up Flutter on Windows for the EcoTrack project.

---

## 📋 Prerequisites Checklist

Before starting, make sure you have:

- [ ] Windows 10 or Windows 11 (64-bit)
- [ ] At least 10 GB of free disk space
- [ ] An internet connection
- [ ] Git for Windows installed → https://git-scm.com/download/win
- [ ] A code editor (VS Code recommended) → https://code.visualstudio.com/

---

## STEP 1 — Download Flutter SDK

1. Go to the official Flutter installation page:  
   👉 https://docs.flutter.dev/get-started/install/windows

2. Under **"Get the Flutter SDK"**, click the **Download Flutter SDK** button to get the `.zip` file.

3. **Extract** the zip file to a recommended location:
   ```
   C:\src\flutter
   ```

   ⚠️ **Important Rules:**
   - Do NOT extract to `C:\Program Files\` (requires admin access)
   - Do NOT use paths with **spaces** (e.g., avoid `C:\My Flutter\`)
   - Do NOT use paths with **special characters**

---

## STEP 2 — Add Flutter to System PATH

1. Press `Win + S` and search for **"Edit the system environment variables"** — click it.

2. In the dialog that opens, click **"Environment Variables..."**

3. In the **"User variables"** section (top half), find the variable named `Path`:
   - Click on it → click **Edit**
   - Click **New**
   - Type the path to Flutter's `bin` folder:
     ```
     C:\src\flutter\bin
     ```
   - Click **OK** on all dialogs.

4. Open a **new** PowerShell window (important — old windows won't reflect changes):
   ```powershell
   flutter --version
   ```
   You should see the Flutter version printed. ✅

---

## STEP 3 — Install Android Studio

1. Download Android Studio from:  
   👉 https://developer.android.com/studio

2. Run the installer → use **Standard** settings.

3. On first launch, the **Setup Wizard** will automatically install:
   - Android SDK
   - Android SDK Platform-Tools
   - Android Emulator

4. Accept all Android SDK licenses:
   ```powershell
   flutter doctor --android-licenses
   ```
   Type `y` and press `Enter` for each prompt.

---

## STEP 4 — Configure Android SDK Environment Variables

1. Open **Environment Variables** again (same as Step 2).

2. Under **"User variables"**, click **New** and create:

   | Variable Name  | Variable Value                                          |
   |----------------|----------------------------------------------------------|
   | `ANDROID_HOME` | `C:\Users\<YourUsername>\AppData\Local\Android\Sdk`     |

   > Replace `<YourUsername>` with your actual Windows username.

3. Add the following to the `Path` variable (click **Edit**, then **New**):
   ```
   %ANDROID_HOME%\tools
   %ANDROID_HOME%\platform-tools
   ```

4. Confirm by opening a new PowerShell and running:
   ```powershell
   adb --version
   ```

---

## STEP 5 — Install Required Android SDK Components

1. Open **Android Studio**
2. Go to `Tools > SDK Manager`
3. Under **"SDK Platforms"** tab:
   - ✅ Check **Android 13.0 (API Level 33)** or latest stable
4. Under **"SDK Tools"** tab:
   - ✅ Android SDK Build-Tools
   - ✅ Android Emulator
   - ✅ Android SDK Platform-Tools
   - ✅ **Android SDK Command-line Tools (latest)** ← often missed!
5. Click **Apply** → **OK**

---

## STEP 6 — Create an Android Emulator (AVD)

### Option A: Using Android Studio (Recommended)

1. In Android Studio, click **Device Manager** (right-side panel or `Tools > Device Manager`)
2. Click **Create Device**
3. Select a hardware profile: e.g., **Pixel 6**
4. Select a System Image: e.g., **API 33 — Android 13** (download if needed)
5. Click **Finish**
6. Click the ▶️ **Play** button to launch the emulator

### Option B: Using the Command Line

```powershell
# List available emulators
flutter emulators

# Create a new emulator (requires AVD Manager in PATH)
avdmanager create avd -n "Pixel6_API33" -k "system-images;android-33;google_apis;x86_64"

# Launch the emulator
flutter emulators --launch Pixel6_API33
```

---

## STEP 7 — Install VS Code Flutter Extensions

1. Open **VS Code**
2. Go to Extensions (`Ctrl + Shift + X`)
3. Search and install:
   - ✅ **Flutter** (by Dart Code)
   - ✅ **Dart** (by Dart Code)
   - ✅ **Pubspec Assist** (optional, helpful)

---

## STEP 8 — Run Flutter Doctor

Run the full diagnostic check:

```powershell
flutter doctor -v
```

### Understanding the Output

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x, ...)
[✓] Windows Version ...
[✓] Android toolchain - develop for Android devices
[✓] Chrome - develop for the web
[✓] Visual Studio - develop Windows apps
[✓] Android Studio ...
[✓] VS Code ...
[✓] Connected device (2 available)
[✓] Network resources
```

### Common Issues & Fixes

| ❌ Issue | ✅ Fix |
|---------|--------|
| `Android toolchain` — licenses not accepted | Run `flutter doctor --android-licenses` |
| `cmdline-tools component is missing` | Android Studio → SDK Manager → SDK Tools → ✅ Android SDK Command-line Tools |
| `Visual Studio` not detected (Desktop) | Install [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/) → select **"Desktop development with C++"** workload |
| `Chrome` not detected | Install Google Chrome or set `$env:CHROME_EXECUTABLE="C:\path\to\chrome.exe"` |
| `Unable to locate Android SDK` | Set `ANDROID_HOME` environment variable (Step 4) |
| `flutter command not found` | Close all terminals and reopen — PATH change requires new shell session |

---

## STEP 9 — Verify Full Setup

```powershell
# Check Flutter version
flutter --version

# Check connected devices
flutter devices

# Check all tools
flutter doctor -v
```

All items should show ✅. You're ready to build! 🚀

---

## 🧹 Optional: Enable Desktop Support (Windows)

```powershell
flutter config --enable-windows-desktop
flutter devices   # Should now show "Windows" as a target
flutter run -d windows
```

---

## 📝 Quick Reference Commands

```powershell
flutter --version                        # Show Flutter version
flutter doctor -v                        # Full diagnostic
flutter doctor --android-licenses        # Accept Android licenses
flutter devices                          # List connected devices
flutter emulators                        # List available emulators
flutter emulators --launch <id>          # Launch an emulator
flutter create <project_name>            # Create new project
flutter pub get                          # Install dependencies
flutter run                              # Run app
flutter build apk --release             # Build Android APK
flutter build windows                   # Build Windows desktop app
flutter clean                            # Clean build cache
flutter upgrade                          # Upgrade Flutter SDK
```

---

> ✅ Once all checks pass, proceed to the main [README.md](./README.md) for project initialization steps.
