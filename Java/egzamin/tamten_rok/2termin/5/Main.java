interface F {
    double f(float x);
}
public class Main{
    private static double cube(float x){
        return x*x*x;
    }
    public static void main(String[] args){
        F s = Main::cube;
        System.out.println(s.f(0));
    }
}