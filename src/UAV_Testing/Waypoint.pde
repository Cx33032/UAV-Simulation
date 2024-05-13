public class Waypoint{
    float x;
    float y;
    float thickness = 1;

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
        if(otherX==x && otherY==y){
            return true;
        }
        return false;
    }
}