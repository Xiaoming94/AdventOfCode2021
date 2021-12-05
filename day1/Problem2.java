import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class Problem2 {
    public static void main (String [] args) {
        Integer [] numList = {199,200,208,210,200,207,240,269,260,263};
        List <Integer> inputs = new ArrayList<>(Arrays.asList(numList));
        IncCounter counter = new IncCounterImplProb2();
        System.out.println(counter.countIncrements(inputs) == 5);
    }
}
