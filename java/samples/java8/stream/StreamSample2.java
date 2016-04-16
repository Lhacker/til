import java.util.stream.Stream;
import java.util.stream.IntStream;
import java.util.IntSummaryStatistics;

public class StreamSample2 {
    public static void main(String[] args) {
        String[] words = Stream.of("C", "C++", "Java", "Scala", "Ruby")
            .map(s -> s.toUpperCase())
            .sorted()
            .toArray(String[]::new);
        for (String w : words) {
            System.out.println(w);
        }

        IntSummaryStatistics stats = IntStream.generate(() -> (int)(Math.random() * 100))
            .filter(n -> n >= 80)
            .distinct()
            .limit(3)
            .summaryStatistics();
        System.out.println(stats);
        System.out.println(stats.getCount());
    }
}
