import java.util.Arrays;
import java.util.Comparator;

public class LambdaSample {
    public static void main(String[] args) {
        Integer[] array = new Integer[5];
        array[0] = 5;
        array[1] = 2;
        array[2] = 3;
        array[3] = 1;
        array[4] = 4;

        Arrays.sort(array, new Comparator<Integer>() {
            @Override
            public int compare(Integer a, Integer b) {
                return Integer.compare(a, b);
            }
        });
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i]);
        }
        System.out.println();

        Arrays.sort(array, (a, b) -> -Integer.compare(a, b));
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i]);
        }
        System.out.println();
    }
}
