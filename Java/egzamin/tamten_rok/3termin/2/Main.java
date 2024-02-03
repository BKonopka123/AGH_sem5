import java.io.*;
class Data{
    transient int k=1;
}
public class Main{
    public static void main(String[] args) throws Exception{
        ObjectOutputStream os = new ObjectOutputStream(new FileOutputStream("Data"));
        os.writeObject(new Data());
        os.close();
        ObjectInputStream is = new ObjectInputStream(new FileInputStream("Data"));
        Data copy = (Data) is.readObject();
        is.close();
        System.out.println(copy.k);
    }
}