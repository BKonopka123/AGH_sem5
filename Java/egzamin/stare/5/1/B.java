class Rzecz {
    public String nazwa = "Rzecz";
}
class Ksiazka extends Rzecz {
    { nazwa = "Ksiazka"; }
}
interface Schowek <E extends Rzecz> {
    void wstaw(E x);
    E wyjmij();
}
class Pudelko <E extends Rzecz> implements Schowek<E> {
    private E zawartosc;
    public void wstaw(E x) {zawartosc = x;}
    public E wyjmij() {
        E x = zawartosc;
        zawartosc = null;
        return x;
    }
}
public class B {
    static String f() {
        // return new Ksiazka(); //A NIE - Ksiazka cannot be converted to String

        // Rzecz r = new Ksiazka();
        // return "" + r; //B TAK - jakis kod metody

        // Rzecz r = new Ksiazka();
        // return r.nazwa; //C TAK - Ksiazka

        // Rzecz r = new Rzecz();
        // Ksiazka k = new Ksiazka();
        // Object tmp = r;
        // r=k;
        // k=tmp;
        // return r.nazwa; //D NIE - object cannot be converted to Ksiazka

        // class I extends Ksiazka {}
        // I x = new I();
        // return ((Rzecz)x).nazwa; //E TAK Ksiazka

        // Rzecz r = new Ksiazka();
        // Ksiazka k = new Rzecz();
        // return r.nazwa + k.nazwa; //F NIE bo 2 linijka nie zadziala

        // Ksiazka k = new Ksiazka();
        // Pudelko<Rzecz> p = new Pudelko<Rzecz>();
        // p.wstaw(k);
        // k.nazwa = "Pamietnik";
        // return p.wyjmij().nazwa; //G TAK - Pamietnik

        // Ksiazka k = new Ksiazka();
        // Pudelko<Rzecz> p = new Pudelko<Rzecz>();
        // k.nazwa = "Pamietnik";
        // p.wstaw(k);
        // return p.wyjmij().nazwa; //H TAK - Pamietnik

        // Object obj = new Rzecz();
        // Pudelko<Rzecz> p = new Pudelko<>();
        // return p.wyjmij().nazwa; //I NIE - Exception in thread "main" java.lang.NullPointerException

        // Object obj = new Rzecz();
        // Pudelko<Rzecz> p = new Pudelko<>();
        // p.wstaw(obj);
        // return p.wyjmij().nazwa; //J - NIE - Object cannot be converted to rzecz

        // Schowek<Rzecz> s = new Pudelko<Rzecz>();
        // s.wstaw(new Ksiazka());
        // return s.wyjmij().nazwa; //K TAK - Ksiazka

        // Schowek<Rzecz> s = new Pudelko<Ksiazka>();
        // s.wstaw(new Ksiazka());
        // return s.wyjmij().nazwa; //L NIE - nieprawidlowe typy

        // Schowek<Ksiazka> s = new Pudelko<Rzecz>();
        // s.wstaw(new Ksiazka());
        // return s.wyjmij().nazwa; //M NIE - nieprawidlowe typy

        // var x = new Pudelko<Ksiazka>();
        // x.wstaw(new Ksiazka());
        // return x.wyjmij().nazwa; //N TAK - Ksiazka

        // var x = new Pudelko<Rzecz>();
        // x.wstaw(new Ksiazka());
        // x.wyjmij().nazwa = "Notes";
        // return x.wyjmij().nazwa; //O NIE - null

        // Schowek<Rzecz> s = new Pudelko<>();
        // s.wstaw("Zeszyt");
        // return s.toString(); //P NIE - String to nie Rzecz

        // Schowek<Ksiazka> s1 = new Pudelko<Ksiazka>();
        // Schowek<Rzecz> s2 = new Pudelko<Rzecz>();
        // s1.wstaw(new Ksiazka());
        // s2.wstaw(new Ksiazka());
        // var x1 = (Rzecz)s1.wyjmij();
        // var x2 = s2.wyjmij();
        // return x1.nazwa + x2.nazwa; //R TAK - KsiazkaKsiazka

        // static Pudelko<Ksiazka> p = new Pudelko<Ksiazka>();
        // return p.toString(); //S NIE

        // Ksiazka k = new Ksiazka();
        // Rzecz r  = k;
        // Object obj = r;
        // return ((Rzecz)obj).nazwa; //T TAK - Ksiazka

        // class Napis implements Schowek<Ksiazka> {}
        // Napis n = new Napis();
        // n.wstaw(new Ksiazka());
        // return n.wyjmij().nazwa; //U NIE - nie implementuje metod z Schowek

        // class Napis extends Pudelko<Ksiazka> {}
        // Napis n = new Napis();
        // n.wstaw(new Ksiazka());
        // return n.wyjmij().nazwa; //W TAK - Ksiazka
    }
    public static void main(String[] args){
        System.out.println(f());
    }
}