public class MyType implements Comparable<MyType> {
    private int value_full;
    private int value_half;

    public MyType(int value_full, int value_half) {
        this.value_full = value_full;
        this.value_half = value_half;
    }

    public int getValueFull() {
        return value_full;
    }

    public int getValueHalf() {
        return value_half;
    }

    @Override
    public int compareTo(MyType other) {
        if (value_full == other.value_full) {
            return value_half - other.getValueHalf();
        }
        return value_full - other.getValueFull();
    }
    
    public String toString() {
        return value_full + "." + value_half;
    }
}
