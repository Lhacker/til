import java.util.Arrays;
import java.util.Comparator;

public class LambdaSample2 {
    public static void main(String[] args) {
        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                for (int i = 0; i < 10; i++) {
                    try {
                        Thread.sleep(100);
                    } catch(InterruptedException e) {}
                    System.out.println(i);
                }
            }
        });
        t.start();
        System.out.println();

        Thread t2 = new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                try {
                    Thread.sleep(100);
                } catch(InterruptedException e) {}
                System.out.println(i);
            }
        });
        t2.start();
    }
}
