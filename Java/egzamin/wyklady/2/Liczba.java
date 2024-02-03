class Liczba {
    double x = Math.sqrt(2);
    String s = new String("sqrt(2)=");
    Liczba() {
        System.out.println(s+x);
        x = Math.sqrt(4);
        s = new String("sqrt(4)=");
    }
    public String toString() {
        return s+x;
    }
    { x = 3; s = "sqrt(9)="; }
}
