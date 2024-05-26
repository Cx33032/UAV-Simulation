public class TextBox{

    String textStr;
    float x, y, w, h;
    color textColor;
    PFont textFont;

    public TextBox(String str, float x, float y, float w, float h, color clr, PFont font){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        textColor = clr;
        textFont = font;
        textStr = str;
    }

    public TextBox(String str, TextBox txt){
        this.x = txt.x;
        this.y = txt.y;
        this.w = txt.w;
        this.h = txt.h;
        this.textColor = txt.textColor;
        this.textFont = txt.textFont;
        textStr = str;
    }

    public TextBox(){

    }

    public void display(){
        fill(0);
        stroke(textColor);
        rect(x, y, w-2, h-2);
        fill(textColor);
        textSize(0.7*h);
        textFont(textFont);
        text(textStr, x+10, y+10, w, h);
        noFill();
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