public class Equilateral 
{
	private double side;
	public Equilateral(double s) 
	{
		setSide(s);
	}
	public void setSide(double s) 
	{
		side=((s>0)?s:0);
	}
	public double getSide() 
	{
		return side;
	}

}
