class B {
	public B() {
		System.out.print("B");
	}
	class C {
		public C() {
		System.out.print("C");
		}
	}
}
public class A extends B.C {
	public A(B b) {
		b.super();
		System.out.print("A");
	}
    public static void main(String[] args){
        A a = new A(new B());
    }
}