//Jacky
int numPart = 5000;
int firecrackerY = 300;
int lineY = 250;
boolean bc = false;
boolean light = false;
lighter device = new lighter(245, 320);
Particle[] explosion = new Particle[numPart];
Rocket[] boom = new Rocket[10];
Spark dot = new Spark(300, 250, 650);

void setup()
{
  size(600, 800);
  //Jaden
  for (int i = 0; i < numPart; i++) {
    explosion[i] = new Particle(2000, 2000);
  }
  for (int i = 0; i < 10; i++) {
    boom[i] = new Rocket(2000, 2000);
  }
}

void draw()
{
  background(135, 206, 235);
  pergoda();
  button(225, 20);
  device.show();
  device.move();
  Firecracker fire = new Firecracker(firecrackerY, lineY);
  fire.show();
  dot.show();
  stroke(0);
  strokeWeight(0);
  //Jacky
  if (checker()) {
    for (int i = 0; i < numPart; i++) {
      explosion[i] = new Particle(300, dot.myY);
    }

    for (int i = 0; i < 10; i++) {
      boom[i] = new Rocket(300, dot.myY);
    }
  }
  for (int i = 0; i < numPart; i++) {
    explosion[i].show();
    explosion[i].move();
  }
  for (int i = 0; i < 10; i++) {
    boom[i].move();
    boom[i].rshow();
  }

  //Jacky
  for (int i = 250; i < 650; i+=100) {
    if (dot.myY >= i && dot.myY <= i + 50) {
      fill(255);
      strokeWeight(4);
      line(300, i, 300, dot.myY);
    }
    if (dot.myY >= i + 50 && dot.myY < i + 51) {
      lineY += 100;
    }
    if (dot.myY >= i + 75 && dot.myY < i + 76) {
      firecrackerY += 100;
    }
  }
  stroke(0);
  strokeWeight(0);
}

