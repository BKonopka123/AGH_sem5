public class A {
    int t[3];
	{
		t[0] = 1;
		t[1] = 1;
	}
	public A() {
		System.out.print(java.util.Arrays.toString(t));
	}
    public static void main(String[] args){
        A a = new A();
    }
}