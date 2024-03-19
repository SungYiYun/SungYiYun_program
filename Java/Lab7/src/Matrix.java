public class Matrix 
{
	public static int[][] getRandomMatrix()
	{
		int row=(int)(Math.random()*6+5);
		int column=(int)(Math.random()*6+5);
		int a[][];
		a=new int[row][column];
		for(int i=0;i<a.length;i++)
		{
			for(int j=0;j<a[i].length;j++)
			{
				a[i][j]=(int)(Math.random()*21-10);
			}
		}
		return a;
	}
	public static void displayMatrix(int m[][])
	{
		for(int i[]:m)
		{
			for(int j:i)
			{
				if(j<0)
				{
					System.out.printf("%d\t", j);
				}else if(j>=10)
				{
					System.out.printf("%d\t", j);
				}else if(j>=0 && j<10)
				{
					System.out.printf(" %d\t", j);
				}
			}
			System.out.println();
		}
	}
	public static int[][] transpose(int x[][])
	{
		int column=x.length;
		int row=x[0].length;
		int y[][]=new int[row][column];
		for(int i=0;i<row;i++)
		{
			for(int j=0;j<column;j++)
			{
				y[i][j]=x[j][i];
			}
		}
		return y;
	}
	public static void main(String[] args) 
	{
		int a[][]=getRandomMatrix();
		displayMatrix(a);
		System.out.println();
		displayMatrix(transpose(a));
	}
}
