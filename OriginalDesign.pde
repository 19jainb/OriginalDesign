void setup()
{
  size(200, 200, OPENGL);
}

void draw()
{
  noStroke();
  lights();
  translate(100, 100, 0);
  fill(255, 0, 0);
  sphere(75);
}
