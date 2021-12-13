import processing.sound.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioIn mic;
Amplitude amp;

void setup() {
  colorMode(RGB,255);
  size(1500,1080,P2D);
  for(int i =0; i < num-1; i++){
    c[i] = color(random(20,255),random(0,255),random(0,255));
    v[i] = new PVector(random(width),random(height));
    theta[i] = round(random(360));
    dtheta[i] = random(mts);
    mtheta[i] = theta[i]/180*PI;
    rdt[i] = round(random(-rdtr, rdtr));
    easing[i] = random(0.02, 0.3);
  }
  
  frameRate(60);
  
  mic = new AudioIn(this, 1);
  mic.start();
  amp = new Amplitude(this);
  amp.input(mic);
}
