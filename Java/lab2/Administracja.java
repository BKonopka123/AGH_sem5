public class Administracja
{
    Przedszkole[] prz = new Przedszkole[5];

    public Administracja(Przedszkole[] p, int max)
    {
        if(p.length > max)
            System.exit(0);
        prz=p;
    }

    static public int podaj_liczbe_oddzialow()
    {
        return OddzialPrzedszkolny.liczba_oddzialow;
    }

    static public int podaj_liczbe_dzieci()
    {
        return Dziecko.liczba_dzieci;
    }

    public void wypisz_administracje()
    {
        for(int i=0; i<prz.length; i++)
        {
            prz[i].wypisz_przedszkole();
        }
    }
}