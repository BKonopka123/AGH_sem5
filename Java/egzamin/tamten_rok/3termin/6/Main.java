interface I {
    String f();
    static void g() {
        System.out.println("g");
    }
}
public class Main {
    public static void main(String[] args) {
        var a = new I() {
            public String f() {
                I.g();
                return "f";
            }
        };
        System.out.println(a.f());
    }
}