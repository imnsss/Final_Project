int num = 5000;
float mts = PI/600;
float r = 100;
int rdtr = 120;
int rdu = 5;

PVector v[] = new PVector[num];
boolean mv = true;
boolean mo = true;
color c[] = new color[num];
float theta[] = new float[num];
float mtheta[] = new float[num];
float dtheta[] = new float[num];
float easing[] = new float[num];
int rdt[] = new int[num];



void draw() {

  fill(0,0,0,25);
  rect(0,0,width,height);
  pushMatrix();
  noStroke();
  
  r = map (amp.analyze(),0,0.1,100,width);
  
  if (mv) {
    if (mo) {
      for (int i = 0; i < num-1; i++){
        mtheta[i] += dtheta[i];
        v[i].lerp(mouseX+cos(mtheta[i])*(rdt[i]+r), mouseY+sin(mtheta[i])*(rdt[i]+r),0,easing[i]);
        fill(c[i]);
        ellipse(v[i].x,v[i].y,rdu,rdu);
      }
    }
   if (!mo) {
      for (int i = 0; i < num-1; i++){
        v[i].lerp(mouseX+cos(mtheta[i])*(rdt[i]+r), mouseY+sin(mtheta[i])*(rdt[i]+r),0,easing[i]);
        fill(c[i]);
        ellipse(v[i].x,v[i].y,rdu,rdu);
      }
    }
  }
  
  if (!mv) {
    if (mo) {
      for (int i = 0; i < num-1; i++){
        mtheta[i] += dtheta[i];
        v[i].lerp(mouseX+cos(mtheta[i])*(rdt[i]), mouseY+sin(mtheta[i])*(rdt[i]),0,easing[i]);
        fill(c[i]);
        ellipse(v[i].x,v[i].y,rdu,rdu);
      }
    }
   if (!mo) {
      for (int i = 0; i < num-1; i++){
        v[i].lerp(mouseX+cos(mtheta[i])*(rdt[i]), mouseY+sin(mtheta[i])*(rdt[i]),0,easing[i]);
        fill(c[i]);
        ellipse(v[i].x,v[i].y,rdu,rdu);
      }
    }
  }
  popMatrix();
  fill(0);
  rect(0,0,width,15);
  fill(255);
  textAlign(LEFT, TOP);
  text("r= "+ r,0,0);
  text("fps = "+ round(frameRate), 80,0);
  
  if (mv) {
    fill(255,0,0);
    text("Running", 120, 0);
  }
  if (!mv) {
    text("Static", 120, 0);
  }  
  if (mo) {
    fill(255,0,0);
    text("motion", 160, 0);
  }  
  if (!mo) {
    fill(255);
    text("stop", 160, 0);
  }  
  
}

void mousePressed() {

}

//void keyPressed() {
//  if (key == 's' || key == 's') {
//    mo = !mo;
//  }
//}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e == -1) r += 10;
  if (e ==1) r -= 10;
}
