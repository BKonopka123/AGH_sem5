public class Main{
    public int result(int length, String[] type){
        length++;
        type[0] = "LONG";
        return length;
    }
    public static void main(String[] args) {
        final var h = new Main();
        var length = 3;
        var type = new String[1];
        length = h.result(length, type);
        System.out.println(length + " " + type[0]);
    }
}