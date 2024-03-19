import MyPackage.Frame;
import MyPackage.Delay;
public class Test2 
{
	public static void main(String[] args) 
	{
		Frame a = new Frame();
		Delay b = new Delay();
		a.setFrameText("10 second");
		a.ShowFrame();
		b.DelaySeconds(1);
		a.setFrameText("9 second");
		a.ShowFrame();
		b.DelaySeconds(1);
		a.setFrameText("8 second");
		a.ShowFrame();
		b.DelaySeconds(1);
		a.setFrameText("7 second");
		a.ShowFrame();
		b.DelaySeconds(1);
		a.setFrameText("6 second");
		a.ShowFrame();
		b.DelaySeconds(1);
		a.setFrameText("5 second");
		a.ShowFrame();
		b.DelaySeconds(1);
		a.setFrameText("4 second");
		a.ShowFrame();
		b.DelaySeconds(1);
		a.setFrameText("3 second");
		a.ShowFrame();
		b.DelaySeconds(1);
		a.setFrameText("2 second");
		a.ShowFrame();
		b.DelaySeconds(1);
		a.setFrameText("1 second");
		a.ShowFrame();
		b.DelaySeconds(1);
		a.setFrameText("0 second");
		a.ShowFrame();
	}
}
