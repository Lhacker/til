import java.util.function.Function;

public class FunctionSample {
    public static void main(String[] args) {
        Function<String, Integer> function = str -> Integer.parseInt(str);
        System.out.println(function.apply("12345"));
    }
}
