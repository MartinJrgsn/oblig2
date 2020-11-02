dht11
By adafruit version 1.4.0

Adafruit sin variant har fire pinner, les heller hva pinnene heter istedenfor pinne nummer for hvordan vi skal koble opp (Vcc, Ground, signal)


Neste steg

File
 Examples 
  Dht sensor library
   Dht tester


I koden
#include "DHT.h"

#define DHTTYPE DHT11 (vår er nr. 11)

Variabelen:
 h leser fuktighet
 t leser i grader celsius

Viktig å ha dht.begin(); for å lese av sensoren


NÅ ER DET SNAKK OM ENUM

enum days{mon=1, tue, wed, thu, fri, sat, sun}
//da blir tue 2,wed 3 osv
//enum days{mon=1, tue=5, wed, thu, fri, sat, sun}
//her blir tue 5, wed 6, thu 7 osv
//ikke lurt at: man=1,tue=0, for da blir tue =1


void setup() {
Serial.begin(9600);
}

void loop() {
days today = mon;
if(today == mon) {
Serial.println("Det er mandag"};
Serial.println(mon); //verdien til mon
}
}


Idé for LAB8 forbedring:

enum binary{000, 001, 010, 011, 100, 101, 110, 111}
/* da får 000 desimalverdien 0, 001 får 1 osv */


