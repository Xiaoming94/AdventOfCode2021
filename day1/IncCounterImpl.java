import java.util.List;

public class IncCounterImpl implements IncCounter {

    @Override
    public int countIncrements(List<Integer> input) {
        int increments = 0;
        int old = input.remove(0);

        for (int head : input) {
            if(head > old) 
                ++increments;
            old = head;
        }

        return increments;
    }
}