//Jaden
class lighter
{
  int myX, myY, mySpeed, end;
  lighter(int y, int x1) {
    myX = 600;
    myY = y;
    mySpeed = 5;
    end = x1;
  }
  void move() {
    if (bc) {
      myX -= mySpeed;
      if (myX == 600 && mySpeed < 0) {
        mySpeed = 0;
      }
    }
    if (myX <= end) {
      mySpeed = 0;
    }
  }
  void show() {
    fill(0);
    //biggest
    rect(myX + 130, myY, 150, 90, 20);
    //barrel
    rect(myX, myY, 150, 25, 100);
    fill(200);
    //gray trigger
    rect(myX + 140, myY + 30, 70, 50, 20);
    fill(#FF0000);
    //red
    rect(myX + 110, myY, 20, 25);
    if (mouseX > myX + 140 && mouseX < myX + 220 && mouseY > myY + 30 && mouseY < myY + 90 && mousePressed == true) {
      rect(myX + 195, myY + 30, 20, 50, 5);
      fill(#FF0000);
      beginShape();
      curveVertex(myX, myY + 10);
      curveVertex(myX, myY + 10);
      curveVertex(myX - 30, myY - 10);
      curveVertex(myX - 50, myY -20);
      curveVertex(myX - 45, myY + 10);
      curveVertex(myX, myY + 15);
      curveVertex(myX, myY + 15);
      endShape();
      light = true;
      mySpeed = -1;
    } else {
      rect(myX + 185, myY + 30, 30, 50, 5);
    }
  }
}

//Jaden
void button(int myX, int myY) {
  if (mouseX > myX && mouseX < myX + 150 && mouseY > myY && mouseY < myY + 50 && mousePressed == true) {
    fill(255, 0, 0);
    bc = true;
  } else if (mouseX > myX && mouseX < myX + 150 && mouseY > myY && mouseY < myY + 50) {
    fill(255, 0, 0);
  } else {
    fill(240, 0, 0);
  }
  if (!bc) {
    textAlign(CENTER);
    textSize(20);
    rect(myX, myY, 150, 50, 10);
    fill(0);
    text("Lighter", myX + 75, myY +30);
  }
}
//Jacky
boolean checker() {
  for (int i = 325; i < 700; i+=100) {
    if (dot.myY == i) {
      return true;
    }
  }
  return false;
}
//Jaden
void scale(int x, int y) {
  fill(0, 255, 0);
  beginShape();
  curveVertex(x, y);
  curveVertex(x, y);
  curveVertex(x, y + 10);
  curveVertex(x + 10, y + 15);
  curveVertex(x + 20, y);
  curveVertex(x + 20, y);
  endShape();
}
//Jaden & Jacky
void pergoda() {
  fill(150, 75, 0);
  rect(100, 200, 30, 500);
  rect(470, 200, 30, 500);
  beginShape();
  vertex(600, 200);
  vertex(0, 200);
  vertex(100, 100);
  vertex(500, 100);
  endShape();
  for (int i = 200, j = 0; i >= 100; i -= 10, j += 10) {
    for (int k = 0 + j; k < 600 - j; k += 15) {
      scale(k, i);
    }
  }
}

//Jacky
class Firecracker
{
  int myX, myFY, myLY, myWidth;
  Firecracker(int Fy, int lY) {
    myWidth = 100;
    myX = 600/2 - myWidth/2;
    myFY = Fy;
    myLY = lY;
  }

  void show() {
    fill(255, 0, 0);
    strokeWeight(0);
    for (int i = myFY; i < 700; i+=100) {
      for (int j = i; j < i + 50; j+=10)
      {
        rect(myX, j, myWidth, 10, 100);
      }
    }
    stroke(#875638);
    strokeWeight(4);
    for (int i = myLY; i < 650; i+=100) {
      line(300, i, 300, i+50);
    }
  }
}

//Jacky && Jaden
class Particle
{

  double myX, myY, xSpeed, ySpeed, angle, acceleration, speed;
  Particle(int x, int y) {
    myX = x;
    myY = y;
    speed = Math.random() * 10;
    angle = Math.random()*2*PI;
    xSpeed = Math.cos(angle) * speed;
    ySpeed = -(Math.sin(angle) * speed);
    acceleration = Math.random()/2 + 0.3;
  }
  void move() {
    myX += xSpeed;
    myY += ySpeed;
    ySpeed += acceleration;
  }
  void show() {
    fill(255, 0, 0);
    ellipse((float)myX, (float)myY, 7, 7);
  }
}

//Jaden & Jacky
class Rocket extends Particle
{
  int myWidth, myLength;

  Rocket(int x, int y) {
    super(x, y);
    myWidth = 5;
    myLength = 20;
    myX = x;
    myY = y;
    speed = (Math.random() * 10);
    angle = Math.random()*2*PI;
    xSpeed = Math.cos(angle) * speed;
    ySpeed = -(Math.sin(angle) * speed);
    acceleration = 0;
  }

  void rshow() {
    fill(0, 0, 0);
    rect((float)(myX-myWidth), (float)myY, (float)(myWidth * 2), (float)myLength);
    fill(255, 0, 0);
    triangle((float)(myX - myWidth - 3), (float)myY, (float)myX, (float)(myY - 10), (float)(myX + myWidth + 3), (float)myY);
  }
}

//Jacky && Jaden
class Spark
{
  int mySpeed, myX, myY, end;
  Spark(int x, int y, int y1)
  {
    mySpeed = 1;
    myX = x; //300
    myY = y; //250
    end = y1; //700
  }

  void show()
  {
    if (light) {
      fill(255, 165, 0);
      beginShape();
      curveVertex(myX, myY);
      curveVertex(myX, myY);
      curveVertex(myX + 10, myY - 10);
      curveVertex(myX, myY - 30);
      curveVertex(myX - 10, myY - 10);
      curveVertex(myX, myY);
      curveVertex(myX, myY);
      endShape();

      myY += mySpeed;
    }
    if (myY > end)
    {
      light = false;
      mySpeed = 0;
    }
  }
}
