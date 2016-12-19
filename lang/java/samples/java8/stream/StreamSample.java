import java.util.Arrays;
import java.util.List;

public class StreamSample {
    public static void main(String[] args) {
        List<String> list = Arrays.asList("C", "C++", "Java", "Scala", "Ruby");
        int count = 0;
        for (String elem : list) {
            if (elem.startsWith("C")) {
                count += elem.length();
            }
        }
        System.out.println("count = " + String.valueOf(count));

        long count2 = list.stream()
            .filter(s -> s.startsWith("C"))
            .mapToInt(s -> s.length())
            .sum();
        System.out.println("count2 = " + String.valueOf(count2));
    }
}
