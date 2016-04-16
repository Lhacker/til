import java.util.Arrays;
import java.util.List;

public class ParallelStreamSample {
    public static void main(String[] args) {
        List<String> list = Arrays.asList("C", "C++", "Java", "Scala", "Ruby");
        long count = list.parallelStream()
            .filter(s -> s.startsWith("C"))
            .mapToInt(s -> s.length())
            .sum();
        System.out.println("count = " + String.valueOf(count));
    }
}
