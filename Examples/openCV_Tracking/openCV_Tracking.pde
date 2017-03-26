import hypermedia.video.*; // Imports the OpenCV library
OpenCV opencv; // Creates a new OpenCV Object

void setup()
{

size( 320, 240 );

opencv = new OpenCV( this ); // Initialises the OpenCV object
opencv.capture( 320, 240 ); // Opens a video capture stream

}

void draw()
{

opencv.read(); // Grabs a frame from the camera
image( opencv.image(), 0, 0 ); // Displays the image in the OpenCV buffer to the screen

}
PImage anImage;
opencv.copy(anImage);