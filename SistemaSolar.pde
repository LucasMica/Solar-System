// An array of 4 planet objects
Planet[] planets = new Planet[3];

void setup() {
  size(800, 500);

  // The planet objects are initialized using the counter variable
  
  for (int i = 0 ; i < planets.length-1; i++) {
    planets[i] = new Planet(100 + i*60, 24);
  }
  
  int lastIndex = planets.length-1;
  planets[lastIndex] = new Planet(100 + lastIndex*60, 24, 2);
  
}

void draw() {
  background(255);

  // Drawing the Sun
  pushMatrix();
  translate(width/2, height/2);
  stroke(0);
  fill(255, 255, 0);
  ellipse(0, 0, 64, 64);

  // Drawing all Planets
  for (int i = 0; i < planets.length; i++ ) {
    planets[i].update();
    planets[i].display();
  }
  popMatrix();
}
