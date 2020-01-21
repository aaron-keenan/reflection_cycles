class ReflectionCycle
{
  float absoluteRotation = radians(0);
  float relativeRotation = radians(135);
  Sector[] sectors;
  
  ReflectionCycle()
  {
    background(255);
    blendMode(BLEND);
    sectors = new Sector[totalSectors];
    generateSectors();
  }
  
  void generateSectors()
  {
    boolean mirror = false;
    int i = 0;
    for (float angle : angleList.angles) {
      // println(relativeRotation);
      sectors[i] = new Sector(angle, relativeRotation, mirror, showSkeleton);
      translate(width/2, height/2);
      rotate(angle);
      translate(-width/2, -height/2);
      if (mirror) {
        relativeRotation -= angle;
      } else {
        relativeRotation += angle;
      }
      mirror = !mirror;
      i++;
    }
  }
}
