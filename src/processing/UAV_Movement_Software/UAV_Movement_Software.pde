import java.util.ArrayList;

float angle = 0;
float radius = 5;
int increment = 1000;
float x2, y2;
float lineX1, lineX2, lineY1, lineY2;
boolean mouseClicked = false;
boolean textClicked = false;
boolean destinationCreated = false;
boolean patternPicked = false;
UAV drone1;
static ArrayList<Waypoint> coords = new ArrayList<Waypoint>();
int movement = 1;
PFont quickSand;
TextBox[] prompts = new TextBox[4];
OptionBox[] options = new OptionBox[2];
PImage[] optionImgs = new PImage[2];
TextBox optionTextBox;
int promptIndex = 0;
PrintWriter output;

void setting(){
    lineX1 = 0;
    lineX2 = 0;
    lineY1 = 0;
    lineY2 = 0;
}

void setup() {
    size(1100, 1000);
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
    options[0] = new OptionBox("Curved Spiral", optionImgs[0], 100, 100, 400, 400, optionTextBox);
    optionTextBox.setCoord(600, 500);
    options[1] = new OptionBox("Square Spiral", optionImgs[1], 600, 100, 400, 400, optionTextBox);
    output = createWriter("MovementCommands/movements.txt");
}

void draw() {
    background(0);
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
    } else{
        stroke(0, 255, 0);
        strokeWeight(1);
        line(lineX1, lineY1, lineX2, lineY2);
        loadCoords();
    }
    prompts[promptIndex].display();
}

void mousePressed(){
    mouseClicked = !mouseClicked;
    textClicked = prompts[promptIndex].touched(mouseX, mouseY);

    if(!textClicked){
        if(!destinationCreated && mouseClicked){
            lineX1 = mouseX;
            lineX2 = mouseX;
            lineY1 = mouseY;
            lineY2 = mouseY;
            promptIndex = 1;
            coords.add(new Waypoint(lineX1, lineY1));
        } else if(!destinationCreated){
            destinationCreated = true;
            promptIndex = 2;
        } else if(!patternPicked){
            for(int i = 0; i<options.length; i++){
                if(options[i].touched(mouseX, mouseY)){
                    patternPicked = true;
                    drone1 = new UAV(coords.get(0).x, coords.get(0).y, 0.4, 0.4, 10);
                    coords.add(new Waypoint(lineX2, lineY2));
                    if(i==0){
                        spiral(coords.get(1).x, coords.get(1).y, 200);
                        output.flush();
                        output.close();
                        drone1.setSpeed(2, 2);
                    } else{
                        squareSpiral(20);
                        output.flush();
                        output.close();
                    }
                    drone1.setDestination(coords.get(1));
                    promptIndex = 3;
                }
            }
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
    if(dotIndex>0){
        x2 = cos(radians(angle)) * radius; // Calculate x-coordinate based on angle and radius
        y2 = sin(radians(angle)) * radius; // Calculate y-coordinate based on angle and radius
        coords.add(new Waypoint(x2 + originX, y2 + originY));
    }
    angle =(radius>10)? (angle + (increment/radius))%360: (angle + (increment/radius/10))%360; // Increment the angle for the next point
    radius += (radius<20)? increment/radius/20: increment/radius/5; // Increase the radius for the next point
}

void spiral(float originX, float originY, int dots){
    for(int i = 0; i<dots; i++){
        //coords.add(new Waypoint());
        addToSpiral(i, originX, originY);
    }
}

void loadCoords(){
    for(int i = 0; i<coords.size(); i++){
        if(i!=0){
            Waypoint c1 = coords.get(i);
            Waypoint c2 = coords.get(i-1);
            stroke(0, 0, 255, 70);
            line(c1.x, c1.y, c2.x, c2.y);
        }
        coords.get(i).display();
    }
}

void squareSpiral(int dots){
    for(int i = 1; i<=dots; i++){
        float prevY = coords.get(i).y;
        float prevX = coords.get(i).x;
        float distance = ((i+2)/2)*50;
        int duration = (int) distance*2;
        float x2 = prevX;
        float y2 = prevY;
        //Vertical movement
        if(i%2==0){
            //Up
            if(i%4==0){
                System.out.println(i+": Up");
                output.println("Direction: Forward");
                y2 = prevY - distance;
            }
            //Down
            else{
                System.out.println(i+": Down");
                output.println("Direction: Back");
                y2 = prevY + distance;
            }
        }
        //Horizontal movement
        else{
            //Left
            if((i-3)%4==0){
                System.out.println(i+": Left");
                output.println("Direction: Left");
                x2 = prevX - distance;
            }
            //Right
            else{
                System.out.println(i+": Right");
                output.println("Direction: Right");
                x2 = prevX + distance;
            }
        }
        output.println("Move: "+duration);
        coords.add(new Waypoint(x2, y2));
    }
}