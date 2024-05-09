#!/bin/sh
set -e

BASE_DIR="$(readlink -f $0 | xargs dirname)"
BUILD_DIR="$BASE_DIR/.build"
SCIPIO_GIT_URL=https://github.com/giginet/Scipio.git
SCIPIO_GIT_TAG=0.18.2
SCIPIO_GIT_DIR="$BASE_DIR/.build/scipio"
SCIPIO_BIN="$SCIPIO_GIT_DIR/.build/release/scipio"
TCA_GIT_URL=https://github.com/pointfreeco/swift-composable-architecture.git
TCA_GIT_TAG=1.10.3
TCA_GIT_DIR="$BASE_DIR/.build/swift-composable-architecture"
FRAMEWORKS_DIR="$BASE_DIR/Frameworks"
MACROS_DIR="$BASE_DIR/Macros"

message() { 
  echo "\n\033[1;32m▶ $1\033[0m\n"
}

message "🧹 Clean build directory"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

message "⬇️ Fetch Scipio"
git clone --depth 1 --branch "$SCIPIO_GIT_TAG" "$SCIPIO_GIT_URL" "$SCIPIO_GIT_DIR"

message "⬇️ Fetch swift-composable-architecture"
git clone --depth 1 --branch "$TCA_GIT_TAG" "$TCA_GIT_URL" "$TCA_GIT_DIR"

message "🏗️ Build Scipio"
(cd "$SCIPIO_GIT_DIR"; swift build -c release)

message "🏗️ Build XCFrameworks"
"$SCIPIO_BIN" create\
  "$TCA_GIT_DIR"\
  --output "$FRAMEWORKS_DIR"\
  --configuration release\
  --embed-debug-symbols\
  --support-simulators\
  --overwrite\
  --platforms iOS\
  --platforms macOS

message "🏗️ Build Swift Macros"
(cd "$TCA_GIT_DIR"; swift build -c release)
mkdir -p "$MACROS_DIR"
cp -fp "$TCA_GIT_DIR/.build/release/CasePathsMacros" "$MACROS_DIR/"
cp -fp "$TCA_GIT_DIR/.build/release/ComposableArchitectureMacros" "$MACROS_DIR/"
cp -fp "$TCA_GIT_DIR/.build/release/DependenciesMacrosPlugin" "$MACROS_DIR/"
cp -fp "$TCA_GIT_DIR/.build/release/PerceptionMacros" "$MACROS_DIR/"

message "✅ Done"
