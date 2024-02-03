public class A {
	final String s = "abc";
	{ s = "def"; }
	public A() {
		System.out.print(s);
	}
    public static void main(String[] args){
        A a = new A();
    }
}