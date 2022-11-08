
int leftScore = 0;
int rightScore = 0;

Puck puck;

Paddle left;
Paddle right;

void setup() {
  
  size(600, 400);
  
  puck = new Puck();
  
  left = new Paddle(true);
  right = new Paddle(false);
  
}

void draw() {
  
  background(0);
  noStroke();
  
  puck.show();
  
  left.show();
  right.show();
  left.update();
  right.update();
  
  puck.update();
  puck.checkEdges();
  puck.checkPaddleRight(right);
  puck.checkPaddleLeft(left);
  
  fill(255);
  textSize(32);
  text(leftScore, 32, 40);
  text(rightScore, width-64, 40);
  
}

void keyReleased() {
  if(key == 'w' || key == 's') {
    left.move(0);
  }
  
  if(key == 'i' || key == 'k') {
    right.move(0);
  }
}

void keyPressed() {
  if(key == 'w') {
    left.move(-5);
  } else if (key == 's') {
    left.move(5);
  }
  
  if(key == 'i') {
    right.move(-5);
  } else if (key == 'k') {
    right.move(5);
  }
}
