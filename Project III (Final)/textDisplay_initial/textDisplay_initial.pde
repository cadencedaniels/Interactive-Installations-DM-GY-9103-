// An array of news headlines

//String[] headlines = {
//  "Processing downloads break downloading record.", 
//  "New study shows computer programming lowers cholesterol.",
//  };

//String[] headlines; //= loadStrings("/Users/CadenceDaniels/Google Drive/Spring 2017/Interactive Installations (DM-GY 9103)/Project III/Narrative_Nola.rtf");
  
 String[] headlines = {
   "Nola was molested by her cousin, uncle, and a family friend,",
   "starting when she was nine years old.",
   "When Nola discussed the alleged abuse with family members at age 24,",
   "they refused to accept what she said.",
   "Are all mothers like this?",
   "Nola chose never to be a mother", 
   "because she had not been mothered well.",
   "At 13, Nola ran away from home.",
   "When she was 14, she became pregnant",
   "but her son was born prematurely and he died shortly after birth.",
   "She began going to Lincoln High School;",
   "but after early success in the Upward Bound program,",
   "was transferred to the affluent suburban Nicolet High School,",
   "where her poverty was constantly rubbed in her face as she rode the bus to school with fellow African-Americans,",
   "some of whom were servants of her classmates' families.",
   "She began to steal money from her mother",
   "in an effort to keep up with her free-spending peers,",
   "to lie to and argue with her mother,",
   "and to go out with older boys."
   };
   

PFont f;  // Global font variable
float x;  // horizontal location of headline
float y;  // vertical location of headline
int index = 0;

void setup() {
  size(1244,700);
  f = createFont("Gotham-Medium", 100, true);  
  // Initialize headline offscreen to the right 
  x = width; 
  y = 350;
}

void draw() {
  background(107, 38, 23);
  fill(0);
  // Display headline at x  location
  textFont(f, 50);        
  textAlign(LEFT);
  fill(255);
  // If x is less than the negative width, 
  // then it is off the screen
  float w = textWidth(headlines[index]);
  
  if( (index == 0) || (index % 5 != 0)){
    text(headlines[index], x, y); 
    // Decrement x
    x = x - 6;    
    if (x < -w) {
      x = width; 
      y = 10 + (int)random(100, height - 100); // not entire height so the text is allways inside the screen. 
      index = (index + 1) % headlines.length;
    }
  }
  else {
    if( (index - 1) == 5){
      text(headlines[index], (x - w)/2, 350);
      index = (index + 1) % headlines.length;
    }
  }

}