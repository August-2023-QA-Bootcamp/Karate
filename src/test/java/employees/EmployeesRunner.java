package employees;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class EmployeesRunner {

	@Test
	Karate test() 
	{
		return Karate.run()
				.karateEnv("dev")
				.tags("~@validation","~@exclude", "@sanity")
				.dryRun(false)
				.relativeTo(getClass());
	}
}
