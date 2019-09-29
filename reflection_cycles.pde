import processing.video.*;

PImage photo;
Movie movie;
PGraphics maskImage;
AngleList angleList;
ReflectionCycle reflectionCycle;

// Even number
int totalSectors = 10;

// Options for regular or irregular sector angle size sequences
// "uniform" / "random" / "parametric" / "fibonacci"
String type = "random";

// Option to set hard-coded list of angle sizes
// FloatList setAngleList = new FloatList(1, 1, 2, 2, 3, 3, 4, 4);
FloatList setAngleList;

boolean showSkeleton = false;

void setup() {
  photo = loadImage("peacock.jpg");
  size(800, 800);
  angleList = new AngleList(totalSectors, type);
  println(angleList.angles);
  reflectionCycle = new ReflectionCycle();
  //movie = new Movie(this, "example.mp4");
  //movie.loop();
  //movie.read();
  //movie.volume(0);
}

void switchSkeletonMode()
{
  showSkeleton = !showSkeleton;
  reflectionCycle = new ReflectionCycle();
}

void keyPressed() {
  CurrentDate currentDate = new CurrentDate();
  if (key == RETURN | key == ENTER) {
    save("output/reflection-cycles-"+currentDate.toString()+".png");
  }
  if (key == 's' && showSkeleton == false) {
    switchSkeletonMode();
  }
}

void keyReleased() {
  if (key == 's' && showSkeleton == true) {
    switchSkeletonMode();
  }
}

void draw() {
  // Must exist to process key press events
}

//void movieEvent(Movie m) {
//  m.read();
//}
