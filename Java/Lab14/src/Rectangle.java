public class Rectangle extends Shape
{
	public double length;
	public double width;
	
	public Rectangle(double l,double w)
	{
		name="Rectangle";
		length=l;
		width=w;
	}
	public double getDiagonal()
	{
		double diagonal;
		diagonal=Math.sqrt(length*length+width*width);
		return diagonal;
	}
	public void computeBorders() 
	{
		border=(length+width)*2;
	}
	public void computeArea() 
	{
		area=length*width;
	}
}
