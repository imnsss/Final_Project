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
int bpm = 85;
AudioPlayer []player=new AudioPlayer[3];
Sampler     kick;
Sampler     snare;
Sampler     hat;
boolean[] hatRow = new boolean[16];
boolean[] snrRow = new boolean[16];
boolean[] kikRow = new boolean[16];
int beat;
int mode=0;
int MidiStep=28;
ArrayList<Rect> buttons = new ArrayList<Rect>();

void setup()
{
  size(1000, 1000);
  cp5 = new ControlP5(this);
  minim=new Minim(this);
  out = minim.getLineOut();

  player[0]=minim.loadFile("Aimer (エメ) - カタオモイ (单相思).mp3", 2048);
  player[1]=minim.loadFile("Martin Garrix _ David Guetta _ Jamie Scott _ Romy Dya - So Far Away.mp3", 2048);
  player[2]=minim.loadFile("Sub Urban; Bella Poarch - INFERNO.mp3", 2048);
  kick  = new Sampler( "BD.wav", 4, minim );
  snare = new Sampler( "SD.wav", 4, minim );
  hat   = new Sampler( "CHH.wav", 4, minim );
  for (int i = 0; i < 12; i++)
  {
    buttons.add( new Rect(150+i*MidiStep, 850, hatRow, i ) );
    buttons.add( new Rect(150+i*MidiStep, 900, snrRow, i ) );
    buttons.add( new Rect(150+i*MidiStep, 950, kikRow, i ) );
  }

  player[0].loop();

  fft = new FFT(player[0].bufferSize(), player[0].sampleRate());

  for (int i=0; i<3; i++) {
    cp5.addBang("bang"+i)
      .setPosition(width/2+20-3*40+i*80+200, height-100)
      .setSize(40, 40)
      .setId(i)
      ;
  }

  cp5.addSlider("Vol")
    .setPosition(width/2-100+200, height-150)
    .setSize(200, 20)
    .setRange(-20, 20)
    .setValue(128)
    ;

  cp5.addBang("Pause")
    .setPosition(width/2-150+200, height-150)
    .setSize(30, 30)
    .setLabel("Pause")
    ;
  cp5.addBang("Continue")
    .setPosition(width/2+120+200, height-150)
    .setSize(30, 30)
    .setLabel("Continue")
    ;


  cp5.addKnob("Tempo")
    .setRange(30, 230)
    .setValue(100)
    .setPosition(40, 870)
    .setRadius(30)
    .setDragDirection(Knob.HORIZONTAL)
    ;


  kick.patch( out );//不是混响暂时不能用
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
  fill(23);
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
  line(150+beat*MidiStep, 837, 150+beat*MidiStep, 964);
}
void Drawjdt()
{
  float posx = map(player[mode].position(), 0, player[mode].length(), 555+15, 844-15);
  stroke(234, 234, 234);
  strokeWeight(5);
  line(555, 788, 844, 788);
  noStroke();
  fill(0, 209, 247);
  ellipse(posx, 788, 30, 30);
}
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
void keyPressed()
{
  if (key=='a')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("C4").asHz(), 1.60 ) );
  }
  if (key=='s')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("C#4").asHz(), 1.60 ) );
  }
  if (key=='d')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("D4").asHz(), 1.60 ) );
  }
  if (key=='f')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("D#4").asHz(), 1.60 ) );
  }
  if (key=='g')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("E4").asHz(), 1.60 ) );
  }
  if (key=='h')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("F4").asHz(), 1.60 ) );
  }
  if (key=='j')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("F#4").asHz(), 1.60 ) );
  }
  if (key=='k')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("G4").asHz(), 1.60 ) );
  }
  if (key=='l')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("G#4").asHz(), 1.60 ) );
  }
  if (key==';')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("A4").asHz(), 1.60 ) );
  }
  if (key==' ')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("B4").asHz(), 1.60 ) );
  }
}
