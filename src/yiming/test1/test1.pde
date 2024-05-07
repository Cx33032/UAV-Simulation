import java.util.ArrayList;

float angle = 0;
float radius = 5;
int increment = 5;
int mouseClick = 0;
float x = 0;
float y = 0;
float x2, y2;
boolean mouseBool = false;
ArrayList<Waypoint> coords = new ArrayList<Waypoint>();


void setup() {
    size(600, 600);
    background(0);
}

void draw() {

    if(mouseBool){
        // translate(x, y); // Move the origin to the center of the canvas
        // addToSpiral();
    }
}

void mouseClicked(){
    mouseClick ++;
    System.out.println("Click "+mouseClick);
     if(mouseClick%2 == 1){
        x = mouseX;
        y = mouseY;
        mouseBool = true;
        spiral(x,y, 50);
    }

    if(mouseClick%2 == 0){
        mouseBool = false;
        background(0);
        angle = 0;
        radius = 5;
    }
}

void addToSpiral(int dotIndex){
    strokeWeight(4);
    stroke(255, 0, 0); // Set stroke color to red
    x2 = cos(radians(angle)) * radius; // Calculate x-coordinate based on angle and radius
    y2 = sin(radians(angle)) * radius; // Calculate y-coordinate based on angle and radius
    coords.get(dotIndex).setCoord(x2, y2);
    float d = dist(0, 0, x2, y2);
    point(x2, y2); // Draw a point at the calculated position
    angle += ((increment / d) * 150); // Increment the angle for the next point
    angle %= 360;
    // println(angle);
    radius += 1 / d * 50; // Increase the radius for the next point
}

void spiral(float originX, float originY, int dots){
    translate(originX, originY); // Move the origin to the center of the canvas
    for(int i = 0; i<dots; i++){
        addToSpiral(i);
        coords.add(new Waypoint());
    }
}