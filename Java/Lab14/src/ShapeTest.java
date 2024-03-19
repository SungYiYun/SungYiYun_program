public class ShapeTest 
{
	public static void shapeDescription(Shape s[])
	{
		for(int i=0;i<s.length;i++)
		{
			
			boolean a;
			if(a=s[i] instanceof Triangle)
			{
				
			}
			if(a=s[i] instanceof Rectangle)
			{
				s[i].toString();
				System.out.println((Rectangle)s[i]);
			}
			if(a=s[i] instanceof Square)
			{
				s[i].toString();
				System.out.println((Square)s[i]);
			}
			if(a=s[i] instanceof Hexagon)
			{
				s[i].toString();
				System.out.println((Hexagon)s[i]);
			}
		}
	}
	public static void main(String[] args) 
	{
		Triangle t1=new Triangle(3,4,5);
		Triangle t2=new Triangle(5,5,5);
		Square s=new Square(5);
		Rectangle r=new Rectangle(3,4);
		Hexagon h=new Hexagon(3);
		
		Shape arrShape[]={t1,t2,s,r,h};
		shapeDescription(arrShape);
	}
}
