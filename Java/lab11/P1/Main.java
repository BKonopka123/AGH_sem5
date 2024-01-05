import java.time.LocalDate;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> array_int = new ArrayList<Integer>();
        array_int.add(5);
        array_int.add(3);
        array_int.add(58);
        array_int.add(14);
        PairSelector<Integer> ps_int = new PairSelector<Integer>(array_int);
        System.out.println(ps_int.getPair());

        ArrayList<LocalDateWrapper> array_date = new ArrayList<LocalDateWrapper>();
        array_date.add(new LocalDateWrapper(LocalDate.of(2019, 12, 1)));
        array_date.add(new LocalDateWrapper(LocalDate.of(2023, 11, 3)));
        array_date.add(new LocalDateWrapper(LocalDate.of(1918, 8, 16)));
        array_date.add(new LocalDateWrapper(LocalDate.of(2010, 3, 24)));
        PairSelector<LocalDateWrapper> ps_date = new PairSelector<LocalDateWrapper>(array_date);
        System.out.println(ps_date.getPair());

        ArrayList<MyType> array_mytype = new ArrayList<MyType>();
        array_mytype.add(new MyType(5, 3));
        array_mytype.add(new MyType(5, 18));
        array_mytype.add(new MyType(1, 14));
        array_mytype.add(new MyType(3, 58));
        PairSelector<MyType> ps_mytype = new PairSelector<MyType>(array_mytype);
        System.out.println(ps_mytype.getPair());
    }
}

