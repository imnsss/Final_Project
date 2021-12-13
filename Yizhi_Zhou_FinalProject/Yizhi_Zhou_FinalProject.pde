
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import controlP5.*;

ControlP5 cp5;

Minim minim;

AudioPlayer []player=new AudioPlayer[3];

int mode=0;
void setup()
{
  cp5 = new ControlP5(this);
  minim=new Minim(this);
  player[0]=minim.loadFile("Aimer (エメ) - カタオモイ (单相思).mp3", 2048);
  player[1]=minim.loadFile("Martin Garrix _ David Guetta _ Jamie Scott _ Romy Dya - So Far Away.mp3", 2048);
  player[2]=minim.loadFile("Sub Urban; Bella Poarch - INFERNO.mp3", 2048);
  player[0].loop();
  size(1000, 1000);
  effect03set();
  fft = new FFT(player[0].bufferSize(), player[0].sampleRate());

  for (int i=0; i<3; i++) {
    cp5.addBang("bang"+i)
      .setPosition(width/2+20-3*40+i*80, height-100)
      .setSize(40, 40)
      .setId(i)
      ;
  }

  cp5.addSlider("Vol")
    .setPosition(width/2-100, height-150)
    .setSize(200, 20)
    .setRange(-20, 20)
    .setValue(128)
    ;

  cp5.addBang("Pause")
    .setPosition(width/2-150, height-150)
    .setSize(30, 30)
    .setLabel("Pause")
    ;
  cp5.addBang("Continue")
    .setPosition(width/2+120, height-150)
    .setSize(30, 30)
    .setLabel("Continue")
    ;
}
void draw()
{
  background(0);
  if (mode%3==0)
  {
    effect01dra();
  } else if (mode%3==1)
  {
    effect02dra();
  } else if (mode%3==2)
  {
    effect03dra();
  }
}
void keyPressed()
{
  player[mode%3].pause();
  mode++;
  player[mode%3].loop();
}

public void controlEvent(ControlEvent theEvent) {

  for (int i=0; i<3; i++) {
    if (theEvent.getController().getName().equals("bang"+i)) {
      player[mode].pause();
      mode=i;
      player[mode].loop();
    }
  }
}

void Vol(float val) {
  player[mode].setGain(val);
}

public void Pause() {
  player[mode].pause();
}

public void Continue() {
  player[mode].loop();
}
