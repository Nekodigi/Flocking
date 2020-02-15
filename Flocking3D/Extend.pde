void triangle(PVector p, float d, float size){
  pushMatrix();
  translate(p);
  //rotate(d);
  point(p.x, p.y, p.z);
  //triangle(-size/4, size/4*sqrt(3), size/4, size/4*sqrt(3), 0, -size/2);
  popMatrix();
}

void translate(PVector p){
  translate(p.x, p.y, p.z);
}