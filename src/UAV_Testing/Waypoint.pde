public class Waypoint{
    float x;
    float y;
    float thickness = 4;

    public Waypoint(){

    }

    public Waypoint(float x, float y){
        setCoord(x,y);
    }

    public void setCoord(float x, float y){
        this.x = x;
        this.y = y;
    }

    public String toString(){
        return "("+x+", "+y+")";
    }

    public void display(){
        strokeWeight(thickness);
        stroke(255, 0, 0);
        point(x, y);
    }

    public boolean equals(float otherX, float otherY){
        float diffX = Math.abs(x-otherX);
        float diffY = Math.abs(y-otherY);
        if(diffX<=0.1 && diffY<=0.1){
            return true;
        }
        return false;
    }
}