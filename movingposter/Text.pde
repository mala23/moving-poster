class Text {
  PShape _textA;
  PShape _textB;
  float _posX;
  float _posY;
  float _s;
  int _textId;
  float _textW;
  float _textH;
  float _textRatio;

  Text(float textX, float textY) {
    _posX = textX;
    _posY = textY;
    _textA = loadShape("data/svg/text-a.svg");
    _textB = loadShape("data/svg/text-b.svg");
    _textRatio = _textA.width / _textA.height;
    _textW = width * 0.9;
    _textH = _textW / _textRatio;
  };

  void draw(int textId) {
    if (textId == 1) {
      shape(_textA, _posX, _posY, _textW, _textH);
    } else {
      shape(_textB, _posX, _posY, _textW, _textH);
    }
  }
}
