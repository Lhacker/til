import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class LambdaSample4 {
    public static void main(String[] args) {
        final List<String> cities = Arrays.asList("Kyoto", "Osaka", "Kobe");
        final List<String> startWithKs =
            cities.stream()
                .filter(city -> city.startsWith("K"))
                .collect(Collectors.toList());
        startWithKs.forEach(System.out::println);

        final Optional<String> foundCity =
            cities.stream()
                .filter(city -> city.startsWith("K"))
                .findFirst();
        System.out.println(foundCity.orElse("None"));
        foundCity.ifPresent(System.out::println);
    }
}
