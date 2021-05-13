
//source: https://www.youtube.com/watch?v=6CsNSTfZXKY


int Button = 2;
int Motor = 3;

int button;
int Speed_Level;

void setup() {
  // put your setup code here, to run once:
    pinMode(Button, INPUT);
    pinMode(Motor, OUTPUT);
    
}

void loop() {
  // put your main code here, to run repeatedly:
    button = digitalRead(Button);

    if(button == 1){
      Speed_Level++;
      delay(300);
    }

    if(SpeedLevel == 4){
      SpeedLevel = 0;
    }

    if(Speed_Level == 1){
      analogWrite(Motor, 100);
    }

    else if(Speed_Level == 2){
      analogWrite(Motor, 150);
    }

    else if(Speed_Level == 3){
      analogWrite(Motor, 200);
    }

    else{
      analogWrite(Motor, 0);
    }
    
}
