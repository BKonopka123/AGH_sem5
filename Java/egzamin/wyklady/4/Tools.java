class Tools {
    static int n;
    static int init(String s) {
    System.out.println( (++n) + ")␣" + s );
        return n;
    }
    static void print(int k, int m) {
        System.out.println("k=" + k + "␣m=" + m);
    }
}