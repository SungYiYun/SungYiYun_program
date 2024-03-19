public class Person 
{
	private String name;
	private String email;
	private int age;
	
	public Person(String n,String e,int a)
	{
		setName(n);
		setEMail(e);
		setAge(a);
	}
	public void setName(String str)
	{
		name=str;
	}
	public void setEMail(String str)
	{
		email=str;
	}
	public void setAge(int i)
	{
		age=((i>=0)?i:0);
	}
	public String getName()
	{
		return name;
	}
	public String getEMail()
	{
		return email;
	}
	public int getAge()
	{
		return age;
	}
	public String toString()
	{
		return String.format("The person %s, age %d, E-Mail %s",name,age,email);
	}
}
