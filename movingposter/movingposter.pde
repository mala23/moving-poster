int posterBackground = 255;
float actorX;
float actorY;

Eye eye1;
Eye eye2;
Eye eye3;
Eye eye4;
Eye eye5;
Eye eye6;
Eye eye7;
Eye eye8;
Eye eye9;

Text text;

void setup() {
  fullScreen(1);
  setupScreen();
  shapeMode(CENTER);
  // setupOpenCV();

  eye1 = new Eye((width * 0.069) + 75, (height * 0.049) + 75);
  eye2 = new Eye((width * 0.121) + 225, (height * 0.049) + 75);
  eye3 = new Eye((width * 0.173) + 375, (height * 0.049) + 75);
  eye4 = new Eye((width * 0.069) + 75, (height * 0.0859) + 225);
  eye5 = new Eye((width * 0.121) + 225, (height * 0.0859) + 225);
  eye6 = new Eye((width * 0.173) + 375, (height * 0.0859) + 225);
  eye7 = new Eye((width * 0.069) + 75, (height * 0.1228) + 375);
  eye8 = new Eye((width * 0.121) + 225, (height * 0.1228) + 375);
  eye9 = new Eye((width * 0.173) + 375, (height * 0.1228) + 375);

  text = new Text((width * 0.269) + 128, height - (height * 0.069));
};

void draw() {
  background(posterBackground);
  eye1.setActorPos(mouseX, mouseY);
  eye2.setActorPos(mouseX, mouseY);
  eye3.setActorPos(mouseX, mouseY);
  eye4.setActorPos(mouseX, mouseY);
  eye5.setActorPos(mouseX, mouseY);
  eye6.setActorPos(mouseX, mouseY);
  eye7.setActorPos(mouseX, mouseY);
  eye8.setActorPos(mouseX, mouseY);
  eye9.setActorPos(mouseX, mouseY);
  eye1.draw();
  eye2.draw();
  eye3.draw();
  eye4.draw();
  eye5.draw();
  eye6.draw();
  eye7.draw();
  eye8.draw();
  eye9.draw();
  eye1.move();
  eye2.move();
  eye3.move();
  eye4.move();
  eye5.move();
  eye6.move();
  eye7.move();
  eye8.move();
  eye9.move();
  text.draw();
//  PVector heapPoint = faceLocation();
};
