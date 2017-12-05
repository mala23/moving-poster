int posterBackground = 255;
Eye eye1;
Eye eye2;

void setup() {
  fullScreen(1);
  setupScreen();
  // setupOpenCV();

  eye1 = new Eye(0, 0);
  eye2 = new Eye(198, 0);
  smooth();
};

void draw() {
  background(posterBackground);
  // PVector heapPoint = faceLocation();
};
