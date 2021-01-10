class SensorDataProvider
{
  int filePath;
  Table dataTable;
  int currentIndex;

  SensorDataProvider()
  {
    //filePath = Integer.parseInt(Path);
    currentIndex = 0;
  }
  void Initialize()
  {
    if (filePath==1)
      dataTable = loadTable ("Car.csv", "header");
    else if (filePath==2)
      dataTable = loadTable ("Truck.csv", "header");
    //else {
    //  exit();
    //  return;
    //}
  }

  void readNext()
  {
    if (currentIndex<dataTable.getRowCount()-1)
    {
      currentIndex++;
    }
  }

  float readRPM()
  {
    return dataTable.getFloat(currentIndex, "RPM");   // The ID of the Row is 2 less than the excel sheet
  }

  float readFuelLevel()
  {
    return dataTable.getFloat(currentIndex, "Fuel Level (liter)");
  }

  float readRatio()
  {
    return dataTable.getFloat(currentIndex, "Gear Ratio");
  }

  double readX()
  {
    return dataTable.getDouble(currentIndex, "X");
  }

  double readY()
  {
    return dataTable.getDouble(currentIndex, "Y");
  }

  float readRadius()
  {
    if (filePath == 1)
      return 23;
    if (filePath == 2)
      return 25.4;
    else 
    return 0;
  }
}
