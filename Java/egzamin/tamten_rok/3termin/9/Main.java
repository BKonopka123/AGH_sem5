class A {
    String s = "ABC";
}
public class Main {
    public static void main(String[] args) {
        A x = new A();
        A y = new A();
        System.out.println(y.equals(x));
    }
}