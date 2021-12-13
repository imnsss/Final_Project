FFT fft;
float[] fftReal;

void effect01dra()
{
  fft.forward(player[0].mix);
  fftReal = fft.getSpectrumReal();
  float ang=0;
  float ang2=ang+0.93;
  float ang3=ang+2.0;


  float angle=PI/40;

  int Rad = 137;
  int circRad = 193;
  int cRad = 219;

  int circThick = 3;//宽度

  strokeWeight(1);

  for (int i = 0; i < 81; i+=1) {
    float dist = constrain(fftReal[i], 0, 160);
    float dist2 =constrain(fftReal[i+1], 0, 160);
    stroke(255, 200);
    strokeWeight(3);
    //line(width/2 - cos(ang)*(circRad-dist-circThick), height/2 + sin(ang)*(circRad-dist-circThick), width/2 - cos(ang+angle)*(circRad-dist2-circThick), height/2 + sin(ang+angle)*(circRad-dist2-circThick));
    line(width/2 - cos(ang)*(Rad+dist+circThick), height/2 + sin(ang)*(Rad+dist+circThick), width/2 - cos(ang)*(Rad-dist-circThick), height/2 + sin(ang)*(Rad-dist-circThick));
    //line(width/2 - cos(ang)*(Rad+dist+circThick), height/2 + sin(ang)*(Rad+dist+circThick), width/2 - cos(ang+angle)*(Rad+dist2+circThick), height/2 + sin(ang+angle)*(Rad+dist2+circThick));
    //line(width/2 - cos(ang)*(Rad-dist-circThick), height/2 + sin(ang)*(Rad-dist-circThick), width/2 - cos(ang+angle)*(Rad-dist2-circThick), height/2 + sin(ang+angle)*(Rad-dist2-circThick));

    line(width/2 - cos(ang2)*(circRad+dist+circThick), height/2 + sin(ang2)*(circRad+dist+circThick), width/2 - cos(ang2)*(circRad-dist-circThick), height/2 + sin(ang2)*(circRad-dist-circThick));
    line(width/2 - cos(ang2)*(circRad+dist+circThick), height/2 + sin(ang2)*(circRad+dist+circThick), width/2 - cos(ang2+angle)*(circRad+dist2+circThick), height/2 + sin(ang2+angle)*(circRad+dist2+circThick));

    line(width/2 - cos(ang3)*(cRad+dist+circThick), height/2 + sin(ang3)*(cRad+dist+circThick), width/2 - cos(ang3)*(cRad-dist-circThick), height/2 + sin(ang3)*(cRad-dist-circThick));
    line(width/2 - cos(ang3)*(cRad+dist+circThick), height/2 + sin(ang3)*(cRad+dist+circThick), width/2 - cos(ang3+angle)*(cRad+dist2+circThick), height/2 + sin(ang3+angle)*(cRad+dist2+circThick));
    line(width/2 - cos(ang3)*(cRad-dist-circThick), height/2 + sin(ang3)*(cRad-dist-circThick), width/2 - cos(ang3+angle)*(cRad-dist2-circThick), height/2 + sin(ang3+angle)*(cRad-dist2-circThick));
    ang2+=angle;
    ang3+=angle;
    ang+=angle;
  }
}
