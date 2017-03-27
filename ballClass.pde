class Ball {
  float op;
  PVector locate;
  float x;
  float y;
  
  Ball(float xie,float yie) {
    op = 255;
    x = xie;
    y=yie;
  }
  
 void update(){
    op = op-2;
    //println(op);
  }
  
  float opacity(){
    return op;
  }
  
  void display(){
    noStroke();
    pushMatrix();
    translate(x,y);
    fill(0,0,255,op);
    ellipse(0,0,10,10);
    popMatrix();
  }
}