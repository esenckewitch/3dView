class Point{
  float x;
  float y;
  float z;
  float h;
  
  Point(float x, float y, float h){
    this.x = x;
    this.y = y;
    this.z = 0;
    this.h = h;
  }
  
   Point(float x, float y, float z, float h){
    this.x = x;
    this.y = y;
    this.z = z;
    this.h = h;
  }
  
  Point(PVector p, float h){
    this.x = p.x;
    this.y = -p.y;
    this.z = p.z;
    this.h = h;
  }
  
  void transform(float a, float b, float c, float d){
    x = x * a + x * c;
    y = y * b + y * d;
  }
  
  void transform(float a, float b, float c, float d, float m, float n, float p, float q, float hh){
    x = x * a + y * c + h * m;
    y = x * b + y * d + h * n;
    h = x * p + y * q + h * hh;
  }
  
  void transform(float a, float b, float c, float d, float e, float f, float g, float i, float j, float l, float m, float n, float p, float q, float r, float s){
    x = x * a + y * d + z * g + h * l;
    y = x * b + y * e + z * i + h * m;
    z = x * c + y * f + z * j + h * n;
    h = x * p + y * q + z * r + h * s;
  }
  void normalize(float f, float q){
    transform(cos(f), sin(f) * sin(q), 0, 0, cos(q), 0, sin(f) ,-cos(f) * sin(q) , 0, 0, 0, 0, 0, 0, 0, 1);    
  }
  
  void scale(float s){
    transform(s, 0, 0, s);
  }
  
  void rotate(float t){
    transform(cos(t), sin(t), -sin(t), cos(t));
  }
  
  void rotate(float t, float x, float y){
    this.rotate(t);
    this.move(x,y);
  }
  
  void move(float x, float y){
    transform(1, 0, 0, 1, x, y, 0, 0, 1);
  }
  
  void show(){
    point(round(this.x / h), round(this.y / h));
  }
  
}
class Line{
  Point p1, p2;
  
  Line(Point p1, Point p2){
    this.p1 = p1;
    this.p2 = p2;
  }
  
  void transform(float a, float b, float c, float d){
    p1.transform(a, b, c, d);
    p2.transform(a, b, c, d); 
  }
  
  void transform(float a, float b, float c, float d, float m, float n, float p, float q, float hh){
    p1.transform(a, b, c, d, m, n, p, q, hh);
    p2.transform(a, b, c, d, m, n, p, q, hh);
  }
  
  void transform(float a, float b, float c, float d, float e, float f, float g, float i, float j, float l, float m, float n, float p, float q, float r, float s){
    p1.transform(a, b, c, d, e, f, g, i, j, l, m, n, p, q, r, s);
    p2.transform(a, b, c, d, e, f, g, i, j, l, m, n, p, q, r, s);
  }
  void normalize(float f, float q){
    p1.normalize(f, q);
    p2.normalize(f, q);
  }
  void scale(float s){
    transform(s, 0, 0, s);
  }
  
  void rotate(float t){
    transform(cos(t), sin(t), -sin(t), cos(t));
  }
  
  void rotate(float t, float x, float y){
    this.rotate(t);
    this.move(x,y);
  }
  
  void move(float x, float y){
    transform(1, 0, 0, 1, x, y, 0, 0, 1);
  }
  
  void show2d(){
    line(round(p1.x / p1.h), round(p1.y / p1.h), round(p2.x / p2.h), round(p2.y / p2.h));
  }
  
  void showXY(){
    line(round(p1.x / p1.h) + 250, -round(p1.y / p1.h) + 125, round(p2.x / p2.h) + 250, -round(p2.y / p2.h) + 125);
  }
  
  void showZY(){
    line(round(p1.z / p1.h) + 750, -round(p1.y / p1.h) + 125, round(p2.z / p2.h) + 750, -round(p2.y / p2.h) + 125);
  }
  
