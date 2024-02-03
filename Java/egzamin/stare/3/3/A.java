class B {
	public B(int n) {
		System.out.print(n);
	}
}
public class A extends B {
    B b = new B(3);
    public A() {
            System.out.print(".14");
    }
    public static void main(String[] args){
        A a = new A();
    }
}