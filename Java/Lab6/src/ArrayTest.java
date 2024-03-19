
public class ArrayTest 
{
	public static void main(String[] args) 
	{
		int a[]={1,2,3,4,5};
		for (int i=7;i>-2;i--)
		{
			a=Array.deleteElement(a,i);
			for(int e:a)
			{
				System.out.print(e+" ");
			}
			System.out.println();
		}
		System.out.println("-------------");
	}
}