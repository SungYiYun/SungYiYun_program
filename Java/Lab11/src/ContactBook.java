public class ContactBook 
{
	public Teacher teacherList[];
	public Classmate classmateList[];
	
	public ContactBook(Teacher f[],Classmate c[])
	{
		teacherList=f;
		classmateList=c;
	}
	public int countClassmateByType(int type)
	{
		int count=0;
		for(int i=0;i<classmateList.length;i++)
		{
			if(classmateList[i].getClassmateType()==type)
			{
				count=count+1;
			}
		}
		return count;
	}
}
