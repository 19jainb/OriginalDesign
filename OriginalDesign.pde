import ddf.minim.*;

Minim minim;
AudioPlayer audio;

int buttonRadius;
int faceRadius;
int textboxRadius;
float textSize;

void setup()
{
  size(200, 200);
  buttonRadius = 200;
  faceRadius = 0;
  textboxRadius = 200;
  textSize = 75;
  
  minim = new Minim(this);
  audio = minim.loadFile("that_was_easy.wav");
  
  setupText();
  
  noLoop();
}

void draw()
{
  background(220);
  noStroke();
  fill(255, 0, 0);
  ellipse(100, 100, buttonRadius, buttonRadius);
  if (textboxRadius >= 100) displayText();
  
  if (buttonRadius > 0)
  { 
    buttonRadius = buttonRadius - 2;
  } else
  {
    displayFace();
  }  
}

void setupText() {
  PFont font = loadFont("HelveticaNeueLTStd-Lt-48.vlw");
  textFont(font);
}

void displayText() {
  int point = 200 - textboxRadius;
  
  if (textSize > 1)
  {
    textSize(textSize);
  } else
  {
    textSize(1); 
  }  
  
  textAlign(CENTER, CENTER);
  fill(255, 250, 250);
  text("easy", point, point, textboxRadius - point, textboxRadius - point);
  textboxRadius--;
  textSize = textSize - .8;
}  

void displayFace()
{ 
  if (faceRadius < 200)
  {
  faceRadius++;
  }
  
  background(220); // face
  noStroke();
  fill(255, 255, 0);
  ellipse(100, 100, faceRadius, faceRadius);
  
  fill(255, 255, 255); // smile
  stroke(0);
  arc(100, 135, 125, 100, 0, PI);
  
  fill(0); // line connected endpoints of smile
  line(37.5, 135, 162.5, 135);
  
  rect(50, 50, 10, 10); // eyes
  rect(140, 50, 10, 10);
  
  fill(0, 128, 0); // nose
  triangle(100, 80, 90, 110, 110, 110);
}  

void mousePressed()
{
  audio.play();
  audio.rewind();
  loop();
}
