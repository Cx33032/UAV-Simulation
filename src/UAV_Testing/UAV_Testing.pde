import java.util.ArrayList;

float angle = 0;
float radius = 5;
int increment = 5;
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
Waypoint w1;
Waypoint w2;


void setup() {
    size(1200, 1200);
    background(0);
    w1 = new Waypoint(100, 100);
    coords.add(w1);
    drone1 = new UAV(w1.x, w1.y, 1, 1, 10);
    w2 = new Waypoint(400, 400);
    coords.add(w2);
    w1.thickness = 6;
    w2.thickness = 6;
    createSpiral(w2.x, w2.y, 200);
    drone1.setSpeed(w1, w2);
    
}

void draw() {
    background(0);
    loadCoords();
    drone1.display();
    drone1.move();
}

void mouseClicked(){
    
}

void addSpiralCoord(int dotIndex, float originX, float originY){
    x2 = cos(radians(angle)) * radius; // Calculate x-coordinate based on angle and radius
    y2 = sin(radians(angle)) * radius; // Calculate y-coordinate based on angle and radius
    coords.get(dotIndex).setCoord(x2 + originX, y2 + originY);
    float d = dist(0, 0, x2, y2);
    
    angle =(radius>10)? angle + ((increment / d) * 100): angle + 5; // Increment the angle for the next point
    angle %= 360;
    // println(angle);
    radius += 1 / d * 50; // Increase the radius for the next point
}

void createSpiral(float originX, float originY, int dots){
    //coords.clear();
    translate(originX, originY); // Move the origin to the center of the canvas
    for(int i = 2; i<dots+2; i++){
        coords.add(new Waypoint());
        addSpiralCoord(i, originX, originY);
    }
}

void loadCoords(){
    for(int i = 0; i<coords.size(); i++){
        coords.get(i).display();
    }
}
