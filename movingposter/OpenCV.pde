import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

// resolution for webcamVideo
int camWidth = 320;
int camHeight = 180;
//
boolean displayWindow = false;
Rectangle[] faces = new Rectangle[0];
Rectangle ActiveFace;
PVector[] headPosition = new PVector[15]; // a longer array means more references for calculating average
int readIndex = 0;             
PVector total = new PVector();    
PVector average  = new PVector(); 
PVector heapPoint = new PVector();

Capture video;
OpenCV opencv;

void setupOpenCV() {

  String[] cameras = Capture.list();
  ActiveFace = new Rectangle();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
  }
  //openCV
  for (int i = 0; i<headPosition.length; i++) {
    headPosition[i] = new PVector();
  }
  // video information
  video = new Capture(this, camWidth, camHeight, cameras[1]);
  opencv = new OpenCV(this, camWidth, camHeight);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
}

PVector faceLocation() {

  opencv.loadImage(video);
  faces = opencv.detect();

  if (faces.length == 0) {
    ActiveFace.width = 1;
    ActiveFace.height = 1;
    ActiveFace.x = camWidth/2;
    ActiveFace.y = camHeight/2;
  } else if (faces.length>1) {
    int index = 0;
    float record = camWidth*2;
    for (int i = 0; i < faces.length; i++) {
      float d = dist(faces[i].x, faces[i].y, ActiveFace.x, ActiveFace.y);
      if (d < record) {
        record = d;
        index = i;
      }
    }
    ActiveFace = faces[index];
  } else  if (faces.length == 1) {
    ActiveFace = faces[0];
  }
  heapPoint.x = ActiveFace.x + ActiveFace.width/2;
  heapPoint.y = ActiveFace.y + ActiveFace.height/2;
  heapPoint.x = map(heapPoint.x, ActiveFace.width/2, camWidth-(ActiveFace.width/2), 0, width);
  heapPoint.y = map(heapPoint.y, ActiveFace.height/2, camHeight-(ActiveFace.height/2), 0, height);
  heapPoint.z = map(ActiveFace.width, 30, camWidth, 100, 0);

  // smooth readings out to avoid any shake
  total = total.sub(headPosition[readIndex]);
  headPosition[readIndex] = heapPoint.copy();
  total = total.add(headPosition[readIndex]);
  readIndex = readIndex + 1;
  if (readIndex >= headPosition.length) {
    readIndex = 0;
  }
  // calculate average
  average.x = total.x /  headPosition.length;
  average.y = total.y /  headPosition.length;
  average.z = total.z /  headPosition.length;
  return average;
}


//2nd window for debuging 
void captureEvent(Capture c) {
  c.read();
}

public class SecondApplet extends PApplet {
  public void settings() {
    size(320, 180);
  }

  public void draw() {
    image(video, 0, 0);

    pushStyle();
    noFill();
    stroke(255, 0, 0);
    rect(ActiveFace.x, ActiveFace.y, ActiveFace.width, ActiveFace.height);
    popStyle();
  }
}

// activate 2nd window 
void keyPressed() {
  if (key == ' ') {
    if (!displayWindow) {
      String[] args = {"video"};
      SecondApplet sa = new SecondApplet();
      PApplet.runSketch(args, sa);
      displayWindow = true;
    }
  }
}
