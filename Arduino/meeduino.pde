char val;         // variable to receive data from the serial port
int ledpin = 13; // Lets go with the on-board LED
     
#define BLUESMIRFON 7

void setup() {
  pinMode(ledpin, OUTPUT);  
  pinMode(BLUESMIRFON, OUTPUT);
  digitalWrite(BLUESMIRFON, HIGH);  //  Power on the BlueSMIRF 
  delay(2000);			        //Wait for BlueSMIRF to turn on
  Serial.begin(115200);          // start serial communication
}


void loop() {
  if( Serial.available() )         // if data is available to read
  {
    val = Serial.read();          // read it and store it in 'val'
  }
  if( val == 'M' )                     // if 'M' for Meego was received :)
  {
    digitalWrite(ledpin, HIGH);  // turn ON the LED
  } else { 
    digitalWrite(ledpin, LOW);   // otherwise turn it OFF
  }
  delay(100);                         // wait 100ms for next reading
}

