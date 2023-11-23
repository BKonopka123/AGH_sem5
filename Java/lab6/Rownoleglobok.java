public class Rownoleglobok extends Figura{
    protected double a;
    protected double b;
    protected double h;

    public Rownoleglobok(int a, int b, int h){
        this.a = a;
        this.b = b;
        this.h = h;
    }
    
    public double getPole(){
        return a * h;
    }

    public double getObwod(){
        return 2 * a + 2 * b;
    }

    public String getRodzaj(){
        return "Rownoleglobok";
    }

    public String toString(){
        return this.getRodzaj() + ", pole: " + this.getPole() + ", obwod: " + this.getObwod();
    }
}
