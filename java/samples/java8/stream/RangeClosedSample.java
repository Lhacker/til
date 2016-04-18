import java.util.stream.IntStream;

public class RangeClosedSample {
    public static void main(String[] args) {
        int sum = IntStream.rangeClosed(1, 10).map(i -> i / 2).sum();
        System.out.println(sum);

        double doubleSum = IntStream.rangeClosed(1, 10).asDoubleStream().map(i -> i / 2).sum();
        System.out.println(doubleSum);
    }
}

