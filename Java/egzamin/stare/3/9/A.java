class B <T extends String> {
	T f(T a) {
		return a+"def";
	}
}
public class A {
	static <V> void f(V a) {
		System.out.print(a);
	}
	public A() {
		f((new B<String>()).f("abc"));
	}
    public static void main(String[] args){
        A a = new A();
    }
}