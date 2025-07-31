#!/bin/bash
set -e

# === Configuration ===
SRC_FILE="MyClass.m"
OUTPUT_LIB="libMyDynamicLib.dylib"
FRAMEWORKS="-framework Foundation"

# === Compilation ===
echo "🛠️ Compiling $SRC_FILE into $OUTPUT_LIB ..."

clang -dynamiclib $FRAMEWORKS "$SRC_FILE" -o "$OUTPUT_LIB"

# === Result ===
if [[ -f "$OUTPUT_LIB" ]]; then
    echo "✅ Successfully built: $OUTPUT_LIB"
else
    echo "❌ Build failed."
    exit 1
fi