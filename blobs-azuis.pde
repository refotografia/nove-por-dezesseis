void setup() {
  size(450, 800);
  background(0);
  frameRate(2);
}

void draw() {
  float y1 = random(25);
  float y2 = (y1/2)+(height/16);
  for (int j = 0; j < 16; j++) {
    float x1 = random(40);
    float x2 = (x1/2)+(random(0.8,1.2)*(width/9));
    for (int i = 0; i < 9; i++) {
      float w = random(10,40);
      strokeWeight(w);
      stroke(random(0,20), random(0,75), random(127,255));
      x1 = (x1*random(0.97,1.02));
      y1 = (y1*random(0.98,1.02));
      x2 = (x2*random(0.97,1.01));
      y2 = (y2*random(0.99,1.01));
      line(x1, y1, x2, y2);
      x1 = x1+(random(0.8,1.2)*(width/9));
      x2 = x2+(random(0.8,1.2)*(width/9));
    }
    line(x1, y1, x2, y2);
    y1 = y1+(random(0.8,1.2)*(height/16));
    y2 = y2+(random(0.8,1.2)*(height/16));
  }
}
