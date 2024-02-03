enum Value { ZERO, ONE }
class Data {}
class Bit extends Data {
    String s;
    Bit(String s) { this.s = s; }
}
class Main {
    public static void main(String[] args) {
        //Bit a = new Bit();
        Bit b = new Bit("ZERO");
        Bit c = new Bit(Value.ZERO + "1");
        Data d = new Bit("ONE");
        //Data e = new Bit(ONE);
        //Data f = new Bit(Value.ONE);
    }
}