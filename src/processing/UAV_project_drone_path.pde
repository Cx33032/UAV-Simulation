PImage droneImage;
int startDegrees, startMinutes, startSeconds; // Starting point
int endDegrees, endMinutes, endSeconds; // Ending point
int currentDegrees, currentMinutes, currentSeconds; // Current position
int numStops = 15; // Number of stops
float totalDistance; // Total distance between starting and ending points
float distanceBetweenStops; // Distance between each stop
int currentStopIndex = 0; // Index of the current stop
boolean reachedDestination = false; // Flag to indicate if drone reached the destination
long lastStopTime = 0; // Time when the drone last stopped

void setup() {
  size(800, 600);
  // Load drone image
  droneImage = loadImage("drone.jpg");
  
  // Set starting and ending points
  startDegrees = 0;
  startMinutes = 0;
  startSeconds = 0;
  
  endDegrees = 180;
  endMinutes = 30;
  endSeconds = 10;
  
  // Calculate total distance
  totalDistance = calculateDistance(startDegrees, startMinutes, startSeconds, endDegrees, endMinutes, endSeconds);
  
  // Calculate distance between stops
  distanceBetweenStops = totalDistance / numStops;
  
  // Initialize current position to starting point
  currentDegrees = startDegrees;
  currentMinutes = startMinutes;
  currentSeconds = startSeconds;
}

void draw() {
  background(255);
  
  // Move drone
  moveDrone();
  
  // Display drone image at current position
  image(droneImage, mouseX, mouseY, 50, 50);
}

void moveDrone() {
  // Check if drone reached destination
  if (reachedDestination) {
    return;
  }
  
  // Check if drone reached next stop
  long currentTime = millis();
  if (currentTime - lastStopTime >= 5000) {
    // Move to next stop
    currentStopIndex++;
    if (currentStopIndex >= numStops) {
      reachedDestination = true;
      println("Drone reached destination!");
      return;
    }
    // Calculate new position based on distance between stops
    float distanceToNextStop = distanceBetweenStops * currentStopIndex;
    calculatePosition(distanceToNextStop);
    lastStopTime = currentTime;
  }
}

void calculatePosition(float distance) {
  // Calculate new position based on distance
  // For simplicity, let's assume the drone moves in a straight line
  // and the distance is proportional to the change in degrees, minutes, and seconds
  // between starting and ending points
  
  // Calculate change in degrees, minutes, and seconds
  float changeDegrees = (endDegrees - startDegrees) * (distance / totalDistance);
  float changeMinutes = (endMinutes - startMinutes) * (distance / totalDistance);
  float changeSeconds = (endSeconds - startSeconds) * (distance / totalDistance);
  
  // Update current position
  currentDegrees = startDegrees + int(changeDegrees);
  currentMinutes = startMinutes + int(changeMinutes);
  currentSeconds = startSeconds + int(changeSeconds);
}

float calculateDistance(int startDeg, int startMin, int startSec, int endDeg, int endMin, int endSec) {
  // Calculate distance between two points using spherical law of cosines
  float startRadians = radians(startDeg + startMin / 60.0 + startSec / 3600.0);
  float endRadians = radians(endDeg + endMin / 60.0 + endSec / 3600.0);
  
  float distance = acos(sin(startRadians) * sin(endRadians) + cos(startRadians) * cos(endRadians) * cos(abs(endRadians - startRadians))) * 6371; // Earth's radius in km
  
  return distance;
}
