// Arduino Bluetooth LE Servo Controlled by iOS
// https://www.raywenderlich.com/2164-arduino-tutorial-integrating-bluetooth-le-and-ios-with-swift
#include <Servo.h> //imports the servo library
#include <SoftwareSerial.h> //imports the serial communication library, which we will use to get the Bluetooth Low Energy (BLE) working


int LED = 13;     // Most Arduino boards have an onboard LED on pin 13
Servo myservo;    // Create servo object to control the servo
SoftwareSerial BLE_Shield(4,5); //This will create an instance of SoftwareSerial named BLE_Shield. The two parameters are pin numbers, so the BLE shield will use RX and TX lines 4 and 5 respectively.
//TX and RX are abbreviations for transmit and receive, respectively.

void setup() { // Called only once per startup
  pinMode(LED, OUTPUT);     // Set pin as an output
  digitalWrite(LED, HIGH);  // Turn on LED (ie set to HIGH voltage)

  myservo.attach(9);        // Attach the servo object to pin 9
  myservo.write(0);         // Initialize servo position to 0 degrees

  BLE_Shield.begin(9600);   // Setup the serial port at 9600 bps. This is the BLE Shield default baud rate. "Baud rate" is the speed at which data bits are transmitted.
}

void loop() {
   // See if new position data is available
  if (BLE_Shield.available()) {
    myservo.write(BLE_Shield.read());  // Write position to servo
  }

}
