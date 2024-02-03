public class Main {
    private final String name;
    public Main(){
        this(null);
        this.name = "AAA";
    }
    public Main(String n){
        name = "BBB";
    }
    public static void main(String[] sound) {
        var d = new Main("CCC");
        System.out.println(d.name);
    }
}