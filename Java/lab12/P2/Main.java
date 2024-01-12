public class Main {
    public static void main(String[] args) {
        ReadFile rf = new ReadFile();
        rf.read_save();
        System.out.println("Unikalne slowa ze specjalnymi znakami: " + rf.count_with());
        System.out.println("Unikalne slowa bez specjalnych znakow: " + rf.count_without());
        //rf.print_without();
    }
}
