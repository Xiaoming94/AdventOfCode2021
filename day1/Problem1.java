import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Problem1 {
	public static void main(String [] args) {
		IncCounter incCounter = new IncCounterImpl();
		Integer [] a = {1,4,2,4,6,7,8,6,7};
		List <Integer> inputs = new ArrayList <> (Arrays.asList(a));
		System.out.println(incCounter.countIncrements(inputs));
		
	}
}
