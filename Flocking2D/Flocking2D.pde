float perceptR = 2.5;
float seperateR = 1;
float collisionR = 5;
float scale = 50;

ArrayList<Boid> boids = new ArrayList<Boid>();

void setup(){
  fullScreen();
  //size(2000, 1000);
  colorMode(HSB, 360, 100, 100, 100);
  for(int i = 0; i < 1000; i++){
    boids.add(new Boid());
  }
}

void draw(){
  //background(0);
  fill(0, 10);
  rect(0, 0, width, height);
  fill(360);
  noStroke();
  for(Boid boid : boids){
    boid.update(boids);
    boid.show();
  }
  //show info
  //PVector tp = new PVector(width-200, height/2);
  //fill(360, 50);ellipse(tp.x, tp.y, collisionR*scale*2, collisionR*scale*2);
  //fill(360, 50);ellipse(tp.x, tp.y, perceptR*scale*2, perceptR*scale*2);
  //fill(0, 100, 100, 50);ellipse(tp.x, tp.y, seperateR*scale*2, seperateR*scale*2);
  //fill(360);triangle(tp, 0, 50);
}