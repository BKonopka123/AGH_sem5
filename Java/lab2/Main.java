public class Main
{
    public static void main(String[] args)
    {
        Dziecko d_1 = new Dziecko("Jan", "Kowalski");
        Dziecko d_2 = new Dziecko("Jan", "Nowak");
        Dziecko d_3 = new Dziecko("Adam", "Kowalski");
        Dziecko d_4 = new Dziecko("Jan", "Burak");
        Dziecko d_5 = new Dziecko("Adam", "Maj");
        Dziecko d_6 = new Dziecko("Andrzej", "Kon");
        Dziecko d_7 = new Dziecko("Adam", "Kleszcz");
        Dziecko d_8 = new Dziecko("Maciej", "Zlodziej");
        Dziecko d_9 = new Dziecko("Adam", "Szyszka");


        Dziecko[] tab_d_1  = new Dziecko[3];
        Dziecko[] tab_d_2  = new Dziecko[2];
        Dziecko[] tab_d_3  = new Dziecko[1];
        Dziecko[] tab_d_4  = new Dziecko[3];
        tab_d_1[0]=d_1;
        tab_d_1[1]=d_2;
        tab_d_1[2]=d_3;
        tab_d_2[0]=d_4;
        tab_d_2[1]=d_5;
        tab_d_3[0]=d_6;
        tab_d_4[0]=d_7;
        tab_d_4[1]=d_8;
        tab_d_4[2]=d_9;

        OddzialPrzedszkolny o_1 = new OddzialPrzedszkolny(tab_d_1, "Oddzial 1", 10);
        OddzialPrzedszkolny o_2 = new OddzialPrzedszkolny(tab_d_2, "Oddzial 2", 10);
        OddzialPrzedszkolny o_3 = new OddzialPrzedszkolny(tab_d_3, "Oddzial 3", 10);
        OddzialPrzedszkolny o_4 = new OddzialPrzedszkolny(tab_d_4, "Oddzial 4", 10);

        OddzialPrzedszkolny[] tab_o_1 = new OddzialPrzedszkolny[2];
        OddzialPrzedszkolny[] tab_o_2 = new OddzialPrzedszkolny[2];
        tab_o_1[0] = o_1;
        tab_o_1[1] = o_2;
        tab_o_2[0] = o_3;
        tab_o_2[1] = o_4;

        Przedszkole p_1 = new Przedszkole(tab_o_1, "Przedszkole 1", 5);
        Przedszkole p_2 = new Przedszkole(tab_o_2, "Przedszkole 2", 5);

        Przedszkole[] tab_p_1 = new Przedszkole[2];
        tab_p_1[0] = p_1; 
        tab_p_1[1] = p_2; 

        Administracja a_1 =new Administracja(tab_p_1, 5);

        a_1.wypisz_administracje();
        System.out.println("Liczba oddzialow: " + Administracja.podaj_liczbe_oddzialow());
        System.out.println("Liczba Dzieci: " + Administracja.podaj_liczbe_dzieci());
    }
}