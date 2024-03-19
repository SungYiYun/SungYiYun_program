
public class StatisticTest 
{
	public static void main(String[] args) 
	{
		int a[]={20, 9, 10, 7, 6, 14, 19, 19, 2, 7, 7, 6, 3, 11, 8, 20, 5};
		double c;
		Statistic b=new Statistic();
		c=b.getSD(a);
		System.out.println(c);
	}
}