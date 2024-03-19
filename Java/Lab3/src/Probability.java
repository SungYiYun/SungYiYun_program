import java.util.Random;
public class Probability 
{
	public static char drawABCD()
	{
		Random a = new Random();
		int b;
		char c =0;
		b = a.nextInt(10)+1;
		if(b==1)
		{
			c='A';
		}
		if(b==2 & b==3)
		{
			c='B';
		}
		if(b==4 & b==5 & b==6)
		{
			c='C';
		}
		if(b==7 & b==8 & b==9 & b==10)
		{
			c='D';
		}
		return c;
	}
	public static void main(String[] args) 
	{
		Probability a = new Probability();
		int b=0;
		int c=0;
		int d=0;
		int e=0;
		float h;
		float i;
		float j;
		float k;
		for (int f=1;f<=10000;f++)
		{
			char g = a.drawABCD();
			switch (g)
			{
			case'A':
				++b;
				break;
			case'B':
				++c;
				break;
			case 'C':
				++d;
				break;
			case 'D':
				++e;
				break;
			}
		}
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);
		System.out.println(e);
		h = b/10000;
		i = c/10000;
		j = d/10000;
		k = e/10000;
		System.out.printf("A ¥X²{ªº¾÷²v¬° %.3f\n",h);
		System.out.printf("B ¥X²{ªº¾÷²v¬° %.3f\n",i);
		System.out.printf("C ¥X²{ªº¾÷²v¬° %.3f\n",j);
		System.out.printf("D ¥X²{ªº¾÷²v¬° %.3f\n",k);
	}
}
