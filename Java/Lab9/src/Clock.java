import MyPackage.Frame;
import MyPackage.Delay;
import MyPackage.CurrentTime;
public class Clock 
{
	private Time t;
	private Frame clockFrame;
	
	public Clock()
	{
		t=null;
		clockFrame=null;
	}
	public void showClock()
	{
		Frame c=new Frame();
		Delay d=new Delay();
		CurrentTime e=new CurrentTime();
		c.setFrameText(String.format("%d:%02d:%02d",e.currentHour(),e.currentMinute(),e.currentSecond()));
		t.setTime(e.currentHour(),e.currentMinute(),e.currentSecond());
		t.runOneScond();
		d.DelaySeconds(1);
		
	}
}
