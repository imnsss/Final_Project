void effect02dra()
{
  fill(238, 177, 255);
  ellipse(width/2, height/2, player[1].mix.level()*600, player[1].mix.level()*600);
  for (int i = 0; i < player[1].bufferSize() - 1; i+=30)
  {
    fill(140, 197, 237);
    float x1 = map( i, 0, player[1].bufferSize(), 0, width );
    rect(x1, 600, 10, 50 + player[1].left.get(i+1)*50 );
  }
}
