import java.util.List;

public class IncCounterImplProb2 implements IncCounter{

    @Override
    public int countIncrements(List<Integer> input) {
        int increments = 0;
        int oldSum = input.subList(0, 3).stream().reduce(0, Integer::sum);
        for (int indexCurrent = 3; indexCurrent < input.size(); indexCurrent++) {
            int indexLast = indexCurrent - 3;
            int current = input.get(indexCurrent);
            int last = input.get(indexLast);
            int currentSum = oldSum - last + current;
            if (currentSum > oldSum)
                ++increments;
            oldSum = currentSum;
        }
        return increments;
    }
}
