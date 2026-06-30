import processing.serial.*;

Serial port;

// ---------------- Configuration ----------------
final String PORT_NAME = "COM5";      // Change if required
final int BAUD_RATE = 115200;
final int MAX_DIST = 30;
final int SWEEP_TRAIL = 120;

// ---------------- State ----------------
int currentAngle = 0;
int currentDist = -1;

int[] distMap = new int[181];
int[] ageMap  = new int[181];

// ---------------- Layout ----------------
int cx, cy, r;

void setup() {

  size(1000,600);

  cx = width/2;
  cy = height-60;
  r  = height-120;

  for(int i=0;i<=180;i++){
    distMap[i]=-1;
    ageMap[i]=0;
  }

  println(Serial.list());

  try{
    port = new Serial(this,PORT_NAME,BAUD_RATE);
    port.bufferUntil('\n');
  }
  catch(Exception e){
    println("Cannot open "+PORT_NAME);
  }
}

void draw(){

  background(0);

  drawGrid();

  drawDetections();

  drawSweep();

  drawHUD();

  // Age every detection
  for(int i=0;i<=180;i++){
    if(ageMap[i] < 1000)
      ageMap[i]++;

    if(ageMap[i] > SWEEP_TRAIL)
      distMap[i]=-1;
  }

}

// ------------------------------------------------------
// SERIAL
// ------------------------------------------------------

void serialEvent(Serial p){

  String raw = p.readStringUntil('\n');

  if(raw==null)
    return;

  raw = trim(raw);

  if(raw.indexOf(',')==-1)
    return;

  String parts[] = split(raw,',');

  if(parts.length!=2)
    return;

  try{

    int a = int(trim(parts[0]));
    int d = int(trim(parts[1]));

    if(a<0 || a>180)
      return;

    currentAngle = constrain(a,0,180);

    if(d==255){

      currentDist=-1;
      distMap[a]=-1;

      return;

    }

    if(d<0)
      return;

    if(d>MAX_DIST)
      d=MAX_DIST;

    currentDist=d;

    if(d>0){
      distMap[a]=d;
      ageMap[a]=0;
    }
    else{
      distMap[a]=-1;
    }

  }
  catch(Exception e){
  }

}

// ------------------------------------------------------
// GRID
// ------------------------------------------------------

void drawGrid(){

  stroke(0,80,0);
  strokeWeight(1);
  noFill();

  for(int i=1;i<=6;i++){

    float rr=r*i/6.0;

    arc(cx,cy,rr*2,rr*2,PI,TWO_PI);

  }

  for(int deg=0;deg<=180;deg+=30){

    float rad=radians(180-deg);

    float ex=cx+r*cos(rad);
    float ey=cy-r*sin(rad);

    line(cx,cy,ex,ey);

  }

  line(cx-r,cy,cx+r,cy);

  fill(0,255,70);

  textAlign(CENTER,CENTER);

  for(int deg=0;deg<=180;deg+=30){

    float rad=radians(180-deg);

    text(deg+"°",
      cx+(r+20)*cos(rad),
      cy-(r+20)*sin(rad));

  }

  textAlign(LEFT,CENTER);

  for(int i=1;i<=6;i++){

    float rr=r*i/6.0;

    text((MAX_DIST*i/6)+" cm",
      cx+5,
      cy-rr);

  }

}

// ------------------------------------------------------
// DETECTIONS
// ------------------------------------------------------

void drawDetections() {

  for (int a = 0; a <= 180; a++) {

    if (distMap[a] <= 0)
      continue;

    // Only show detections close to the current sweep
    int ageDeg = abs(a - currentAngle);
    if (ageDeg > SWEEP_TRAIL)
      continue;

    float alpha = map(ageDeg, 0, SWEEP_TRAIL, 255, 30);

    float frac = (float)distMap[a] / MAX_DIST;
    float pr = frac * r;
    float rad = radians(a);
    float px = cx + pr * cos(rad);
    float py = cy - pr * sin(rad);

    // Green line from center to target
    stroke(0, 255, 70, alpha * 0.4);
    strokeWeight(1);
    line(cx, cy, px, py);

    // Red target
    noStroke();
    fill(255, 0, 0, alpha);
    ellipse(px, py, 10, 10);
  }
}

// ------------------------------------------------------
// SWEEP
// ------------------------------------------------------

void drawSweep(){

  for(int i=0;i<SWEEP_TRAIL;i++){

    int a=currentAngle-i;

    if(a<0)
      break;

    float alpha=map(i,0,SWEEP_TRAIL,220,0);

    float rad=radians(180-a);

    stroke(0,255,70,alpha);

    strokeWeight(2);

    line(
      cx,
      cy,
      cx+r*cos(rad),
      cy-r*sin(rad)
      );

  }

}

// ------------------------------------------------------
// HUD
// ------------------------------------------------------

void drawHUD(){

  fill(0,255,70);

  textAlign(LEFT,TOP);

  textSize(16);

  text("FPGA RADAR",10,10);

  text("Angle : "+nf(currentAngle,3)+"°",10,40);

  if(currentDist<0)
    text("Distance : ---",10,65);
  else
    text("Distance : "+nf(currentDist,3)+" cm",10,65);

  text("Port : "+PORT_NAME+" @ "+BAUD_RATE,10,90);

  if(currentDist>0 && currentDist<MAX_DIST){

    fill(255,60,60);

    text("[ OBJECT DETECTED ]",10,120);

  }

}