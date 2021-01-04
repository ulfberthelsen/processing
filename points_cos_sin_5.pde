void setup() {
  size(600, 600);
  background(0);
}


float x = TWO_PI/100; //radians value 
float y = TWO_PI/100;

void draw() {
  frameRate(20);
  float a = random(2);//returns random number between 0 and 2, but not including 2
  float b = random(2);
  background(0);
  translate(width/2, height/2); // puts 0,0 at the center of frame
  stroke(random(100, 255), 0, random(100, 150), random(100, 200)); //stroke color
  strokeWeight(1);
  for (int i = 0; i < 100000; i = i+1) { //the loop distributes 100,000 points in the frame for each repetition
    point(random(0, 200)*cos(a), random(0, 200)*sin(b)); // places point in the x,y-plane; both x and y values ranges from -200 to 200 by using cos amd sin funtions
    a = a+x; //updates argument values for cos and sin functions
    b = b+y;
  }

  //saveFrame("frames/####.png"); //remove '//' for saving images to folder
  //noLoop(); //remove '//' to stop the draw function from looping
}
