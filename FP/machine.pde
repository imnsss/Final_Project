class Tick implements Instrument
{

  void noteOn( float dur )
  {
    if ( hatRow[beat] )
    {

      hat.trigger();
    }
    if ( snrRow[beat] )
    {

      snare.trigger();
    }
    if ( kikRow[beat] ) {
      kick.trigger();
    }
  }

  void noteOff()
  {
    beat = (beat+1)%16;
    out.setTempo(bpm);
    out.playNote( 0, 0.25f, this );
  }
}
class Rect
{
  int x, y, w, h;
  boolean[] steps;
  int stepId;

  public Rect(int _x, int _y, boolean[] _steps, int _id)
  {
    x = _x;
    y = _y;
    w = 12;
    h = MidiStep-8;
    steps = _steps;
    stepId = _id;
  }

  public void draw()
  {
    rectMode(CENTER);
    noStroke();
    fill(26, 98, 179);
    rect(x, y, h, h);
    if ( steps[stepId] )
    {
      fill(86, 211, 226);
      rect(x, y, w, w);
    } else
    {
    }
    rectMode(CORNER);
  }

  public void mousePressed()
  {
    if ( mouseX >= x-h/2&& mouseX <= x+h/2 && mouseY >= y-h/2 && mouseY <= y+h/2 )
    {
      steps[stepId] = !steps[stepId];
    }
  }
}

void mousePressed()
{
  for (int i = 0; i < buttons.size(); ++i)
  {
    buttons.get(i).mousePressed();
  }
}
