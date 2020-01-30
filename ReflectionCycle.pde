class ReflectionCycle
{
  Sector[] sectors;
  
  ReflectionCycle()
  {
    background(255);
    blendMode(BLEND);
    sectors = new Sector[totalSectors];
    rotateToStartAngle();
    generateSectors();
  }
  
  void rotateToStartAngle()
  {
    translate(centrePoint.x, centrePoint.y);
    rotate(startRotation);
    translate(-centrePoint.x, -centrePoint.y);
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
