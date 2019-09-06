class AngleList
{
  int totalSectors;
  int totalSets;
  String type;
  float[] angles;
  float minimumAngle = 0;
  
  AngleList(int _totalSectors, String _type)
  {
    totalSectors = _totalSectors;
    totalSets = totalSectors / 2;
    type = _type;
    calculateAngles();
  }
  
  void calculateAngles()
  {
    switch (type)
    {
      case "uniform":
        angles = calculateUniformAngles();
        break;
      case "random":
        angles = calculateRandomAngles();
        break;
      case "parametric":
        angles = calculateParametricAngles();
        break;
    }
  }
  
  float[] calculateUniformAngles()
  {
    float[] _angles = new float[totalSectors];
    for (int i = 0; i < totalSectors; i++)
    {
      _angles[i] = TWO_PI / totalSectors;
    }
    return _angles;
  }
  
  float[] calculateRandomAngles()
  {
    float[] _angles = new float[totalSectors];
    for (int i = 0; i < totalSectors; i++)
    {
      _angles[i] = random(1);
    }
    _angles = makeCyclical(_angles);
    return _angles;
  }
  
  float[] calculateParametricAngles()
  {
    float[] _angles = new float[totalSectors];
    for (int i = 0; i < totalSets; i++)
    {
      _angles[2 * i] = 1 - cos((2 * i) * TWO_PI / totalSectors);
      _angles[2 * i + 1] = 1 - cos((2 * i + 1) * TWO_PI / totalSectors);
    }
    _angles = makeCyclical(_angles);
    return _angles;
  }
  
  float[] makeCyclical(float[] _angles)
  {
    float[] clockwiseAngles = new float[totalSets];
    float[] anticlockwiseAngles = new float[totalSets];
    float fullCycle = TWO_PI - (totalSectors * minimumAngle);
    float clockwiseMultiplier = 0;
    float anticlockwiseMultiplier = 0;
    
    for (int i = 0; i < totalSets; i++)
    {
      clockwiseAngles[i] = _angles[2 * i];
      anticlockwiseAngles[i] = _angles[2 * i + 1];
      
      clockwiseMultiplier += clockwiseAngles[i];
      anticlockwiseMultiplier += anticlockwiseAngles[i];
    }
    
    clockwiseMultiplier = (fullCycle / 2) / clockwiseMultiplier;
    anticlockwiseMultiplier = (fullCycle / 2) / anticlockwiseMultiplier;
    
    for (int i = 0; i < totalSets; i++)
    {
      _angles[2 * i] = minimumAngle + (clockwiseAngles[i] * clockwiseMultiplier);
      _angles[2 * i + 1] = minimumAngle + (anticlockwiseAngles[i] * anticlockwiseMultiplier);
    }
    
    return _angles;
  }
}
