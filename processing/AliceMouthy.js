//Creating animations

//animations like p5 images should be stored in variables
//in order to be displayed during the draw cycle
var mouth1, mouth2;
var forwards = true;
var canvasWidth = 1100;
var canvasHeight = 600;
var delayFrames = 10;
var singingPos = 510;
var singingPos2 = 450;
var mouthPos = 675;


//it's advisable (but not necessary) to load the images in the preload function
//of your sketch otherwise they may appear with a little delay
function preload() {

  mouth1 = loadAnimation('assets/mouth-02.png', 'assets/mouthb-02.png', 'assets/mouthc-02.png', 'assets/mouthd-02.png');
  mouth1.frameDelay = delayFrames;

  mouth2 = loadAnimation('assets/mouthf-03.png', 'assets/moutha-03.png', 'assets/mouthb-03.png', 'assets/mouthc-03.png', 'assets/mouthd-03.png', 'assets/mouthe-03.png' );
  mouth2.frameDelay = 5;
    
  mouth3 = loadAnimation('assets/moutha-04.png', 'assets/mouthb-04.png', 'assets/mouthc-04.png', 'assets/mouthd-04.png', 'assets/mouthc-04.png');
  mouth3.frameDelay = delayFrames+1;
  
  mouth4 = loadAnimation('assets/moutha-04.png', 'assets/mouthb-04.png');
  mouth4.frameDelay = delayFrames+1;
    
  song1 = loadAnimation('assets/musicc-04.png', 'assets/musicb-04.png');
  song1.frameDelay = delayFrames;
    
  song2 = loadAnimation('assets/music-04.png', 'assets/musica-04.png');
  song2.frameDelay = delayFrames;
    
  cookieWhole = loadAnimation('assets/cookie-03.png');
  cookieMunch = loadAnimation('assets/cookie-03.png', 'assets/cookie-03.png', 'assets/cookieb-03.png','assets/cookieb-03.png', 'assets/cookieb-03.png', 'assets/cookiec-03.png','assets/cookiec-03.png','assets/cookiec-03.png', 'assets/cookied-03.png','assets/cookied-03.png' );
  cookieMunch.frameDelay = delayFrames;                            
}

function setup() {
  createCanvas(canvasWidth, canvasHeight);
  img = loadImage("assets/alice.jpg");   
    
  //create a sprite and add the animations
  mouthSprite = createSprite(mouthPos, 242, 50, 50);
  mouthSprite.scale = 0.1;
  mouthSprite.addAnimation('chatting', mouth1);
  mouthSprite.addAnimation('laughing', mouth2);
  mouthSprite.setCollider('circle',0,0,110);
    
  singingSprite = createSprite(singingPos, 165, 50, 50);
  singingSprite.scale = 0.1;
  singingSprite.addAnimation('singing', mouth3);
  singingSprite.addAnimation('pausing', mouth4);

  musicSprite = createSprite(singingPos+50, 165, 50, 50);
  musicSprite.scale = 0.1;
  musicSprite.addAnimation('musicing', song1);
  
  musicSprite2 = createSprite(singingPos+200, 165, 50, 50);
  musicSprite2.scale = 0.1;
  musicSprite2.addAnimation('musicing', song2);
    
  musicSprite3 = createSprite(singingPos+350, 165, 50, 50);
  musicSprite3.scale = 0.1;
  musicSprite3.addAnimation('musicing', song1);
    
  cookieSprite = createSprite(mouseX, mouseY, 50, 50);
  cookieSprite.scale = 0.1;
  cookieSprite.addAnimation('whole', cookieWhole);
  cookieSprite.addAnimation('munch',cookieMunch);
  cookieSprite.setCollider('circle', -20, 0, 110);
    
}

function draw() {
  background(255, 255, 255);    

  image(img, 0, 0);
    
  cookieSprite.changeAnimation('whole');
  cookieSprite.position.x = mouseX;
  cookieSprite.position.y = mouseY;
    
  mouthSprite.changeAnimation('chatting');
    
  singingSprite.changeAnimation('singing'); 
  
  musicSprite.visible = false;
  musicSprite2.visible = false;
  musicSprite3.visible = false;
    
  musicSprite.changeAnimation('musicing');
  musicSprite.setSpeed(-3,0);
    
  musicSprite2.changeAnimation('musicing'); 
  musicSprite2.setSpeed(-3,0);
    
  musicSprite3.changeAnimation('musicing'); 
  musicSprite3.setSpeed(-3,0);
    
  var musicPos = musicSprite.position;
  var music2Pos = musicSprite2.position;
  var music3Pos = musicSprite3.position;
  
  if(musicPos.x<singingPos2){
      musicSprite.visible = true;
  } 
    
  if(musicPos.x<-50){
      musicSprite.position.x = singingPos2; 
  }
    
  if(music2Pos.x<singingPos2){
      musicSprite2.visible = true;
  } 
    
  if(music2Pos.x<-50){
      musicSprite2.position.x = singingPos2; 
  }
    
  if(music3Pos.x<singingPos2){
      musicSprite3.visible = true;
  } 
    
  if(music3Pos.x<-50){
      musicSprite3.position.x = singingPos2; 
  }
  
  if(mouseIsPressed){
     musicSprite.visible = false;
     musicSprite2.visible = false;
     musicSprite3.visible = false;
     singingSprite.changeAnimation('pausing'); 
     mouthSprite.changeAnimation('laughing'); 
     //mouthSprite.position.y = 242;
  }
    
  if(cookieSprite.overlap(mouthSprite)){
    cookieSprite.changeAnimation('munch');
    mouthSprite.changeAnimation('laughing');
  } else {
    cookieSprite.changeAnimation('whole');
    mouthSprite.changeAnimation('chatting');
  }
    
  //draw the sprite
  drawSprites();
}

