//This function draws the PLAY screeny)
void play() {
  drawMap();
  animatedThings();
  drawPlayInterface();
  handleButtonClicks();
}

void drawMap() {

  //the map
  textFont(square);
  background(grey);

  //the path
  strokeWeight(45);
  fill(255);
  line(0, 200, 400, 200);
  line(400, 200, 400, 600);
  line(400, 600, 200, 600);
  line(200, 600, 200, 400);
  line(200, 400, 600, 400);
  line(600, 400, 600, 100);
  line(600, 100, 700, 100);
  line(700, 100, 700, 800);
  strokeWeight(1);

  //temporary node drawing space
  int i=0;
  while (i<7) {
    nodes[i].show();
    i++;
  }

}

void drawPlayInterface() {
  stroke(255);
  fill(0);
  rect(900, height/2, 200, height);
  //build.show();
  fill(255);
  textSize(20);
  text("WAVE: "+ wave, 900, 30);
  nextWave.show();

}



void animatedThings() {

  int i=0;
  while (i<mobby.size()) {
    Mob myMob= mobby.get(i);
    myMob.act();
    myMob.show();
    myMob.healthbar();
    if (myMob.hp<=0) {
      mobby.remove(i);
    } else {
      i++;
    }
  }
  if (mobby.size()>0) {
    i=0;
    while (i<bullets.size()) {

      Bullet myBullet= bullets.get(i);
      myBullet.act();
      myBullet.show();

      if (myBullet.hp<=0) {
        bullets.remove(i);
      } else if (myBullet.x>800||myBullet.y>800||myBullet.x<0||myBullet.y<0) {
        bullets.remove(i);
      } else {
        i++;
      }
    }
  }



  i=0;
  while (i<towers.size()) {
    Tower myTower= towers.get(i);
    myTower.act();
    myTower.show();
    i++;
  }
}



void handleButtonClicks() {
  if (nextWave.clicked&&mobby.size()==0) {
    for (int i=0; i<=wave; i++) {

      mobby.add(new Mob(0-i*50, 200, 1, 0));
    }
    wave++;
    }else if(build.clicked){
      mode=BUILD;
}
}
