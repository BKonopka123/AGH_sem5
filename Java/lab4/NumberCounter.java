import java.util.Scanner;
import java.lang.StringBuilder;
import java.util.Arrays;

public class NumberCounter {
    
    StringBuilder numbers;
    int counted_numbers;

    public NumberCounter(){
        numbers = new StringBuilder();
        counted_numbers = 0;
    }

    public boolean check_stop(String tmp){
        return tmp.equalsIgnoreCase("quit");
    }

    public String stop(){
        char array_to_sort[] = numbers.toString().toCharArray();
        Arrays.sort(array_to_sort);
        return new String(array_to_sort);
    }

    public void add_to_string(String tmp){
        for(int i=0; i<tmp.length(); i++)
            if(Character.isDigit(tmp.charAt(i)))
                numbers.append(tmp.charAt(i));
    }

    public int count_numbers(String tmp){
         for(int i=0; i<tmp.length(); i++)
            if(Character.isDigit(tmp.charAt(i)))
                counted_numbers += 1;
        return counted_numbers;
    }

    public String show_numbers(){
        return numbers.toString();
    }

    public String histogram(){
        StringBuilder hist = new StringBuilder();
        char array_to_sort[] = numbers.toString().toCharArray();
        Arrays.sort(array_to_sort);
        for(int i=0; i<array_to_sort.length; i++){
            hist.append(array_to_sort[i]);
            if(i != array_to_sort.length-1 && array_to_sort[i] != array_to_sort[i+1]){
                hist.append("\n");
                if(i != array_to_sort.length-1 && Character.getNumericValue(array_to_sort[i]) + 1 < Character.getNumericValue(array_to_sort[i+1]))
                    for(int j=0; j < Character.getNumericValue(array_to_sort[i+1]) - Character.getNumericValue(array_to_sort[i]) - 1; j++)
                        hist.append("-\n");
            }
        }
        if(array_to_sort[array_to_sort.length -1] != 9){
            hist.append("\n");
            for(int i=0; i < 9 - Character.getNumericValue(array_to_sort[array_to_sort.length - 1]); i++)
                hist.append("-\n");
        }
        return hist.toString();
    }
}