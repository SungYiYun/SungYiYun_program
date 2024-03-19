public class Hexagon extends Shape
{
	public double side;
	
	public Hexagon(double s)
	{
		name="Hexagon";
		side=s;
	}
	public double outerCircleArea()
	{
		double carea;
		carea=side*side*3.14;
		return carea;
	}
	public void computeBorders() 
	{
		border=side*6;
	}
	public void computeArea() 
	{
		area=(3/2)*(side*side)*Math.sqrt(3);
	}
}
