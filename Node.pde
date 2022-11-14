//Nodes are invisible objects that we place on the map
//to direct the flow of mobs. When a mob collides with
//a node object, it will change direction according to 
//the node's instructions. 

class Node {
  
  float x,y,dx,dy; 
  
  Node(float _x,float _y,float _dx,float _dy){
    x=_x;
    y=_y;
    dx=_dx;
    dy=_dy;
  }
  
  void show(){
    stroke(2);
    fill(255,0,0);
    circle(x,y,40);
    line(x,y,x+dx*50,y+dy*50);
    
  }
  
}
