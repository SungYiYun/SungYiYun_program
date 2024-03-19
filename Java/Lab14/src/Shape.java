public abstract class Shape 
{
	public String name;
	public double border;
	public double area;
	
	public abstract void computeBorders();
	public abstract void computeArea();
	public String toString()
	{
		return String.format("This is a %s. The border is %.2f. and the area is %.2f",name,border,area);
	}
}
