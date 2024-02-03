interface Colored {String color();}
enum COLORS implements Colored {
    red {public String color(){return "[RED]";}},
    green {public String color(){return "[GREEN]";}},
    blue {public String color(){return "[BLUE]";}};
    private COLORS() {}
}
public class Main {
    final void paint(Colored c){
        System.out.println(c + "=" + c.color());
    }
    public static void main(String[] args) {
        new Main().paint(COLORS.green);
    }
}