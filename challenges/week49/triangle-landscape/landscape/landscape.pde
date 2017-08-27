int cols, rows;
int scl = 50;
int w = 1652;
int h = 2908;

float flying = 0;
float[][] terrain;

void setup() {
  size(852, 2908, P3D);
  //fullScreen(P3D);
  smooth();
  pixelDensity(2);
  
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  
}

void draw() {
    flying -= 0.025;
  
   float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  
   background(17, 18, 16); 
   stroke(245, 244, 236);
   noFill();  
   
   translate(width / 2, height / 2);
   rotateX(PI/3);
   translate(-w / 2, -h / 3);
   
   for (int y = 0; y < rows-1; y++) {
     beginShape(TRIANGLE_STRIP);
     for (int x = 0; x < cols; x++) {
       vertex(x*scl, y*scl, terrain[x][y]);
       vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
     }
     endShape();
   }
   
   // Tif is faster.
   saveFrame("frames/####.png");
}