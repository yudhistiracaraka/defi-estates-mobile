# DeFi Estates Mobile Assessment

Technical assessment submission for the Mobile Developer task. This project is a Flutter-based mobile adaptation of the DeFi Estates core product from `DREI-3ff-main`, rebuilt with a mobile-first experience, responsive layouts, Riverpod state management, reusable theming, and a cleaner feature-oriented structure.

## Demo Video

[Watch the demo video](https://drive.google.com/file/d/1x1mIcNPFanE5wOUrq08JiLyIpYb27cID/view?usp=sharing)

## Assessment Context

This submission is based on **Option 4: Mobile Developer** from the provided assessment.

Objective:
- Create a mobile version of an existing page from the project
- Keep the experience responsive and clean on mobile devices
- Follow platform-friendly UI patterns
- Support common screen sizes

## What Was Built

This mobile app adapts the DeFi Estates concept from the provided core project into a Flutter application with:

- Mobile-first responsive UI
- Multi-page navigation flow
- Property browsing and filtering
- Property detail view
- Investor dashboard flow
- Admin dashboard flow
- Reusable theme, color system, and common widgets
- Riverpod-based state management

## Implemented Screens

- Home
- Browse Properties
- Property Detail
- User Dashboard
- Admin Dashboard
- About
- Wallet Connection Sheet
- Purchase Sheet

## Key Features

- Responsive layouts for small phones, large phones, and wider layouts
- Property search and filter by location, status, min price, and max price
- Mock investor and admin wallet flows
- Property metrics, funding progress, and token purchase simulation
- Feature-first structure for improved maintainability
- Centralized route constants
- Centralized app colors, text theme, and app theme
- Reusable widgets for shared UI patterns

## Architecture

The project follows a simplified clean and feature-first structure:

```text
lib/
  core/
    constants/
    theme/
    utils/
    widgets/
  features/
    about/
    admin/
    app/
    browse/
    home/
    properties/
    user/
    wallet/
```

Patterns used:

- `core` for shared constants, theme, utilities, and reusable widgets
- `features` for isolated presentation, application, domain, and data concerns
- Riverpod providers and notifiers for state management
- Stateless reusable UI components extracted into dedicated widget files

## Tech Stack

- Flutter
- Dart
- Flutter Riverpod

## State Management

Riverpod is used for:

- Wallet state
- Repository access
- Property list and featured property state
- Browse filters and filtered results
- Portfolio and transactions
- Contract deployment data

## Design System and Reusability

The app includes centralized styling and shared UI building blocks:

- `lib/core/theme/app_colors.dart`
- `lib/core/theme/app_text_theme.dart`
- `lib/core/theme/app_theme.dart`
- `lib/core/constants/app_routes.dart`
- `lib/core/widgets/common/`

This keeps colors, typography, routes, and repeated UI patterns consistent across the app.

## Demo Data

This submission uses mock data and simulated flows for:

- Properties
- Transactions
- Portfolio
- Contract deployments
- Wallet roles

No live backend or blockchain integration is required for this mobile assessment submission.

## Run the Project

### Prerequisites

- Flutter SDK installed
- Dart SDK installed through Flutter
- Android Studio / VS Code
- Android device or emulator

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

If using VS Code, a launch configuration is already included in:

```text
.vscode/launch.json
```

So the app can be started directly from **Run and Debug**.

## Validation

Verified with:

- `flutter analyze`
- `flutter test`

## Notes

- The app is built as a mobile interpretation of the provided core project, not as a direct 1:1 port of the web implementation.
- The focus of this submission is code structure, responsiveness, UI clarity, and maintainability.
- Wallet and purchase flows are mocked to demonstrate product behavior in a mobile context.

## Repository Purpose

This repository is intended as a technical assessment submission and demonstration of:

- Flutter development fundamentals
- UI adaptation from existing product context
- Clean project organization
- Reusable component design
- State management with Riverpod

