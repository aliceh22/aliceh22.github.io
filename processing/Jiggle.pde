float x, y, z, r, radius, angle, a, b;
float xRadius, yRadius, zRadius, xCenter, yCenter, zCenter;
float xLast, yLast, zLast;
float res, zForce, yForce;
float jelly;
float jelliness = 0.5;


void setup() {
  size(800,800,P3D);
  
  frameRate(60);
  xCenter = width/2;
  yCenter = height/2;
  zCenter = 0;
  radius = yRadius = xRadius = zRadius = width/6;
  r = 0;
  res = PI/32;
  zForce = 0;
  yForce = 0;
  }
  
  
  
  
void draw() {
  background(0, 0);
   
  directionalLight(255, 150, 150, 1, 1, -1);
  lightSpecular(100, 100, 0);
  emissive(max(0, 15-int(abs(dist(mouseX, mouseY, xCenter, yCenter)))), max(40, 60-int(abs(dist(mouseX, mouseY, xCenter, yCenter)))), max(60, 80-int(abs(dist(mouseX, mouseY, xCenter, yCenter)))));
  shininess(50);
  cameraStuff();
  fill(200,200,200, 220);
  stroke(220, 140, 160, 90);
 
  
  r += jelliness;
  if (r > TWO_PI*2) {
    r -= TWO_PI*2;
  }
  
  for (float i = 0; i <= PI; i += res) {
    beginShape();
    xRadius = radius +jelly*cos(i+r);
    yRadius = radius +jelly*cos(i-r);
    zRadius = radius+ jelly*sin(i-r);
    for (float j = 0; j <= PI/2; j += res) {
      x = xRadius * sin(i) * cos(j) + xCenter;
      y = yRadius * cos(i) + yCenter;
      z = zRadius * sin(i) * sin(j) + zCenter;
      
      
        vertex(x, y, z);
      
    }
    
     for (float j = 0; j <= PI/2; j += res) {
      x = xRadius * sin(i+res) * cos(PI-j) + xCenter;
      y = yRadius * cos(i+res) * yForce/70 + yCenter; //CHANGE - TO *FOR COOL EFFECT
      z = zRadius * sin(i+res) * sin(PI-j) + zCenter;
      
       vertex(x, y, z);
      
    }
    endShape();
    
  }
  
  
  for (float i = PI; i <= TWO_PI; i += res) {
    beginShape();
    xRadius = radius +jelly*cos(i+r);
    yRadius = radius +jelly*cos(i-r);
    zRadius = radius+ jelly*sin(i-r);
    for (float j = 0; j <= PI/2; j += res) {
      x = xRadius * sin(i) * cos(j) + xCenter;
      y = yRadius * cos(i)+ yCenter;
      z = zRadius * sin(i) * sin(j) + zCenter;
      
      vertex(x, y, z);
      
    }
    
     for (float j = 0; j <= PI/2; j += res) {
      x = xRadius * sin(i+res) * cos(PI-j) + xCenter;
      y = yRadius * cos(i+res)* yForce/70 + yCenter; //CHANGE - TO *FOR COOL EFFECT
      z = zRadius * sin(i+res) * sin(PI-j) + zCenter;
      
       vertex(x, y, z);
      
    }
    endShape();
    
  }
 
   
 
   
 }
 

 
float xrotary = 0;
float yrotary = 0;
float zrotary = 0;
 
 
void cameraStuff() {
  
  xrotary += -float(mouseY - height/2 + 4*int(dist(mouseX, mouseY, pmouseX, pmouseY))) * 0.00005;
  yrotary += float(mouseX - width/2 + 4*int(dist(mouseX, mouseY, pmouseX, pmouseY))) * 0.00005;
  zrotary += -float(mouseX - mouseY + 4*int(dist(mouseX, mouseY, pmouseX, pmouseY))) * 0.00005;
  
  translate(xCenter, yCenter, 0);
  rotateX(xrotary);
  rotateY(yrotary);
  rotateZ(zrotary);
  translate(-xCenter, -yCenter, 0);
  
  //zForce = float((mouseX/2-width/4)/2+(mouseY/2-height/4)/2);
  yForce = -float((mouseX/3-width/6+mouseY/3-height/6));
  
  jelly = float(900/(int(abs(dist(mouseX, mouseY, xCenter, yCenter)))+22));
}


void mouseClicked() {
  for(float k =1; k<=60; k++){
  
  
  
  radius += width/60;
  
    background(0, 0);
   
  directionalLight(255, 150, 150, 1, 1, -1);
  lightSpecular(100, 100, 0);
  emissive(max(0, 15-int(abs(dist(mouseX, mouseY, xCenter, yCenter)))), max(40, 60-int(abs(dist(mouseX, mouseY, xCenter, yCenter)))), max(60, 80-int(abs(dist(mouseX, mouseY, xCenter, yCenter)))));
  shininess(20);
  cameraStuff();
  fill(200,200,200, 220);
  stroke(250, 130, 180, 90);
 
  
  r += jelliness;
  if (r > TWO_PI*2) {
    r -= TWO_PI*2;
  }
  
  for (float i = 0; i <= PI; i += res) {
    beginShape();
    xRadius = radius +jelly*cos(i+r);
    yRadius = radius +jelly*cos(i-r);
    zRadius = radius+ jelly*sin(i-r);
    for (float j = 0; j <= PI/2; j += res) {
      x = xRadius * sin(i) * cos(j) + xCenter;
      y = yRadius * cos(i) + yCenter;
      z = zRadius * sin(i) * sin(j) + zCenter;
      
      
        vertex(x, y, z);
      
    }
    
     for (float j = 0; j <= PI/2; j += res) {
      x = xRadius * sin(i+res) * cos(PI-j) + xCenter;
      y = yRadius * cos(i+res) * yForce/70 + yCenter; //CHANGE - TO *FOR COOL EFFECT
      z = zRadius * sin(i+res) * sin(PI-j) + zCenter;
      
       vertex(x, y, z);
      
    }
    endShape();
    
  }
  
  
  for (float i = PI; i <= TWO_PI; i += res) {
    beginShape();
    xRadius = radius +jelly*cos(i+r);
    yRadius = radius +jelly*cos(i-r);
    zRadius = radius+ jelly*sin(i-r);
    for (float j = 0; j <= PI/2; j += res) {
      x = xRadius * sin(i) * cos(j) + xCenter;
      y = yRadius * cos(i)+ yCenter;
      z = zRadius * sin(i) * sin(j) + zCenter;
      
      vertex(x, y, z);
      
    }
    
     for (float j = 0; j <= PI/2; j += res) {
      x = xRadius * sin(i+res) * cos(PI-j) + xCenter;
      y = yRadius * cos(i+res)* yForce/70 + yCenter; //CHANGE - TO *FOR COOL EFFECT
      z = zRadius * sin(i+res) * sin(PI-j) + zCenter;
      
       vertex(x, y, z);
      
    }
    endShape();
    
  }
 
  }
}