  void showZX(){
    line(round(p1.x / p1.h) + 250, -round(p1.z / p1.h) + 375, round(p2.x / p2.h) + 250, -round(p2.z / p2.h) + 375);
  }
  
  void show3D(){
    line(round(p1.x / p1.h) + 750, -round(p1.y / p1.h) + 325, round(p2.x / p2.h) + 750, -round(p2.y / p2.h) + 325);
  }
  
  void show(){
    if(this.p1.z == 0 && this.p2.z == 0)
       show2d();
    else
       showXY();
       showZY();
       showZX();
  }
  
}

class Figure3d{
  private int size = 8;
  Point ps[] = new Point[size];

  Figure3d(Point ps[]){
    for(int i = 0; i < size; i++)
      this.ps[i] = ps[i];
  }
  
  void transform(float a, float b, float c, float d){
    for(int i = 0; i < size; i++)
      ps[i].transform(a, b, c, d);
  }
  
  void transform(float a, float b, float c, float d, float m, float n, float p, float q, float hh){
    for(int i = 0; i < size; i++)
      ps[i].transform(a, b, c, d, m, n, p, q, hh);
  }
  
  void transform(float a, float b, float c, float d, float e, float f, float g, float i, float j, float l, float m, float n, float p, float q, float r, float s){
    for(int k = 0; k < size; k++)
      ps[k].transform(a, b, c, d, e, f, g, i, j, l, m, n, p, q, r, s);
  }
  void rotateX(float t){}
  
  void rotateY(float t){
    transform(cos(t), 0, -sin(t), 0, 1, 0, sin(t), 0, cos(t), 0, 0, 0, 0, 0, 0, 1);
  }
  
  void rotateZ(float t){}
  
  void normalize(float f, float q){
    for(int i = 0; i < size; i++)
      ps[i].normalize(f, q);
  }
  void move(float x, float y){
    transform(1, 0, 0, 1, x, y, 0, 0, 1);
  }
  
  void rotate(float t){
    transform(cos(t), sin(t), -sin(t), cos(t));
  }
  
  void show(){
    for(int i = 0; i < size; i++){
      for(int j = 0; j < size; j++){
        if(i <= j) continue;
        Line l = new Line(ps[i], ps[j]);
        l.show();
      }
    }
  }
  
  void show3D(float t, float q){
    for(int i = 0; i < size; i++){
      for(int j = 0; j < size; j++){
        if(i <= j) continue;
        Point p1 = new Point(ps[i].x, ps[i].y, ps[i].z, 1);
        Point p2 = new Point(ps[j].x, ps[j].y, ps[j].z, 1);
        Line l = new Line(p1, p2);
        p1.move(0, -10);
        p2.move(0, -10);
        p1.transform(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0.3);
        p2.transform(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0.3);
        p1.normalize(t, q);
        p2.normalize(t, q);
        l.show3D();
      }
    }
  }

}

void setup(){
  size(1000, 500);
  background(255,255,255);
}

float t = 0;

void draw(){
  clear();
  background(255,255,255);
  line(500, 0, 500, 500);
  line(0, 250, 1000, 250);
  Point ps[] = new  Point[8];
  ps[0] = new Point(0-20, -10-20, -20, 0.25);
  ps[1] = new Point(40-20, 0-20, 0-20, 0.25);
  ps[2] = new Point(0-20, 0-20, 40-20, 0.25);
  ps[3] = new Point(40-20, 0-20, 40-20, 0.25);
  ps[4] = new Point(0-20, 40-20, 0-20, 0.25);
  ps[5] = new Point(40-20, 40-20, 0-20, 0.25);
  ps[6] = new Point(0-20, 40-20, 40-20, 0.25);
  ps[7] = new Point(40-20, 40-20, 40-20, 0.25);
  
  Figure3d f = new Figure3d(ps);
  f.show();
  f.show3D(t, 0);
  saveFrame("save/res_####.png");
  t += 0.1;
}
