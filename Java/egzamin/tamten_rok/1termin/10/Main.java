enum E{
    A(4), B(3), C(2), D(1);
    E(int d) {}
}

public class Main {
    public static void main(String[] args) {
        final E s = E.B;
        switch(s) {
            case B: System.out.println(s);
            default: System.out.println(s.ordinal());
        }
        switch(s) {
            case B -> System.out.println(s);
            default -> System.out.println(s.ordinal());
        }
    }
}