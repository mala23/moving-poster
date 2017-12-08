class Eye {
  PShape _eye;
  PShape _eyeBackground;
  PShape _eyeIris;
  PShape _eyeLashBottom;
  PShape _eyeLashTop;
  float _posX;
  float _posY;
  float _actorX;
  float _actorY;
  float _reactorX;
  float _reactorY;
  float _eyeW;
  float _eyeH;
  float _easing = 0.05;

  Eye(float eyeX, float eyeY, float eyeW, float eyeH) {
    _posX = eyeX;
    _posY = eyeY;
    _eyeW = eyeW;
    _eyeH = eyeH;
    _reactorX = _posX;
    _reactorY = _posY;
    _eye = loadShape("data/svg/eye.svg");
    _eyeBackground = _eye.getChild("eye_background");
    _eyeIris = _eye.getChild("eye_iris");
    _eyeLashBottom = _eye.getChild("eye_lash_bottom");
    _eyeLashTop = _eye.getChild("eye_lash_top");
  };

  void draw() {
    shape(_eyeBackground, _posX, _posY, _eyeW, _eyeH);
    shape(_eyeLashBottom, _posX, _posY, _eyeW, _eyeH);
    shape(_eyeLashTop, _posX, _posY, _eyeW, _eyeH);
    shape(_eyeIris, _reactorX, _reactorY, _eyeW, _eyeH);
  }

  void setActorPos(float actorX, float actorY) {
    _actorX = actorY;
    _actorY = actorX;
  }

  void move() {
    if (abs(_actorX - _reactorX) > 0.1) {
      _reactorX = _reactorX + (_actorX - _reactorX) * _easing;
    }
    if (abs(_actorY - _reactorY) > 0.1) {
      _reactorY = _reactorY + (_actorY - _reactorY) * _easing;
    }

    _reactorX = constrain(_reactorX - _posX, -25, 25) + _posX;
    _reactorY = constrain(_reactorY - _posY, -20, 20) + _posY;
  }
}
