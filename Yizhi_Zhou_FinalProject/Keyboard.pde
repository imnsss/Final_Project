// The sound of keyboard could be edited through Hertz

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
  if (key=='w')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("F#4").asHz(), 1.60 ) );
  }
  if (key=='e')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("G4").asHz(), 1.60 ) );
  }
  if (key=='r')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("G#4").asHz(), 1.60 ) );
  }
  if (key=='t')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("A4").asHz(), 1.60 ) );
  }
  if (key=='y') 
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("B4").asHz(), 1.60 ) );
  }
}
