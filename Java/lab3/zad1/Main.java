import java.time.LocalDate;

public class Main{
    public static void main(String[] args) throws CloneNotSupportedException{
        Czlowiek c1=new Czlowiek("Adam", "Zlodziej", LocalDate.of(2002,4,3));
        System.out.println(c1==c1.clone());
        System.out.println(c1.equals(c1.clone()));
        //Czlowiek c2=new Czlowiek("Adam", "Zlodziej", LocalDate.of(2003,4,3));
        //System.out.println(c1.equals(c2));
    }
}