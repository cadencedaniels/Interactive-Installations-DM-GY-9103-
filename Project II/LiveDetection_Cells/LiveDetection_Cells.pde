/**
 * Mirror 2 
 * by Daniel Shiffman. 
 * Each pixel from the video source is drawn as a rectangle with size based on brightness.  
 */
 
import processing.video.*;
import gab.opencv.*;
import java.awt.*;

// Size of each cell in the grid
int cellSize = 10;
// Number of columns and rows in our system
int cols, rows;
// Variable for capture device
Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
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

  background(0);
}


void draw() { 
    opencv.loadImage(video);
    opencv.updateBackground();
    opencv.dilate();
    opencv.erode();
    video.read();
    video.loadPixels();
    
    background(150);
    
    // Begin loop for columns
    for (int i = 0; i < cols;i++) {
      // Begin loop for rows
      for (int j = 0; j < rows;j++) {
          // Where are we, pixel-wise?
          int x = i * cellSize;
          int y = j * cellSize;
          
          float sz = 0;
          for (Contour contour : opencv.findContours()){
            if (!contour.containsPoint(x, y)){
              //contour.draw();
              sz = cellSize;
            }
          }
          
          int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image
          // Each rect is colored white with a size determined by brightness
          color c = video.pixels[loc];
          //float sz = (brightness(c) / 255.0) * cellSize;
          fill(255);
          noStroke();
          rect(x + cellSize/2, y + cellSize/2, sz, sz, (brightness(c) / 255.0) * 10);
       }  
    }
}

void captureEvent(Capture c) {
  c.read();
}