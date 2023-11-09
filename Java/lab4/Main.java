import java.util.Scanner;
import java.lang.StringBuilder;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        NumberCounter obj = new NumberCounter();

        while(true){
            System.out.print("Podaj ciag znakow (quit aby zakonczyc): ");
            String tmp_string = scanner.nextLine();
            if(obj.check_stop(tmp_string)){
                System.out.println("Posortowany ciag znakow: " + obj.stop());
                break;
            }
            obj.add_to_string(tmp_string);
            System.out.println("Zliczona dotychczas ilosc cyfr: " + obj.count_numbers(tmp_string));
            System.out.println("Aktualny StringBuffer: " + obj.show_numbers());
        }

        System.out.println("Histogram:\n" + obj.histogram());
    }
}