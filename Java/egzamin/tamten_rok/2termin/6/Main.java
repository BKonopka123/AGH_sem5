class A {
    protected void f() {
        System.out.print("x");
    }
}
class B extends A {
    public void g() {f();}
}
public class Main {
    public static void main(String[] args) {
        var x = new B();
        x.g();
        x.f();
    }
}