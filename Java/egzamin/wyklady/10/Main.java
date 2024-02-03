public class Main {
    public static void main(String[] args) {
        int t[] = { 1, 2, 3 };
        for(int x : t) { x = 99; }
        System.out.println(t[0] + ",␣" + t[1] + ",␣" + t[2]);
    }
}