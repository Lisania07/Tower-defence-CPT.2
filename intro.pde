//This function draws the INTRO screen.

void intro() {
  //gif
  introAnimation.show();
  
  //start button
  start.show();
  if(start.clicked){
    mode=PLAY;
  }
   //text
  
  textFont(font);
  fill(255);
  text("Tower Defence",500,300);
}
