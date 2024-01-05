import java.util.ArrayList;

public class PairSelector<T extends Comparable<T>> {
    ArrayList<T> arr;

    public PairSelector(ArrayList<T> arr) {
        this.arr = arr;
    }

    public Pair<T> getPair() {
        T min = arr.get(0);
        for (T t : arr) {
            if (t.compareTo(min) < 0){
                min = t;
            }
        }
        T max = arr.get(0); 
        for (T t : arr) {
            if (t.compareTo(max) > 0){
                max = t;
            }
        }
        return new Pair<T>(min, max);
    }
}
