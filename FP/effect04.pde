float bgHue;
float avg;
float ballBaseHue;
float diameter;
float ballX;
float ballY;
float ballHue;
float ballSat;
float ballBright;
float ballAlpha;
void effect03dra()
{
  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);
  stroke(bgHue, 200, 255, 150);
  strokeWeight(4);
  noFill();
  float xpos;
  float ypos;
  avg=0;
  beginShape();
  for (int i = 0; i < player[2].bufferSize(); i++) {
    xpos=map(i, 0, player[2].bufferSize(), 0, width);
    ypos=height/2+100*player[2].mix.get(i);
    vertex(xpos, ypos);
    avg+=abs(player[2].mix.get(i));
  }
  endShape();
  avg/=player[2].bufferSize();
  ballBaseHue=map(avg, 0, 0.6, 170, 0);  //HSB模式下，170是蓝色，0是红色，正好体现"冷和热"

  noStroke();

  for (int i = 0; i < player[2].bufferSize(); i++) {
    if (random(1)<abs(player[2].mix.get(i))) {
      diameter=map(player[2].mix.get(i), 0, 0.5, 6, 20);
      diameter*=random(0.7, 1.3);
      ballX=randomGaussian()*100+width/2;
      ballY=randomGaussian()*100+height/2;
      ballHue=ballBaseHue+random(-10, 10);
      ballSat=random(200, 255);
      ballBright=random(200, 255);
      ballAlpha=random(80, 160);
      if (diameter>50) {
        ballAlpha=random(50, 120);
      }
      fill(ballHue, ballSat, ballBright, ballAlpha+20);
      ellipse(ballX, ballY, diameter*1.2, diameter*1.2);
    }
  }
}
