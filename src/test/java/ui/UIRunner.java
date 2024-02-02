package ui;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;

public class UIRunner {

	@Test
	public void testRunner() {
		Runner.path("src/test/java/ui").tags("@chrome").parallel(2);
	}
}
