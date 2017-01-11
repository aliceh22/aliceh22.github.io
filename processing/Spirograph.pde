

float R=200, r=50, rp=44; //SPIROGRAPH VARIABLES
//R is the radius of outer circle
//r is radius of inner circle (should be smaller than R)
//rp is the distance from the center of the smaller circle 
//that the drawing point is placed.


float fps=100;  // frames per second - speed of animation
float Cx, Cy, Mx, My, Px, Py, prevPx, prevPy, Mx1, My1, Mx2, My2;
float rm, ratio;
float angle1, angle2;
float ang1, ang2;
float ctr1x, ctr1y, ctr2x, ctr2y;
float count = 1, a, remainder, frames, angCount = PI/100;
color back = #EFE3CC;     //background colour
color spiro =  #E8C35E;   //spirograph colour
int seq = 1;
int num=1;


void setup() {
  size(400, 400, P3D); //window size -> increase for R>200
  ratio=R/r;
  rm= R-r;
  angle1 = 0;
  Cx = width/2;
  Cy = height/2;
  
  Mx = Cx+rm*cos(ang1);
  My = Cy+rm*sin(ang1);
  Px = Mx + rp*cos(ang2);
  Py = My + rp*sin(ang2);
  
  prevPx=Px;
  prevPy=Py;
  ctr1x=Px;
  ctr1y=Py;
  ctr2x=Px;
  ctr2y=Py;
  
  
  ang1 = radians(angle1);
  ang2 = radians(angle2);
  
  remainder = ratio - floor(ratio);
  if(remainder == 0){
    a = 1;
  }else{
    a = ceil(1/remainder);
  }
  frames = 2*PI*a /angCount;
  background(back);
  frameRate(fps);
  
}


void draw() {
  
  ang2 = -ratio*ang1;
  
  Mx = Cx + rm*cos(ang1);
  My = Cy + rm*sin(ang1);
  prevPx = Mx + rp*cos(ang2);
  prevPy = My + rp*sin(ang2);
  
  Mx1 = Cx+rm*cos(ang1 + angCount);
  My1 = Cy+rm*sin(ang1 + angCount);
  Px = Mx1 + rp*cos(ang2 - ratio*angCount);
  Py = My1 + rp*sin(ang2 - ratio*angCount);

  Mx2 = Cx+rm*cos(ang1 + 2*angCount);
  My2 = Cy+rm*sin(ang1 + 2*angCount);
  ctr2x = Mx2 + rp*cos(ang2 - 2*ratio*angCount);
  ctr2y = My2 + rp*sin(ang2 - 2*ratio*angCount);
  
  
  

  stroke(spiro);
  //float str = min(1+ang1/10,4);
  strokeWeight(4);
  curve(ctr1x, ctr1y, prevPx, prevPy, Px, Py, ctr2x, ctr2y);
  
  ang1 = ang1+angCount;
  
  ctr1x = prevPx;
  ctr1y = prevPy;
  
  
  //if(count % 5 == 0 && num<5*frames+1 && num>199){
  //  String end = ".png";
  //  String name = str(num);
  //  name = name.concat(end);
  //  saveFrame(name);
  //}
  
  
  if(count>=frames){
    if(seq==1){
      spiro = #397A99;
      seq=2;
    }else if(seq==2){
      spiro = #B8C185;//#F1D452;
      seq=3;
    }else if(seq==3){
      spiro = #bd6060;//#F1D452;
      seq=4;
    }else{
      spiro = #E8C35E;
      seq=1;
    }
    count=0;
  }
  count++;
  num++;
  
}




