Particle[]dots = new Particle[1000];
void setup() {
  background(0);
  size(600, 600, P3D);
  for (int i = 0; i<dots.length; i++) {
    dots[i] = new Particle();
  }
  dots[0] = new oddball();
}
void draw() {
  for (int i = 0; i<dots.length; i++) {
    dots[i].move();
    dots[i].show();
  }
  fill(0,0,0,15);
  rect(0,0,600,600);
}

class Particle {
  double x, y, z, speed, angle;
  Particle() {
    double start = Math.random()*600;
    z = -Math.random()*50;
    speed = Math.random()*5;
    angle = Math.random()*2*PI;
    x=300+(Math.cos(angle)*speed*start);
    y=300+(Math.sin(angle)*speed*start);
  }
  void show() {
    fill(255);
    translate((float)x, (float)y, (float)z);
    rotate((float)angle+PI/2);
    ellipse(0, 0, 4, 5);
    rotate(-((float)angle+PI/2));
    translate(-(float)x, -(float)y, -(float)z);
  }
  void move() {
    x+=Math.cos(angle)*speed;
    y+=Math.sin(angle)*speed;
  }
}

class oddball extends Particle {
  oddball() {
    x = 300;
    y = 300;
    z = 4;
    speed = 0;
    angle = 0;
  }
  void show() {
    noStroke();
    fill(88, 103, 128);
    ellipse((int)x, (int)y, (int)z, (int)z);
  }
  void move() {
    z+=0.005;
  }
}


