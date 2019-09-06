//Exercise 1.10
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  float angle = 0;
  float aVelocity = 0.01;
  float aAcceleration = 0;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(3,-5);
    acceleration = new PVector(0,0);
    //topspeed = 10;
  }

  void applyForce(PVector force) {
     PVector f = PVector.div(force,mass);
     acceleration.add(f);
  }  
    
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    
    aAcceleration = acceleration.x/10;
    aVelocity += aAcceleration;
    angle += aVelocity;
    
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(175);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rect(0,0,mass*16,mass*16);
    popMatrix();
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}
