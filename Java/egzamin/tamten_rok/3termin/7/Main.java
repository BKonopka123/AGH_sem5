class A {
    void f() {}
    String f() {return null;}
    String f(int k) {return k + "m";}
}
public class Main {
    public static void main(String[] args) {
        System.out.println(new A().f(5));
    }
}