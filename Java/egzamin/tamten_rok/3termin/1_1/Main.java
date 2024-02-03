interface l {}
class A {}
class B extends A implements l {}
public class Main {
    public static void main(String[] args) {
        // l a = new l();
        // B b = new A();
        l c = new B();
        A d = new A();
        // l e = new A();
        // l f = (l) (new A());
    }
}