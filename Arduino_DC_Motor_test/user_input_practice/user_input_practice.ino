//purpose of file: to practice using the user input to control the amount of times the built-in LED will blink

int numBlinks;
String LedOnMessage = "Red LED is turned on";
String LedOffMessage = "Red LED is turned off";

void setup() {
    // initialize digital pin LED_BUILTIN as an output.
    pinMode(LED_BUILTIN, OUTPUT); //LED_BUILTIN is a string that acts as an equivalent to a pin number for the built-in LED
    digitalWrite(LED_BUILTIN, LOW);
    Serial.begin(9600);
}

void loop() {
  
   Serial.println("How Many Times Do You Want the Red LEDs to blink?"); //Prompt User for Input
   
   while (Serial.available() == 0) {
      // Wait for User to Input Data
   }
   
   numBlinks = Serial.parseInt(); //Read the data the user has input
   digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
   delay(1000);                       // wait for a second
   digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
   delay(1000);                       // wait for a second
   
    for (int counter = 1; counter <= numBlinks; counter++) {
    Serial.println(LedOnMessage);
    digitalWrite(LED_BUILTIN, HIGH);
    delay(1000);
    Serial.println(LedOffMessage);
    digitalWrite(LED_BUILTIN, LOW);
    delay(1000);
  }
  
  Serial.print("The user has choosen the number: ");
  Serial.println(numBlinks);
  Serial.println(" ");
}
