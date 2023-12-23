public class Main {
    public static void main(String[] args) {
        RWfile rw = new RWfile();
        rw.read("dane.csv");
        //System.out.print(rw.show());
        rw.count();
        rw.write("wynik.csv");
    }
}
