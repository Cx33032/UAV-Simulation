public class UAV{
    float x;
    float y;
    float xSpeed;
    float ySpeed;
    float radius;

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
        stroke(0,0,255);
        ellipse(x, y, radius, radius);
    }

    public void move(float x1, float y1, float x2, float y2){
        this.x = x2;
        this.y = y2;
    }
}