public class Waypoint{
    float x;
    float y; 
    float thickness = 4;
    int[] colour = {255, 0, 0};

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
        stroke(colour[0], colour[1], colour[2]);
        strokeWeight(thickness);
        point(x, y);
    }

    public boolean equals(float x2, float y2){
        float dx = Math.abs(x2 - x);
        float dy = Math.abs(y2 - y);
        if(dx<=0.01 && dy<=0.01){
            return true;
        }
        return false;
    }
}