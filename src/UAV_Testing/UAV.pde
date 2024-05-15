public class UAV{
    float x;
    float y;
    float xSpeed;
    float ySpeed;
    float radius;
    Waypoint start;
    Waypoint end;
    boolean moving = false;

    public UAV(){

    }

    public UAV(float x, float y, float xSpeed, float ySpeed, float radius){
        this.x = x;
        this.y = y;
        this.xSpeed = xSpeed;
        this.ySpeed = ySpeed;
        this.radius = radius;
    }

    public void display(){
        strokeWeight(3);
        stroke(0,0,255);
        ellipse(x, y, radius, radius);
    }

    public void move(){
        moving = !end.equals(x,y);
        if(moving){
            this.x += xSpeed;
            this.y += ySpeed;
        }
    }

    void setSpeed(Waypoint w1, Waypoint w2){
        start = w1;
        end = w2;
        float diffY = end.y - start.y;
        float diffX = end.x - start.x;
        float slope = diffY/diffX;
        xSpeed = 1*slope/slope;
        ySpeed = slope;
    }
}