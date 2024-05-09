# The Composable Architecture XCFrameworks - Swift Package Example

- Example package contains a single library with `Reducer` and SwiftUI `View`.
- XCFrameworks are added as binary targets (not all of them are required to run example code).
- Precompiled Swift Macros are added using swift settings unsafe flags (`-load-plugin-executable`).
- Library product compiles for iOS and macOS.
- Unit tests runs and passes on iOS.
- Unit tests does not run on macOS ("Failed to load test bundle", CasePaths).
- `Reducer._printChanges` does not work (nothing is printed to the console when running previews). This is caused by building TCA XCFramework with release configuration.
