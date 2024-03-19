public class Square extends Equilateral
{
	public Square(double s)
	{
		super(s);
	}
	public double getBorders()
	{
		double a=getSide();
		double border=a*4;
		return border;
	}
	public double getArea()
	{
		double b=getSide();
		double area=b*b;
		return area;
	}
	public String toString()
	{
		return String.format("This square's side is %.2f, border is %.2f and area is %.2f", getSide(),getBorders(),getArea());
	}
}
