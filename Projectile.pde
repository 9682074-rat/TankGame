class Projectile {
  int x, y, w, h, speed, health;

  //Constructor
  Projectile(int x, int y) {
    this.x = x;
    this.y = y;
    w = 4;
    h = 6;
    speed = 10;
    health = 10;
  }

  void display() {
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }
  boolean reachedEdge() {
    return x >= width+150 || x <= -150 || y > height + 150 || y < -150;
  }
}
