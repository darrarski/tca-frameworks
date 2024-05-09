# The Composable Architecture XCFrameworks

Experimental script for building binary XCFrameworks of [Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture) and its dependencies.

## 📖 Documentation

- It's an experiment, not ready to be used in a production environment.
- Run `build.sh` and go make yourself a coffee.
- Tested with Swift 5.10 from Xcode 15.4 RC1.
- [Spicio](https://github.com/giginet/Scipio) is used for generating XCFrameworks into `Frameworks` directory.
- Generated XCFrameworks supports iOS, iOS Simulator, and macOS architecture.
- Swift Macros binaries are copied into `Macros` directory. These can be linked to a project using "Other Swift Flags" `-load-plugin-executable`.
- Script does not cache any build artifacts on its own.
- It takes ~17 minutes to fetch, build, and generate everything on a MacBook Pro with M1 Max processor.

## ⭐️ Examples

- [swift-package-example](Examples/swift-package-example) - integrating into SPM library.

## ☕️ Do you like the project?

I would love to hear if you like my work. I can help you apply any of the solutions used in this repository. Feel free to reach out to me, or if you just want to say "thanks", you can buy me a coffee.

<a href="https://www.buymeacoffee.com/darrarski" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="60" width="217" style="height: 60px !important;width: 217px !important;" ></a>

## 📄 License

Copyright © 2024 Dariusz Rybicki Darrarski

License: [MIT](LICENSE)
