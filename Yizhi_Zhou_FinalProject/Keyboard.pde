// The sound of keyboard could be adjusted through Hertz

void keyPressed()
{
  if (key=='1')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("C4").asHz(), 1.60 ) );
  }
  if (key=='2')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("C#4").asHz(), 1.60 ) );
  }
  if (key=='3')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("D4").asHz(), 1.60 ) );
  }
  if (key=='4')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("D#4").asHz(), 1.60 ) );
  }
  if (key=='5')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("E4").asHz(), 1.60 ) );
  }
  if (key=='6')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("F4").asHz(), 1.60 ) );
  }
  if (key=='7')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("F#4").asHz(), 1.60 ) );
  }
  if (key=='8')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("G4").asHz(), 1.60 ) );
  }
  if (key=='9')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("G#4").asHz(), 1.60 ) );
  }
  if (key=='0')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("A4").asHz(), 1.60 ) );
  }
  if (key=='-')
  {
    out.playNote(0, 0.3, new ToneInstrument(Frequency.ofPitch("B4").asHz(), 1.60 ) );
  }
}
