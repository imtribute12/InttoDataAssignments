#include <Wire.h>
#include <MPU6050.h>
#include <LiquidCrystal.h>

LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

MPU6050 mpu;

int16_t accelX, accelY, accelZ;
float gForceX;
float velocityX = 0.0, prevVelocityX;
float positionX = 0.0;

unsigned long prevTime = 0;

void setup() {
  Serial.begin(9600);

  lcd.begin(16, 2);
  lcd.print("Hiz:");
  lcd.setCursor(0, 1);
  lcd.print("Konum:");

  Wire.begin();

  mpu.initialize();
}

void loop() {
  mpu.getAcceleration(&accelX,  &accelY, &accelZ);
  gForceX = accelX / 16384.0;

  unsigned long currentTime = millis();
  float deltaTime = (currentTime - prevTime) / 1000.0;

  velocityX += (gForceX) * deltaTime;

  prevVelocityX = velocityX;
  prevTime = currentTime;

  positionX += simpsonsRule(velocityX, prevVelocityX, deltaTime);

  Serial.print("Ivme X: ");
  Serial.print(gForceX, 2);
  Serial.print(" g\t");

  Serial.print("Hiz X: ");
  Serial.print(velocityX, 2);
  Serial.print(" m/s\t");

  Serial.print("Konum X: ");
  Serial.print(positionX, 2);
  Serial.print(" m\n");

  lcd.setCursor(4, 0);
  lcd.print(velocityX, 2);
  lcd.print(" m/s");

  lcd.setCursor(6, 1);
  lcd.print(positionX, 2);
  lcd.print(" m");

  delay(1000);

}

// Simpson Kuralı ile konum hesaplama fonksiyonu
float simpsonsRule(float currentVelocity, float previousVelocity, float deltaTime) {
  float averageVelocity = (currentVelocity + previousVelocity) / 2.0;
  float positionChange = averageVelocity * deltaTime;
  return positionChange;
}
