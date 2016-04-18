import java.util.function.Supplier;

public class SupplierSample {
    public static void main(String[] args) {
        Supplier<String> supplier = () -> "hoge";
        System.out.println(supplier.get());
    }
}
