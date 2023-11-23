public class Kolo extends Figura{
    protected double r;

    public Kolo(int r){
        this.r = r;
    }

    public double getPole(){
        return Math.PI * r * r;
    }

    public double getObwod(){
        return 2 * Math.PI * r;
    }

    public String getRodzaj(){
        return "Kolo";
    }
    
    public String toString(){
        return this.getRodzaj() + ", pole: " + this.getPole() + ", obwod: " + this.getObwod();
    }
}
