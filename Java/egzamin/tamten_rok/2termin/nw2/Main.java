class Main {
    {
        System.out.println("1");
    }
    static {
        System.out.println("2");
    }
    public Main() {
        System.out.println("3");
    }
    public static void f() {
        System.out.println("4");
    }
    public static void main(String[] args) {
        f();
        f();
        System.out.println("5");
    }
}