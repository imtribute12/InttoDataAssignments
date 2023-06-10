#include <Wire.h>
#include <MPU6050.h>
#include <LiquidCrystal.h> // LCD kütüphanesi

// LCD Screen
LiquidCrystal lcd(12, 11, 5, 4, 3, 2); // Address and location informations

// MPU-6050 accelerometer object
MPU6050 mpu;

// Measurement variables
int16_t accelX, accelY, accelZ;
float gForceX, gForceY, gForceZ;
float velocityX = 0.0, velocityY = 0.0, velocityZ = 0.0;
float positionX = 0.0, positionY = 0.0, positionZ = 0.0;
unsigned long prevTime = 0;

void setup() {
  // Initialize serial communication
  Serial.begin(9600);
  
  // Initialize LCD Screen
  lcd.begin(16, 2);
  lcd.print("hiz:");
  lcd.setCursor(0, 1);
  lcd.print("konum:");

  // Initialize MPU-6050 accelerometer
  Wire.begin();
  mpu.initialize();
}

void loop() {
  // Read accelerometer data from MPU-6050
  mpu.getAcceleration(&accelX, &accelY, &accelZ);

  // Convert accelerometer data to g-force
  gForceX = accelX / 16384.0;
  gForceY = accelY / 16384.0;
  gForceZ = accelZ / 16384.0;

  // Calculate time difference since last iteration
  unsigned long currentTime = millis();
  float deltaTime = (currentTime - prevTime) / 1000.0; // Convert to seconds

  // Calculate velocity using the trapezoidal rule (numerical integration)
  velocityX += (gForceX) / 2.0 * deltaTime;
  velocityY += (gForceY) / 2.0 * deltaTime;
  velocityZ += (gForceZ) / 2.0 * deltaTime;

  // Calculate position using the trapezoidal rule (numerical integration)
  positionX += (velocityX) / 2.0 * deltaTime;
  positionY += (velocityY) / 2.0 * deltaTime;
  positionZ += (velocityZ) / 2.0 * deltaTime;

  Serial.print("Hiz: ");
  Serial.print(velocityX, 2);
  Serial.print(" m/s\t");

  Serial.print("Konum: ");
  Serial.print(positionX, 2);
  Serial.println(" m");

  lcd.setCursor(4, 0);
  lcd.print(velocityX, 2);
  lcd.print(" m/s");

  lcd.setCursor(7, 1);
  lcd.print(positionX, 2);
  lcd.print(" m");

  delay(500);
}
