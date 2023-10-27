import java.util.Date;

public class Main{
    public static void main(String[] args) throws CloneNotSupportedException{
        Date data = new Date(2000);
        
        Czlowiek c1=new Czlowiek("Adam", "Zlodziej", data);
        Czlowiek c2=c1.clone();
        Czlowiek c3=c1.clone();
        c1.printCzlowiek();
        c2.printCzlowiek();
        c3.printCzlowiek();
        Date nowadata = new Date(1000);
        c1.changedU(nowadata);
        c1.printCzlowiek();
        c2.printCzlowiek();
        c3.printCzlowiek();
        System.out.println(c1.equals(c2));
        System.out.println(c2.equals(c3));
    }
}