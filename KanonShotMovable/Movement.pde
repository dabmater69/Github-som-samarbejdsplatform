class Movement{
  float roll;
  
  Movement(){
    roll = 100;
  }
  
  void display(){
    if (keyPressed==true){
      if (keyCode == LEFT) {
        roll -= 2;
      } else if (keyCode == RIGHT) {
        roll += 2;
      } 
    }
  }
  
}
