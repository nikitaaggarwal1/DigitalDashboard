class Gauge
{
  float Minimum;   // Related Variables
  float Maximum;
  float Current_Value;
  String Units;

  float position; // Displaying variables
  float size;

  //A function that sets the current value

  void Guage_Display(float x, float y, float value, String Description) //displays gauge depending on what gauge is named.
  {
    Minimum = 0;

    //Sets the units for each parameter
    if (Description.equals("Speed"))
    {
      Units = "(km/h)";
      Maximum = 250;
    } else if (Description.equals("RPM"))
    {
      Units = "";
      Maximum = 3000;
    } else if (Description.equals("Fuel"))
    {
      Units="(liter)";
      if (Data.filePath == 1)
        Maximum = 60;
      else if (Data.filePath ==2)
        Maximum = 80;
    }
    //Displays the Circle
    stroke(255);
    strokeWeight(5);
    noFill();
    ellipse(x, y, 300, 300);

    //Displays the value inside the circle and only displays 1 digit after decimal place.
    textFont(createFont("digital-7", 70));
    if (((((float)Data.currentIndex/Data.dataTable.getRowCount())*100)<=15) || ((((float)Data.currentIndex/Data.dataTable.getRowCount())*100)>=85))
    {
      fill(255, 0, 0);
      textAlign(CENTER, CENTER);
      text(nf(value, 0, 1), x, y);
    }
      else {
      fill(250);
      textAlign(CENTER, CENTER);
      text(nf(value, 0, 1), x, y);
      }
    //Displays the Units and despcription underneath the circle
    textSize(20);
    fill(255);
    text(Description+" "+Units, x, y+165);
  }

  void Text_Display(float x, float y, float value, String Description)
  { 
    if (Description.equals("Range:"))
      Units = "km";
    else if (Description.equals("Fuel Economy:"))
      Units="km/liter";
    else if (Description.equals("Odometer:"))
      Units = "km";
    else if (Description.equals("Fuel Consumption:"))
      Units = "liter/(100 km)";

    textSize(25);
    fill(0, 255, 0);
    textAlign(LEFT, CENTER);
    text(Description+" "+nf(value, 0, 2)+" "+Units, x, y);
  }
  }
