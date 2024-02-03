interface I {
	default public boolean f() {
		return this.getClass().isInterface();
	}
}
public class A implements I {
	public A() {
		System.out.print(f());
	}
    public static void main(String[] args){
        A a = new A();
    }
}