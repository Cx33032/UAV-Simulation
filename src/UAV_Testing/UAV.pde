public class UAV{
    float x;
    float y;
    float xSpeed;
    float ySpeed;
    float radius;
    Waypoint start;
    int startIndex = 0;
    Waypoint end;
    int endIndex = 1;
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
            float diffX = end.x - x;
            float diffY = end.y - y;
            if(diffX!=0){
                this.x = (diffX>xSpeed)? x + xSpeed: x + diffX;
            }
            if(diffY!=0){
                this.y = (diffY>xSpeed)? y + ySpeed: y + diffY;
            }
            System.out.println(!end.equals(x,y)+": ("+x+", "+y+")");
        }
        else{
            System.out.println("next");
            startIndex+=1;
            endIndex+=1;
            setSpeed(UAV_Testing.coords.get(startIndex), UAV_Testing.coords.get(endIndex));
            System.out.println(x);
            System.out.println(y);
            System.out.println(start);
            System.out.println(end);
            System.out.println(!end.equals(x, y));
            System.out.println("---------------");
        }
        
    }

    void setSpeed(Waypoint w1, Waypoint w2){
        start = w1;
        x = start.x;
        y = start.y;
        end = w2;
        float diffY = end.y - start.y;
        float diffX = end.x - start.x;
        float slope = diffY/diffX;
        System.out.println("---------------");
        System.out.println("delta X: "+diffX+" delta Y: "+ diffY+" slope: "+slope);
        //xSpeed = (slope!=0)? 1*slope/slope: (Math.abs(slope)<=1)? 1: diffX;
        if(slope!=0){
            if(Math.abs(slope)<=1)
                xSpeed = getSign(diffX);
            else
                xSpeed = diffX;
        }
        else{
            xSpeed = diffX;
        }
        ySpeed = (Math.abs(slope)<=1)? Math.abs(slope)*getSign(diffY): diffY;
    }

    int getSign(float n){
        if(n<0)
            return -1;
        else if(n>0)
            return 1;
        else
            return 0;
    }

    
}