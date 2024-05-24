public class UAV{
    float x;
    float y;
    float xSpeed;
    float ySpeed;
    float radius;
    Waypoint destination;
    int direction = 1;
    int position = 1;
    float vx, dx; //Horizontal speed and distance
    float vy, dy; //Vertical speed and distance

    public UAV(){

    }

    public UAV(float x, float y, float xSpeed, float ySpeed, float radius){
        this.x = x;
        this.y = y;
        setSpeed(xSpeed, ySpeed);
        this.radius = radius;
    }

    public void display(){
        stroke(0,0,255);
        ellipse(x, y, radius, radius);
    }

    public void move(){
        boolean moving = !destination.equals(x, y);
        if(moving){
            this.x += vx;
            this.y += vy;
            //System.out.println("("+x+", "+y+")");
            setDestination(destination);
        } else{
            //System.out.println("Destination reached");
            //System.out.println("------------"+"\n");
            position+=direction;
            if(position==UAV_Movement3.coords.size()||position==-1){
                direction*=-1;
                position+=direction;
            }
            setDestination(UAV_Movement3.coords.get(position));
        }
    
    }

    public void setDestination(Waypoint w1){
        destination = w1;
        dx = w1.x - x;
        dy = w1.y - y;
        vx = (5*xSpeed>1)? dx/(5*xSpeed): dx;
        vy = (5*ySpeed>1)? dy/(5*ySpeed): dy;
        //vx = dx/(5*xSpeed);
        //vy = dy/(5*ySpeed);
        //System.out.println("------------");
        //System.out.println("destination: "+w1);
        //System.out.println("dx: "+dx+" dy: "+dy+" vx: "+vx+" vy: "+vy);
    }

    public void setSpeed(float xSpeed, float ySpeed){
        this.xSpeed = 1/xSpeed;
        this.ySpeed = 1/ySpeed;
    }
}