/*
Mitchell Griest
 Fall 2015
 waterColor00.pde
 */

PImage logo;
int diameterA, diameterB;
int offsetX, offsetY;

void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  rectMode(CENTER);
  //Hide the mouse
  noCursor();
  strokeWeight(2);
  stroke(100);
  noStroke();
  //White background
  background(0, 0, 100);
  imageMode(CENTER);
  //Load the MOSAIC logo
  logo = loadImage("mlogo00.png");
  //Resize it to fit in our screen (does not protect aspect ratio)
  logo.resize(width, height);
}//end setup()

void draw() {
  //Redraw the logo overtop to keep it visible at all times
  filter(BLUR, 1);
  image(logo, width/2, height/2);
}//end draw()

//If the mouse is moved
void mouseMoved() {
  //Change the fill

  //Radial fill color
  fill(
  abs(100-(map(mouseDistanceFromCenter(), 0, width, 0, 100))),   //H
  map(mouseDistanceFromCenter(), 0, width, 20, 100),             //S
  100);                                                          //B

  //Fill color based on mouseX
  //  fill((map(mouseX, 0, width, 0, 100)), map(mouseY, 0, height, 0, 75), 100);

  //Choose a random diameter for our circle
  diameterA = (int)random(10, 150); //main circle
  diameterB = (int)random(10, 100); //accend circle
  offsetX = (int)random(-100, 100);
  offsetY = (int)random(-100, 100);
  //Draw the circle
  ellipse(mouseX, mouseY, diameterA, diameterA);

  //Draw a small accent circle near the main circle
  //  ellipse(mouseX+offsetX, mouseY+offsetY, diameterB, diameterB);

  //Redraw the logo overtop to keep it visible at all times
  image(logo, width/2, height/2);
  //  filter(ERODE);
}//end mouseMoved()

int mouseDistanceFromCenter() {
  return (int)sqrt( sq(mouseX - width/2) + sq(mouseY - height/2));
}

