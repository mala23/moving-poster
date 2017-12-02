float radius = 200;
float angle = 0;
ArrayList<lineFolow> lineList;

void setup() {
  fullScreen(1);
  setupScreen();
  setupOpenCV();
  lineList = new ArrayList<lineFolow>();
  for (int i = 0; i<45; i++) {
    angle = radians(i*8);
    lineList.add(new lineFolow(0, 0, angle, width/2));
  }
};

void draw() {
  background(255);
  PVector heapPoint = faceLocation();
  for (int i = 0; i<lineList.size(); i++) {
    lineList.get(i).display(heapPoint.x, heapPoint.y, map(heapPoint.z, 0, 100, 0, 5));
  }
};

class lineFolow {
  float x, y, angle, radius;
  lineFolow(float x, float y, float angle, float radius) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.radius = radius;
  }
  void display(float targetX, float targetY, float angle2) {
    x =  width/2+sin(angle+angle2)*radius;
    y = height/2+cos(angle+angle2)*radius;
    line (x, y, targetX, targetY);
  }
};
