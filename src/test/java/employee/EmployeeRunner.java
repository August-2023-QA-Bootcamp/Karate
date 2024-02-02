package employee;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class EmployeeRunner 
{

	@Test
	Karate test() 
	{
		return Karate.run()
				.tags("@delete-employee-feature")
				.relativeTo(getClass());
	}
}
