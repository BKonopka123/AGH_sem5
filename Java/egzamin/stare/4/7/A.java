class A {
    void f() {
        System.out.println("f() z A, ");
    }
    static void g() {
        System.out.println("g() z A, ");
    }
    public static void main(String[] args) {
        B b = new B();
        A a = b;
        b.f(); a.f(); b.g(); a.g();
    }
}
class B extends A {
    void f() {
        System.out.println("f() z B, ");
    }
    static void g() {
        System.out.println("g() z B, ");
    }
}