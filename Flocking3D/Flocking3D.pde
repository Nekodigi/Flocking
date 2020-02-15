float perceptR = 2.5;
float seperateR = 1;
float collisionR = 5;
float scale = 100;

ArrayList<Boid> boids = new ArrayList<Boid>();

void setup(){
  fullScreen(P3D);
  //size(2000, 1000);
  colorMode(HSB, 360, 100, 100, 100);
  for(int i = 0; i < 1000; i++){
    boids.add(new Boid());
  }
}

void draw(){
  background(0);
  //fill(0, 10);
  //rect(0, 0, width, height);
  translate(width/2, height/2);
  rotateX((float)frameCount/1000);
  rotateY((float)frameCount/1000);
  rotateZ((float)frameCount/1000);
  strokeWeight(10);
  for(Boid boid : boids){
    boid.update(boids);
    boid.show();
  }
  noFill();
  strokeWeight(1);
  stroke(360);
  box(height/2, height/2, height/2);
}