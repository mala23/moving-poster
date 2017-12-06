class Text {
  PShape _textA;
  PShape _textB;
  float _posX;
  float _posY;

  Text(float textX, float textY) {
    _posX = textX;
    _posY = textY;
    _textA = loadShape("data/svg/text-a.svg");
    _textB = loadShape("data/svg/text-b.svg");
  };

  void draw() {
    shape(_textA, _posX, _posY);
  }
}
