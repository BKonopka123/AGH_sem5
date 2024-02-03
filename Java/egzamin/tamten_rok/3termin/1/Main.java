public class Main{
    public static void main(String[] args) {
        int x = 10;
        String name = null;
        try {
            x = name.length();
            x /= 2;
        } catch(NullPointerException e) {
            ++x;
        } catch(RuntimeException e) {
            x--;
        } finally {
            System.out.println("x=" + x);
        }
    }
}