public class Prostokat extends Rownoleglobok {
    public String rodzaj = new String("Prostokat");
    public Prostokat(int a, int b) {
        super(a, b, b);
    }

    public String getRodzaj(){
        return "Prostokat";
    }

    public String toString(){
        return this.getRodzaj() + ", pole: " + super.getPole() + ", obwod: " + super.getObwod();
    }
}
