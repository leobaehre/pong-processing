class Paddle {
  
  float x, y;
  float w, h;
  float velY;
  
  
  Paddle(boolean isLeft) {
   
    this.y = height / 2;
    this.w = 20;
    this.h = 100;
    this.velY = 0;
   
    this.x = isLeft ? this.w : width - this.w;
  }
  
  void update() {
    this.y += this.velY;
    this.y = constrain(this.y, this.h/2, height - this.h/2);
  }
  
  void move(float steps) {
    this.velY = steps;
  }
 
  void show() {
    fill(255);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h);
  }
}
