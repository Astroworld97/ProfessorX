//https://www.raywenderlich.com/2164-arduino-tutorial-integrating-bluetooth-le-and-ios-with-swift
// Arduino Bluetooth LE Motor Control by iOS

#include <SoftwareSerial.h>

SoftwareSerial BLE_Shield(4,5); //This will create an instance of SoftwareSerial named BLE_Shield. The two parameters are pin numbers, so the BLE shield will use RX and TX lines 4 and 5 respectively.

void setup() {  // Called only once per startup

  BLE_Shield.begin(9600);  // Setup the serial port at 9600 bps. This is the BLE Shield default baud rate. 
  Serial.begin(9600); //It is important to initialize both Serial and SoftwareSerial. See more details here: https://arduino.stackexchange.com/questions/3996/difference-between-softwareserial-and-serial

    // Setup Channel A
  pinMode(12, OUTPUT); //Initiates Motor Channel A pin
  pinMode(9, OUTPUT); //Initiates Brake Channel A pin

  //Setup Channel B
  pinMode(13, OUTPUT); //Initiates Motor Channel B pin
  pinMode(8, OUTPUT); //Initiates Brake Channel B pin
}

void loop() { // Continuous loop

// See if new position data is available
  if (BLE_Shield.available())
    Serial.write(BLE_Shield.read());
  if (Serial.available())
    BLE_Shield.write(Serial.read());

//  //Motor A forward @ full speed
//  digitalWrite(12, HIGH); //Establishes forward direction of Channel A
//  digitalWrite(9, LOW); //Disengage the Brake for Channel A
//  analogWrite(3, 255); //Spins the motor on Channel A at full speed
//
//  //Motor B backward @ half speed
//  digitalWrite(13, LOW); //Establishes backward direction of Channel B
//  digitalWrite(8, LOW); //Disengage the Brake for Channel B
//  analogWrite(11, 128); //Spins the motor on Channel B at half speed
//
//  delay(3000);
//
//  digitalWrite(9, HIGH); //Engage the Brake for Channel A
//  digitalWrite(8, HIGH); //Engage the Brake for Channel B
//
//  delay(1000);
//
//  //Motor A forward @ full speed
//  digitalWrite(12, LOW); //Establishes backward direction of Channel A
//  digitalWrite(9, LOW); //Disengage the Brake for Channel A
//  analogWrite(11, 255); //Spins the motor on Channel B at full speed
//
//  delay(3000);
//
//  digitalWrite(9, HIGH); //Engage the Brake for Channel A
//  digitalWrite(8, HIGH); //Engage the Brake for Channel B
//
//  delay(1000);
}

// user input practice code
