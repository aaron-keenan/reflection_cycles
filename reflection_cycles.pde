import processing.video.*;

// "video" / "image"
String mediaType = "video";

// Video or image file within "media" directory
String mediaFile = "gibraltar-point.mp4";

// Even number
int totalSectors = 24;

// Options for regular or irregular sector angle size sequences
// "uniform" / "random" / "parametric" / "fibonacci"
String type = "parametric";

// Option to set hard-coded list of angle sizes
// FloatList setAngleList = new FloatList(1, 1, 2, 2, 3, 3, 4, 4);
FloatList setAngleList;

PImage media;
PImage photo;
Movie video;
PGraphics maskImage;
AngleList angleList;
ReflectionCycle reflectionCycle;
int videoFrameRate = 30;
boolean showSkeleton = false;

void setup() {
  size(1080, 1080);
  frameRate(videoFrameRate);
  
  angleList = new AngleList(totalSectors, type);
  println(angleList.angles);
  
  setupMedia();
}

void setupMedia()
{  
  switch (mediaType)
  {
    case "photo":
      photo = loadImage(mediaFile);
      reflectionCycle = new ReflectionCycle();
      break;
    case "video":
      video = new Movie(this, mediaFile);
      video.volume(0);
      video.frameRate(videoFrameRate);
      video.play();
      break;
  }
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
  if (mediaType != "video") {
    return;
  }

  if (video.available()) {
    video.pause();
    video.read();
    reflectionCycle = new ReflectionCycle();
    video.play();
  }
}
