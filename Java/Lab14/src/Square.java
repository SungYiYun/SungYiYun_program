public class Square extends Shape
{
	public double side;
	
	public Square(double s)
	{
		name="Square";
		side=s;
	}
	public double innerCircleArea()
	{
		double r=side/2;
		double carea;
		carea=r*r*3.14;
		return carea;
	}
	public void computeBorders() 
	{
		border=side*4;
	}
	public void computeArea() 
	{
		area=side*side;
	}
}
