public class OddzialPrzedszkolny
{
    Dziecko[] dziec = new Dziecko[10];
    String nazwa;
    static int liczba_oddzialow=0;

    public OddzialPrzedszkolny(Dziecko[] dz, String n, int max)
    {
        if(dz.length > max)
            System.exit(0);
        nazwa = n;
        dziec = dz;
        liczba_oddzialow += 1;
    }

    public void wypisz_oddzial()
    {
        System.out.println(nazwa);
        for(int i=0; i<dziec.length; i++)
        {
            dziec[i].wypisz_dziecko();
        }
    }
}