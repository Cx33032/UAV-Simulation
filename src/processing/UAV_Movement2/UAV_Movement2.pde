import java.util.ArrayList;

float angle = 0;
float radius = 5;
int increment = 5;
int mouseClick = 0;
int position = 0;
int slowness = 2;
float counter = 0;
float x = 0;
float y = 0;
float x2, y2;
boolean mouseBool = false;
UAV drone1;
ArrayList<Waypoint> coords = new ArrayList<Waypoint>();
int movement = 1;

void setup() {
    fullScreen();
    //size(600, 600);
    background(0);
    drone1 = new UAV(0, 0, 0, 0, 10);
}

void draw() {
    background(0);
    if(mouseBool){
        position += movement;
        if(position==(coords.size()*slowness)|| position==0){
            movement*=-1;
            position+=movement;
        }
        loadSpiral();
        drone1.move(0,0, coords.get(position/slowness).x, coords.get(position/slowness).y);
        drone1.display();
    }
}

void mouseClicked(){
    mouseClick ++;
    System.out.println("Click " + mouseClick);
    // odd-time click show the route
     if(mouseClick%2 == 1){
        x = mouseX;
        y = mouseY;
        mouseBool = true;
        spiral(x,y, 200);
    }

    //even-time click erase the route
    if(mouseClick%2 == 0){
        mouseBool = false;
        background(0);
        angle = 0;
        radius = 5;
    }
}

void addToSpiral(int dotIndex, float originX, float originY){
    counter +=1;
    x2 = cos(radians(angle))*radius;
    y2 = sin(radians(angle))*radius;
    stroke(0);
    strokeWeight(4);
    point(x,y);

    coords.get(dotIndex).setCoord(x2 + originX, y2 + originY);
    
    float arcLen = (counter<20)? radius/3: radius/5;
    float angleIncrease = arcLen/(2*(float)Math.PI*radius)*360;
    angle+=(angleIncrease);
    radius+=1;
}

void spiral(float originX, float originY, int dots){
    coords.clear();
    translate(originX, originY); // Move the origin to the center of the canvas
    for(int i = 0; i<dots; i++){
        coords.add(new Waypoint());
        addToSpiral(i, originX, originY);
    }
}

void loadSpiral(){
    for(int i = 1; i<coords.size(); i++){
        strokeWeight(4);
        stroke(255, 0, 0); // Set stroke color to red
        point(coords.get(i).x, coords.get(i).y);
    }
}