# _app_framework

A minimal starter Flutter project setup with an about page and **provider** that provides dependency injection and pub/sub capabilities.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Copying as a startup for a new project

- Use git to clone this project to a local folder. Note that there may be branches containing optional elements on top of the starting framework e.g. PWA
- Rename the newly cloned local folder to match your new app name
- CD into the newly cloned/renamed folder
- Remove the .git folder (may be hidden) from the newly cloned/renamed folder
- Open the newly cloned/renamed folder in VSCode
- Execute from a Terminal in VSCode

        flutter pub global activate rename
        flutter pub global run rename --bundleId "com.example.your_app_name"
        flutter pub global run rename --appname "Your app displayname"

- Next, replace any remaining instances of the whole word "_app_framwork" with the foldername of your app using the **Edit -> Replace in files...** option of VSCode
- Update lib/services/app_settings_service.dart to match your requirements



