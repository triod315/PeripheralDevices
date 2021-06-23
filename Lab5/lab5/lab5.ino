// Logistic Map
// Select of the pin for each light-emitting diode (LED)
const int NbrLEDs = 10;
const int LEDpin[] = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
const int wait = 250; // Wait for 500 milliseconds
// Parameters of Logistic Map
const double r = 3.8; // Logistic map constant
double X0 = 0.3; // Initial position
double X = X0; // X0 - first calculated point
// For initializes the LED pins use setup ()
void setup() {
  for (int i = 0; i < NbrLEDs; i++) {
    pinMode(LEDpin[i], OUTPUT);
  }
}
// For turn on/off LEDs and iterates the Logistic Map use loop ()
void loop ()
{
  if (X < 0.1)
    blinkLED(LEDpin [0]) ;
  else if ((X >= 0.1 ) && (X < 0.2))
    blinkLED(LEDpin[1]);
  else if ((X >= 0.2) && (X < 0.3))
    blinkLED(LEDpin[2]);
  else if ((X >= 0.3) && (X < 0.4))
    blinkLED(LEDpin[3]);
  else if ((X >= 0.4) && (X < 0.5))
    blinkLED(LEDpin[4]);
  else if ((X >= 0.5) && (X < 0.6))
    blinkLED(LEDpin[5]);
  else if ((X >= 0.6) && (X < 0.7))
    blinkLED(LEDpin[6]);
  else if ((X >= 0.7) && (X < 0.8))
    blinkLED(LEDpin[7]);
  else if ((X >= 0.8) && (X < 0.9))
    blinkLED(LEDpin[8]);
  else
    blinkLED(LEDpin[9]);
  // Logistic Map function with iterates
  X0 = X;
  X = r * X0 * (1.0 - X0);
}
// Function for blinkLED
// turn on/off LEDs
void blinkLED(const int pin) {
  digitalWrite(pin, HIGH); // turn LED on
  delay (wait); // wait 500 milliseconds
  digitalWrite(pin, LOW); // turn LED off
}
