public class TestContactBook 
{
	public static void main(String[] args) 
	{
		String name[ ] = {"David", "Lisa", "James", "Josh", "Odie","Tom", "Jay", "Howard", "Victor", "Eve","Harry", "Daniel", "Steven", "Frank", "Jack","Jacky", "Aaron", "Ray", "Matt", "Jon"};
		String email[] = {"David@Yahoo.com", "Lisa@Yahoo.com", "James@Yahoo.com","Josh@Yahoo.com", "Odie@Yahoo.com","Tom@Yahoo.com","Jay@Yahoo.com", "Howard@Yahoo.com", "Victor@Yahoo.com","Eve@Yahoo.com", "Harry@Yahoo.com", "Daniel@Yahoo.com","Steven@Yahoo.com", "Frank@Yahoo.com", "Jack@Yahoo.com","Jacky@Yahoo.com", "Aaron@Yahoo.com", "Ray@Yahoo.com","Matt@Yahoo.com", "Jon@Yahoo.com"};
		int age[] = {30, -5, 61, 12, 25, 18, 32, 18, 16, 10,23, 38, 12, 9, 45, 21, 45, 20, 19, 12};
		boolean hasClass[] = {true, false, true, false, true,true, true, false, true, false,false, false, true, true, true,true, true, true, false, false};
		String office[] = {"MB301","MB302","MB303","MB304","MB305","MB306","MB307","MB308","MB309","MB310","MB311","MB312","MB313","MB314","MB315","MB316","MB317","MB318","MB319","MB320"};
		int type[] = {Classmate.ELEMENTARY,Classmate.ELEMENTARY,Classmate.ELEMENTARY,Classmate.ELEMENTARY,Classmate.ELEMENTARY,Classmate.HIGHSCHOOL,Classmate.HIGHSCHOOL,Classmate.HIGHSCHOOL,Classmate.COLLEGE,Classmate.COLLEGE};
		Teacher tList[] = new Teacher[10];
		Classmate cList[] = new Classmate[10];
		for (int i=0; i<tList.length; i++) 
		{
			Teacher f = new Teacher(name[i],email[i],age[i],hasClass[i],office[i]);
			tList[i] = f;
		}
		
		for (int i=0; i<cList.length; i++) 
		{
			Classmate c = new Classmate(name[i+10],email[i+10],age[i+10],type[i]);
			cList[i] = c;
		}
		
		ContactBook cb = new ContactBook(tList, cList);
		
		System.out.println("Friend List");
		for (Teacher t:cb.teacherList) {System.out.println(t);}
		for (Classmate c:cb.classmateList) {System.out.println(c);}
		
		System.out.println("\nClassmate Count");
		System.out.printf("Elementary:%d, HighSchool:%d, College:%d",cb.countClassmateByType(Classmate.ELEMENTARY),cb.countClassmateByType(Classmate.HIGHSCHOOL),cb.countClassmateByType(Classmate.COLLEGE));
		
	}
}
