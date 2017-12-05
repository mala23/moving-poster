class Eye {
  PShape eye;
  PShape eyeBackground;
  PShape eyeIris;
  PShape eyeLashBottom;
  PShape eyeLashTop;
  int posX;
  int posY;

  Eye(int eyeX, int eyeY) {
    posX = eyeX;
    posY = eyeY;
    eye = loadShape("data/svg/eye.svg");
    eyeBackground = eye.getChild("eye_background");
    eyeIris = eye.getChild("eye_iris");
    eyeLashBottom = eye.getChild("eye_lash_bottom");
    eyeLashTop = eye.getChild("eye_lash_top");
  };

  void draw() {
    background(posterBackground);
    shape(eyeBackground, posX, posY);
    shape(eyeIris, posX, posY);
    shape(eyeLashBottom, posX, posY);
    shape(eyeLashTop, posX, posY);
  }
}
