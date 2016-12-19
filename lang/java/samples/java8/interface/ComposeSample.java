import java.util.function.Function;

public class ComposeSample {
    public static void main(String[] args) {
        Function<String, String> wrapDoubleQuatation = str -> "\"" + str + "\"";
        Function<String, String> wrapSingleQuatation = str -> "\'" + str + "\'";

        // compose
        Function<String, String> wrapDoubleAndSingleQuatation =
            wrapDoubleQuatation.compose(wrapSingleQuatation);
        String result = wrapDoubleAndSingleQuatation.apply("hoge");
        System.out.println(result);

        // andThen
        Function<String, String> wrapSingleAndDoubleQuatation =
            wrapDoubleQuatation.andThen(wrapSingleQuatation);
        result = wrapSingleAndDoubleQuatation.apply("hoge");
        System.out.println(result);
    }
}
