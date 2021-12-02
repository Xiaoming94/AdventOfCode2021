import java.util.List;
/**
 * @author Xiaoming
 * Interface for the counter of AoC day 1 problem 1
 */

public interface IncCounter {
    /**
     * Method countIncrements
     * This method is the increments counter that is specified in Day 1 problem 1
     * @param input: List of Integers representing the Scan data
     * @return increments: Number of increments happening in the input List
     */
    public int countIncrements (List <Integer> input);
}