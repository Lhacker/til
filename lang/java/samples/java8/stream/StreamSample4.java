import java.util.Arrays;
import java.util.stream.Collectors;

public class StreamSample4 {
    public static void main(String[] args) {
        int[] numbers = {1, 2, 3, 4};
        String commaSeparatedNumbers = Arrays.stream(numbers)
            .mapToObj(i -> String.valueOf(i))
            .collect(Collectors.joining(", "));
        System.out.println(commaSeparatedNumbers);
    }
}
