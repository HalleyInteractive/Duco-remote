#!/bin/bash

# Install Arduino CLI
echo "Installing Arduino CLI..."
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

# Add Arduino CLI to PATH
echo "Adding Arduino CLI to PATH..."
export PATH="$HOME/.arduino15/bin:$PATH"

# Verify installation
echo "Checking Arduino CLI version:"
arduino-cli version

# Install ESP32 board support
echo "Installing ESP32 board support..."
arduino-cli core update-index
arduino-cli core install esp32:esp32

# Install library dependencies
echo "Installing library dependencies..."
if [ -f "libraries.txt" ]; then
  cat "libraries.txt" | while IFS= read -r library; do
    # Remove leading/trailing whitespace
    library=$(echo "$library" | tr -d '[:space:]')

    # Skip empty lines and comments
    if [[ -n "$library" && ! "$library" =~ ^# ]]; then
      echo "Installing library: $library"
      arduino-cli lib install "$library"
    fi
  done
  echo "Library installation complete."
else
  echo "libraries.txt not found. Skipping library installation."
fi

echo "Arduino-CLI setup complete!"