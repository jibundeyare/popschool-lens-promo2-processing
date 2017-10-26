class Attractor {
  PVector position = new PVector();
  float force = 1.0 / 4.0;

  Attractor(int pX, int pY) {
    position.x = pX;
    position.y = pY;
  }

  void attract(Particle p) {
    PVector delta  = PVector.sub(position, p.position);
    delta.normalize();
    delta.mult(force);
    p.velocity.add(delta);
    p.velocity.limit(10);
  }
}