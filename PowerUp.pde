class PowerUp {
  //member variable
  float x, y, w, h, speed;
  char type;

  //Constructor
  PowerUp(float x, float y) {
    this.x = x;
    this.y = y;
    w = 100;
    h = 100;
    speed = 2;
    x = random(width);
    y = 100;
    if(int(random(4))==2) {
      type = 'h'; // H - health
    } else if (int(random(3))==1) {
      type = 't'; // T - turret
    } else {
      type = 'a'; // A - Ammo
    }
    //obst1 = loadImage("obj.png");
  }

  void display() {
    if (type == 'a') {
      fill(#a37785);
      ellipse(x, y, w, h);
      fill(#a30f3e);
      textAlign(CENTER, CENTER);
      text("ammo", x, y);
    } else if (type == 'h') {
      fill(#c2a7af);
      ellipse(x, y, w, h);
      fill(#0a2a36);
      textAlign(CENTER, CENTER);
      text("Health",x,y);
    } else if (type == 't') {
      fill(#613e49);
      ellipse(x, y, w, h);
    }else{
    fill (#374a52,0,0);
    ellipse(x,y,w,h);
    fill(#111b1f);
    textAlign(CENTER,CENTER);
    text("Ammo",x,y);
    }
    //imageMode(CENTER);
    //image(obst1, x, y);
  }

  void move() {
    y = y + speed;
  }
    boolean reachedEdge() {
    return x >= width+150 || x <= -150 || y > height + 150 || y > -150;
  }
  
  boolean intersect(Tank t) {
    float distance = dist(x, y, t.x, t.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
  
}
