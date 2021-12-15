// It shows an error when running the program
//          ==== JavaSound Minim Error ==== 
//          ==== Don't know the ID3 code APIC
// Through my search, ID3 tags are the textual parts of MP3 giving information like artist or title.
// For some reason, Minim complains when it doesn't recognize a tag, but there are many custom tags.
// These warning are harmless.

//Final Project

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import controlP5.*;

ControlP5 cp5;
AudioOutput out;
Minim minim;

AudioPlayer []player=new AudioPlayer[3];
Sampler     kick;
Sampler     snare;
Sampler     hat;

boolean[] hatRow = new boolean[16];
boolean[] snrRow = new boolean[16];
boolean[] kikRow = new boolean[16];

int bpm = 85;  //Initial BPM
int beat;
int mode=0;
int MidiStep=28; // The gap between buttons

ArrayList<Rect> buttons = new ArrayList<Rect>();
boolean playToggle = false;

void setup()
{
  size(1050,1000);
  cp5 = new ControlP5(this);
  minim=new Minim(this);
  out = minim.getLineOut();

  player[0]=minim.loadFile("Aimer.mp3", 2048); // The original name: Aimer (エメ) - カタオモイ (单相思).mp3 // The processing font needs to be changed so I deleted the Chinese and Japanese Fonts
  player[1]=minim.loadFile("Martin Garrix _ David Guetta _ Jamie Scott _ Romy Dya - So Far Away.mp3", 2048);
  player[2]=minim.loadFile("Sub Urban; Bella Poarch - INFERNO.mp3", 2048);
    
  kick  = new Sampler( "BD.wav", 4, minim );
  snare = new Sampler( "SD.wav", 4, minim );
  hat   = new Sampler( "CHH.wav", 4, minim );
  
  for (int i = 0; i < 16; i++)
  {
    buttons.add( new Rect(95+i*MidiStep, 860, hatRow, i ) );
    buttons.add( new Rect(95+i*MidiStep, 910, snrRow, i ) );
    buttons.add( new Rect(95+i*MidiStep, 960, kikRow, i ) );
  }

  player[0].loop();

  fft = new FFT(player[0].bufferSize(), player[0].sampleRate());

  for (int i=0; i<3; i++) {
    cp5.addBang("bang"+i)
      .setPosition(width/2+20-3*40+i*80+180, height-95)
      .setSize(40, 40)
      .setId(i)
      ;
  }

  cp5.addSlider("Vol")
    .setPosition(width/2-100+180, height-150)
    .setSize(200, 20)
    .setRange(-30, 30)
    .setValue(-20) //Initial volume of the song
    ;

  cp5.addBang("Pause")
    .setPosition(width/2+120+230, height-150)
    .setSize(30, 30)
    .setLabel("Pause")
    ;
    
  cp5.addBang("Continue")
    .setPosition(width/2+120+230, height-90)
    .setSize(70, 30)
    .setLabel("Continue/Replay")
    ;

  cp5.addKnob("Tempo")
    .setRange(30, 230)
    .setValue(85)
    .setPosition(40, 750)
    .setRadius(30)
    .setDragDirection(Knob.HORIZONTAL)
    ;

  cp5.addToggle("PlayPause")
    .setPosition(20, height - 130)
    .setSize(30, 70)
    .setValue(false)
    ;

  kick.patch( out );
  snare.patch( out);
  hat.patch( out );

  beat = 0;
  out.setTempo( bpm );
  out.playNote( 0, 0.25f, new Tick() );
}

void draw()
{
  background(0);
  pushMatrix();
  translate(0, -100);
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
  popMatrix();
  noStroke();
  fill(40); //UI background color
  rect(0, 700, width, 300);
  outF();
  MIDI();
  Drawjdt();
}


public void controlEvent(ControlEvent theEvent) {

  if (theEvent.getController().getName().equals("Tempo")) {
    bpm=int((theEvent.getController().getValue()));
    out.setTempo( bpm );
  }

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

// Relates to the DrumMachine
void MIDI()
{
  for (int i = 0; i < buttons.size(); ++i)
  {
    buttons.get(i).draw();
  }
  stroke(128);
  if ( beat % 4 == 0 )
  {
    fill(200, 0, 0);
  } else
  {
    fill(0, 200, 0);
  }
  stroke(0);
  line(95+beat*MidiStep, 840, 95+beat*MidiStep, 980);
}

//Music playback progress bar
void Drawjdt()
{
  float posx = map(player[mode].position(), 0, player[mode].length(), 555+45, 874-15);
  stroke(234, 234, 234);
  strokeWeight(5);
  line(585, 772, 874, 772);
  noStroke();
  fill(233, 244, 255);
  ellipse(posx, 772, 30, 30);
  fill(172, 198, 222);
  ellipse(posx, 772, 19, 19);
  
  if (mousePressed&mouseX>585&&mouseX<874&&mouseY>762&&mouseY<782) {
   int position=(int)map(mouseX, 585, 874, 0, player[mode].length());
     player[mode].cue(position);
  }
}

//music visualization for drum machine and keyboard
void outF()
{
  fill(63);
  rect(136, 724, 336, 106);
  stroke(255);

  for (int i = 0; i < out.bufferSize()/4 - 1; i++)
  {
    float w=map(i, 0, out.bufferSize()/4-1, 137, 470);
    line(w, 766 + out.left.get(i)*30, w+1, 766  + out.left.get(i+1)*30);
    line(w, 796 + out.right.get(i)*30, w+1, 796 + out.right.get(i+1)*30);
  }
}

void PlayPause(boolean toggVal) {
  playToggle = toggVal;
}
