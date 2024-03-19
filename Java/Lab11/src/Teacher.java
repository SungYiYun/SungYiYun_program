
public class Teacher extends Person
{
	private boolean hasClass;
	private String office;
	
	public Teacher(String n,String e,int a,boolean c,String o)
	{
		super(n,e,a);
		setHasClass(c);
		setOffice(o);
	}
	public void setHasClass(boolean b)
	{
		hasClass=b;
	}
	public void setOffice(String str)
	{
		office=str;
	}
	public boolean getHasClass()
	{
		return hasClass;
	}
	public String getOffice()
	{
		return office;
	}
	public String toString()
	{
		if(getHasClass()==true)
		{
			return String.format("The teacher %s, age %d, E-Mail %s,%s,office at %s",getName(),getAge(),getEMail(),"taking class",office);
		}
		else
		{
			return String.format("The teacher %s, age %d, E-Mail %s,%s,office at %s",getName(),getAge(),getEMail(),"not taking class",office);
		}
	}
}
