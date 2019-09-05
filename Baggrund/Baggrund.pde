Mover movers[]= new Mover[10];
int sht=0;
float shtx=0;
float shty=0;
PImage kanonIMG;
boolean amsquish=false;
float count;
float reload;
Kanon k = new Kanon();

void setup() {
  size(1500,700);
  kanonIMG = loadImage("CoolKanon.png");
  
  for (int i=0;i<movers.length;i++){
    movers[i]=new Mover(3,50,height-50,0);
  }
}
 
 
void draw() {
  //display background
  background(#1800FF);
  rectMode(CORNERS);
  fill(#00FF1B);
  rect(0,height-height/3,width,height);
  
//DISPLAY BALLS
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
      reload = 0;
      shtx += 2.5/30;
      shty += 2.5/30;
  }
    
    if (reload == 1) {
      shtx = 0;
      shty = 0;
      textSize(32);
      fill(0);
      text("Reloading", width/2-60, height/2); 
    }
  }


// DISPLAY KANON
  k.display();
  if(amsquish==true){
    k.squish();
    if(frameCount-count > 30){
      amsquish=false;
      k.sVelocity *= 0.0;
      k.sAcceleration *= 0.0;
      k.damping = 0.80;
      k.dangle = PI/4;
      k.startsquish=300;   
    }
  }
  
  
}

void mouseReleased(){
  //AFFYR KANON
  if (sht < movers.length) {
    movers[sht]= new Mover(3,250,height-150,55);
    movers[sht].velocity = new PVector(shtx,-shty);
    sht++;
    shtx=0;
    shty=0;
    
    //KANON SQUISH
    if(amsquish==false){
      amsquish = true;
      count=frameCount;
    }
  }else{
    sht=0;
    reload=1;
    for (int i=0;i<movers.length;i++){
    movers[i]=new Mover(3,50,height-50,0);
}
  }
}
