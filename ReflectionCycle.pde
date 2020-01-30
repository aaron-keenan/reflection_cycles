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
      translate(centrePoint.x, centrePoint.y);
      rotate(angle);
      translate(-centrePoint.x, -centrePoint.y);
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
