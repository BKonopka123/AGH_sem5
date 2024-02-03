public class A {
	public A() {
		try {
			throw new ArithmeticException();
		}
		catch (Exception e){
			System.out.print("E");
		}
		catch (ArithmeticException e){
			System.out.print("A");
		}
	}
    public static void main(String[] args){
        A a = new A();
    }
}