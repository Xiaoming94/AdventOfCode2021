import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class Problem2 {
    public static void main (String [] args) {
        Integer [] numList = {1,2,3,4,5};
        List <Integer> inputs = new ArrayList<>(Arrays.asList(numList));
        IncCounter counter = new IncCounterImplProb2();
        System.out.println((1 + 2 + 3) == counter.countIncrements(inputs));
    }
}
