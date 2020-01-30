class CentrePoint
{
  float x = 0;
  float y = 0;
  String xString;
  String yString;
  
  CentrePoint(float _x, float _y)
  {
    x = _x;
    y = _y;
  }
  
  CentrePoint(String _xString, String _yString)
  {
    xString = _xString;
    yString = _yString;
  }
  
  void calculateCentre()
  {
    x = getXCoordinate();
    y = getYCoordinate();
  }
  
  float getXCoordinate()
  {
    if (xString == null) {
      return x;
    }
    
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
  
  float getYCoordinate()
  {
    if (yString == null) {
      return y;
    }
    
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
