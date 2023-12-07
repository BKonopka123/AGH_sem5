import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Noise> noises = new ArrayList<Noise>();
        noises.add(new Repairs("Banging", "Jan Kowalski", "Hammer"));
        noises.add(new NightWork("Car sound", "Maciej Nowak", "Deliverer"));
        noises.add(new Party("Music", 10, true));
        noises.add(new Integration("Talking", 5, "work integration"));
        for (Noise noise : noises) {
            System.out.println(noise.makeNoise());
        }
    }
}
