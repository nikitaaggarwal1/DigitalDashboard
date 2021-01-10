class TripComputer
{
  float RPM;
  float gearRatio;
  float totalTravelledDistance;
  float Speed;
  float radius;
  float Distance;

  float getCurrentSpeed()                               // Calculate the Current Speed in KM/HOUR
  {
    RPM = Data.readRPM();
    gearRatio = Data.readRatio();
    radius = Data.readRadius();
    Speed = (RPM/60)*(1/gearRatio)*(2*PI*(radius/100));   
    return Speed*3.6;
  }

  float getCurrentDistance()                            // Returns the Distance travelled in one second in Meters
  {
    Distance = getCurrentSpeed()/3.6;
    return Distance/1000;
  }
  float updateTotalDistance()                          // Returns the total distancetravelled in Meters
  {
    if (Data.currentIndex>=Data.dataTable.getRowCount()-1)
      return 0;

    totalTravelledDistance += (getCurrentSpeed()/3.6);
    return totalTravelledDistance/1000;
  }
}
