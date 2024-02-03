public class X {
    protected static boolean r;
    private String s;
    public X() {
        s="X()";
    }
    public X(int n) {
        s=new Integer(n).toString();
    }
    public X(boolean q) {
        s="q="+q;
        r=q;
    }
    public void p() { System.out.println(s); }
    public String toString() { return s; }
    public static void main(String [] args)
    {
        System.out.println(new X()); //TAK - X() - dobrze

        // System.out.println(new X(1.9/4)); //NIE - nie ma takiego konstruktora - dobrze

        System.out.println(r); //TAK - false  - dobrze
        
        X a = new X(true);
        System.out.println(r); //TAK - true - dobrze

        // X(1==2).p(); //TAK - q=false - xle - Nie bo nie ma new

        new X() { 
            public void p() {
                System.out.println("s");
            }
        }.p(); //TAK - s - dobrze

        // new X() {
        //     public void p(){
        //         System.out.println(this.s);
        //     }
        // }.p(); //NIE - bo s prywatne - dobrze

    }
}