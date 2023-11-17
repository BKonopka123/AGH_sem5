import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class Biblioteka{
    String nazwa;
    ArrayList<Ksiazka> ksiazki = new ArrayList<Ksiazka>();

    public Biblioteka(String nazwa){
        this.nazwa = nazwa;
    }

    public void wypozycz(Ksiazka ksiazka, Czytelnik czytelnik){
        czytelnik.wypozyczone_ksiazki.add(ksiazka);
    }

    public void laduj_ksiazke(String sciezka){
        try {
            BufferedReader f = new BufferedReader(new FileReader(sciezka));
            String s;
            int i=1;
            while((s = f.readLine()) != null){
                StringTokenizer st = new StringTokenizer(s, ";");
                String tytul = st.nextToken();
                String autor = st.nextToken();
                Ksiazka tmp = new Ksiazka(i, tytul, autor);
                this.ksiazki.add(tmp);
                i++;
            }
            f.close();
        }
        catch(Throwable e){
            System.out.println("Blad odczytu pliku!");
        }
    }

    public void wypisz_ksiazki(){
        for(int i=0; i<this.ksiazki.size(); i++){
            System.out.println(this.ksiazki.get(i).tytul() + " " + this.ksiazki.get(i).autor());
        }
    }
}