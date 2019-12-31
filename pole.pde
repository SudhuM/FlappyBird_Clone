import java.util.Random;
class pole {
  int xpole, top, bottom, xsize = 20, offset, pipespeed =3;
  pole() {
    xpole =  (int)random(width+30, width+100);
    top    = (int)random(35,height/2+80);
    offset = (int)random(60,height/4+25);
  }
  void createPole() {
    fill(0,100,0);
    bottom = top + offset;
    rect(xpole, 0, xsize, top);
    rect(xpole, bottom, xsize, height);
  }
  void poleUpdate() {
    xpole -= pipespeed;
  }
  void Delete() {       
    if (xpole < 0){
      list.remove(this);
      Score++;  
  }
  }
  void Collison() {
    if(bird.y - size/2 < top || bird.y+(size/2) > bottom){
      if(bird.x > xpole  &&  bird.x < xpole+xsize)
      isHit = true;
    }  
  }
}