class FuelComputer
{
  float[] fuelEconomy; //arrays for fuel computer
  float[] fuelConsumptionHistory;
  float[] AverageFuelEconomyHistory;
  float[] temp;
  float fuelEconomyHistory;
  float range; 

  void makeArray() //creating an array 
  {
    int index = Data.dataTable.getRowCount(); //index= number of rows in table
    fuelEconomy = new float[index]; // creats array of size index for fueleconomy
    fuelConsumptionHistory = new float[index]; //array of size index for fuelconsuptionhistory
    AverageFuelEconomyHistory = new float[index]; //array of size index for averagefueleconomyhistory
  }

  float calculateFuelEconomy (float Distance, float ConsumedFuel) //funtion for calculating fuel economy
  {
    if (ConsumedFuel==0) //displays at start of program
      return 0;
    else {
      fuelEconomy[Data.currentIndex] = Distance/ConsumedFuel; //calculated fuel economy at current time
      return fuelEconomy[Data.currentIndex];
    }
  }

  float calculateAverageFuelEconomy() // function to calculate average fuel economy
  {
    float sum = 0; //sums all fuel economy data
    int counter=0; //keeps track of time so average can be calculated
    for (int i = 0; (i<60)&&((Data.currentIndex-i)>=0); i++, counter++) 
    {
      sum+=fuelEconomy[Data.currentIndex-i]; //sums fuel economy for each second
    }
    return sum/counter; //calculates average fuel economy
  }

  float calculateRange()
  {
    return (calculateAverageFuelEconomy()*Data.readFuelLevel()); //function calculates range
  }

  float calculateFuelConsumption() //calculates fuel consumption
  {
    return ((1/calculateAverageFuelEconomy())*(100));
  }

 void calculateFuelConsumptionHistory() //calculated fuel consumption history for graph
 {
    fuelConsumptionHistory[Data.currentIndex] = calculateFuelConsumption();
  }

  float[] ConsumptionHistory() //for graph
  {
    //float [] temp;
    if (Data.currentIndex<=39)
      temp = subset(fuelConsumptionHistory, 0, 40);
    else {
      for (int i=0; (i<40)&&((Data.currentIndex-i)>0); i++)
      {
        temp[39-i]=fuelConsumptionHistory[Data.currentIndex-i];
      }
    }
    return temp;
  }

  void calculateAverageEconomyHistory() //calculates average economic history
  {
    AverageFuelEconomyHistory[Data.currentIndex] = calculateAverageFuelEconomy();
  }

  float[] EconomyHistory() //economic history for graph
  {
    if (Data.currentIndex<=39)
      temp = subset(AverageFuelEconomyHistory, 0, 40);
    else {
      for (int i=0; (i<40)&&((Data.currentIndex-i)>0); i++)
      {
        temp[39-i] = AverageFuelEconomyHistory[Data.currentIndex - i];
      }
    }
    return temp;
  }
}
