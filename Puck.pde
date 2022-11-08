class Puck {
  
  float x;
  float y;
  
  float velX;
  float velY;
  
  float r;
  
  Puck() {
    
    this.x = width/2;
    this.y = height/2;
    
    this.velX = 0;
    this.velY = 0;
    
    this.r = 12;
    
    this.reset();
  }
  
  void update() {
    
    this.x += this.velX;
    this.y += this.velY;
  }
  
  void show() {
    fill(255);
    ellipse(this.x, this.y, this.r*2, this.r*2);
  }
  
  void reset() {
    this.x = width/2;
    this.y = height/2;
    float angle = random(-PI/4, PI/4);
    this.velX = (float) (5 * Math.cos(angle));
    this.velY = (float) (5 * Math.sin(angle));
        
    if (random(1) < 0.5) {
    this.velX *= -1;
    }
  }
  
  void checkEdges() {
    
    if (this.y < 0 || this.y > height) {
      this.velY *= -1;
    }
    
    if (this.x - this.r > width) {
      leftScore++;
      this.reset();
    }
    
    if (this.x - this.r < 0) {
      rightScore++;
      this.reset();
    }
  }
  
  void checkPaddleLeft(Paddle p) {
    if (this.y - this.r < p.y + p.h/2 &&
      this.y + this.r > p.y - p.h/2 &&
      this.x - this.r < p.x + p.w/2) {
                
      if (this.x > p.x) {
        float diff = this.y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        this.velX = 5 * cos(angle);
        this.velY = 5 * sin(angle);
        this.x = p.x + p.w/2 + this.r;
      }         
    }  
  }
  
  void checkPaddleRight(Paddle p) {
    if (this.y - this.r < p.y + p.h/2 &&
      this.y + this.r > p.y - p.h/2 &&
      this.x + this.r > p.x - p.w/2) {
                
      if (this.x < p.x) {
        float diff = this.y - (p.y - p.h/2);
        float angle = map(diff, 0, p.h, radians(225), radians(135));
        this.velX = 5 * cos(angle);
        this.velY = 5 * sin(angle);
        this.x = p.x - p.w/2 - this.r;
      }       
    }  
  }
}
