class Particle {
  PVector position = new PVector();
  PVector velocity = new PVector();
  int d = 5;

  Particle(int pX, int pY, int vX, int vY) {
    position.x = pX;
    position.y = pY;
    velocity.x = vX;
    velocity.y = vY;
  }

  void draw() {
    noStroke();
    fill(255, 100);
    ellipse(position.x, position.y, d, d);
  }

  void update() {
    position.add(velocity);

    if (position.x < 0) {
      position.x = -position.x;
      velocity.x = -velocity.x;
    }

    if (position.x > width) {
      position.x = width - (position.x - width);
      velocity.x = -velocity.x;
    }

    if (position.y < 0) {
      position.y = -position.y;
      velocity.y = -velocity.y;
    }

    if (position.y > height) {
      position.y = height - (position.y - height);
      velocity.y = -velocity.y;
    }
  }
}