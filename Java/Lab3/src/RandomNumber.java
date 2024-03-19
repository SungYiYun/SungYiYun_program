import java.util.Random;
public class RandomNumber 
{
	public static void main(String[] args) 
	{
		int a = (int)(Math.random()*20);
		System.out.printf("(a) %d\n", a);
		int b = (int)(Math.random()*5-2);
		System.out.printf("(b) %d\n", b);
		int c = (int)(Math.random()*11+10);
		System.out.printf("(c) %d\n", c);
		int d = (int)(Math.random()*4)*13+52;
		System.out.printf("(d) %d\n", d);
		Random e = new Random();
		e.setSeed(1234);
		int f;
		System.out.print("(e) ");
		for(int g=1;g<=10;g++)
		{
			f = e.nextInt(4)*13+52;
			System.out.printf("%d ", f);
		}
		System.out.println();
		e.setSeed(1234);
		System.out.print("    ");
		for(int g=1;g<=10;g++)
		{
			f = e.nextInt(4)*13+52;
			System.out.printf("%d ", f);
		}
	}
}
