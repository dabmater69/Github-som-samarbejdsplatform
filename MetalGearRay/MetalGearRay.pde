Mover movers[]= new Mover[10];
Movement moveplz= new Movement();
int sht=0;
float shtx=0;
float shty=0;
PImage kanonIMG;
PImage hjulIMG;
PImage baggrundIMG;

boolean amsquish=false;
float count;
float reload;
Kanon k = new Kanon();

float OposX;
float OposY;
float angle;


void setup() {
  size(1500,834);
  kanonIMG = loadImage("CoolKanon.png");
  hjulIMG = loadImage("CoolHjul.png");
  baggrundIMG = loadImage("Baggrund.png");
  baggrundIMG.resize(1500,0);
  
  for (int i=0;i<movers.length;i++){
    movers[i]=new Mover(3,50,height-50,0);
  }
}
 
 
void draw() {
  //display background
  background(#1800FF);
  image(baggrundIMG,width/2,height/2);

  
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

//MOVE KANON  
  moveplz.display();


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
      kanonIMG = loadImage("CoolKanon.png");
    }
  }
// FIND ANGLE OF MOUSE IN RELATION TO CANON
  OposX = 160+moveplz.roll;
  OposY = height-90;
  angle = atan2(mouseY-OposY,mouseX-OposX);
}


void mouseReleased(){
  //AFFYR KANON
  
  if (sht < movers.length) {
    movers[sht]= new Mover(3,OposX-20+cos(angle)*150,OposY+sin(angle)*150,55);
    float lshot= sqrt(sq(shtx)+sq(shty));
    movers[sht].velocity = new PVector(cos(angle)*lshot,(sin(angle)*lshot));
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
