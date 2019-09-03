Mover movers[]= new Mover[10];
int sht=0;
float shtx=0;
float shty=0;


void setup() {
  size(640,360);
  
  for (int i=0;i<movers.length;i++){
    movers[i]=new Mover(3,50,height-50);
  }
}
 
 
void draw() {
  background(255);

  for (int i=0;i<movers.length;i++){
    float m = movers[i].mass;
    float c = 0.3;
    
    PVector gravity = new PVector(0,0.5*m);
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
       
    movers[i].applyForce(friction);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
    
    if (mousePressed==true){
      shtx += 1.5/30;
      shty += 4.0/30;
    }
  }
}

void mouseReleased(){
  if (sht < movers.length) {
    movers[sht].velocity = new PVector(shtx,shty);
    sht++;
    shtx=0;
    shty=0;
  }
}

/*
void mouseClicked(){
  if (sht < movers.length) {
    movers[sht].velocity = new PVector(15,40);
    sht++;
  }
}
*/
