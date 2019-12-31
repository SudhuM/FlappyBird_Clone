PVector bird = new PVector(width/2, height/2);
ArrayList<pole> list = new ArrayList<pole>();
PImage cover, back;
pole pl;
float vel =0, grav =0, lift = -5,x=0;
int size = 20, clickCount =0,Score =0;
boolean isHit = false, gameState = false,isCounted = false;
void setup() {
  size(642,482);
  cover = loadImage("open.png");
  back = loadImage("bird.png");
  imageMode(CORNER);
  list.add(new pole());
}
void draw() {    
  if (!gameState) {
    image(cover, 0, 0, width, height);
    fill(255, 0, 0);
    textSize(30);
    textAlign(CENTER);
    text("Click to begin", width/2, height/2+25);
  } else {
    background(back);
    Bird();   
    update(); 
    fill(255,0,0);
    textSize(20);
    if (frameCount % 100 == 0) {
      list.add(new pole());
    }
    for (int i=0; i<list.size(); i++) {
      list.get(i).createPole();
      list.get(i).poleUpdate();
      list.get(i).Delete();
      list.get(i).Collison();
      if(list.get(0).xpole < width/2 && !isCounted){
        Score =1;
        isCounted = true;
      }
 }   
      if (isHit) {
        createPos();
        Exit();
      }
    }
   text("Score "+Score,45,20);
  }
void createPos() {
  bird.x= width/2;
  bird.y = height/2;
}
void Bird() {
  fill(255,255,0);       
  noStroke(); 
  ellipse(bird.x, bird.y, 20, 20);
}
void mouseClicked() {
  if (!gameState)
    createPos();
    gameState = true;
}
void update() {
  vel += grav;
  isHit = false;
  bird.y += vel;
  if (bird.y > height-15) {
    bird.y = height-15;
    isHit = true;
  }
  if (bird.y < 0) {  
    bird.y =0;
    isHit= true;
  }
}
void keyPressed() {    
  if (keyCode == ' ') {
    vel =.6;
    grav = .3;
    vel+= lift;
  }
  if (keyCode == ENTER) {
    Score =0;
    isCounted = false;
    loop();
  }
  if (key == 'x')
    exit();
  if (key == 'r') {
    clickCount++;
    if (clickCount %2 !=0) {
      fill(255 , 0, 0);
      textAlign(CENTER);
      textSize(25);
      text("Game Paused ! click R to Resume the game back", width/2, height/2);
      noLoop();
    } else
      loop();
  }
}
void Exit() {
  fill(255 ,0 , 0);
  textAlign(CENTER);
  textFont(createFont("Times New Roman", 26));
  text("Game Over!!\n Press Enter to Restart \n X to Exit", width/2, height/2);
  list.clear();
  noLoop();
}