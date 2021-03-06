import processing.video.*;
import com.hamoid.*; // video export

// "video" / "image"
String mediaType = "video";

// Video or image file within "media" directory
String mediaFile = "gibraltar-point.mp4";

// Even number
int totalSectors = 24;

// Options for regular or irregular sector angle size sequences
// "uniform" / "random" / "perlin" / "parametric" / "fibonacci"
String type = "fibonacci";

// Option to set hard-coded list of angle sizes
// FloatList setAngleList = new FloatList(1, 1, 2, 2, 3, 3, 4, 4);
FloatList setAngleList;

// Rotation angle of first radial
float startRotation = radians(0);

// Rotation angle of background image
float relativeRotation = radians(135);

// Media position
int mediaOffsetX = 0;
int mediaOffsetY = 750;

// Centre point position
// Pass either numeric or descriptive coordinates to CentrePoint
// (0, 0) or ("left"/"centre"/"right", "top"/"centre"/"bottom")
CentrePoint centrePoint = new CentrePoint("centre", "centre");

// Options for multiple rotations with blend mode for overlapping layers
int totalRotations = 1;
int blendMode = BLEND;

PImage media;
PImage photo;
Movie video;
VideoExport videoExport;
PGraphics maskImage;
AngleList angleList;
ReflectionCycle reflectionCycle;
int videoFrameRate = 30;
int exportFrameRate = 20;
boolean showSkeleton = false;
CurrentDate currentDate = new CurrentDate();

void setup() {
  size(1500, 1500);
  frameRate(videoFrameRate);

  centrePoint.calculateCentre();
  centrePoint.printCoordinates();
  angleList = new AngleList(totalSectors, type);
  angleList.printAngles();
  
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
      videoExport = new VideoExport(this);
      videoExport.setFrameRate(exportFrameRate);
      videoExport.setMovieFileName("output/reflection-cycles-"+currentDate.toString()+".mp4");
      videoExport.startMovie();
      break;
  }
} 

void switchSkeletonMode()
{
  showSkeleton = !showSkeleton;
  reflectionCycle = new ReflectionCycle();
}

void keyPressed() {
  if (key == RETURN | key == ENTER) {
    save("output/reflection-cycles-"+currentDate.toString()+".png");
  }
  if (key == 's' && showSkeleton == false) {
    switchSkeletonMode();
  }
  if (key == 'q' && mediaType == "video") {
    videoExport.endMovie();
    exit();
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
    videoExport.saveFrame();
    video.play();
  }
}
