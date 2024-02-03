class Main{
    static interface B{}
    static class A implements B{}
    public static void main(String[] args){
        Object b = null;
        System.out.println(b instanceof Object);
        b = new A();
        System.out.println(b instanceof Main);
        System.out.println(b instanceof B);
        System.out.println(b instanceof A);
    }
}