public class Main{
    public static void main(String[] args){
        abstract class A{
            int n= 50;
            int getN(){return n/10;}
        }
        A p = new A() {
            int getN(){return n;}
        };
        switch(p.getN()){
            default: System.out.println("xx");
            case 5: System.out.println("5"); 
            case 50: System.out.println("50");
        }
    }
}