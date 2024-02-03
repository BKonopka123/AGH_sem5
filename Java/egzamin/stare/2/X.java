public class X {
    public double u;
    private double r;

    public X(double x, double y) {
        u=x*y; r=x/y;
    }

    public X(float x) {
        u=x;
    }

    public static X f() {
        return new X(1./2,3/2);
    }

    public void p() {
        System.out.println ("u= "+u+ "r="+r);
    }

    public static void main(String [] args) {
        X a=new X(3/2);
        a.p(); //TAK - u=1.5 r=0.0  - zle - TAK u=1.0 r=0.0

        // X b=new X(3.14);
        // a.p(); //TAK - u=3.14 r=0.0 - zle - NIE - bo double do float konwersja

        byte x=1;
        X c = new X(x,2);
        a.p(); //NIE - brak takiego konstruktora - zle - TAK u=1.0 r=0.0

        // X.r=0.5;
        // X.p(); //TAK - u=3.14 r=0.5 - zle - NIE bo metoda static wiec nie ma dostepu do niestatic zmiennych

        // this.u=0.5;
        // this.p(); //TAK - u=0.5 r=0.5 - zle - NIE bo metoda static wiec nie ma dostepu do niestatic zmiennych

        // X d=f().p(); //Nie - bo jest to X - zle/2 - konwersja void do X

        f().p(); //TAK - u=0.75 r=0.333 - zle/2 - u= 0.5 r=0.5
    }
}