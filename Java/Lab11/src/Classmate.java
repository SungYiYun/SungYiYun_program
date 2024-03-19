public class Classmate extends Person
{
	public static final int ELEMENTARY=1;
	public static final int HIGHSCHOOL=2;
	public static final int COLLEGE=3;
	private int classmateType;
	
	public Classmate(String n,String e,int a,int cType)
	{
		super(n,e,a);
		setClassmateType(cType);
	}
	public void setClassmateType(int i)
	{
		classmateType=i;
	}
	public int getClassmateType()
	{
		return classmateType;
	}
	public String toString()
	{
		if(getClassmateType()==1)
		{
			return String.format("The classmate %s, age %d, E-Mail %s,%s",getName(),getAge(),getEMail(),"Elementary School classmate");
		}else if(getClassmateType()==2)
		{
			return String.format("The classmate %s, age %d, E-Mail %s,%s",getName(),getAge(),getEMail(),"High School classmate");
		}else
		{
			return String.format("The classmate %s, age %d, E-Mail %s,%s",getName(),getAge(),getEMail(),"College School classmate");
		}
	}
}
