PImage kanonIMG;
boolean amsquish=false;
float count;
Kanon k = new Kanon();

void setup(){
  size(800,350);
  kanonIMG = loadImage("CoolKanon.png");
}

void draw(){
  background(0);
  
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


void mouseClicked(){

  if(amsquish==false){
    amsquish = true;
    count=frameCount;
  }
}
