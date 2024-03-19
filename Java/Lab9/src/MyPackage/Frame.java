package MyPackage;
import java.awt.Color;
import java.awt.Font;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import java.awt.FlowLayout;

public class Frame 
{
	
	private JFrame frame;
	private JLabel label;
	
	public Frame() 
	{
		frame = new JFrame("Clock");
		label = new JLabel();
		frame.setLayout(new FlowLayout());
		frame.setSize(200,90);
		frame.add(label);
		label.setFont(new Font("Arial", Font.BOLD, 32));
		label.setForeground(Color.DARK_GRAY);
		label.setHorizontalTextPosition(SwingConstants.CENTER);	
	}
	
	public void setFrameText(String text) 
	{
		label.setText(text);
	}
	
	public void ShowFrame() 
	{
		frame.setVisible(true);
	}

	//public void setFrameText(int text) {
	//	setFrameText(Integer.toString(text));
	//}
}
