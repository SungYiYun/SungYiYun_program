public class Triangle extends Shape
{
	public double side1;
	public double side2;
	public double side3;
	
	public Triangle(double s1,double s2,double s3)
	{
		name="Triangle";
		side1=s1;
		side2=s2;
		side3=s3;
	}
	public boolean isRightTriangle()
	{
		boolean a=false;
		if(side1>side2)
		{
			if(side1>side3)
			{
				if((side1)*(side1)==((side2)*(side2)+(side3)*(side3)))
				{
					return a=true;
				}
			}
		}
		if(side2>side3)
		{
			if(side2>side1)
			{
				if((side2)*(side2)==((side1)*(side1)+(side3)*(side3)))
				{
					return a=true;
				}
			}
		}
		if(side3>side1)
		{
			if(side3>side2)
			{
				if((side3)*(side3)==((side2)*(side2)+(side1)*(side1)))
				{
					return a=true;
				}
			}
		}
		return a;
	}
	public void computeBorders() 
	{
		border=side1+side2+side3;	
	}
	public void computeArea() 
	{
		if(side1>side2)
		{
			if(side1>side3)
			{
				area=side2*side3*0.5;
			}
		}
		if(side2>side3)
		{
			if(side2>side1)
			{
				area=side3*side1*0.5;
			}
		}
		if(side3>side1)
		{
			if(side3>side2)
			{
				area=side1*side2*0.5;
			}
		}
	}
}
