class A{
    class B{
        class C{

        }
    }
    public void f(){
        var a = new A().new B().new C();
        // B.C b = B.new C();
        // var c = new C();
        var d = new B().new C();
        A.B.C e = new A().new B().new C();
        // C f = new A().new B().new C();
    }
}

public class Main{
    public static void main(String[] args){
        new A().f();
    }
}