#!/bin/bash

# Compile duco-remote.ino for ESP32 and output binary to bin/

# Set your board FQBN (Fully Qualified Board Name)
BOARD_FQBN="esp32:esp32:esp32" # Example: esp32 board. Change as needed.

# Set the path to your duco-remote.ino file
SKETCH_PATH="duco-remote"

# Create the bin directory if it doesn't exist
mkdir -p bin

# Compile the sketch and output the binary to bin/
echo "Compiling $SKETCH_PATH for $BOARD_FQBN and outputting to bin/..."
arduino-cli compile --fqbn $BOARD_FQBN --output-dir bin/ $SKETCH_PATH

# Check for compilation errors
if [ $? -eq 0 ]; then
  echo "Compilation successful! Binary output to bin/."
else
  echo "Compilation failed. See error messages above."
fi