import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

public class PathReader {
    Path in_path;
    Path out_path;

    public void readPath(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Wpisz sciezke do folderu wejsciowego:");
        String in_pathString = scanner.next();
        System.out.println("Wpisz sciezke do folderu wyjsciowego:");
        String out_pathString = scanner.next();
        scanner.close();
        this.in_path = Paths.get(in_pathString);
        this.out_path = Paths.get(out_pathString);
    }

    public Path getIn(){
        return this.in_path;
    }

    public Path getOut(){
        return this.out_path;
    }
}
