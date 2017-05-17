import processing.video.*;
import gab.opencv.*;
import java.awt.*;

// Size of each cell in the grid
int cellSize = 150;
// Number of columns and rows in our system
int cols, rows;

Capture video;
OpenCV opencv;
PImage image1;
PImage image2;

void setup() {
  frameRate(20);
  fullScreen();
  //size(640, 480);
  // Set up columns and rows
  cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 100);
  rectMode(CENTER);

  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, width, height);
  opencv = new OpenCV(this, width, height);
  opencv.startBackgroundSubtraction(5, 3, 0.5);

  // Start capturing the images from the camera
  video.start();  
  
  image2 = loadImage("data/graphic 01.png");
  image1 = loadImage("data/graphic 02.png");

  background(0);
}


void draw() { 
  image(video, 0, 0);
  opencv.loadImage(video);
  opencv.updateBackground();
  opencv.dilate();
  opencv.erode();
  video.read();
  video.loadPixels();
  
  background(255, 245, 185);
  tint(255, 80);
  image(image2, 0, 0);
  
  int x, y;
  
  for (Contour contour : opencv.findContours()){
    x = video.width - contour.getBoundingBox().x;
    y = contour.getBoundingBox().y;
    
    int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image
    // Each rect is colored white with a size determined by brightness
    color c = video.pixels[loc];
    float sz = (brightness(c) / 255.0) * cellSize;
    
    PImage cellImage = image1.get(x, y, int(sz), int(sz));
    tint(255, map(((brightness(c) / 255.0) * cellSize), 0, 255, 0, 200));
    image(cellImage, x + cellSize/2, y + cellSize/2);
    //fill(0, 0);
    //stroke(255, 245, (brightness(c) / 255.0) * cellSize);
    //rect(x, y, sz, sz);
  }
}

void captureEvent(Capture c) {
  c.read();
}


/**
 * Mirror 2 
 * by Daniel Shiffman. 
 * Each pixel from the video source is drawn as a rectangle with size based on brightness.  
 */