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
  float _distX;
  float _distY;
  float eyeW = ((width / 100) * 25.25);
  float eyeH = ((height / 100) * 17.84);

  Eye(float eyeX, float eyeY) {
    _posX = eyeX;
    _posY = eyeY;
    _reactorX = _posX;
    _reactorY = _posY;
    _eye = loadShape("data/svg/eye.svg");
    _eyeBackground = _eye.getChild("eye_background");
    _eyeIris = _eye.getChild("eye_iris");
    _eyeLashBottom = _eye.getChild("eye_lash_bottom");
    _eyeLashTop = _eye.getChild("eye_lash_top");
  };

  void draw() {
    shape(_eyeBackground, _posX, _posY);
    shape(_eyeLashBottom, _posX, _posY);
    shape(_eyeLashTop, _posX, _posY);
    shape(_eyeIris, _reactorX, _reactorY);
  }

  void setActorPos(float actorX, float actorY) {
    _actorX = actorX;
    _actorY = actorY;
  }

  void move() {
    _distX = abs(_actorX - _reactorX);
    _distY = abs(_actorY - _reactorY);
    if (_distX > (_posX + 10)) {
      _reactorX = _reactorX + 10;
    } else {
      _reactorX = _distX;
    }
    if (_distY > (_posY + 10)) {
      _reactorY = _reactorY +  10;
    } else {
      _reactorY = _distY;
    }
    if (_distX < (_posX - 10)) {
      _reactorX = _reactorX - 10;
    } else {
      _reactorX = _distX;
    }
    if (_distY < (_posY - 10)) {
      _reactorY = _reactorY - 10;
    } else {
      _reactorY = _distY;
    }
  }
}
