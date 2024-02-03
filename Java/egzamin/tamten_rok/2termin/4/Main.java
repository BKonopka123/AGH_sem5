interface S<T> {
    T get();
}

public class Main {
    private static double pi() {
        return 3.14;
    }
    public static void main(String[] args){
        S<double> s = Main::pi;
        System.out.println (s.get());
    }
}