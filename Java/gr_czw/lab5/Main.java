import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<VHS> vhs_list = new ArrayList<>();
        Read.read_file(vhs_list, "VHS.csv");
        Read.show_list(vhs_list);
    }
}