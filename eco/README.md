# 🚀 How to Run EcoTrack on All Devices (Windows, macOS, Android, iPhone)

This guide provides step-by-step instructions on how to run this Flutter project on **Windows Desktop**, **macOS Desktop**, **Android Phone**, and **iPhone**.

---

## 📱 1. Running on Android Phone

To run the app on a physical Android device:

**Prerequisites:**
- Flutter SDK installed and working.
- Android Studio installed.

**Steps:**
1. **Enable Developer Options:** On your phone, go to **Settings > About phone**, and tap **Build number** 7 times.
2. **Enable USB Debugging:** Go back to **Settings > System > Developer options** and turn on **USB debugging**.
3. **Connect your phone:** Plug your phone into your computer using a USB cable. If prompted on the phone, tap "Allow USB debugging".
4. **Check the connection:** Open a terminal and run:
   ```bash
   flutter devices
   ```
   You should see your phone listed.
5. **Run the app:**
   ```bash
   flutter run
   ```
   *If multiple devices are connected, use `flutter run -d <device_id>` or `flutter run -d android`.*

---

## 🍏 2. Running on iPhone (Physical Device)

*Note: You MUST have a Mac computer to run the app on an iPhone.*

**Prerequisites:**
- macOS computer.
- Xcode installed (from the Mac App Store).
- An Apple ID (Free developer account works).
- CocoaPods (`brew install cocoapods`).

**Steps:**
1. **Connect your iPhone:** Plug your iPhone into your Mac via USB. Unlock the phone and tap **Trust** when prompted "Trust This Computer?".
2. **Open the iOS project:** In your terminal, navigate to the project root and open the Xcode workspace:
   ```bash
   open ios/Runner.xcworkspace
   ```
3. **Configure Signing in Xcode:**
   - In Xcode, select the **Runner** project in the left navigation panel.
   - Go to the **Signing & Capabilities** tab.
   - Check **"Automatically manage signing"**.
   - Under **Team**, sign in with your Apple ID and select your personal team.
   - *If an error about "Bundle Identifier" appears, change it slightly (e.g., `com.ecohack.ecotrack123`).*
4. **Trust the Developer Profile on iPhone:**
   - On your iPhone, go to **Settings > General > VPN & Device Management**.
   - Tap your Apple ID profile and tap **Trust**.
5. **Run the app:**
   - You can click the **Play** button in Xcode (Make sure your iPhone is selected as the destination at the top).
   - Alternatively, back in your terminal at the project root:
     ```bash
     flutter run -d ios
     ```

---

## 🪟 3. Running as a Windows Desktop App

*Note: You must be on a Windows PC.*

**Prerequisites:**
- Flutter SDK installed.
- **Visual Studio 2022** (Not VS Code) installed with the **"Desktop development with C++"** workload.

**Steps:**
1. **Enable Windows Desktop support:** If you haven't already, enable Windows support in Flutter:
   ```bash
   flutter config --enable-windows-desktop
   ```
2. **Check requirements:**
   ```bash
   flutter doctor
   ```
   Ensure "Visual Studio" has a green checkmark.
3. **Run the app:**
   ```bash
   flutter run -d windows
   ```
   A native Windows application window should launch.

---

## 🍎 4. Running as a macOS Desktop App

*Note: You must be on a Mac.*

**Prerequisites:**
- Xcode installed.
- CocoaPods installed (`brew install cocoapods`).

**Steps:**
1. **Enable macOS Desktop support:**
   ```bash
   flutter config --enable-macos-desktop
   ```
2. **Check requirements:**
   ```bash
   flutter doctor
   ```
   Ensure Xcode has a green checkmark.
3. **Setup macOS project:** (Only needed if the `macos` folder doesn't exist or needs updating)
   ```bash
   flutter create --platforms=macos .
   ```
4. **Run the app:**
   ```bash
   flutter run -d macos
   ```
   A native macOS application window should launch.

---

### General Troubleshooting
- **No devices found:** Run `flutter run` and if it says "No supported devices connected", ensure your device is plugged in, unlocked, and debugging/trust is enabled.
- **Dependency issues:** If you get strange errors, try cleaning the project:
  ```bash
  flutter clean
  flutter pub get
  ```
- **Check your setup:** If you are missing something, `flutter doctor` will tell you exactly what you need to install.
