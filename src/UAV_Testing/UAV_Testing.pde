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
ArrayList<Waypoint> coords = new ArrayList<Waypoint>();
int movement = 1;
Waypoint w1;
Waypoint w2;


void setup() {
    size(1200, 1200);
    background(0);
    w1 = new Waypoint(100, 100);
    drone1 = new UAV(w1.x, w1.y, 1, 1, 10);
    w2 = new Waypoint(400, 400);
    w1.thickness = 6;
    w2.thickness = 6;
    drone1.setSpeed(w1, w2);
}

void draw() {
    background(0);
    w1.display();
    w2.display();
    drone1.display();
    drone1.move();
}

void mouseClicked(){
    
}

