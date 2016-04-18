public class LambdaInterface {
    public static void main(String[] args) {
       hello h = (name -> "Hello " + name);
       System.out.println(h.sayHi("hiroyuki"));
    }
}

@FunctionalInterface
interface hello {
    public String sayHi(String name);
}
