
// Arduino Bluetooth LE Servo Controlled by iOS

int LED = 13;     // Most Arduino boards have an onboard LED on pin 13

void setup() {  // Called only once per startup
  pinMode(LED, OUTPUT);     // Set pin as an output
  digitalWrite(LED, HIGH);  // Turn on LED (ie set to HIGH voltage)
}

void loop() { // Continuous loop
  delay(500);
  digitalWrite(LED, LOW);
  delay(500);
  digitalWrite(LED, HIGH);
}