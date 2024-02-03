abstract class Dane {
    abstract void pisz();
    Dane() {
        System.out.println("Dane()␣BEGIN");
        pisz(); // !!!
        System.out.println("Dane()␣END");
    }
}
