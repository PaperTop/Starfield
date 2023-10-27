int sizeX = 600;
int sizeY = 800;

boolean bc = false;
lighter device = new lighter(200, width/2);
//your code here
void setup()
{
  size(600, 800);
}

void draw()
{
  background(200);
  button(400, 100, "Lighter");
  device.show();
  device.move();
  //System.out.println(mouseX + " " + mouseY);
}

class lighter
{
  int myX, myY, mySpeed, end;
  lighter(int y, int x1) {
    myX = sizeX;
    myY = y;
    mySpeed = 1;
    end = x1;
  }
  void move() {
    if (bc) {
      myX -= mySpeed;
    }else{
      myX += mySpeed;
    }
    if (myX <= end) {
      mySpeed = 0;
    }
  }
  void show() {
    fill(0);
    //biggest
    rect(myX + 230, myY, 250, 100, 20);
    //barrel
    rect(myX, myY, 250, 25, 100);
    fill(200);
    //gray trigger
    rect(myX + 240, myY + 30, 80, 60, 20);
    fill(#FF0000);
    //red
    rect(myX + 210, myY, 20, 25);
    if (mouseX > myX + 240 && mouseX < myX + 320 && mouseY > myY + 30 && mouseY < myY + 90 && mousePressed == true) {
      rect(myX + 305, myY + 30, 20, 60, 5);
      fill(#FF0000);
      beginShape();
      curveVertex(myX, 210);
      curveVertex(myX, 210);
      curveVertex(myX - 30, 190);
      curveVertex(myX - 50, 180);
      curveVertex(myX - 45, 210);
      curveVertex(myX, 215);
      curveVertex(myX, 215);
      endShape();
    } else {
      rect(myX + 295, myY + 30, 30, 60, 5);
    }
  }
}


void button(int myX, int myY, String text) {
  //Jaden
  if (mouseX > myX && mouseX < myX + 150 && mouseY > myY && mouseY < myY + 50 && mousePressed == true) {
    fill(255, 0, 0);
    bc = true;
  } else if (mouseX > myX && mouseX < myX + 150 && mouseY > myY && mouseY < myY + 50) {
    fill(255, 0, 0);
    bc = false;
  } else {
    fill(240, 0, 0);
  }
  textAlign(CENTER);
  textSize(20);
  rect(myX, myY, 150, 50, 10);
  fill(0);
  text(text, myX + 75, myY +30);
}



class Particle
{
  //your code here
}

class OddballParticle //inherits from Particle
{
  //your code here
}

//class Firecracker
//{
//  int myX, mY, myWidth;
//  Firecracker(int x, int y) {
//    myWidth = 100;
//    myX = width/2 - myWidth;
//    myY = y
//    mySpeed = 5;
//  }
//  void move(){
//    myX -= mySpeed
//    if (myX < 300){
//      mySpeed = 0;
//    }

//  }

//  void show() {
//    fill(255, 0, 0);
//    strokeWeight(0);
//    for (int i = 100; i < 700; i+=100) {
//      for(int j = i; j < i + 50; j+=10)
//      {
//        rect(myX, j, myWidth, 10, 100);        
//      }
//    }
//    stroke(#875638);
//    strokeWeight(4);
//    for (int i = 50; i < 650; i+=100) {
//      line(width/2, i, myWidth, i+50);
//    }
//  }
//}


