import java.util.ArrayList;

float angle = 0;
float radius = 5;
int increment = 1000;
//int mouseClick = 0;
//int position = 0;
// int slowness = 2;
// float x = 0;
// float y = 0;
float x2, y2;
float lineX1, lineX2, lineY1, lineY2;
boolean mouseClicked = false;
boolean textClicked = false;
boolean destinationCreated = false;
UAV drone1;
static ArrayList<Waypoint> coords = new ArrayList<Waypoint>();
int movement = 1;
PFont quickSand;
TextBox[] prompts = new TextBox[3];
OptionBox[] options = new OptionBox[2];
PImage[] optionImgs = new PImage[2];
TextBox optionTextBox;
int promptIndex = 0;


void setting(){
    lineX1 = 0;
    lineX2 = 0;
    lineY1 = 0;
    lineY2 = 0;
}

void setup() {
    size(1200, 1000);
    background(0);
    quickSand = createFont("Quicksand-LightItalic.otf", 48);
    optionImgs[0] = loadImage("SpiralOption.png");
    optionImgs[1] = loadImage("SquareSpiralOption.png");

    prompts[0] = new TextBox("Click starting location", 0, height-100, width, 100, color(0, 0, 255), quickSand);
    prompts[1] = new TextBox("Click searching location", prompts[0]);
    prompts[2] = new TextBox("Pick Drone Pattern", prompts[0]);
    prompts[3] = new TextBox("Drone pathway created", prompts[0]);

    //Option menu setup
    optionTextBox = new TextBox("Option: ", prompts[0]);
    optionTextBox.setCoord(100, 500);
    optionTextBox.setDimensions(400, 100);
    options[0] = new optionBox("Curved Spiral", optionImgs[0], 100, 100, 400, 400, optionTextBox);
    optionTextBox.setCoord(600, 500);
    options[1] = new optionBox("Square Spiral", optionImgs[1], 600, 100, 400, 400, optionTextBox);

    //spiral(width/2, height/2, 500);
    // coords.add(new Waypoint(width/2, height/2));
    // squareSpiral(20);
    // //spiral(coords.get(0).x, coords.get(0).y, 200);
    // drone1 = new UAV(coords.get(0).x, coords.get(0).y, 1, 1, 10);
    // drone1.setDestination(coords.get(1));
}

void draw() {
    background(0);
    // loadCoords();
    // drone1.display();
    // drone1.move();
    prompts[promptIndex].display();
    if(promptIndex == 2){
        background(255);
        for(int i = 0; i<options.length; i++){
            options[i].display();
        }
    } else if (destinationCreated){
        stroke(0, 255, 0);
        strokeWeight(1);
        line(lineX1, lineY1, lineX2, lineY2);
        loadCoords();
        
        drone1.display();
        drone1.move();
    }
}

void mousePressed(){
    mouseClicked = !mouseClicked;
    textClicked = prompts[promptIndex].touched(mouseX, mouseY);
    System.out.println(textClicked);
    if(!textClicked){
        // System.out.println("Mouse clicked: "+mouseClicked);
        if(!destinationCreated && mouseClicked){
            lineX1 = mouseX;
            lineX2 = mouseX;
            lineY1 = mouseY;
            lineY2 = mouseY;
            promptIndex = 1;
            coords.add(new Waypoint(lineX1, lineY1));
        } else if (!destinationCreated){
            destinationCreated = true;
            //spiral(width/2, height/2, 500);
            coords.add(new Waypoint(lineX2, lineY2));
            squareSpiral(20);
            //spiral(coords.get(0).x, coords.get(0).y, 200);
            drone1 = new UAV(coords.get(0).x, coords.get(0).y, 0.4, 0.4, 10);
            drone1.setDestination(coords.get(1));
            promptIndex = 2;
        }
    } else{
        mouseClicked = false;
    }

}

void mouseMoved(){
    if(!destinationCreated && mouseClicked && !textClicked){
        lineX2 = mouseX;
        lineY2 = mouseY;
    }
}

void mouseDragged(){
    if(!destinationCreated && mouseClicked && !textClicked){
        lineX2 = mouseX;
        lineY2 = mouseY;
    }
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

void loadCoords(){
    for(int i = 0; i<coords.size(); i++){
        coords.get(i).display();
        if(i!=0){
            Waypoint c1 = coords.get(i);
            Waypoint c2 = coords.get(i-1);
            stroke(0, 0, 255, 70);
            line(c1.x, c1.y, c2.x, c2.y);
        }
    }
}

void squareSpiral(int dots){
    for(int i = 1; i<=dots; i++){
        float prevY = coords.get(i).y;
        float prevX = coords.get(i).x;
        float distance = ((i+2)/2)*60;
        float x2 = prevX;
        float y2 = prevY;
        //Vertical movement
        if(i%2==0){
            //Up
            if(i%4==0){
                System.out.println(i+": Up");
                y2 = prevY - distance;
            }
            //Down
            else{
                System.out.println(i+": Down");
                y2 = prevY + distance;
            }
        }
        //Horizontal movement
        else{
            //Left
            if((i-3)%4==0){
                System.out.println(i+": Left");
                x2 = prevX - distance;
            }
            //Right
            else{
                System.out.println(i+": Right");
                x2 = prevX + distance;
            }
        }
        coords.add(new Waypoint(x2, y2));
    }
}