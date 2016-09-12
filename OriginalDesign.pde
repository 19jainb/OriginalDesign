int buttonRadius;
int faceRadius;
int textboxRadius;
float textSize;
boolean lockMousePress;
float leftEyeX;
float leftEyeY;
float rightEyeX;
float rightEyeY;
float upPointNoseY; // working
float leftPointNoseX;
float rightPointNoseX;
float leftRightNoseY;

void setup()
{
  size(200, 200);
  lockMousePress = false;
  buttonRadius = 200;
  faceRadius = 0;
  textboxRadius = 200;
  textSize = 75;
  
  leftEyeX = 100;
  leftEyeY = 100;
  rightEyeX = 100;
  rightEyeY = 100;
  
  upPointNoseY = 100;
  leftPointNoseX = 100;
  rightPointNoseX = 100;
  leftRightNoseY = 100;
  
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
  } else lockMousePress = false;
  
  background(220); // face
  noStroke();
  fill(255, 255, 0);
  ellipse(100, 100, faceRadius, faceRadius);
  
  fill(255, 255, 255); // smile
  stroke(0);
  arc(100, 135, 125, 100, 0, PI); // need to expand/shrink
  
  fill(0); // line connected endpoints of smile
  line(37.5, 135, 162.5, 135); // need to expand/shrink
  
  rect(leftEyeX, leftEyeY, 10, 10); // eyes
  rect(rightEyeX, rightEyeY, 10, 10);
  
  if ((leftEyeX > 50) & (leftEyeY > 50))
  {
  leftEyeX = leftEyeX - 0.25;
  leftEyeY = leftEyeY - 0.25;
  }
  
  if (rightEyeX < 140) rightEyeX = rightEyeX + 0.25;
  if (rightEyeY > 50) rightEyeY = rightEyeY - 0.25;
  
  fill(0, 128, 0); // nose
  if (upPointNoseY > 80) upPointNoseY = upPointNoseY - 0.1;
  if (leftPointNoseX > 90) leftPointNoseX = leftPointNoseX - 0.1;
  if (rightPointNoseX < 110) rightPointNoseX = rightPointNoseX + 0.1;
  if (leftRightNoseY < 110) leftRightNoseY = leftRightNoseY + 0.1;
  triangle(100, upPointNoseY, leftPointNoseX, leftRightNoseY, rightPointNoseX, leftRightNoseY);
}  

void mousePressed()
{
  if (lockMousePress == false) {
  lockMousePress = true;
  loop();
  }
}
