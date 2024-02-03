public class Main{
    private static int f(int... a){
        return (a[0] + a[1]) / a[2];
    }
    public static void main(String[] args){
        //System.out.println(f(0));
        //System.out.println(f(1, 0));
        //System.out.println(f(2, 1, 0));
        System.out.println(f(3, 2, 1, 0));
        //System.out.println(f(3, 2, 1, 0, -1.0));
        System.out.println(f(3, 2, 1, 0, (int) -1.0));
    }
}