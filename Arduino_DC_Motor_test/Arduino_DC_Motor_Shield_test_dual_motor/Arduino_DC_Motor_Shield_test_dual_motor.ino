/*
 * Arduino Motor Shield 2-Channel DC Motor Demo
 * Note to self: 2-Channel means two motors
 * Links: https://duino4projects.com/arduino-motor-shield-tutorial/
 * https://www.instructables.com/id/Arduino-Motor-Shield-Tutorial/
 */


void setup() {
  // Setup Channel A
  pinMode(12, OUTPUT); //Initiates Motor Channel A pin
  pinMode(9, OUTPUT); //Initiates Brake Channel A pin

  //Setup Channel B
  pinMode(13, OUTPUT); //Initiates Motor Channel B pin
  pinMode(8, OUTPUT); //Initiates Brake Channel B pin
}

void loop() {
  //Motor A forward @ full speed
  digitalWrite(12, HIGH); //Establishes forward direction of Channel A
  digitalWrite(9, LOW); //Disengage the Brake for Channel A
  analogWrite(3, 255); //Spins the motor on Channel A at full speed

  //Motor B backward @ half speed
  digitalWrite(13, LOW); //Establishes backward direction of Channel B
  digitalWrite(8, LOW); //Disengage the Brake for Channel B
  analogWrite(11, 128); //Spins the motor on Channel B at half speed

  delay(3000);

  digitalWrite(9, HIGH); //Engage the Brake for Channel A
  digitalWrite(8, HIGH); //Engage the Brake for Channel B

  delay(1000);

  //Motor A forward @ full speed
  digitalWrite(12, LOW); //Establishes backward direction of Channel A
  digitalWrite(9, LOW); //Disengage the Brake for Channel A
  analogWrite(11, 255); //Spins the motor on Channel B at full speed

  delay(3000);

  digitalWrite(9, HIGH); //Engage the Brake for Channel A
  digitalWrite(8, HIGH); //Engage the Brake for Channel B

  delay(1000);
}
