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
    angles = new float[totalSectors];
    calculateAngles();
  }
  
  void calculateAngles()
  {
    switch (type)
    {
      case "uniform":
        calculateUniformAngles();
        break;
      case "random":
        calculateRandomAngles();
        break;
      case "parametric":
        calculateParametricAngles();
        break;
      case "fibonacci":
        calculateFibonacciAngles();
        break;
    }
    makeCyclical();
  }
  
  void calculateUniformAngles()
  {
    for (int i = 0; i < totalSectors; i++)
    {
      angles[i] = TWO_PI / totalSectors;
    }
  }
  
  void calculateRandomAngles()
  {
    for (int i = 0; i < totalSectors; i++)
    {
      angles[i] = random(1);
    }
  }
  
  void calculateParametricAngles()
  {
    for (int i = 0; i < totalSets; i++)
    {
      angles[2 * i] = 1 - cos((2 * i) * TWO_PI / totalSectors);
      angles[2 * i + 1] = 1 - cos((2 * i + 1) * TWO_PI / totalSectors);
    }
  }
  
  void calculateFibonacciAngles()
  {
    int current = 2;
    int previous = 1;
    
    for (int i = 0; i < totalSets; i++)
    {
      if (i > 1) {
        current += previous;
        previous = current - previous;
      }
      angles[2 * i] = previous;
      angles[2 * i + 1] = current;
    }
  }
  
  void makeCyclical()
  {
    float[] clockwiseAngles = new float[totalSets];
    float[] anticlockwiseAngles = new float[totalSets];
    float fullCycle = TWO_PI - (totalSectors * minimumAngle);
    float clockwiseMultiplier = 0;
    float anticlockwiseMultiplier = 0;
    
    for (int i = 0; i < totalSets; i++)
    {
      clockwiseAngles[i] = angles[2 * i];
      anticlockwiseAngles[i] = angles[2 * i + 1];
      
      clockwiseMultiplier += clockwiseAngles[i];
      anticlockwiseMultiplier += anticlockwiseAngles[i];
    }
    
    clockwiseMultiplier = (fullCycle / 2) / clockwiseMultiplier;
    anticlockwiseMultiplier = (fullCycle / 2) / anticlockwiseMultiplier;
    
    for (int i = 0; i < totalSets; i++)
    {
      angles[2 * i] = minimumAngle + (clockwiseAngles[i] * clockwiseMultiplier);
      angles[2 * i + 1] = minimumAngle + (anticlockwiseAngles[i] * anticlockwiseMultiplier);
    }
  }
}
