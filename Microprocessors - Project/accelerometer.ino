#include "Arduino_SensorKit.h"

void setup() {
  // put your setup code here, to run once:
  
  Oled.begin();
  Oled.setFlipMode(1);  //Rotate it
  
  Serial.begin(9600);
  while(!Serial);
  
  Accelerometer.begin();
}

void loop() {
  // put your main code here, to run repeatedly:
  
  Oled.setFont(u8x8_font_chroma48medium8_r);
  Oled.drawString(0,0,"Hello World!");
  Oled.refreshDisplay();
  delay(1000);
  
  // 3 axis
  Serial.print("x:"); 
  Serial.print(Accelerometer.readX()); 
  Serial.print("  ");
  Serial.print("y:"); 
  Serial.print(Accelerometer.readY());        
  Serial.print("  ");
  Serial.print("z:"); 
  Serial.println(Accelerometer.readZ());
 
  delay(500);
}
