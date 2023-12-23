import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.lang.StringBuilder;

public class RWfile {
    
    ArrayList<Record> data_arr = new ArrayList<Record>();

    public RWfile(){}
    
    public void read(String filename){
        try {
            BufferedReader f = new BufferedReader(new FileReader(filename));
            String s;
            int i=1;
            f.readLine();
            while((s = f.readLine()) != null){
                Record tmp = new Record(i, s);
                this.data_arr.add(tmp);
                i++;
            }
            f.close();
        }
        catch(Throwable e){
            System.out.println("Blad odczytu pliku!");
        }
    }

    public String show(){
        StringBuilder s = new StringBuilder();
        for(Record r : this.data_arr){
            s.append(r.toString() + "\n");
        }
        return s.toString();
    }

    public void count(){
        for(Record r : this.data_arr){
            r.count();
        }
    }

    public void write(String filename){
        try {
            java.io.PrintWriter f = new java.io.PrintWriter(filename);
            f.println("lp.;efektywnosc");
            for(Record r : this.data_arr){
                f.println(r.write());
            }
            f.close();
        }
        catch(Throwable e){
            System.out.println("Blad zapisu pliku!");
        }
    }
}
