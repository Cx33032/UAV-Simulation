package yiming.test1;


public class Waypoint{
    float x;
    float y; 

    public Waypoint(){

    }

    public Waypoint(float x, float y){
        setCoord(x,y);
    }

    public void setCoord(float x, float y){
        this.x = x;
        this.y = y;
    }
}