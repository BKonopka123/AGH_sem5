public class Main {
    public static void main(String[] args) {
        System.out.println("Wykorzystanie konstruktorów (1 pkt) i statycznych metod fabrycznych (1.5 pkt.) oraz toString (0.5 pkt.):");
        Time t1 = new Time();
        System.out.println(t1); // 0:00:00:00
        Time t2 = new Time(-10, 13, 55, 49); // Liczba dni: -10 spoza przedzialu [0, 2147483647)!
        t2 = new Time(0, -13, 55, 49); // Liczba godzin: -13 spoza przedzialu [0, 24)!
        t2 = new Time(0, 24, 55, 49); // Liczba godzin: 24 spoza przedzialu [0, 24)!
        t2 = new Time(0, 13, -55, 49); // Liczba minut: -55 spoza przedzialu [0, 60)!
        t2 = new Time(0, 13, 65, 49); // Liczba minut: 65 spoza przedzialu [0, 60)!
        t2 = new Time(0, 13, 55, -1); // Liczba sekund: -1 spoza przedzialu [0, 60)!
        t2 = new Time(0, 13, 55, 60); // Liczba sekund: 60 spoza przedzialu [0, 60)!
        t2 = new Time(3, 13, 55, 49);
        System.out.println(t2); // 3:13:55:49
        Time t3 = Time.timeOf("2:01:51:34");
        System.out.println(t3); // 2:01:51:34
        t1 = Time.copyOf(t3);
        System.out.println(t1); // 2:01:51:34
        System.out.println();

        System.out.println("Stałe pola typu int (1 pkt za wszystkie pola klasy):");
        System.out.println("Time.SECONDS_PER_MINUTE = " + Time.SECONDS_PER_MINUTE); // Time.SECONDS_PER_MINUTE = 60
        System.out.println("Time.MINUTES_PER_HOUR = " + Time.MINUTES_PER_HOUR); // Time.MINUTES_PER_HOUR = 60
        System.out.println("Time.HOURS_PER_DAY = " + Time.HOURS_PER_DAY); // Time.HOURS_PER_DAY = 24
        System.out.println();

        System.out.println("Stałe pola typu Time:");
        System.out.println("Time.ZERO = " + Time.ZERO); // Time.ZERO = 0:00:00:00
        System.out.println("Time.ONE_SECOND = " + Time.ONE_SECOND); // Time.ONE_SECOND = 0:00:00:01
        System.out.println("Time.ONE_MINUTE = " + Time.ONE_MINUTE); // Time.ONE_MINUTE = 0:00:01:00
        System.out.println("Time.ONE_HOUR = " + Time.ONE_HOUR); // Time.ONE_HOUR = 0:01:00:00
        System.out.println("Time.ONE_DAY = " + Time.ONE_DAY); // Time.ONE_DAY = 1:00:00:00
        System.out.println("Time.ONE_YEAR = " + Time.ONE_YEAR); // Time.ONE_YEAR = 365:00:00:00
        System.out.println();

        System.out.println("Wykorzystanie metod typu set (1 pkt):");
        t3.setDays(1);
        t3.setHours(23);
        t3.setMinutes(59);
        t3.setSeconds(58);
        System.out.println(t3); // 1:23:59:58
        t3.setDays(-2); // Liczba dni: -2 spoza przedzialu [0, 2147483647)!
        t3.setHours(-1); // Liczba godzin: -1 spoza przedzialu [0, 24)!
        t3.setHours(24); // Liczba godzin: 24 spoza przedzialu [0, 24)!
        t3.setMinutes(-15); // Liczba minut: -15 spoza przedzialu [0, 60)!
        t3.setMinutes(60); // Liczba minut: 60 spoza przedzialu [0, 60)!
        t3.setSeconds(-152); // Liczba sekund: -152 spoza przedzialu [0, 60)!
        t3.setSeconds(152); // Liczba sekund: 152 spoza przedzialu [0, 60)!
        System.out.println(t3); // 1:23:59:58
        System.out.println();

        System.out.println("Wykorzystanie pozostalych metod-mutatorow (1.5 pkt.):");
        t3.addDays(183);
        System.out.println(t3); // 184:23:59:58
        t3.addHours(24);
        System.out.println(t3); // 185:23:59:58
        t3.addMinutes(3022);
        System.out.println(t3); // 188:02:21:58
        t3.addSeconds(79706);
        System.out.println(t3); // 189:00:30:24
        System.out.println();

        System.out.println("Wykorzystanie metod typu get (0.5 pkt.):");
        System.out.println("t3.getDays() = " + t3.getDays()); // t3.getDays() = 189
        System.out.println("t3.getHours() = " + t3.getHours()); // t3.getHours() = 0
        System.out.println("t3.getMinutes() = " + t3.getMinutes()); // t3.getMinutes() = 30
        System.out.println("t3.getSeconds() = " + t3.getSeconds()); // t3.getSeconds() = 24
        System.out.println();

        System.out.println("Wykorzystanie pozostalych metod-akcesorow (2 pkt.):");
        System.out.println("t1 + t2 = " + Time.plusTime(t1, t2)); // t1 + t2 = 5:15:47:23
        System.out.println("t1 * 2 = " + Time.times(t1, 2)); // t1 * 2 = 4:03:43:08
        System.out.println("t1 * 60 = " + Time.times(t1, 60)); // t1 * 60 = 124:15:34:00
        System.out.println();

        System.out.println("Metoda equals (1 pkt):");
        System.out.println("t1.equals(t1) = " + t1.equals(t1)); // t1.equals(t1) = true
        System.out.println("t1.equals(null) = " + t1.equals(null)); // t1.equals(null) = false
        System.out.println("t1.equals(\"błędny obiekt\") = " + t1.equals("błędny obiekt")); // t1.equals("błędny obiekt") = false
        System.out.println("t1.equals(t2) = " + t1.equals(t2)); // t1.equals(t2) = false
        t3 = new Time(2, 01, 51, 34);
        System.out.println("t1.equals(t3) = " + t1.equals(t3)); // t1.equals(t3) = true
        t3.addDays(1);
        System.out.println("t1.equals(t3) = " + t1.equals(t3)); // t1.equals(t3) = false
        System.out.println();
    }
}