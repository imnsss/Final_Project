Ball[] balls;
float level;
void effect03set()
{
  balls=new Ball[50];
  for (int i=0; i<50; i++)
  {
    balls[i]=new Ball();
  }
}

void effect02dra()
{
  background(0);
  level= player[1].mix.level() *100 * 2;
  for (int i=0; i<50; i++)
  {
    for (int j=0; j<50; j++)
    {
      if (dist(balls[i].posx, balls[i].posy, balls[j].posx, balls[j].posy)<100)
      {
        stroke(balls[i].hue, 100, 100);
        strokeWeight(3);
        line(balls[i].posx, balls[i].posy, balls[j].posx, balls[j].posy);
      }
    }
  }
  for (int i=0; i<50; i++)
  {
    balls[i].display();
    balls[i].bound();
    balls[i].move();
  }
}
class Ball {
  float posx;
  float posy;
  float speedx;
  float speedy;
  float hue;
  float hue1, hue2, hue3, hue4;
  float size;
  float levelF;
  Ball()
  {
    posx=random(width);
    posy=random(height);
    speedx=random(-3, 3);
    speedy=random(-3, 3);
    hue=random(360);
    hue1=random(90);
    hue2=random(90, 180);
    hue3=random(180, 270);
    hue4=random(270, 360);
    size=random(10, 30);
    levelF=random(0.8, 1.1);
  }
  void display()
  {
    noStroke();
    fill(hue, 100, 100);
    ellipse(posx, posy, size+level*levelF, size+level*levelF);
  }
  void move()
  {
    posx+=speedx;
    posy+=speedy;
  }
  void bound()
  {

    if (posx<0) {
      posx=0;
      speedx=-1*speedx;
    }
    if (posx>width) {
      posx=width;
      speedx=-1*speedx;
    }
    if (posy<0) {
      posy=0;
      speedy=-1*speedy;
    }
    if (posy>height) {
      posy=height;
      speedy=-1*speedy;
    }
  }
}
