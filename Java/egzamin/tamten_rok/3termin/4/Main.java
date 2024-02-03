interface I {
    int f(int x);
    static final int N = -5;
}
class A{
    final int N = 5;
}
public class Main{
    public static void main(String[] args){
        A p = new A();
        I o = (x) -> p.N + x;
        System.out.println(o.f(I.N));
    }
}
