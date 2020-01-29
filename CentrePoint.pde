class CentrePoint
{
  float x = 0;
  float y = 0;
  
  CentrePoint(FloatList coordinates)
  {
    x = coordinates.get(0);
    y = coordinates.get(1);
    printCoordinates();
  }
  
  CentrePoint(StringList coordinates)
  {
    x = getXCoordinate(coordinates.get(0));
    y = getYCoordinate(coordinates.get(1));
    printCoordinates();
  }
  
  float getXCoordinate(String xString)
  {
    switch(xString) {
      case "left": 
        return 0;
      case "centre": 
        return width / 2;
      case "right": 
        return width;
    }
    return 0;
  }
  
  float getYCoordinate(String yString)
  {
    switch(yString) {
      case "top": 
        return 0;
      case "centre": 
        return height / 2;
      case "bottom": 
        return height;
    }
    return 0;
  }
  
  void printCoordinates()
  {
    println("x: " + x + ", y:" + y);
  }
}
