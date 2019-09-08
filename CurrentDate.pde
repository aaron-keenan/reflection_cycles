class CurrentDate
{
  int day = day();
  int month = month();
  int year = year();
  int hour = hour();
  int minute = minute();
  int second = second();
  String now;
  
  CurrentDate()
  {
    now = nf(year, 4)
      + "-"
      + nf(month, 2)
      + "-"
      + nf(day, 2)
      + "-"
      + nf(hour, 2)
      + nf(minute, 2)
      + nf(second, 2);
  }
  
  String toString()
  {
    return now;
  }
}
