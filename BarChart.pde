void drawBarChart(float x, float y, float[] Fuel_History)
{
  textSize(9);
  
  barChart.setData(Fuel_History); //draws bar charts based on the help document and gicentre program.
  barChart.showValueAxis(true);
  barChart.setValueFormat("#");
  barChart.showCategoryAxis(true);

  //Scaling
  barChart.setMinValue(0);
  barChart.setMaxValue(30);

  //customizing the chart
  barChart.setBarColour(color(250, 80, 0));
  barChart.setBarGap(2);
  barChart.draw(x, y, 500, 180);
}
