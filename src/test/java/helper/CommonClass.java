package helper;

import java.time.Instant;

public class CommonClass {

	public static String getOS() {
		return System.getProperty("os.name");
	}
	
	public Instant getCurrentDateTime() {
		return Instant.now();
	}
}
