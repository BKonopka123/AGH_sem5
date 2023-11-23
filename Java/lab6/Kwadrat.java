public class Kwadrat extends Prostokat  {
    public Kwadrat(int a) {
        super(a, a);
    }

    public String getRodzaj(){
        return "Kwadrat";
    }

    public String toString(){
        return this.getRodzaj() + ", pole: " + super.getPole() + ", obwod: " + super.getObwod();
    }
}
