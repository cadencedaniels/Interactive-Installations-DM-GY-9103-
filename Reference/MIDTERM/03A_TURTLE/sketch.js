// TURTLE GRAPHICS
// https://en.wikipedia.org/wiki/Turtle_graphics
// 
// this p5 sketch does a simple implementation of Seymour Papert's
// 'turtle graphics' package for LOGO.  using key commands, you can
// drive a turtle as it draws on the screen.
// 
// your tasks:
// (1) make the drawing system that the turtle drives around
// more interesting.  you can change the way lines work; you
// can have it plop down images instead of shapes; you can 
// have it set vertex points for shapes.
// (2) expand the turtle's vocabulary so it understands more 
// symbols than +, -, and F.  for example, a standard turtle
// typically will use lowercase 'f' for a move that *doesn't*
// draw (e.g. to leave a space).  it will also allow for branching
// symbols such as '[' and ']' so that the turtle can go on an
// expedition and 'teleport' back when a branch closes.  a simple
// thought would be to have the 'C' key change the turtle's drawing
// color.
// (3) find a way to make the turtle draw *automatically*, using
// the same system.  see the next sketch for an example of how that
// might be done.  :)

var x, y, xT, yT; // some variables for the current position of the turtle
var currentangle = 0; // we start out facing north
var step = 20; // how many pixels do we move forward when we draw?
var angle = 90; // how many degrees do we turn with '+' and '-'
var keys = new Array('F', 'L', 'R', '[', ']');
var trace;

function setup()
{
  createCanvas(800, 600);
  background(0);
  noStroke();
  
  // start our turtle in the middle of the screen
  x = width/2;
  y = height/2;
}

function draw()
{
  // give me some random color values:
  var r = random(128, 255);
  var g = random(0, 192);
  var b = random(0, 50);
  var a = random(50, 100);

  // pick a gaussian (D&D) distribution for the radius:
  var radius = 0;
  radius+= random(0, 20);
  radius+= random(0, 20);
  radius+= random(0, 20);
  radius = radius/3;
  
  // draw the stuff:
  if (trace){
  fill(0); // interior fill color
  }
  else{
    fill(255);
  }  
  ellipse(x, y, radius, radius); // circle that chases the mouse
  
  doTheThing();
}

function doTheThing()
{
  //console.log(key); // what key did we type?
  //var move = random(keys);
  var index = floor(random(keys.length));  // Convert to integer

  if(keys[index]=='F') // draw forward
  {
    // polar to cartesian transformation based on step and currentangle:
    var x1 = x + step*cos(radians(currentangle));
    var y1 = y + step*sin(radians(currentangle));
    noStroke();
    //strokeWeight(0.5);
    line(x, y, x1, y1); // connect the old and the new
    // update the turtle's position:
    x = x1;
    y = y1;
  }
  else if(keys[index]=='L')
  {
    currentangle-=angle; // turn left
    // polar to cartesian transformation based on step and currentangle:
    var x1 = x + step*cos(radians(currentangle));
    var y1 = y + step*sin(radians(currentangle));
    noStroke();
    //strokeWeight(0.5);
    line(x, y, x1, y1); // connect the old and the new
    // update the turtle's position:
    x = x1;
    y = y1; 
  }
  else if(keys[index]=='R')
  {
   currentangle+=angle; // turn right   
    // polar to cartesian transformation based on step and currentangle:
    var x1 = x + step*cos(radians(currentangle));
    var y1 = y + step*sin(radians(currentangle));
    noStroke();
    //strokeWeight(0.5);
    line(x, y, x1, y1); // connect the old and the new
    // update the turtle's position:
    x = x1;
    y = y1;
  }
  
  else if(keys[index]=='['){
    //teleports to random place, saves "home" position
    xT = x;
    yT = y;
    var x1 = random(0, 800);
    var y1 = random (0, 600);
    noStroke();
    //strokeWeight(0.5);
    line(x, y, x1, y1); // connect the old and the new
    // update the turtle's position:
    x = x1;
    y = y1;
  }
  
  else if(keys[index]=']'){
    // returns to "home" position
    if (xT !=null && yT != null){
    noStroke();
    //strokeWeight(0.5);
      line(x, y, xT, yT); // connect the old and the new
      x = xT;
      y = yT;
    }
  }
}

function keyTyped() {
  if (key === ' ') {
    trace = !trace;
    if (trace){
      background(255);
    }
    else{
      background(0);
    }
  }
}