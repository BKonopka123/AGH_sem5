import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.UUID;
import java.lang.Integer;
import java.time.LocalDate;

/**
 * Class which allows reading data from file, and printing list of VHS
 */
public class Read {

    /**
     * Method allowing to read data from file, and putting all data to vhs list
     * @param vhs_list list of VHS where data will be stored
     * @param path path to file which will be read
     */
    public static void read_file(ArrayList<VHS> vhs_list, String path){
        try{
            BufferedReader f = new BufferedReader(new FileReader(path));
            String s;
            s = f.readLine();

            while((s = f.readLine()) != null){
                StringTokenizer st = new StringTokenizer(s, ",");
                UUID id = UUID.fromString(st.nextToken());
                String title = st.nextToken();
                int duration = Integer.parseInt(st.nextToken());
                String director = st.nextToken();
                String tmp_1 = st.nextToken();
                String tmp_2 = st.nextToken();
                StringTokenizer st_1 = new StringTokenizer(tmp_1, "-");
                StringTokenizer st_2 = new StringTokenizer(tmp_2, "-");
                int year_1 = Integer.parseInt(st_1.nextToken());
                int month_1 = Integer.parseInt(st_1.nextToken());
                int day_1 = Integer.parseInt(st_1.nextToken());
                int year_2 = Integer.parseInt(st_2.nextToken());
                int month_2 = Integer.parseInt(st_2.nextToken());
                int day_2 = Integer.parseInt(st_2.nextToken());
                LocalDate rental_date = LocalDate.of(year_1, month_1, day_1);
                LocalDate return_date = LocalDate.of(year_2, month_2, day_2);

                boolean flag = false;
                for (VHS vhs : vhs_list) {
                    if(id.equals(vhs.getUuid())){
                        vhs.change_movie(new Movie(duration, title, director), return_date, rental_date);
                        flag = true;
                    }
                }
                if(!flag) {
                    VHS tmp_vhs = new VHS(id, new Movie(duration, title, director), return_date, rental_date);
                    vhs_list.add(tmp_vhs);
                }
            }
        }
        catch(Throwable e) {
            System.out.println("Error!");
        }
    }

    /**
     * Method which allows to print all elements of VHS lis
     * @param vhs_list list which will be printed
     */
    public static void show_list(ArrayList<VHS> vhs_list){
        for (VHS vhs : vhs_list){
            System.out.println(vhs);
        }
    }
}
