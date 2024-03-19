
public class Statistic 
{
	public static double getSD(int x[])
	{
		double n=x.length;
		double sum=0;
		double a;
		double b=0;
		double SD;
		for(int i=0;i<x.length;i++)
		{
			sum=sum+x[i];
		}
		a=sum/n;
		for(int j=0;j<x.length;j++)
		{
			b=b+(x[j]-a)*(x[j]-a);
		}
		SD=Math.sqrt(b/(n-1));
		return SD;
	}
}
