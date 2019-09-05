class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float   topspeed;
  float   mass;
  float angle;
  float aVelocity;
  float aAcceleration;
  float opacity;
  
  
  Mover(float m, float x, float y, float o){
    mass=m;
    opacity=o;
    location= new PVector(x,y);
    velocity= new PVector(0,0);
    acceleration= new PVector(0,0);
    angle = 0;
    aVelocity = 0;
    aAcceleration = 0;
  }
  
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass); //Newton's second law
    acceleration.add(f);
  }
  
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    aAcceleration = velocity.x;
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity,-0.1,0.1);
    if (location.y > height) aVelocity=0;
    angle += aVelocity;
    
    acceleration.mult(0);
  }
  
  
  void display(){
    stroke(0,0,0,opacity*5);
    rectMode(CENTER);
    fill(230,230,230, opacity*4);
    
    pushMatrix();
    
    translate(location.x, location.y);
    rotate(angle);
    rect(0, 0, mass*15,mass*15);
    
    popMatrix();
  }
  

  void checkEdges(){
    if (location.x > width) {
      location.x = width;
      velocity.x *= -0.3; //energyloss impacat wall
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }
    if (location.y > height) {
      location.y=height;
      velocity.y *= -0.4; //energyloss impact ground
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    }
  }
}
