enum E {
	W("wtorek"), S("sroda");
	String day;
	E(String day) {
		this.day = day;
	}
}
public class A {
	public A() {
		System.out.print(E.W);
	}
    public static void main(String[] args){
        A a = new A();
    }
}