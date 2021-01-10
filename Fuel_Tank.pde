class FuelTank
{
  float Fuel_Level[];
  
  void makeArray() //create array for fuel level
  {
   int index = Data.dataTable.getRowCount();
   Fuel_Level = new float[index]; 
  }
  
  void calculateFuelTank() //gets fuel level from table.
  {
    Fuel_Level[Data.currentIndex] = Data.readFuelLevel();
  }

  float getConsumedFuel() //calculates consumed fuel
  {
    if (Data.currentIndex==0) 
      return 0.0; //no fuel is consumed, return same value
    else
      return Fuel_Level[Data.currentIndex-1]-Fuel_Level[Data.currentIndex]; //calculate fuel consumed
  }
}
