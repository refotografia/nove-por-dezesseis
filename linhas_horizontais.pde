
void setup() {
  size(450,800);
  background(255,255,0);
  noStroke();
}

void draw() {
  fill(255,0,0);
  for (int i = 0; i < 55; i++) {
    rect(0, random(0, 790), 225, random(3, 25));
  }
  fill(255,255,0);
  for (int i = 0; i < 55; i++) {
    rect(225, random(0, 790), 225, random(3, 25));
  }
  delay(333);
  fill(255,255,0);
  for (int i = 0; i < 55; i++) {
    rect(0, random(0, 790), 225, random(3, 15));
  }
  fill(0,0,255);
  for (int i = 0; i < 55; i++) {
    rect(225, random(0, 790), 225, random(3, 15));
  }
  delay(333);
  fill(0,0,255);
  for (int i = 0; i < 55; i++) {
    rect(0, random(0, 790), 225, random(3, 15));
  }
  fill(255,0,0);
  for (int i = 0; i < 55; i++) {
    rect(225, random(0, 790), 225, random(3, 15));
  }
  delay(333);
}
