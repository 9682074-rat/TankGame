class PowerUp {
  float x, y, w, h, speed;
  char type;
  //PImage obst1;
  //char idir;


  //Constructor
  PowerUp(float x, float y) {
    this.x = x;
    this.y = y;
    w = 100;
    h = 100;
    speed = 2;
    if (random(4) == 2) {
      type = 'h';
    } else if (random(2) == 1) {
      type = 't';
    } else {
      type = 'a';
    }
    //obst1 = loadImage("obj.png");
  }

  void display() {
    if (type == 'a') {
      fill(#a37785);
      ellipse(x, y, w, h);
      fill(#a30f3e);
      text("ammo", x, y);
    } else if (type == 'h') {
      fill(#c2a7af);
      ellipse(x, y, w, h);
    } else if (type == 't') {
      fill(#613e49);
      ellipse(x, y, w, h);
    }
    //imageMode(CENTER);
    //image(obst1, x, y);
  }

  void move() {
    y = y + speed;
  }
}
