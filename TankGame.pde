// Rat Parry | Apr 14 2026 | TankGame
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
PImage bg;
int score;
Timer objTimer, puTimer;

void setup() {
  size(500, 500);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
  //obstacles.add(new Obstacle(180, 180));
  //obstacles.add(new Obstacle(380, 330));
  score = 0;
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void scorePanel() {
  fill(#111f36, #111f36);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  textAlign(CENTER);
  fill(#c7cdd6);
  textSize(43);
  textAlign(CENTER);
  text("Score:" + score, width/2, 50);
  text("Health:" + tank1.health, width/2-150, 25);
  text("Ammo:" + tank1.laserCount, width/2+150, 25);
}

void draw() {
  background(#000000);
  imageMode(CORNER);
  image(bg, 0, 0);

  //Add timer to distribute obstacles
  if (objTimer.isFinished()) {
    obstacles.add(new Obstacle(-100, int(random(height))));
    objTimer.start();
  }

  //Distribute powerups on a timer
  if (puTimer.isFinished()) {
    //add powerup
    powerups.add(new PowerUp());
    // Restart Timer
    puTimer.start();
  }

  //Display and remove powerups
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();

    if (pu.reachedEdge()) {
      powerups.remove(pu);
    }
    if (pu.intersect(tank1)) {
      if (pu.type == 'h') {
        tank1.health = tank1.health + 100;
        powerups.remove(pu);
      } else if (pu.type == 'a') {
        tank1.laserCount = tank1.laserCount + 100;
        powerups.remove(pu);
      } else if (pu.type == 'a') {
        tank1.turretCount = tank1.turretCount + 1;
        powerups.remove(pu);
      }
    }
  }

  //Displaying and removing obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle obs = obstacles.get(i);
    obs.display();
    obs.move();
    if (obs.reachedEdge()) {
      obstacles.remove(i);
    }
    if (tank1.intersect(obs)) {
      //impact to change score, health, and obstacle
    }
  }
  //Displaying projectiles
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle obs = obstacles.get(j);
      if (p.intersect(obs)) {
        score = score +100;
        projectiles.remove(i);
        obstacles.remove(j);
        continue;
      }
    }
    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }
  }
  tank1.display();
  scorePanel();
  println("Objects in memory:" +obstacles.size());
  println("Projectiles iun Memory:" +projectiles.size());
}

void keyPressed() {
  if (key == 'w') {
    tank1.move('w');
  } else if (key == 's') {
    tank1.move('s');
  } else if (key == 'd') {
    tank1.move('d');
  } else if (key == 'a') {
    tank1.move('a');
  }
}

void mousePressed() {
  if (tank1.turretCount = 1) {
    projectiles.add(new Projectile(tank1.x-20, tank1.y, dx * speed, dy * speed));
  } else if (tank1.turretCount==2) {
    projectiles.add(new Projectile(tank1.x-20, tank1.y, dx * speed, dy * speed));

    projectiles.add(new Projectile(tank1.x-20, tank1.y, dx * speed, dy * speed));
  }
  //projectiles.add(new Projectile(tank1.x-20, tank1.y, dx * speed, dy * speed));
}
