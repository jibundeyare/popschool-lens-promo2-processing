Particle[] particles = new Particle[10000];
Attractor a = new Attractor(0, 0);

void setup() {
  size(800, 600);

  for (int i = 0; i < particles.length; i++) {
    int pX = round(random(0, width));
    int pY = round(random(0, height));
    int vX = round(random(-2, 2));
    int vY = round(random(-2, 2));

    particles[i] = new Particle(pX, pY, vX, vY);
  }
}

void draw() {
  background(0);

  a.position.x = mouseX;
  a.position.y = mouseY;

  for (int i = 0; i < particles.length; i++) {
    particles[i].draw();
    a.attract(particles[i]);
    particles[i].update();
  }
}