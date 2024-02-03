public class A {
	double n = 2.5;
	{ n = 5.0; }
	public A() {
		n+ = 0.5;
		System.out.print(n+new Double(n));
	}
	public static void main(String[] args){
		A a = new A();
	}
}