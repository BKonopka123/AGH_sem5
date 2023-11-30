public class Adress implements AdressFormatter {
    
    String ulica;
    String miasto;
    int nr_domu;
    int nr_lokalu;
    String kod;

    public Adress(String ulica, String miasto, int nr_domu, int nr_lokalu, String kod){
        this.ulica = new String(ulica);
        this.miasto = new String (miasto);
        this.nr_domu = nr_domu;
        this.nr_lokalu = nr_lokalu;
        this.kod = new String(kod);
    }

    public String getFormattedAdress(){
        return "Zamieszkaly: ul. " + ulica + " " + nr_domu + "/" + nr_lokalu + " " + miasto + " " + kod;
    }
}
