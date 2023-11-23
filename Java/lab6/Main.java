import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Figura> figury = new ArrayList<Figura>();
        figury.add(new Rownoleglobok(2, 3, 4));
        figury.add(new Kolo(5));
        figury.add(new Trojkat(3, 4, 5));
        figury.add(new Prostokat(5, 6));
        figury.add(new Kwadrat(4));
        for(Figura i : figury){
            System.out.println(i);
        }
    }
}
