class Sector
{
  PGraphics sector;
  float startAngle;
  float sectorSize;
  float relativeRotation;
  boolean mirror;
  boolean skeleton;
  float radius = width/2 - 30;
  
  Sector(float _sectorSize, float _relativeRotation, boolean _mirror, boolean _skeleton)
  {
    sectorSize = _sectorSize;
    relativeRotation = _relativeRotation;
    mirror = _mirror;
    skeleton = _skeleton;
    drawSector();
  }
  
  void drawSector()
  {
    drawSectorShape();
    photo.mask(sector);
    reposition();
  }
  
  void drawSectorShape()
  {
    float opposite = radius * sin(sectorSize);
    float adjacent = radius * cos(sectorSize);
    float controlMultiplier = (1 + sectorSize/TWO_PI);
    float controlX1 = radius * controlMultiplier * sin(sectorSize/3);
    float controlY1 = -radius * controlMultiplier * cos(sectorSize/3);
    float controlX2 = radius * controlMultiplier * sin(2*sectorSize/3);
    float controlY2 = -radius * controlMultiplier * cos(2*sectorSize/3);
    
    sector = createGraphics(photo.width, photo.height);
    sector.beginDraw();
    sector.stroke(getStrokeWeight());
    sector.strokeWeight(0.5);
    sector.translate(width/2,height/2);
    sector.rotate(relativeRotation);
    sector.beginShape();
    sector.vertex(0, 0);
    sector.vertex(0, -radius);
    
    if (mirror) {
      // sector.bezierVertex(-controlX1, controlY1, -controlX2, controlY2, -opposite, -adjacent);
      sector.vertex(-opposite, -adjacent);
    } else {
      // sector.bezierVertex(controlX1, controlY1, controlX2, controlY2, opposite, -adjacent);
      sector.vertex(opposite, -adjacent);
    }
    sector.endShape(CLOSE);
    sector.endDraw();
  }
  
  void reposition()
  {
    pushMatrix();
      translate(width/2, height/2);
      if (mirror) {
        rotate(relativeRotation);
      } else {
        rotate(-relativeRotation);
      }
      translate(-width/2, -height/2);
      makeSectorImage();
    popMatrix();
  }
  
  void makeSectorImage()
  {
    PImage imageContent;
    if (skeleton) {
      imageContent = sector;
    } else {
      imageContent = photo;
    }
    if (mirror) {
      scale(-1.0, 1.0);
      image(imageContent, -width, 0);
    } else {
      image(imageContent, 0, 0);
    }
  }
  
  int getStrokeWeight()
  {
    if (skeleton) {
      return 0;
    }
    return 255;
  }
}
