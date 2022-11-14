//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  
  float x,y,vx,vy,d;
  int hp,maxhp;
  
  Mob(float _x, float _y, float _vx, float _vy){
    x=_x;
    y=_y;
    vx=_vx;
    vy=_vy;
    d=40;
    hp=2;
    maxhp=2;
  }
  
  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);//background
    fill(#B874F0);
    rect(x-25, y-(d+10), 50, 20);
    fill(#F074CB);
    rect(x-25, y-(d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }
  
  void show(){
    fill(0,0,255);
    strokeWeight(3);
    circle(x,y,40);
  }
    
    void act(){
      x=x+vx;
      y=y+vy;
      
      int i=0;
      while(i<nodes.length){
        if (dist(nodes[i].x,nodes[i].y, x, y)<4){
          vx=nodes[i].dx;
          vy=nodes[i].dy;
        }
         i++;
      }
      
      i=0;
      while(i<bullets.size()){
        Bullet myBullet= bullets.get(i);
        if(dist(myBullet.x,myBullet.y,x,y)< d/2+myBullet.d/2){
          hp=hp-1;
          myBullet.hp--;
        }
        i++;
      }
      
      
      
      
    }
    
  }
