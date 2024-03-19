
public class Array 
{
	public static int[] deleteElement(int x[],int ith)
	{
		int a=ith-1;
		int b=x.length;
		for(int i=0;i<x.length;i++)
		{
			if(i==a)
			{
				b=b-1;
				for(i=a;i<b;i++)
				{
					x[i]=x[i+1];
					for(int j=x.length;j<b;j--)
					{
						x[j]=0;
					}
				}
			}
			//System.out.println(x[i]);
		}
		return x;
	}
}
