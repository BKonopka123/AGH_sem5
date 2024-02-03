public class Main {
    public static void f(String... names) {
        var v = names[1].length();
        System.out.println(names[v]);
    }

    public static void main(String[] args) {
        f("aaaa", "bbbb", "cccc", "dddd");
    }
}