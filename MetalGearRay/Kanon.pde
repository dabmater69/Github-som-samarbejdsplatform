class Kanon{
  float startsquish=300;
  float amplitude=100;
  float period = 120;
  
  float sVelocity;
  float sAcceleration;
  float damping;
  float speed = 1.1;
  float dangle = PI/4;
  
  float rollHJ;
  
  
  Kanon(){
    sVelocity = 0.0;
    sAcceleration = 0.0;
    damping = 0.80;
    rollHJ = 0;
  }
  
  
  void squish(){
    sAcceleration = (-1*speed)*sin(dangle);
    
    sVelocity += sAcceleration;
    dangle += sVelocity;
    sVelocity *= damping;
    
    kanonIMG.resize(int(startsquish),100);

    startsquish = (100*sin(dangle)+287);
    
  }
  
  void display(){
    imageMode(CENTER);
    float OposX = 160+moveplz.roll;
    float OposY = height-90;
    float angle = atan2(mouseY-OposY,mouseX-OposX);
    
    //KANON
    pushMatrix();
    translate(OposX,OposY);
    fill(255,0,0,3*shtx);
    if (sht < movers.length) {
    rect(mouseX-(160+moveplz.roll),mouseY-(height-90),50,50);}
    else{
      fill(0,0,0);
      textSize(25);
      text("Out of ammo",mouseX-(160+moveplz.roll),mouseY-(height-90));
    }
    
    
    rotate(angle);

    image(kanonIMG,0,0);
    popMatrix();
    
    //HJUL
    imageMode(CENTER);
    pushMatrix();
    translate(160+moveplz.roll,height-36);
    if (keyPressed==true){
      if (keyCode == LEFT) {
        rollHJ -= 0.1;
      } else if (keyCode == RIGHT) {
        rollHJ += 0.1;
      } 
    }
    rotate(rollHJ);
    image(hjulIMG,0,0);
    popMatrix();
  }
  
  
  
}
