import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class StreamSample3 {
    public static void main(String[] args) {
        List<String> fizzbuzz = IntStream.rangeClosed(1, 20)
            .mapToObj(n ->
                    (n % 15 == 0) ? "FizzBuzz" :
                    (n % 3 == 0) ? "Fizz" :
                    (n % 5 == 0) ? "Buzz" :
                    String.valueOf(n))
            .collect(Collectors.toList());
        fizzbuzz.forEach(System.out::println);
    }
}
