public class Przedszkole
{
    OddzialPrzedszkolny[] op = new OddzialPrzedszkolny[5];
    String nazwa;
    public Przedszkole(OddzialPrzedszkolny[] o, String n, int max)
    {
        if(o.length > max)
            System.exit(0);
        nazwa = n;
        op = o;
    }
    public void wypisz_przedszkole()
    {
        System.out.println(nazwa);
        for(int i=0; i<op.length; i++)
        {
            op[i].wypisz_oddzial();
        }
    }
}