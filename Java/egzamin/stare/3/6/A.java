public class A {
	final char c;
	private A(char c) {
		this.c = c;
	}
	public A() {
		this('a');
		System.out.print(c);
	}
        public static void main(String[] args){
        A a = new A();
    }
}