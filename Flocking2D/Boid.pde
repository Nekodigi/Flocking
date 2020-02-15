class Boid {

  PVector pos, vel, accel = new PVector();
  float minSpeed = 5;
  float maxSpeed = 8;
  float seperateWeight = 2.5;
  float alignWeight = 1;
  float cohesionWeight = 1;
  float collisionWeight = 10;
  float maxSteerForce = 20;
  float deltaTime = 0.02;

  Boid() {
    pos = new PVector(random(width/scale), random(height/scale));
    vel = new PVector(random(-1, 1), random(-1, 1));
  }

  void update(ArrayList<Boid> boids) {
    accel.add(seperation(boids).mult(seperateWeight));
    accel.add(align(boids).mult(alignWeight));
    accel.add(cohesion(boids).mult(cohesionWeight));
    accel.add(collision().mult(collisionWeight));//-------------will fix
    accel.mult(maxSteerForce);
    //accel.setMag(constrain(accel.mag(), 0, maxSteerForce));
    vel.add(accel.mult(deltaTime));
    vel.setMag(constrain(vel.mag(), minSpeed, maxSpeed));
    pos.add(PVector.mult(vel, deltaTime));
    accel = new PVector();
    edges();
  }

  PVector seperation(ArrayList<Boid> boids) {
    PVector tAccel = new PVector();
    int count = 0;
    for (Boid boid : boids) {
      float sqrD = (pos.x - boid.pos.x)*(pos.x - boid.pos.x) + (pos.y - boid.pos.y)*(pos.y - boid.pos.y);
      if (boid != this && sqrD < seperateR*seperateR) {
        PVector offset = PVector.sub(pos, boid.pos);
        offset.div(sqrD);
        tAccel.add(offset);
        count++;
      }
    }
    if(count > 0){
      tAccel.div(count);
    }
    return tAccel;
  }

  PVector align(ArrayList<Boid> boids) {
    PVector tAccel = new PVector();
    int count = 0;
    for (Boid boid : boids) {
      float d = PVector.dist(pos, boid.pos);
      if (boid != this && d < perceptR) {
        tAccel.add(boid.vel);
        count++;
      }
    }
    if(count > 0){
      tAccel.div(count);
    }
    return tAccel;
  }

  PVector cohesion(ArrayList<Boid> boids) {
    PVector centre = new PVector();//centre of flockmates
    int count = 0;
    PVector offset = new PVector();
    for (Boid boid : boids) {
      float d = PVector.dist(pos, boid.pos);
      if (boid != this && d < perceptR) {
        centre.add(boid.pos);
        count++;
      }
    }
    if (count != 0) {
      centre.div(count);
      offset = PVector.sub(centre, pos);
    }
    return offset;
  }

  PVector collision() {
    PVector p = new PVector(mouseX/scale, mouseY/scale);
    float d = PVector.dist(pos, p);
    if (d < collisionR) {
      return PVector.sub(pos, p).normalize();
    }
    return new PVector();
  }

  void edges() {
    if (pos.x > width/scale) pos.x = 0;
    if (pos.x < 0) pos.x = width/scale;
    if (pos.y > height/scale) pos.y = 0;
    if (pos.y < 0) pos.y = height/scale;
  }

  void show() {
    fill((vel.heading()+PI)/TWO_PI*360, 100, 100);
    triangle(PVector.mult(pos, scale), vel.heading()+HALF_PI, 20);
  }
}