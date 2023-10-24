public class Dziecko
{
    String imie;
    String nazwisko;
    static int liczba_dzieci=0;

    public Dziecko(String i, String n)
    {
        imie = i;
        nazwisko = n;
        liczba_dzieci += 1;
    }
    
    public void wypisz_dziecko()
    {
        System.out.println(imie + " " + nazwisko);
    }
}