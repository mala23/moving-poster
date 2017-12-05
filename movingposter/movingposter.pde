int posterBackground = 255;
int actorX;
int actorY;

Eye eye1;
Eye eye2;

void setup() {
  fullScreen(1);
  setupScreen();
  shapeMode(CENTER);
  // setupOpenCV();

  eye1 = new Eye(150, 150);
  eye2 = new Eye(310, 150);
};

void draw() {
  eye1.setActorPos(mouseX, mouseY);
  eye2.setActorPos(mouseX, mouseY);
  background(posterBackground);
  eye1.draw();
  eye2.draw();
  eye1.move();
  eye2.move();
  // PVector heapPoint = faceLocation();
};
