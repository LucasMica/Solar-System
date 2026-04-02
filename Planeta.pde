class Planet {
  // Each planet object keeps track of its own angle of rotation.
  float theta;      // Rotation around sun
  float diameter;   // Size of planet
  float distance;   // Distance from sun
  float orbitspeed; // Orbit speed
 
  // Each Planet now has a Moon, or more!
  boolean moreMoons = false;
  Moon[] moons;
  Moon moon;
  color c;
  
  Planet(float distance_, float diameter_, int numberOfMoons) {
    distance = distance_;
    diameter = diameter_;
    theta = 0;
    orbitspeed = random(0.01,0.03);
    moreMoons = true;
    
    moons = new Moon[numberOfMoons];
    
    c = color(random(255), random(255), random(255), random(0,150));
    
    // create the Moons 24(or more) pixels from the planet with a diameter of 8(or more)
    for (int i = 0; i < numberOfMoons; i++) {
      moons[i] = new Moon(24*random(1,1.7),8*random(1,2));
    }
  }
 
  
  Planet(float distance_, float diameter_) {
    distance = distance_;
    diameter = diameter_;
    theta = 0;
    orbitspeed = random(0.01,0.03);
    
    c = color(random(255), random(255), random(255), random(0,150));
    
    // create the Moon 24(or more) pixels from the planet with a diameter of 8(or more)
    moon = new Moon(24*random(1,1.7),8*random(1,2));
  }
  
  void update() {
    // Increment the angle to rotate
    theta += orbitspeed;
    // Update the moon(s)
    if (moreMoons) {
      for (Moon moonInList : moons) {
        moonInList.update();
      }
    } else {
      moon.update();
    }
  }
  
  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 
    // Rotate orbit
    rotate(theta); 
    // translate out distance
    translate(distance,0); 
    stroke(0);
    fill(c);
    ellipse(0,0,diameter,diameter);
    // The planet is drawn, now draw the moon(s)
    
    if (moreMoons) {
      for (Moon moonInList : moons) {
        moonInList.display();
      }
    } else {
      moon.display();
    }
    
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix(); 
  }
}
