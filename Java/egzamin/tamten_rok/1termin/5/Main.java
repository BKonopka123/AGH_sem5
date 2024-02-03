interface J {
    static int value() { return 8; }
}

interface K {
    static int value() { return 10; }
}

abstract class A implements J, K {}

public class Main {
    public static void main(String[] strings){
        final class B extends A {
            public int value() { return 15; }
        }
        System.out.println(new B().value());
    }
}