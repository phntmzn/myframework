#!/bin/bash
set -e

SRC_FILE="MyClass.m"
OBJ_FILE="MyClass.o"
OUTPUT_LIB="libMyStaticLib.a"
FRAMEWORKS="-framework Foundation"

echo "🛠️ Compiling $SRC_FILE into object file ..."
clang -c $FRAMEWORKS "$SRC_FILE" -o "$OBJ_FILE"

echo "📦 Archiving $OBJ_FILE into $OUTPUT_LIB ..."
libtool -static "$OBJ_FILE" -o "$OUTPUT_LIB"

if [[ -f "$OUTPUT_LIB" ]]; then
    echo "✅ Static library created: $OUTPUT_LIB"
else
    echo "❌ Failed to build static library."
    exit 1
fi