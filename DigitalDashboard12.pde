import javax.swing.JOptionPane;
import org.gicentre.utils.stat.*;

SensorDataProvider Data; // creating all variables, global
FuelComputer Fuel_Comp;
FuelTank Tank;
Gauge Guage;
TripComputer Trip;
Location Direction;
Car Vehicle;
int state =0; // when state= 0, option pane comes up
BarChart barChart;

void setup()
{

  Data = new SensorDataProvider(); //initializing all variables using default constructors
  Fuel_Comp = new FuelComputer();
  Tank = new FuelTank();
  Guage = new Gauge();
  Trip = new TripComputer();
  Direction = new Location();
  Vehicle = new Car();
  barChart = new BarChart(this);

  fullScreen();
  frameRate(20);
}

void draw ()
{
  Vehicle.runprogram(); 
}
