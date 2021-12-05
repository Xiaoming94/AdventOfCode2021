import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class Problem2 {
    public static void main (String [] args) {
        BufferedReader reader;
		List<Integer> inputList = new ArrayList<>();
		IncCounter incCounter = new IncCounterImplProb2();
		try {
			reader = new BufferedReader(new FileReader("./input.txt"));
			String line = reader.readLine();
			while (line != null)
			{
				int input = Integer.parseInt(line);
				inputList.add(input);
				line = reader.readLine();
			}

			System.out.println(incCounter.countIncrements(inputList));
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
    }
}
