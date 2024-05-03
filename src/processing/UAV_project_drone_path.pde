int angle = 0;
int radius = 10;
int increment = 5;

void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  translate(width/2, height/2); // Move the origin to the center of the canvas
  strokeWeight(2);
  stroke(255, 0, 0); // Set stroke color to red
  float x = cos(radians(angle)) * radius; // Calculate x-coordinate based on angle and radius
  float y = sin(radians(angle)) * radius; // Calculate y-coordinate based on angle and radius
  point(x, y); // Draw a point at the calculated position
  angle += increment; // Increment the angle for the next point
  radius += 1; // Increase the radius for the next point
}
