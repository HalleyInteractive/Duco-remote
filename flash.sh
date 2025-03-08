#!/bin/bash

# Flash compiled binary to ESP32

# Set your board FQBN (Fully Qualified Board Name)
BOARD_FQBN="esp32:esp32:esp32" # Example: esp32 board. Change as needed.

# Set the path to the compiled binary
BINARY_PATH="bin/duco-remote.ino.bin" # Adjust path as needed

# Set the serial port
SERIAL_PORT="/dev/ttyUSB0" # Example: /dev/ttyUSB0. Change as needed.

# Flash the binary
echo "Flashing $BINARY_PATH to $SERIAL_PORT..."
arduino-cli upload --fqbn $BOARD_FQBN --port $SERIAL_PORT $BINARY_PATH

# Check for upload errors
if [ $? -eq 0 ]; then
  echo "Flashing successful!"
else
  echo "Flashing failed. See error messages above."
fi