import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

public class ReadFile{

    private Set<String> words_with = new HashSet<String>();
    private Set<String> words_without = new HashSet<String>();

    public void read_save(){
        try{
            java.io.File file = new java.io.File("Pan_Tadeusz.txt");
            java.util.Scanner input = new java.util.Scanner(file);
            while(input.hasNext()){
                String line = input.nextLine();
                StringTokenizer tokenizer = new StringTokenizer(line);
                while (tokenizer.hasMoreTokens()) {
                    String word = tokenizer.nextToken();
                    words_with.add(word);
                    word = word.toLowerCase();
                    Pattern p = Pattern.compile("[^a-z]", Pattern.CASE_INSENSITIVE);
                    word = word.replaceAll(p.toString(), "");
                    words_without.add(word);
                }
            }
            input.close();
        }catch(java.io.FileNotFoundException e){
            System.out.println("File not found");
        }
    }

    public int count_with(){
        return words_with.size();
    }

    public int count_without(){
        return words_without.size();
    }

    public void print_without(){
        System.out.println(words_without);
    }
}