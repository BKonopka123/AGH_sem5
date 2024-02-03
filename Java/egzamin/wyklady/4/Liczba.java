class Liczba extends Dane {
    int k = 1;
    Liczba(int i) {
        System.out.println("Liczba(int)␣BEGIN");
        k = i;
        pisz();
        System.out.println("Liczba(int)␣END");
    }
    void pisz() { System.out.println("k=" + k); }
}