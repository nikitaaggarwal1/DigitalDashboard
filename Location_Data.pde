class Location
{
  double x[];
  double y[];
  double x_Direction;
  double y_Direction;
  String Quadrant;

  void makeArray() //creates arrays for x and y coordinates
  {
    int index = Data.dataTable.getRowCount();
    x = new double[index];
    y = new double[index];
  }

  void calculateXY() //gets x and y values for each index
  {
    x[Data.currentIndex] = Data.readX();
    y[Data.currentIndex] = Data.readY();
  }


  String calculateDirection()
  {

    //Calculate the Direction the Vechile is going.
    if (Data.currentIndex==0)
      return "";
    x_Direction = x[Data.currentIndex]-x[Data.currentIndex-1];
    y_Direction = y[Data.currentIndex]-y[Data.currentIndex-1];

    //Returns the quadrant that the vechile is going
    if (x_Direction<0 && y_Direction<0)
      return "SW";
    else if (x_Direction<0 && y_Direction>0)
      return "NW";
    else if (x_Direction<0 && y_Direction==0.0)
      return "W";
    else if (x_Direction>0 && y_Direction<0)
      return "SE";
    else if (x_Direction>0 && y_Direction>0)
      return "NE";
    else if (x_Direction>0 && y_Direction==0.0)
      return "E";
    else if (x_Direction==0.0 && y_Direction>0)
      return "N";
    else if (x_Direction==0.0 && y_Direction<0)
      return "S";
    else
      return"";
      
  }

  void DisplayDirection(float x, float y, String Direction) //displays direction
  {
    stroke(255);
    strokeWeight(5);
    noFill();
    ellipse(x, y, 75, 75);

    textAlign(CENTER, CENTER);
    textSize(35);
    fill(0,0,255);
    text(Direction, x, y);
  }
}
