
void effect03dra()
{

  strokeWeight(2);
  for (int i = 0; i < player[2].bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player[2].bufferSize(), 0, width );
    float x2 = map( i+1, 0, player[2].bufferSize(), 0, width );
    float r=map( i, 0, player[2].bufferSize(), 50, 200);
    stroke(r, 253, 89);
    line( x1, 400 + player[2].left.get(i)*50, x2, 400 + player[2].left.get(i+1)*50 );
    line( x1, 600 + player[2].right.get(i)*50, x2, 600 + player[2].right.get(i+1)*50 );
    noStroke();
    if (random(1)>0.95)
    {
      float offy=random(-80, 80);
      fill(random(199), 185, 100, 200);
      ellipse(x1, 400+offy, player[2].left.get(i)*50, player[2].left.get(i)*50);
    }

    if (random(1)<0.05)
    {
      float offy=random(-80, 80);
      fill(random(199), 185, 100, 200);
      ellipse(x2, 600+offy, player[2].right.get(i)*50, player[2].right.get(i)*50);
    }
  }
}
