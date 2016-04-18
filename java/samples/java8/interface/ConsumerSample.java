import java.util.function.Consumer;

public class ConsumerSample {
    public static void main(String[] args) {
        Consumer<String> consumer = str -> System.out.println("Consumer : " + str);
        consumer.accept("hoge");

        Consumer<String> hoge = str -> System.out.println("hoge : " + str);
        Consumer<String> fuga = str -> System.out.println("fuga : " + str);
        Consumer<String> piyo = hoge.andThen(fuga);
        piyo.accept("X");
    }
}
