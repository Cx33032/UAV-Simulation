public class OptionBox{

    PImage img;
    float x, y, w, h;
    // String optionText;
    TextBox optionTextBox;

    public OptionBox(String optionText, PImage img, float x, float y, float w, float h, TextBox txtBox){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.img = img;
        this.img.resize((int)w,(int)h);
        this.optionTextBox = new TextBox(optionText, txtBox);
    }

    public OptionBox(){

    }

    public void display(){
        image(img, x, y);
        optionTextBox.display();   
    }

    public boolean touched(float xCoord, float yCoord){
        //True when mouse touching TextBox
        if(yCoord>=y && yCoord<=(y+h) && xCoord>=x && xCoord<=(x+w)){
            return true;
        }
        return false;
    }

    public void setCoord(float x, float y){
        this.x = x;
        this.y = y;
    }

    public void setWidth(float w){
        this.w = w;
    }

    public void setHeight(float h){
        this.h = h;
    }

    public void setDimensions(float w, float h){
        setWidth(w);
        setHeight(h);
    }

}