//Tower Defense Game
//Lisa Dai
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
int mode;

//Pallette
color white = #ffffff;
color black = #000000;
color grey=#939090;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;
Button nextWave;
Button build;
Button gun;
Button play;
int wave;

//Collections of objects
Node[]nodes;
ArrayList <Mob> mobby;
ArrayList <Tower> towers;
ArrayList <Bullet>bullets;
//Images and Gifs
Gif introAnimation;
PImage nextWaveIcon;
//Fonts
PFont font;
PFont square;
//
float x1, y1;

// ===================== SETUP =========================

void setup() {
  x1=mouseX;
  y1=mouseY;
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  introAnimation=new Gif("creepy/frame_", "_delay-0.04s.gif", 16, 1, width/2, height/2, width, height);
  nextWaveIcon=loadImage("ship.png");
  //Load Fonts
  font=createFont("fonts/StormGust.ttf", 150);
  square=createFont("Squarely.ttf", 60);
  //Create Collections of Objects
  mobby=new ArrayList <Mob> ();
  towers=new ArrayList<Tower>();
  bullets=new ArrayList<Bullet>();
  
//test Towers
towers.add(new Tower(300,300,0,60));
towers.add(new Tower(100,700,0,60));



}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 600, 200, 100, grey, white);

  //PLAY - Next Wave, To Build Mode
  nextWave=new Button(nextWaveIcon, 900, 100, 140, 100, white, grey);
  build=new Button("build",900, 300, 140, 100, white, grey);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
gun=new Button("GUN",900, 300, 140, 100, white, grey);
play=new Button("PLAY",900, 300, 140, 100, white, grey);
  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  nodes=new Node[7];

  nodes[0]=new Node(400, 200, 0, 1);
  nodes[1]=new Node(400, 600, -1, 0);
  nodes[2]=new Node(200, 600, 0, -1);
  nodes[3]=new Node(200, 400, 1, 0);
  nodes[4]=new Node(600, 400, 0, -1);
  nodes[5]=new Node(600, 100, 1, 0);
  nodes[6]=new Node(700, 100, 0, 1);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
}
