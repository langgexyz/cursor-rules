#!/bin/bash

# Cursor Rules initialization script

set -e

# Detect current location
if [ -f "core-rules.mdc" ]; then
    CURSOR_RULES_DIR="."
    PROJECT_ROOT=".."
else
    CURSOR_RULES_DIR="cursor-rules"
    PROJECT_ROOT="."
fi

# Check cursor-rules directory exists
if [ ! -d "$CURSOR_RULES_DIR" ]; then
    echo "Error: cursor-rules directory not found"
    exit 1
fi

# Copy .cursorrules
cp "$CURSOR_RULES_DIR/.cursorrules" "$PROJECT_ROOT/.cursorrules"

# Copy project-spec.mdc if not exists
if [ ! -f "$PROJECT_ROOT/project-spec.mdc" ]; then
    cp "$CURSOR_RULES_DIR/project-spec.template.mdc" "$PROJECT_ROOT/project-spec.mdc"
fi

echo "Done."
