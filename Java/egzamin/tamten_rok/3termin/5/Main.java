interface I {
    int f(int x);
    static final int N = -9;
}
class A{
    final int N = 9;
}
public class Main{
    public static void main(String[] args){
        A p = null;
        int w = I.N + A.N;
        System.out.println(p + " " + w);
    }
}