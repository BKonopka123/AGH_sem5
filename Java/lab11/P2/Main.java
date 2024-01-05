public class Main {
    public static void main(String[] args) {
        java.lang.reflect.Method[] methods_record = Record.class.getDeclaredMethods();
        java.lang.reflect.Constructor<?>[] constructors_record = Record.class.getDeclaredConstructors();
        java.lang.reflect.Method[] methods_rwfile = RWfile.class.getDeclaredMethods();
        java.lang.reflect.Constructor<?>[] constructors_rwfile = RWfile.class.getDeclaredConstructors();
        for (java.lang.reflect.Method method : methods_record) {
            System.out.println(method);
        }
        for (java.lang.reflect.Constructor<?> constructor : constructors_record) {
            System.out.println(constructor);
        }
        for (java.lang.reflect.Method method : methods_rwfile) {
            System.out.println(method);
        }
        for (java.lang.reflect.Constructor<?> constructor : constructors_rwfile) {
            System.out.println(constructor);
        }
    }
}

