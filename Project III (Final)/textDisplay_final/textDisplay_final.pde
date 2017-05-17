import processing.sound.*;

 String[] storyNOLA = {
   "NOLA was born in Kosciusko, Mississippi,",
   "to a housemaid, unmarried teenage mother",
   "and a coal miner, barber, city councilman and military father. ",
   "NOLA spent her first six years",
   "living in rural poverty with her maternal grandmother",
   "who was so poor that NOLA often wore dresses made of potato sacks,",
   "for which the local children made fun of her.",
   "Her grandmother taught her to read before the age of three",
   "and she was nicknamed \"The Preacher\"",
   "for her ability to recite Bible verses.",
   "When NOLA was a child, her grandmother would hit her with a stick",
   "when she did not do chores or if she misbehaved in any way.",
   "NOLA was molested by her cousin, uncle, and a family friend,",
   "starting when she was nine years old.",
   "When NOLA discussed the alleged abuse with family members at age 24,",
   "they refused to accept what she said.",
   //"Are all mothers like this?",
   "NOLA chose never to be a mother", 
   "because she had not been mothered well.",
   "At 13, NOLA ran away from home.",
   "When she was 14, she became pregnant",
   "but her son was born prematurely and he died shortly after birth.",
   "She began going to Lincoln High School;",
   "but after early success in the Upward Bound program,",
   "was transferred to the affluent suburban Nicolet High School,",
   "where her poverty was constantly rubbed in her face",
   "as she rode the bus to school with fellow African-Americans,",
   "some of whom were servants of her classmates' families.",
   "She began to steal money from her mother",
   "in an effort to keep up with her free-spending peers,",
   "to lie to and argue with her mother,",
   "and to go out with older boys.",
   "Her frustrated mother once again sent her",
   "to live with Vernon in Nashville, Tennessee,",
   "though this time NOLA was not welcome.",
   "NOLA's education became priority.",
   "She became an honors student,",
   "was voted Most Popular Girl,",
   "and joined her high school speech team.",
   "She secured  a full scholarship to study communication",
   "at Tennessee State University.",
   "At the age of 17,",
   "NOLA won the Miss Black Tennessee beauty pageant.",
   "She was hired to do part-time news",
   "the local black radio station,",
   "NOLA later acknowledged her grandmother's influence,",
   "saying it was her who had encouraged her",
   "to speak in public and gave her a positive sense of self."
   };

String[] story2 = {};
String[] story3 = {};

SoundFile audio;

PFont f;  // Global font variable
PFont f2;  // Global font variable
int index = -3;

void setup() {
  //size(700, 360);
  fullScreen();
  background(107, 38, 23);
  fill(255);
  setList();
  f = createFont("Gotham-Medium", 100, true);  
  f2 = createFont("Gotham-Book", 100, true);  
  textAlign(CENTER);
  
  audio = new SoundFile(this, "/Users/CadenceDaniels/Google Drive/Spring 2017/Interactive Installations (DM-GY 9103)/Project III/play.wav");
  audio.loop();
}

void draw() {
  background(107, 38, 23);
  drawType();
  noLoop();
}

void mouseClicked() {
  index = index + 3;
  redraw();
}

void drawType() {
  fill(255);
  textFont(f, 40);
  
  //NOLA
  if (index == -3){ 
    textFont(f, 100);
    text("ARE YOU NOLA?", (width/2), (height/2)); 
    textFont(f2, 40);
    text("learn her story", (width/2), (height/2 + 120)); 
  }
  else if (index < storyNOLA.length){ 
    text(storyNOLA[index], (width/2), (height/2 - 120)); 
    if (index + 1 < storyNOLA.length){ text(storyNOLA[index + 1], (width/2), (height/2)); }
    if (index + 2 < storyNOLA.length){ text(storyNOLA[index + 2], (width/2), (height/2 + 120)); }
  }
 
  else if (index >= storyNOLA.length){
    textFont(f, 100);
    text("IDENTIFY NOLA", (width/2), (height/2)); 
    textFont(f2, 40);
    text("", (width/2), (height/2 + 100)); 
  }
}


void setList() {}