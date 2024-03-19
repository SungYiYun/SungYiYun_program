public class Permutation 
{
	public static int[] getNext(int in[])
	{
		int a=in.length;
		int b[]=new int[a];
		int c=(int)(Math.random()*a);
		
		for(int i=0;i<b.length;i++)
		{
			b[i]=in[c];
		}
	}
	public static int[] deleteElement(int a[],int x)
	{
		int b[]=new int[a.length-1];
		for(int i=0;i<a.length;i++)
		{
			if(i<x-1)
			{
				b[i]=a[i];
			}
			if(i>x-1)
			{
				b[i-1]=a[i];
			}
		}
		return b;
	}
}
