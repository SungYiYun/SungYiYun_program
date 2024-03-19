public class Time 
{
	private int hour;
	private int minute;
	private int second;
	
	public void setTime(int hr,int min,int sec)
	{
		hour = ((hr>=0 && hr<24)?hr:0);
		minute = ((min>=0 && min<60)?min:0);
		second = ((sec>=0 && sec<60)?sec:0);
	}
	public int getHour()
	{
		return hour;
	}
	public int getMinute()
	{
		return minute;
	}
	public int getSecond()
	{
		return second;
	}
	public void runOneScond()
	{
		if(second==59)
		{
			if(minute==59)
			{
				if(hour==23)
				{
					hour=0;
					minute=0;
					second=1;
				}
				hour=hour+1;
				minute=0;
				second=1;
			}
			hour=hour+1;
			minute=minute+1;
			second=1;
		}
	}
}
