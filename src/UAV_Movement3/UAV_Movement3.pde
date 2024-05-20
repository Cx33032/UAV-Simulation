import java.util.ArrayList;

float angle = 0;
float radius = 5;
int increment = 1000;
int mouseClick = 0;
int position = 0;
int slowness = 2;
float x = 0;
float y = 0;
float x2, y2;
boolean mouseBool = false;
UAV drone1;
static ArrayList<Waypoint> coords = new ArrayList<Waypoint>();
int movement = 1;

void setup() {
    size(1200, 1200);
    background(0);
    spiral(width/2, height/2, 500);
    drone1 = new UAV(0, 0, 1, 1, 10);
    drone1.setDestination(coords.get(0));
}

void draw() {
    background(0);
    loadSpiral();
    drone1.display();
    drone1.move();
}

void mouseClicked(){
    
}

void addToSpiral(int dotIndex, float originX, float originY){
    x2 = cos(radians(angle)) * radius; // Calculate x-coordinate based on angle and radius
    y2 = sin(radians(angle)) * radius; // Calculate y-coordinate based on angle and radius
    coords.get(dotIndex).setCoord(x2 + originX, y2 + originY);
    angle =(radius>10)? (angle + (increment/radius))%360: (angle + (increment/radius/10))%360; // Increment the angle for the next point
    System.out.println(angle);
    // println(angle);
    radius += (radius<20)? increment/radius/20: increment/radius/5; // Increase the radius for the next point
    //System.out.println(200/radius);
}

void spiral(float originX, float originY, int dots){
    coords.clear();
    //translate(originX, originY); // Move the origin to the center of the canvas
    for(int i = 0; i<dots; i++){
        coords.add(new Waypoint());
        addToSpiral(i, originX, originY);
    }
}

void loadSpiral(){
    for(int i = 0; i<coords.size(); i++){
        coords.get(i).display();
    }
}