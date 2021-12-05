import java.util.List;

public class IncCounterImplProb2 implements IncCounter{

    @Override
    public int countIncrements(List<Integer> input) {
        int increments = 0;
        int old = input.subList(0, 3).stream().reduce(0, Integer::sum);
        return old;
    }
}
