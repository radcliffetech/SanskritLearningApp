# Sanskrit Learning App

Sanskrit Flash Cards is a SwiftUI-based iOS app designed to help learners build and retain their Sanskrit vocabulary through engaging flashcard interactions and curated grammar content.

## Features

- Flashcard-based learning interface
- Rich detail views with tagging support
- Clean and modern UI using SwiftUI
- JSON-backed content for easy expansion

## Getting Started

1. Open the project in Xcode.
2. Build and run on the simulator or a connected device.
3. Explore articles and keywords to begin learning!

## Folder Structure

- `Models/` – App data models (Article, Symbol, etc.)
- `Resources/` – Static assets and JSON content
- `Utilities/` – Helpers like audio and JSON loading
- `ViewModels/` – Logic for interactive views
- `Views/` – Organized into feature domains:
  - `Alphabet/` – Alphabet learning views
  - `Quiz/` – Quiz flow and scoring
  - `Learning/` – Article browsing and reading
  - `Navigation/` – Tab bar and welcome screen
  - `Components/` – Reusable UI elements (e.g., TagPill, AboutView)
- `SanskritLearningAppTests/` – Unit tests
- `SanskritLearningAppUITests/` – UI tests

## Development Wishlist

- Audio playback
- Connect to Firebase/Firestore
