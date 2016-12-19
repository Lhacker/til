import java.util.Arrays;
import java.util.List;

public class LambdaSample3 {
    public static void main(String[] args) {
        final List<String> cities = Arrays.asList("Kyoto", "Osaka", "Kobe");
        cities.stream().map(String::toUpperCase).forEach(System.out::println);
    }
}
