interface I {
	String f();
	String f(int i);
}
public class A{
	I i = this;
	public String f(int n) {
		return f();
	}
	public String f() {
		return "abc";
	}
	public A() {
		System.out.print(i.f());
	}
    public static void main(String[] args){
        A a = new A();
    }
}