// dinFormat 
int pageWidth = 210;
int pageHeight = 297;
void setupScreen() {
  // preserve aspect ratio of poster so it can be printed on DIN format paper
  float aspecRatio1 = float(pageWidth) / float(pageHeight);
  float aspecRatio2 = float(pageHeight) / float(pageWidth);
  int posterWidth;
  int posterHeight;
  if (displayWidth < displayHeight) {
    // for portrait mode 
    posterWidth = displayWidth;
    posterHeight = floor(displayWidth * aspecRatio2);
  } else {
    // for landscape mode 
    posterWidth = floor(displayHeight * aspecRatio1);
    posterHeight = displayHeight;
  }

  surface.setSize(posterWidth, posterHeight);
  //reposition output in center of display 
  int startPointX = (displayWidth / 2) - (width / 2);
  int startPointY = (displayHeight / 2) - (height / 2);
  surface.setLocation(startPointX, startPointY);
}
