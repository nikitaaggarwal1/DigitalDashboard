class Car{
  void runprogram(){
    
    if (state == 0)
  {

    String Path = JOptionPane.showInputDialog("Enter a number for one of the options below\n 1. MiniCar\n 2. Truck\n 3. Exit Program "); //option pane to choose car type
    Data.filePath = Integer.parseInt(Path);
    state = 1; // state becomes one after option is selected in option pane

    if (Data.filePath == 3) // when three is chosen, program quites.
    {
      exit();
      return;
    }
    
    Data.Initialize(); //making arrays within functions.
    Tank.makeArray();
    Fuel_Comp.makeArray();
    Direction.makeArray();
  }

if(state == 1){
  background(0);

  //Displays all the Guages
  Guage.Guage_Display(width/4, height/3.5, Trip.getCurrentSpeed(), "Speed"); //data is sent to gauge class
  Guage.Guage_Display(2*width/4, height/3.5, Data.readRPM(), "RPM");
  Guage.Guage_Display(3*width/4, height/3.5, Data.readFuelLevel(), "Fuel");

  //Displays the texts
  Tank.calculateFuelTank(); //sending data to guage to display calculated values.
  Guage.Text_Display(width/4, 2.3*height/4, Fuel_Comp.calculateFuelEconomy(Trip.getCurrentDistance(), Tank.getConsumedFuel()), "Fuel Economy:");
  Guage.Text_Display(width/4, 2.1*height/4, Trip.updateTotalDistance(), "Odometer:");
  Guage.Text_Display(2.3*width/4,2.1*height/4, Fuel_Comp.calculateRange(), "Range:");
  Guage.Text_Display(2.3*width/4, 2.3*height/4, Fuel_Comp.calculateFuelConsumption(), "Fuel Consumption:");

  //Displays the Direction Compass
  Direction.calculateXY(); //calculates direction
  Direction.DisplayDirection(width/2, height/20, Direction.calculateDirection()); //displays direction 

  Fuel_Comp.calculateFuelConsumptionHistory();  // calculates for graph
  float[] Fuel_History = Fuel_Comp.ConsumptionHistory();

  drawBarChart(width/10, height/1.5, Fuel_History); //bar charts
  fill(255);
  textFont(createFont("Georgia", 18));
  text("Fuel Consumption (liter) over time (sec)", 3*width/10, 7*height/8);

  Fuel_Comp.calculateAverageEconomyHistory();
  float[] Economy_History = Fuel_Comp.EconomyHistory();

  drawBarChart(5*width/10, height/1.5, Economy_History);
  textSize(18);
  text("Average Fuel Economy (km/liter) over time (sec)", 7*width/10, 7*height/8);

 Data.readNext(); //increases index and goes to the next line in the code

  if ((Data.currentIndex == Data.dataTable.getRowCount()-1))
  {
    state = 0; // once program has gone through the entire table, state returns to 0 and option pane reappears.
  Data.currentIndex=0; 
  }
}
}  
}
