class Test { }
interface MojInterfejs { }
class Fruit {
String colour;
Fruit(String c0) { colour = c0; }
public boolean equals(Object obj) {
System.out.print("[@]");
if (this == obj) return true;
if (obj == null || getClass() != obj.getClass())
return false;
Fruit f = (Fruit) obj;
return (f.colour == colour);
}

}
class Apple extends Fruit {
Apple(String c) { super(c); }
}


public class Main {
public static void main(String[] args) {
// Class c1 = (new Test()).getClass();
// Class c2 = Test.class;
// System.out.println("1)␣" + c1);
// System.out.println("2)␣" + c2);
// System.out.println(c1.equals(c2));
// System.out.println(int.class);
// System.out.println(Integer.TYPE);
// System.out.println((new int[3]).getClass());
// System.out.println((new Object[3]).getClass());
// System.out.println((new Main[3]).getClass());
// System.out.println(MojInterfejs.class);
// String[] t = {"Test", "String", "java.lang.String"};
// for(int i = 0; i < t.length; ++i) {
// try {
// Class c = Class.forName(t[i]);
// System.out.println(c);
// } catch (ClassNotFoundException ex) {
// System.out.println("Brak␣klasy␣" + t[i]);
// }
// }
Fruit f1 = new Fruit("red");
Fruit f2 = new Fruit("red");
Apple a1 = new Apple("red");
Apple a2 = new Apple("red");
Object of1 = f1; Object oa1 = a1;
Object of2 = f2; Object oa2 = a2;
System.out.println(f1.equals(f2));
System.out.println(a1.equals(a2));
System.out.println(of1.equals(of2));
System.out.println(oa1.equals(oa2));
System.out.println(f1.equals(a1));
System.out.println(a1.equals(f1));
System.out.println(of1.equals(oa1));
System.out.println(oa1.equals(of1));
}
}