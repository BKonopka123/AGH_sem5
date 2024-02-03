public class Main {
    public void calc() throws Throwable {
        try { 
            throw new NumberFormatException();
        } catch(ClassCastException | ArithmeticException e) {
            System.out.println("Math");
        } catch(IllegalArgumentException | Exception f){
            System.out.println("Unknown");
        }
    }
    public static void main(String[] args) throws Throwable {
        try {
            new Main().calc();
        } finally {
            System.out.println("Done!");
        }
    }
}