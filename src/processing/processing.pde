String[] questions = {
  "How many drone(drones) do you want?",
  "How high do you want the drone(drones) to fly? (In meters)",
  "how long you want the drones to wait in a stop"
};
String[][] options = {
  {"A) 1 drone", "B) 2 drones", "C) 3 drones", "D) 4 drones"},
  {"A) 50m", "B) 100m", "C) 200m", "D) 400m"},
  {"A) 5sec", "B) 10sec", "C) 15sec", "D) 20sec"}
};

int currentQuestion = 0;
boolean[] clicked = {false, false, false, false};

void setup() {
  size(400, 300);
  textAlign(CENTER, CENTER);
  textSize(20);
}

void draw() {
  background(255);
  fill(0);
  text(questions[currentQuestion], width/2, 50);
  for (int i = 0; i < options[currentQuestion].length; i++) {
    if (clicked[i]) {
      fill(0);
    } else {
      noFill();
    }
    ellipse(width/2 - 100, 85 + i*30, 15, 15); // Draw the circle
    text(options[currentQuestion][i], width/2, 90 + i*30);
  }
  
  // Previous button
  if (currentQuestion > 0) {
    fill(0);
    rect(20, height - 50, 80, 30);
    fill(255);
    text("Previous", 60, height - 35);
  }
  
  // Next button
  if (currentQuestion < questions.length - 1) {
    fill(0);
    rect(width - 100, height - 50, 80, 30);
    fill(255);
    text("Next", width - 60, height - 35);
  }
}

void mouseClicked() {
  int mouseYCoord = mouseY;
  for (int i = 0; i < options[currentQuestion].length; i++) {
    int optionY = 80 + i*30;
    if (mouseYCoord >= optionY - 10 && mouseYCoord <= optionY + 10) {
      clicked[i] = true;
    } else {
      clicked[i] = false;
    }
  }
  
  // Check if Previous button clicked
  if (mouseX > 20 && mouseX < 100 && mouseY > height - 50 && mouseY < height - 20 && currentQuestion > 0) {
    currentQuestion--;
    resetClicked();
  }
  
  // Check if Next button clicked
  if (mouseX > width - 100 && mouseX < width - 20 && mouseY > height - 50 && mouseY < height - 20 && currentQuestion < questions.length - 1) {
    currentQuestion++;
    resetClicked();
  }
}

void resetClicked() {
  for (int i = 0; i < clicked.length; i++) {
    clicked[i] = false;
  }
}
