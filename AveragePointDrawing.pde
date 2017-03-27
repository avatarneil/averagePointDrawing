import org.openkinect.freenect.*;
import org.openkinect.processing.*;

KinectTracker tracker;
Kinect kinect;
ArrayList<Ball> balls;
int i;
int counter;


void setup() {
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  balls = new ArrayList<Ball>();
  counter = 0;
  i=0;
}

void draw() {
  background(255);
  tracker.track();
  PVector v2 = tracker.getLerpedPos();
  int t = tracker.getThreshold();
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " +  "UP increase threshold, DOWN decrease threshold" , 10, 500);
  PVector v3 = new PVector(mouseX,mouseY);
  
  balls.add(new Ball(v2.x,v2.y));
  println(balls.size());
  updateBalls();
 
}

// Adjust the threshold with key presses
void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}

void updateBalls() {
  while (counter < balls.size()){
    balls.get(counter).display();
    balls.get(counter).update();
    counter++;
  }
  counter = 0;
  i++;
}