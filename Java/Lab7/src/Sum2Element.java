public class Sum2Element 
{
	public static void main(String[] args) 
	{
		int arrA[]={13,-22,28,17,-8,20,15,6,-2,23};
		int num1=0;
		int num2=0;
		for(int i=0;i<arrA.length;i++)
		{
			if(arrA[i]>num1)
			{
				num1=arrA[i];
			}
			if(arrA[i]>num2)
			{
				if(num1 != arrA[i])
				{
					num2 =arrA[i];
				}
			}
		}
		System.out.println(num1+"+"+num2+"="+(num1+num2));
	}
}
