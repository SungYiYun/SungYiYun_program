public class Triangle extends Equilateral
{
	public Triangle(double s)
	{
		super(s);
	}
	public double getBorders()
	{
		double a = getSide();
		double border=a*3;
		return border;
	}
	public double getArea()
	{
		double b=getSide();
		double area=(b*b)*(3^(1/2))/4;
		return area;
	}
	public String toString()
	{
		return String.format("This triangle's side is %.2f, border is %.2f and area is %.2f", getSide(),getBorders(),getArea());
	}
}
