class A {
    StringBuffer name;
    int id;
    A(StringBuffer s) {
        name = s;
    }
    void info(){
        System.out.println(name + " " + id);
    }
}
public class Main {
    public static void main(String[] args) {
        StringBuffer s = new StringBuffer("X");
        int id = 123;
        A a = new A(s);
        a.id = id;
        s = new StringBuffer("Y");
        id = 987;
        A b = new A(s);
        b.id = id;
        s.append("Z");
        a.info();
        b.info();
    }
}