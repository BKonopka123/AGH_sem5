import java.util.StringTokenizer;

public class Record {
    String to_parse;
    int nmbr;
    String imie;
    String nazwisko;
    Integer l;
    Integer km;
    String efektywnosc;

    public Record(int nmbr, String to_parse) {
        this.nmbr = nmbr;
        try{
        StringTokenizer st = new StringTokenizer(to_parse, ";");
        if(st.countTokens() != 4){
            throw new Exc_length();
        }
        this.imie = st.nextToken();
        this.nazwisko = st.nextToken();
        this.l = Integer.valueOf(st.nextToken());
        this.km = Integer.valueOf(st.nextToken());
        }
        catch(Exc_length e){
            this. efektywnosc = "Zly format wprowadzonych danych!";
        }
    }

    public String toString() {
        return this.nmbr + " " + this.imie + " " + this.nazwisko + " " + this.l + " " + this.km;
    }

    public void count() {
        try {
            if(efektywnosc == null){
                if(this.l == 0 && this.km != 0){
                    throw new Exc_l();
                }
                else if(this.km == 0 && this.l != 0) {
                    throw new Exc_km();
                }
                else if(this.l == 0 && this.km == 0){
                    throw new ArithmeticException();
                }
                else{
                    this.efektywnosc = (float) this.km / this.l + " km/l";
                }
            }
        }
        catch (Exc_l e) {
            this.efektywnosc = "Blad! Ilosc litrow = 0";
        }
        catch (Exc_km e) {
            this.efektywnosc = "Blad! Ilosc km = 0";
        }
        catch (ArithmeticException e) {
            this.efektywnosc = "Blad! Ilosc km i litrow = 0";
        }
    }

    public String write() {
        return this.nmbr + ";" + this.efektywnosc;
    }
}
