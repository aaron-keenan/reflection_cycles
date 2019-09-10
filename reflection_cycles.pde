import processing.video.*;

PImage photo;
Movie movie;
PGraphics maskImage;

ReflectionCycle reflectionCycle;

void setup() {
  photo = loadImage("peacock.jpg");
  size(800, 800);
  reflectionCycle = new ReflectionCycle(16, "fibonacci");
  //movie = new Movie(this, "example.mp4");
  //movie.loop();
  //movie.read();
  //movie.volume(0);
}

void keyPressed() {
  CurrentDate currentDate = new CurrentDate();
  if (key == RETURN | key == ENTER) {
    save("output/reflection-cycles-"+currentDate.toString()+".png");
  }
}

// Must exist to process key press events 
void draw() {

}

//void movieEvent(Movie m) {
//  m.read();
//}
