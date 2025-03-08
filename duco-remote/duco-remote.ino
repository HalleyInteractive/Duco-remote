#include <RadioLib.h>

// Define the CC1101 module
CC1101 radio = new Module(10, 2, 9, 8); // Replace with your actual pins (CS, DIO0, GDO2, GDO0)

void setup() {
  Serial.begin(9600);
  Serial.println(F("Starting CC1101 test"));

  // Initialize the radio module
  int state = radio.begin(868.326); // Set frequency to 868.326 MHz

  if (state == RADIOLIB_ERR_NONE) {
    Serial.println(F("CC1101 initialization successful!"));
  } else {
    Serial.print(F("CC1101 initialization failed, code "));
    Serial.println(state);
    while (true); // Stop execution if initialization fails
  }

  // Configure parameters (adjust as needed)
  radio.setBitrate(38.3835); // Set bitrate (kbps)
  radio.setFrequencyDeviation(20.629883); // Set frequency deviation (kHz)
  radio.setRxBandwidth(101.562500); // Set receive bandwidth (kHz)
  radio.setModulation(RADIOLIB_GFSK); // Set modulation to GFSK
}

void loop() {
  // Your main code will go here. For example, sending or receiving data.
  // Example of sending:
  // String message = "Hello, world!";
  // int state = radio.transmit(message);
  // if (state == RADIOLIB_ERR_NONE) {
  //   Serial.println(F("Transmission successful!"));
  // } else {
  //   Serial.print(F("Transmission failed, code "));
  //   Serial.println(state);
  // }
  delay(1000); // Wait for 1 second
}