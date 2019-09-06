Mover mover;

Mover[] movers = new Mover[1];

float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0.001;

void setup() {
  size(640,360);
 for (int i = 0; i < movers.length;i++){
  movers[i] = new Mover(random(0.5,3),width/8,height-height/4);
  }
}

void draw() {
  background(255);
  
  PVector gravity = new PVector(0,0.1);
  
  for (int i = 0; i < movers.length; i++) {
   movers[i].applyForce(gravity);
   movers[i].update();
   movers[i].checkEdges();
   movers[i].display();
   
   
  aVelocity += aAcceleration;
  angle += aVelocity;
}
}
