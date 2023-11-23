public class Trojkat extends Figura{
    protected double a;
    protected double b;
    protected double c;

    public Trojkat(int a, int b, int c){
        this.a = a;
        this.b = b;
        this.c = c;
    }

    public double getPole(){
        double p = (a + b + c) / 2;
        return Math.sqrt(p * (p - a) * (p - b) * (p - c));
    }

    public double getObwod(){
        return a + b + c;
    }

    public String getRodzaj(){
        return "Trojkat";
    }
    
    public String toString(){
        return this.getRodzaj() + ", pole: " + this.getPole() + ", obwod: " + this.getObwod();
    }
}
