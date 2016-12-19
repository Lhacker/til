import java.util.function.Predicate;

public class PredicateSample {
    public static void main(String[] args) {
        Predicate<String> predicate = str -> str.isEmpty();
        System.out.println(predicate.test(""));
        System.out.println(predicate.test("not empty"));

        Predicate<Object> isNull = Predicate.isEqual(null);
        System.out.println(isNull.test(null));
        System.out.println(isNull.test("not null"));

        Predicate<String> isUpperCase = str -> str.matches("[A-Z]+");
        Predicate<String> isAlphabet = str -> str.matches("[a-zA-Z]+");
        Predicate<String> isNumber = str -> str.matches("\\d+");

        predicate = isAlphabet.and(isUpperCase);
        System.out.println(predicate.test("HOGE"));
        System.out.println(predicate.test("Hoge"));

        predicate = isAlphabet.or(isNumber);
        System.out.println(predicate.test("1234"));
        System.out.println(predicate.test("hoge1234"));

        Predicate<String> isEmpty = str -> str.isEmpty();
        Predicate<String> isNotEmpty = isEmpty.negate();
        System.out.println(isNotEmpty.test(""));
        System.out.println(isNotEmpty.test("not empty"));
    }
}
