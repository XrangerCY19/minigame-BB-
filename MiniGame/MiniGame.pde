import de.bezier.data.sql.*;
Buildings building[];
Cloud clouds[];
Plane plane;

boolean flag = false;
float bX;
float bW;
float bH;
float rotate = 0.1;
float gravity = 5;
float speed = 10;
int score = 0;
int coinAdd =0;
MySQL db;

void setup() {
  fullScreen();
  frameRate(30);  
  rectMode(CENTER);
  loadStuffs();
  initBackground();
  initBuildings();
  initCoins();
  plane = new Plane();
  initMissiles();
  connectSQL();
}

void draw() {
  speed = speed*1.001;
  score+=ceil(speed/10);
  drawbackground();  
  drawBuildings();
  //devMode();
  drawCoins();
  drawTexts();
  drawMissiles();
  plane.Draw();
}

void drawTexts() {
  fill(100,255,100);
  textSize(50);
  textAlign(CENTER,CENTER);
  text(score,width/2,100);
  fill(100,150,250);
  textSize(30);
  text("HighScore:"+highscore,width/2,50);  
  textSize(30);
  fill(#EDDA2D);
  text("Coins:"+coinAdd,80,50);
}

void devMode() {
  fill(200,50,50);
  textSize(12);
  textAlign(CENTER,CENTER);
  text("X:"+mouseX+" Y:"+mouseY+" FR:"+frameRate,width/2,10);
  textAlign(LEFT,CENTER);
  text("Speed:"+speed+"\nM1Speed"+missile1.mspeed+"\nM2Speed"+missile2.mspeed+"\nM3Speed"+missile3.mspeed,10,300);
}

void loadStuffs() {
  player1 = loadImage("player01.png");
  Missile1 = loadImage("missile01.png");
}
