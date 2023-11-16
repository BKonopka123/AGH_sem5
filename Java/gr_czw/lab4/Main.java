import java.util.Arrays;
import java.util.Objects;
import java.lang.StringBuilder;

public class Main {
    public static void main(String[] args) {
        Time t1 = new Time();
        System.out.println(Time.ONE_SECOND);
        Time.ONE_SECOND.setDays(999);
        Time.ONE_SECOND.setHours(23);
        Time.ONE_SECOND.setMinutes(59);
        Time.ONE_SECOND.setSeconds(59);
        System.out.println(Time.ONE_SECOND);

        System.out.println();

        BigInt bi1 = new BigInt(100);
        BigInt bi2 = new BigInt(-500);
        BigInt bi3 = new BigInt("-1560");
        BigInt bi4 = new BigInt("6495664");
        System.out.println(bi1);
        System.out.println(bi2);
        System.out.println(bi3);
        System.out.println(bi4);

        System.out.println();

        BigInt bi5 = BigInt.valueOf("0");
        BigInt bi6 = BigInt.valueOf("100");
        System.out.println(bi5);
        System.out.println(bi6);

        System.out.println();

        System.out.println(bi5.getSign());

        System.out.println();

        BigInt bi7 = bi6.negate();
        System.out.println(bi7);

        System.out.println();

        System.out.println(bi7.equals(bi6));
        System.out.println(bi1.equals(bi6));
        System.out.println(bi6.equals(bi6));

        System.out.println();

        System.out.println(bi7.hashCode());
        System.out.println(bi6.hashCode());
        System.out.println(bi6.hashCode());
        System.out.println(bi1.hashCode());
    }
}