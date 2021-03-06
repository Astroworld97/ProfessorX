/*
 * Motor Shield 1-Channel DC Motor Demo
 * Links: https://duino4projects.com/arduino-motor-shield-tutorial/
 * http://www.instructables.com/id/Arduino-Motor-Shield-Tutorial/
 */


void setup() {
  // Setup Channel A
  pinMode(12, OUTPUT); //Initiates Motor Channel A pin
  pinMode(9, OUTPUT); //Initiates Brake Channel A pin
}

void loop() {
  // forward @ full speed
  digitalWrite(12, HIGH); //establishes forward direction of Channel A
  digitalWrite(9, LOW); //Disengage the Brake for Channel A
  analogWrite(3, 255); //Spins the motor on Channel A at full speed

  delay(3000); //Delay for 3 seconds or 3000 milliseconds

  digitalWrite(9, HIGH); //Engage the Brake for Channel A

  delay(1000);

  //backward @ half speed
  digitalWrite(12, LOW); //Establishes backward direction of Channel A
  digitalWrite(9, LOW); //Disengage the Brake for Channel A
  analogWrite(3, 128); //Spins the motor on Channel A at half speed

  delay(3000);

  digitalWrite(9, HIGH); //Engage the Brake for Channel A

  delay(1000);
}
