public class MyArray 
{
	public static void main(String[] args) 
	{
		String a[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		String b[] = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
		System.out.println(a[18]+b[20]+b[13]+b[6]+" "+a[24]+b[8]+" "+a[24]+b[20]+b[13]);
		
		int c[] = new int[20];
		for(int i=0;i<c.length;i++)
		{
			c[i] = (int)(Math.random()*100+1);
		}
		for(int x=1;x<=20;x++)
		{
			int d=(int) (Math.random()*20);
			System.out.print(c[d]+" ");
		}
	}
}
