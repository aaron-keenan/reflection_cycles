class AngleList
{
  int totalSectors;
  String type;
  float[] angles;
  float minimumAngle = 0;
  
  AngleList(int _totalSectors, String _type)
  {
    totalSectors = _totalSectors;
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
  
  float[] makeCyclical(float[] _angles)
  {
    int sets = totalSectors / 2;
    float[] clockwiseAngles = new float[sets];
    float[] anticlockwiseAngles = new float[sets];
    float fullCycle = TWO_PI - (totalSectors * minimumAngle);
    float clockwiseMultiplier = 0;
    float anticlockwiseMultiplier = 0;
    
    for (int i = 0; i < sets; i++)
    {
      clockwiseAngles[i] = _angles[2 * i];
      anticlockwiseAngles[i] = _angles[2 * i + 1];
      
      clockwiseMultiplier += clockwiseAngles[i];
      anticlockwiseMultiplier += anticlockwiseAngles[i];
    }
    
    clockwiseMultiplier = (fullCycle / 2) / clockwiseMultiplier;
    anticlockwiseMultiplier = (fullCycle / 2) / anticlockwiseMultiplier;
    
    for (int i = 0; i < sets; i++)
    {
      _angles[2 * i] = minimumAngle + (clockwiseAngles[i] * clockwiseMultiplier);
      _angles[2 * i + 1] = minimumAngle + (anticlockwiseAngles[i] * anticlockwiseMultiplier);
    }
    
    return _angles;
  }
}
