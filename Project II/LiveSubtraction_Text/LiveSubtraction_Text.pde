import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  //opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
}

void draw() {
  scale(2);
  image(video, 0, 0);
  opencv.loadImage(video);
  
  opencv.updateBackground();
  opencv.dilate();
  opencv.erode();

  //rectangle to hide camera display
  fill(150);
  noStroke();
  rect(0, 0, 640, 480);
  
  //text under

  //motion feedback
  fill(255);
  noStroke();
  strokeWeight(3);    
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
  
}

void captureEvent(Capture c) {
  c.read();
}