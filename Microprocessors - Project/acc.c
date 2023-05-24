#include <Wire.h>
#include <MPU6050.h>

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

  // Print accelerometer values and position to serial console
  Serial.print("X: ");
  Serial.print(gForceX, 2);
  Serial.print(" g\t");

  Serial.print("Y: ");
  Serial.print(gForceY, 2);
  Serial.print(" g\t");

  Serial.print("Z: ");
  Serial.print(gForceZ, 2);
  Serial.println(" g");

  Serial.print("Position X: ");
  Serial.print(positionX, 2);
  Serial.print(" m\t");

  Serial.print("Position Y: ");
  Serial.print(positionY, 2);
  Serial.print(" m\t");

  Serial.print("Position Z: ");
  Serial.print(positionZ, 2);
  Serial.println(" m");

  delay(500);
}
