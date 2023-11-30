import java.time.LocalDate;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Osoba> lista = new ArrayList<Osoba>();
        lista.add(new Fizyczny("Jan", "Kowalski", "123456789", "aaa@gmail.com", LocalDate.of(1990, 1, 1), new Adress("Kowalska", "Warszawa", 10, 10, "30-300"), LocalDate.of(2010, 1, 1), 3000.0));
        lista.add(new Fizyczny("Adam", "Nowak", "111111111", "bbb@gmail.com", LocalDate.of(1987, 10, 12), new Adress("Nowacka", "Krakow", 15, 4, "32-500"), LocalDate.of(2015, 11, 8), 3000.0));
        lista.add(new Umyslowy("Karolina", "Abacka", "222222222", "ccc@gmail.com", LocalDate.of(1992, 1, 13), new Adress("Abacka", "Poznan", 6, 18, "38-200"), LocalDate.of(2008, 2, 10), 5000.0));
        lista.add(new Umyslowy("Maciej", "Wojcik", "333333333", "ddd@gmail.com", LocalDate.of(1991, 8, 5), new Adress("Wojcicka", "Elblag", 11, 3, "31-100"), LocalDate.of(2010, 7, 15), 5000.0));
    
        for(Osoba o : lista){
            System.out.println(o);
        }
    }
}
