import java.util.function.UnaryOperator;

public class UnaryOperatorSample {
    public static void main(String[] args) {
        UnaryOperator<String> unary = str -> "[" + str + "]";
        System.out.println(unary.apply("hoge"));
    }
}
