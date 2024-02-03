class A {}
public class Main {
    public static void main(String[] args) {
        A x = new A();
        var c = x.getClass().getName(); 
        System.out.println(x + " " + c);
    }
}