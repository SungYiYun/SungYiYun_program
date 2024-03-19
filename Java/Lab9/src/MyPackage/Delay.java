package MyPackage;

public class Delay 
{
	public static void DelaySeconds(int second) 
	{
		 try
         {
			 Thread.sleep(second * 1000); 
         }
         catch(InterruptedException e)
         {
        	 e.printStackTrace();
         } 
	}
}
