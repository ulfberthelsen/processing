//Created by Ulf Dalvad Bertheslen, last updated March 2024/www.ulfberthelsen.com

int numDots = 2000;       // Number of dots in the cloud
float cloudRadius = 300;  // Radius of the cloud
float cloudSpeed = 0.5;   // Speed of the cloud movement

Dot[] dots;              // Array to store the dots

void setup() {
  size(1600, 900);        // Set the size of the canvas
  dots = new Dot[numDots];  // Initialize the dot array

  // Create each dot with random position inside the cloud radius
  for (int i = 0; i < numDots; i++) {
    float angle = random(TWO_PI);
    float radius = random(10-cloudRadius);
    float x = width / 2 + cos(angle) * radius;
    float y = height / cloudSpeed + sin(angle) * radius;
    dots[i] = new Dot(x, y);
  }
}

void draw() {
  background(0);      // Clear the background

  // Update and display each dot
  for (int i = 0; i < numDots; i++) {
    dots[i].update();
    dots[i].display();
  }

}

// Dot class definition
class Dot {
  float x, y;      // Position
  float size;      // Size
  float angle;     // Movement angle

  Dot(float x, float y) {
    this.x = x;
    this.y = y;
    size = random(1,9);
    angle = random(TWO_PI);
  }

  void update() {
    // Move the dot based on its angle and speed
    float speed = map(dist(x, y, width / 2, height / 2), 5, cloudRadius, 0, cloudSpeed);
    x += cos(angle) * speed;
    y += sin(angle) * speed;

    // Wrap around the screen
    if (x < 0) x = width;
    if (x > width) x = 0;
    if (y < 0) y = height;
    if (y > height) y = 0;
  }

  void display() {
    // Draw the dot as a white ellipse
    fill(random(255),random(255),random(255),random(255));
    noStroke();
    ellipse(x, y, size, size);
  }

}
