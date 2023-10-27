import java.time.LocalDate;
import java.time.Month;
import java.time.DayOfWeek;
import java.time.temporal.ChronoUnit;
import java.time.format.TextStyle;
import java.util.Locale;

public class Main {
    

    
    public static void main(String[] args) {

        LocalDate data = LocalDate.now();

        if(args.length == 2){
            data = data.withMonth(Integer.parseInt(args[1]));
        }
        if(args.length == 4){
            data = data.withMonth(Integer.parseInt(args[1]));
            data = data.withYear(Integer.parseInt(args[3]));
        }

        System.out.println("Dzisiaj jest dzień: " + LocalDate.now());
        System.out.println("Do sylwestra pozostało: " + ChronoUnit.DAYS.between(java.time.LocalDate.now(), LocalDate.of(2023, 12, 31)) + " dni");
        System.out.println("\t" + data.getMonth().getDisplayName(TextStyle.SHORT, new Locale("pl")) +  " " + data.getYear());
        for(DayOfWeek day = DayOfWeek.MONDAY; ; day = day.plus(1)){
            System.out.print(day.getDisplayName(TextStyle.NARROW, new Locale("pl")) + "  ");
            if(day == DayOfWeek.SUNDAY){
                System.out.println();
                break;
            }
        }
        for(DayOfWeek day = DayOfWeek.MONDAY; day != data.withDayOfMonth(1).getDayOfWeek(); day = day.plus(1)){
            System.out.print("   ");
        }
        for(LocalDate day = data.withDayOfMonth(1); ;day = day.plusDays(1))
        {
            if(day.getMonth() != data.getMonth())
                break;
            if(day.getDayOfMonth() < 10){
                if(data == LocalDate.now() && day.getDayOfMonth() == data.getDayOfMonth())
                    System.out.print(day.getDayOfMonth() + "* ");   
                else
                    System.out.print(day.getDayOfMonth() + "  ");
            }
            else{
                if(data.getMonth() == LocalDate.now().getMonth() && data.getYear() == LocalDate.now().getYear() && day.getDayOfMonth() == data.getDayOfMonth())
                    System.out.print(day.getDayOfMonth() + "*");  
                else
                    System.out.print(day.getDayOfMonth() + " ");
            }
            
            if(day.getDayOfWeek() == DayOfWeek.SUNDAY)
                System.out.println();
        }
        System.out.println();
    }
}
