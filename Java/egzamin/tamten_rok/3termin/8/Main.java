class A {
    String s = "ABC";
}
public class Main {
    public static void main(String[] args) {
        A x = new A();
        A y = (A) x.clone();
        System.out.println(y.s);
    }
}