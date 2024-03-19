public class TestClassmate 
{
	public static void main(String[] args) 
	{
		Classmate c1 = new Classmate("David", "david@yuntech.edu.tw", 0, Classmate.ELEMENTARY);
		Classmate c2 = new Classmate("Lisa", "lisa@yuntech.edu.tw", -5, Classmate.HIGHSCHOOL);
		Classmate c3 = new Classmate("James", "james@yuntech.edu.tw", 20, Classmate.COLLEGE);
		System.out.println(c1);
		System.out.println(c2);
		System.out.println(c3);
	}
}
