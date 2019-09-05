class ReflectionCycle
{
  float absoluteRotation = 0;
  float relativeRotation = 1.9;
  AngleList angleList;
  
  ReflectionCycle(int totalSectors, String type)
  {
    angleList = new AngleList(totalSectors, type);
    println(angleList.angles);
    generateSectors();
  }
  
  void generateSectors()
  {
    boolean mirror = false;
    for (float angle : angleList.angles) {
      // println(relativeRotation);
      Sector sector = new Sector(angle, relativeRotation, mirror);
      translate(width/2, height/2);
      rotate(angle);
      translate(-width/2, -height/2);
      if (mirror) {
        relativeRotation -= angle;
      } else {
        relativeRotation += angle;
      }
      mirror = !mirror;
    }
  }
}
