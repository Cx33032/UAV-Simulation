
float x, y;
float angle, radius;
int angleInc = 10;
float counter = 0;

void setup(){
    size(600, 800);
    background(255);
    radius = 5;
    angle = 5;
}


void draw(){
    //background(255);
    
    //Displays how changing x based on cosine creates horizontal oscillation
    //background(255);
    //periodicX();

    //Displays how changing y based on sine creates vertical oscillation
    //background(255);
    //periodicY();

    //Diplays the motion following the rules of a unit circle
    //background(255);
    //circleMotion();

    //Displays spiral motion through a constant increment in radius
    basicSpiral();

    //basicSpiral2();



    // translate(width/2, height/2);
    // strokeWeight(2);
    // stroke(0);
    // point(x,y);
    // x = cos(radians(angle))*radius;
    // y = sin(radians(angle))*radius;
    // System.out.println(x);
    // System.out.println(y);
    // System.out.println(angle);
    // System.out.println(radius);
    // System.out.println("-----------");
    // //angle += 5;
    // radius+=5;
}

// void mouseClicked(){
//     translate(width/2, height/2);
//     for(int i = 0; i<10; i++){
//         strokeWeight(2);
//         stroke(0);
//         point(x,y);
//         x = cos(radians(angle))*radius;
//         y = sin(radians(angle))*radius;
//         System.out.println(x);
//         System.out.println(y);
//         System.out.println(angle);
//         System.out.println(radius);
//         System.out.println("-----------");
//         //angle += 5;
//         //Increases next points distance from center
//         radius+=5;
//     }
// }

void periodicX(){
    radius = 20;
    //Moves everything to center
    translate(width/2, height/2);

    //Creates a red line to visualize the diameter
    stroke(255, 0, 0);
    strokeWeight(2);
    line(0-radius, 0, 0+radius, 0);

    x = cos(radians(angle))*radius;
    stroke(0);
    strokeWeight(4);
    point(x,y);
    angle+=angleInc;
}

void periodicY(){
    radius = 20;
    //Moves everything to center
    translate(width/2, height/2);

    //Creates a red line to visualize the diameter
    stroke(255, 0, 0);
    strokeWeight(2);
    line(0, 0-radius, 0, 0+radius);

    y = sin(radians(angle))*radius;
    stroke(0);
    strokeWeight(4);
    point(x,y);
    angle+=angleInc;
}

void circleMotion(){
    radius = 20;
    //Moves everything to center
    translate(width/2, height/2);

    //Creates a red line to visualize the diameter
    stroke(255, 0, 0);
    strokeWeight(2);
    line(0-radius, 0, 0+radius, 0);
    line(0, 0-radius, 0, 0+radius);

    x = cos(radians(angle))*radius;
    y = sin(radians(angle))*radius;
    stroke(0);
    strokeWeight(4);
    point(x,y);
    angle+=angleInc;
}


void basicSpiral(){
    //radius = 20;
    //Moves everything to center
    translate(width/2, height/2);

    //Creates a red line to visualize the diameter
    stroke(255, 0, 0);
    strokeWeight(2);
    line(0-radius, 0, 0+radius, 0);
    line(0, 0-radius, 0, 0+radius);

    x = cos(radians(angle))*radius;
    y = sin(radians(angle))*radius;
    stroke(0);
    strokeWeight(4);
    point(x,y);
    angle+=angleInc;
    radius+=1;
}

void basicSpiral2(){
    counter+=1;
    //radius = 20;
    //Moves everything to center
    translate(width/2, height/2);

    //Creates a red line to visualize the diameter
    stroke(255, 0, 0);
    strokeWeight(2);
    line(0-radius, 0, 0+radius, 0);
    line(0, 0-radius, 0, 0+radius);

    x = cos(radians(angle))*radius;
    y = sin(radians(angle))*radius;
    stroke(0);
    strokeWeight(4);
    point(x,y);

    float arcLen = (counter<20)? radius/3: radius/5;
    float angleIncrease = arcLen/(2*(float)Math.PI*radius)*360;
    angle+=(angleIncrease);
    radius+=1;
}