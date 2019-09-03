class Kanon{
  float startsquish=300;
  float amplitude=100;
  float period = 120;
  
  float sVelocity;
  float sAcceleration;
  float damping;
  float speed = 1.1;
  float dangle = PI/4;
  
  
  Kanon(){
    sVelocity = 0.0;
    sAcceleration = 0.0;
    damping = 0.80;
  }
  
  
  void squish(){
    sAcceleration = (-1*speed)*sin(dangle);
    
    sVelocity += sAcceleration;
    dangle += sVelocity;
    sVelocity *= damping;
    
    kanonIMG.resize(int(startsquish),100);

    startsquish = (100*sin(dangle)+300);
    
  }
  
  void display(){
    pushMatrix();
    translate(0,height-40);
    rotate(PI*1.8);
    image(kanonIMG,0,0);
    
    popMatrix();
  }
  
  
  
}
