package employees;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class EmployeesRunner {

	@Test
	Karate test() {
		return Karate.run("getEmployees.feature")
				.karateEnv("dev")
				.tags("@smoke")
				.dryRun(false)
				.relativeTo(getClass());
	}
}
