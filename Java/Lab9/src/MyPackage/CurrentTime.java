package MyPackage;

import java.util.Calendar;

public class CurrentTime 
{
	 	 
	 public static int currentHour()
	 {
		 return Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
	 }
	
	 public static int currentMinute()
	 {
		 return Calendar.getInstance().get(Calendar.MINUTE);
	 }
	 
	 public static int currentSecond()
	 {
		 return Calendar.getInstance().get(Calendar.SECOND);
	 }
}
